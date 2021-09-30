<?php

use Illuminate\Database\Seeder;
use App\Person;
use App\Note;
use App\Product;

class PersonsTableSeeder extends Seeder
{

    public function run()
    {
        /*factory(Person::class, 12)->create(['category'=>0])->each(function ($person) {
            $personNotes = factory(Note::class, random_int (1 , 5))->make();
            $personProducts = factory(Product::class, random_int (1 , 5))->make();
            $person->person_notes()->saveMany($personNotes);
            $person->person_products()->saveMany($personProducts);
        });*/

        /*factory(Person::class, 12)->create(['category'=>1])->each(function ($person) {
            $personNote = factory(Note::class, random_int (1 , 5))->make();
            $person->person_notes()->saveMany($personNote);
        });*/

    }
}
