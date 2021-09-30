<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Note;

class NoteController extends Controller
{
    public function index(Request $request)
    {
        return view('notes.index');
    }

    public function store(Request $request)
    {
        $input = $request->all();
        $note = Note::create($input);

        return response()->json(["statusCode" => 200, "data"=> $note]);
    }

    public function getNotes(Request $request)
    {        
        $notes = Note::with('person')->orderBy('id', 'desc')->get();
        return response()->json(['statusCode' => 200, 'data' => $notes]) ;
    }

    public function destroy($id)
    {
        $note = Note::find($id);
        $note->delete();

        return response()->json(["statusCode" => 200]);
    }

    public function update(Request $request, $id)
    {
        $note = Note::find($id); 
        $note->update($request->all());
        
        return response()->json(["statusCode" => 200,"data"=>$note]);
    }

    public function __invoke(Request $request)
    {
        //
    }
}
