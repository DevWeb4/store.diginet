<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use App\Models\Models\Cash;
use App\Models\Models\Operation;

class OperationFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Operation::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'cash_id' => Cash::factory(),
            'type' => $this->faker->randomElement(["Venta","Extraccion","Ingreso"]),
        ];
    }
}
