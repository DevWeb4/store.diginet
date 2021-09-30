<?php

use Illuminate\Database\Seeder;
use App\Organization;
use App\Store;

class OrganizationsTableSeeder extends Seeder
{
    public function run()
    {
        Factory(Organization::class)->create([
            'name' => 'Herrera Gerardi Maria Alejandra',
            'cuit' => '27230428307',
            'r_social'=> 'Herrera Gerardi Maria Alejandra',
            'condition_iva'=> 'IVA Responsable Inscripto',
            'init'=>'01/06/2020'
        ]);
        
        Factory(Store::class)->create([
            'organization_id' => 1,
            'name' => 'Smartcell',
            'address' => 'España 320, la Banda',
            'contact'=> 'Tel 1: 3854 89-7793, Tel 2: 3855 74-5285, Tel 3: 699 8995'
        ]);

    }
}
