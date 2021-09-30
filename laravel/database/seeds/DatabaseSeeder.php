<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        $this->call(PermissionsTableSeeder::class);
        $this->call(PersonsTableSeeder::class);
        $this->call(OrganizationsTableSeeder::class);
    }
}
//php artisan db:seed 