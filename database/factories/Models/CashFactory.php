<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use App\Models\Models\Branch;
use App\Models\Models\Cash;
use App\Models\Models\ClosedUser;
use App\Models\Models\OpenedUser;

class CashFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Cash::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'branch_id' => Branch::factory(),
            'opened_user_id' => OpenedUser::factory(),
            'closed_user_id' => ClosedUser::factory(),
            'opened_amount' => $this->faker->numberBetween(-10000, 10000),
            'closed_amount' => $this->faker->numberBetween(-10000, 10000),
            'closed_date' => $this->faker->date(),
        ];
    }
}
