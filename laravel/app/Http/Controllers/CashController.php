<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Cash;
use App\Extra;
use Auth;

class CashController extends Controller
{
    public function index()
    {
        $cashs = Cash::orderBy('id', 'desc')
            ->with(['sales', 'initial_user', 'final_user', 'extras'])
            ->get()
            ->where('store_id', '=', Auth::user()->store->id);
        return view('sales.cashs', compact('cashs'));
    }

    public function update(Request $request, $id)
    {
        $cash = Cash::find($id);
        $cash->timestamps = false;
        $cash->update($request->all());
        
        return response()->json(["statusCode" => 200, "data"=>$cash]);
    }
}
