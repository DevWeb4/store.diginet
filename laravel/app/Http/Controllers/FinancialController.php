<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Financial;
use App\Fee;


class FinancialController extends Controller
{

    public function getFinancials()
    {        
        $financials = Financial::orderBy('name', 'ASC')->with('fee')->get();
        return response()->json(['statusCode' => 200, 'data' => $financials]);
    }

    public function updateFee(Request $request, $id)
    {
        $fee = Fee::find($id);      
        $fee->update($request->all());

        return response()->json(["statusCode" => 200, "data" => $fee]);
    }
    public function updateFinancial(Request $request, $id)
    {
        $financial = Financial::find($id);      
        $financial->update($request->all());

        return response()->json(["statusCode" => 200, "data" => $financial]);
    }

    public function destroy($id)
    {
        $financial = Financial::find($id);
        $financial->fee()->each(function($fee) {
            $fee->delete();
        });
        $financial->delete();

        return response()->json(["statusCode" => 200]);
    }
    
    public function store(Request $request)
    {
        $input = $request->all();
        $financial = Financial::create([
            "name"=> $request->name,
        ]);

        for ($i=1; $i <= 18; $i++) { 
            Fee::create([
                'n'=> $i,
                'p'=> 0,
                'financial_id'=> $financial->id
            ]);
        }

        return response()->json(["statusCode" => 200]);
    }
}
