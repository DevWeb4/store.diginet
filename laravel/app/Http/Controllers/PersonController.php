<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Person;
use App\Account;
use App\Extra;
use App\Cash;


use Auth;

class PersonController extends Controller
{
    public function index(Request $request)
    {
        return view('persons.provider');
    }

    public function getPersons(Request $request)
    {        
        $persons = Person::with('accounts')
            ->orderBy('id', 'desc')
            ->where('organization_id', '=', Auth::user()->store->organization->id)
            ->where('category', '=', $request->category)
            ->with('extras')
            ->get();
        return response()->json(['statusCode' => 200, 'data' => $persons]) ;
    }

    public function update(Request $request, $id)
    {
        $person = Person::find($id); 
        $person->update($request->all());
        
        return response()->json(["statusCode" => 200]);
    }

    public function store(Request $request)
    {

        $input = $request->all();   
        $condition = ["identification" => $input['identification']];

        if(strlen($input['identification']) == 7 || strlen($input['identification']) == 8 || $input['name'] != ''){
            $personInfo = [
                "name" => $input['name'],
                "organization_id"=> Auth::user()->store->organization->id,
                "identification_type"=> 1,
                "email"=> $input['email'],
                "phone"=> $input['phone'],
                "address"=> $input['address'],
                "category"=> 1,
            ];
        
            $person =Person::updateOrCreate($condition,$personInfo);
            $input['payment']['client_id'] = $person->id;
        }


        /*$input = $request->all();
        $input['organization_id'] = Auth::user()->store->organization->id;
        $person = Person::create($input);
*/
        return response()->json(["statusCode" => 200]);
    }
    
    public function editAccount(Request $request, $id)
    {
        $input = $request->all();   

        $account = Account::find($id); 
        $lastCash = $this->lastCash();

        if($lastCash->original['statusCode'] == 200){

            $account->rest_account = $input['rest_account'] - $input['pay'];
            if($account->update()){
                if ($input['impact_cash']) {     
                   
                    
                    $extra = Extra::create([
                        "description"=>"Pago de Cliente ".$input['client_name'],
                        "amount"=>$input['pay'],
                        "cash_id"=>$lastCash->original['data'][0]->id,
                        "user_id"=> Auth::user()->id,
                        "client_id"=>$input['client_id']
                    ]);
                }
            }
            
            return response()->json(["statusCode" => 200, "data" =>$account]);

        }else{

            return response()->json(["statusCode" => 500, "data" =>'']);
        }

    }
    
    public function destroy($id)
    {
        $person = Person::find($id);
        $person->accounts()->each(function($account) {
            $account->delete();
        });
        $person->delete();

        return response()->json(["statusCode" => 200]);
    }

    public function lastCash(){
        $lastCash = Cash::where('store_id', '=', Auth::user()->store_id)
            ->where('status', '=', 1)
            ->with('extras')
            ->orderBy('created_at', 'DESC')
            ->take(1)
            ->get();
            
        if(count($lastCash) == 0){
            return response()->json(['statusCode' => 404, 'data' => '']);
        }
        return response()->json(['statusCode' => 200, 'data' => $lastCash]);
    }

    public function __invoke(Request $request)
    {
        //
    }
}

