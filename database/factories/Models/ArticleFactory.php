<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use App\Models\Models\Article;
use App\Models\Models\Provider;

class ArticleFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Article::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->name,
            'provider_id' => Provider::factory(),
            'code' => $this->faker->word,
            'price' => $this->faker->numberBetween(-10000, 10000),
        ];
    }
}
