<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Product;
use App\Provider;


class ProductController extends Controller
{
    public function index(Request $request)
    {
        return view('products.index');
    }

    
    public function importCSV(Request $request){

        $inventory = $request->all();

        $organization_id = Auth::user()->store->organization->id;
        $organization_id = Auth::user()->store->id;

        foreach ($inventory as $product) {
            $aux = [];

            $aux['organization_id'] = $organization_id;
            $aux['store_id'] = $organization_id;

            $aux['name'] = $product['descripcion'];
            $aux['provider_id'] = 1;

            $aux['bar_code'] = $product['codigo'];
            $aux['partner'] = $product['partner'];
            $aux['gremio'] = $product['gremio'];
            $aux['unit_price'] = $product['pmp'];
            $aux['stock'] = 0;

            
            $condition = ["bar_code" => $aux['bar_code'], 'provider_id' => $aux['provider_id']];

            Product::updateOrCreate($condition,$aux);

        }

        return response()->json(["statusCode" => 200, "data"=> $inventory]);
    }


    public function inventory(Request $request)
    {
        //$inventory = Product::with('provider')->orderBy('id', 'desc')->groupBy('customer_id')->where('store_id', '=', Auth::user()->store->id)->get();
        $inventory = Product::selectRaw('sum(stock) as stock, name')->AVG('unit_price')->groupBy('name')->get();
        return view('products.inventory', compact('inventory'));
    }

    public function store(Request $request)
    {
        $input = $request->all();
        $input['organization_id']= Auth::user()->store->organization->id;
        $input['store_id']= Auth::user()->store->id;

        $condition = ["bar_code" => $input['bar_code'], 'provider_id' => $input['provider_id']];
        $product =Product::updateOrCreate($condition,$input);

        return response()->json(["statusCode" => 200, "data"=> $product]);
    }

    public function getProducts(Request $request)
    {        
        $products = Product::with('provider')->orderBy('id', 'desc')->where('store_id', '=', Auth::user()->store->id)->get();
        return response()->json(['statusCode' => 200, 'data' => $products]) ;
    }

    public function getInventory(Request $request)
    {        
        $products = Product::with('provider')->orderBy('id', 'desc')->where('organization_id', '=', Auth::user()->store->organization->id)->get();        
        return response()->json(['statusCode' => 200, 'data' => $products]) ;
    }

    public function addProvider(Request $request)
    {        
        $this->validate($request, [
            'name' => 'required|unique:providers,name',
        ]);

        $input = $request->all();
        $input['organization_id']= Auth::user()->store->organization->id;

        $provider = Provider::create($input);

        return response()->json(['statusCode' => 200, 'data' => $provider]) ;
    }

    public function updateProvider(Request $request, $id){
        $provider = Provider::find($id); 
        $provider->update($request->all());
        
        return response()->json(["statusCode" => 200, "data"=>$provider]);
    }

    public function auditProduct($id){
        //$provider = Provider::find($id); 
        //$provider->update($request->all());

        $audits = \OwenIt\Auditing\Models\Audit::with('user')->where('auditable_id', $id)->orderBy('updated_at', 'desc')->get();


        return view('products.audit', compact('audits'));
    }


    public function multiProduct(Request $request){
        $input = $request->all();
        Product::whereIn('id', $input['ids'])->update(['unit_price' => $input['unit_price']]);

        return response()->json(['statusCode' => 200]);
    }
    

    public function getProviders(Request $request)
    {        
        $providers = Provider::orderBy('name', 'asc')->where('organization_id', '=', Auth::user()->store->organization->id)->get();        
        return response()->json(['statusCode' => 200, 'data' => $providers]) ;
    }

    public function destroy($id)
    {
        $product = Product::find($id);
        $product->delete();

        return response()->json(["statusCode" => 200]);
    }

    public function deleteProvider($id)
    {
        $provider = Provider::find($id);
        $provider->delete();
        
        return response()->json(["statusCode" => 200]);
    }
    
    public function update(Request $request, $id)
    {
        $product = Product::find($id); 
        $product->update($request->all());
        
        return response()->json(["statusCode" => 200,"data"=>$product]);
    }

    public function __invoke(Request $request)
    {
        //
    }
}
