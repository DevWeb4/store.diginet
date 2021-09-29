<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use App\Models\Models\Client;

class ClientFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Client::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'long_name' => $this->faker->word,
            'short_name' => $this->faker->word,
            'email_contact' => $this->faker->word,
            'level' => $this->faker->numberBetween(-10000, 10000),
            'logo_src' => $this->faker->word,
        ];
    }
}
