<?php

use App\Person;
use App\Note;
use App\Product;
use Faker\Generator as Faker;


$factory->define(Person::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
        'email' => $faker->companyEmail,
        'phone' => $faker->phoneNumber,
        'identification' => $faker->numberBetween($min = 13000000, $max = 50000000),
        'identification_type' => $faker->numberBetween($min = 0, $max = 3),
        'address' => $faker->address,
        'description' => $faker->realText(random_int (50, 150)),
        'organization_id'=> 1,
    ];
});

$factory->define(Note::class, function (Faker $faker) {
    return [
        'title' => $faker->catchPhrase,
        'body' => $faker->realText(random_int (15, 60)),
        'archive'=> random_int (0, 1),
        'store_id'=> 1,
    ];
});

$factory->define(Product::class, function (Faker $faker) {

    //$faker = \Faker\Factory::create();
    $faker->addProvider(new \RauweBieten\PhpFakerClothing\Clothing($faker));

    return [
        'name' => $faker->clothing() . PHP_EOL,
        'bar_code' => $faker->realText(random_int (15, 25)),
        'unit_price'=> random_int (200, 2000),
        'store_id'=>  random_int (1, 4),
        'organization_id'=>  random_int (1, 2),
        'stock'=> random_int (1, 10),
    ];
});