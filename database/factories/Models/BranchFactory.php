<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use App\Models\Models\Branch;
use App\Models\Models\Client;

class BranchFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Branch::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'client_id' => Client::factory(),
            'name' => $this->faker->name,
            'contact_text' => $this->faker->text,
            'type' => $this->faker->randomElement(["Sucursal","Deposito"]),
        ];
    }
}
