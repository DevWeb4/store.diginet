<?php

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\User;

class PermissionsTableSeeder extends Seeder
{
    public function run()
    {
        //Permission list
        /*Permission::create(['name' => 'editar_noticia']);
        Permission::create(['name' => 'borrar_noticia']);
        Permission::create(['name' => 'publicar_noticia']);
        Permission::create(['name' => 'ocultar_noticia']);*/

        $cajero = Role::create(['name' => 'cajero']);
        /*$cajero->givePermissionTo([
            'editar_noticia',
            'borrar_noticia',
        ]);*/

        $administrador = Role::create(['name' => 'administrador']);

        Factory(User::class)->create([
            'name'     => 'Admin',
            'email'    => 'admin@store',
            'store_id'=> 1,
        ])->assignRole($administrador);

        Factory(User::class)->create([
            'name'      => 'Cajero',
            'email'     => 'cajero1@store',
            'store_id'=> 1,
        ])->assignRole($cajero);
    }
}
