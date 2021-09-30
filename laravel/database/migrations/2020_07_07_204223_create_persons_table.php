<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePersonsTable extends Migration
{
    public function up()
    {
        Schema::create('persons', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->bigInteger('identification')->nullable();
            $table->integer('identification_type')->nullable();
            $table->bigInteger('organization_id');
            $table->string('email')->nullable();
            $table->string('phone')->nullable();
            $table->string('address')->nullable();
            $table->string('description')->nullable();
            $table->integer('category')->default(0);//0 proveedor, 1 cliente
            $table->timestamps();
        });

        Schema::create('accounts', function (Blueprint $table) {
            $table->id();
            $table->biginteger('sale_id');
            $table->biginteger('person_id');
            $table->biginteger('total_account')->nullable();
            $table->biginteger('rest_account')->nullable();
            $table->timestamps();
        });

        Schema::create('extras', function (Blueprint $table) {
            $table->id();
            $table->string('description')->nullable();
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('cash_id');
            $table->unsignedBigInteger('client_id');
            $table->bigInteger('amount');
            $table->timestamps();
        });

        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('bar_code')->nullable();
            $table->float('unit_price')->default(0);
            $table->float('unit_price2')->default(0);
            $table->float('unit_price3')->default(0);
            $table->biginteger('provider_id')->nullable();
            $table->biginteger('organization_id');
            $table->biginteger('store_id');
            $table->integer('stock')->default(0);
            $table->timestamps();
        });

        Schema::create('providers', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->integer('organization_id');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('persons');
    }
}
