<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStoresTable extends Migration
{
    public function up()
    {
        Schema::create('organizations', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->bigInteger('cuit');
            $table->string('r_social');
            $table->string('condition_iva');
            $table->string('init');
            $table->timestamps();
        });

        Schema::create('stores', function (Blueprint $table) {//caja
            $table->id();
            $table->integer('organization_id');
            $table->string('name');
            $table->string('address');
            $table->text('contact');
            $table->timestamps();
        });

        Schema::create('cashs', function (Blueprint $table) {//caja
            $table->id();
            $table->integer('status');//cierre/inicio
            $table->float('initial_cash');
            $table->float('final_cash');
            $table->integer('initial_user_id');
            $table->integer('final_user_id');
            $table->integer('store_id');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('stores');
    }
}
