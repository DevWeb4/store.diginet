<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Role;
//use OwenIt\Auditing\Contracts\Auditable;

use Hash;

class UserController extends Controller
{
    public function index(Request $request)
    {
        return view('users.index');
    }

    public function getUsers()
    {        
        $users = User::orderBy('id', 'DESC')->with('roles')->get();
        return response()->json(['statusCode' => 200, 'data' => $users]);
    }

    public function getRoles()
    {        
        return response()->json(Role::orderBy('name', 'asc')->get());
    }


    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'email' => 'required|email|unique:users,email,'.$id,
            //'password' => 'required',//|same:confirm-password//pendiente
        ]);
        
        if(!empty($request->password)){ 
            $request['password'] = Hash::make($request->password);
        }else{
            unset($request['password']);
        }

        $user = User::find($id);
        $user->syncRoles([$request->input('roles.0.id')]);            
        $user->update($request->all());

        return response()->json(["statusCode" => 200]);
    }


    public function store(Request $request)
    {
        $this->validate($request, [
            'email' => 'required|email|unique:users,email',
            'password' => 'required',
        ]);
        $input = $request->all();
        $input['password'] = Hash::make($input['password']);
        $user = User::create($input);

        $user->assignRole($request->input('roles.0.id'));  
        return response()->json(["statusCode" => 200]);
    }

    public function destroy($id)
    {
        $user = User::find($id);
        $user->removeRole($user->roles[0]->id);
        $user->delete();

        return response()->json(["statusCode" => 200]);
    }

    public function getAudits()
    {        
        //$article = User::find(1);
        //$all = $article->audits;
        //$all = $article->audits()->with('user')->get();
        //return $all;
        $audits = \OwenIt\Auditing\Models\Audit::with('user')->get();
        return response()->json(['statusCode' => 200, 'data' => $audits]) ;
    }

    public function __invoke(Request $request)
    {
        //
    }

    
}
