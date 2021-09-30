<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSalesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sales', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->unsignedBigInteger('cash_id')->nullable();
            $table->unsignedBigInteger('client_id')->nullable();
            $table->unsignedBigInteger('bill_id')->nullable();
            $table->bigInteger('cash_payment')->default(0);
            $table->bigInteger('credit_payment')->default(0);
            $table->bigInteger('personal_account_payment')->default(0);
            $table->bigInteger('discount');
            $table->integer('invoiced')->default(0);
            $table->text('description')->nullable();
            $table->timestamps();
        });

        Schema::create('bills', function (Blueprint $table) {
            $table->id();
            $table->string('type')->default('B');
            $table->string('cae');
            $table->bigInteger('comp_n');
            $table->date('cae_fch_vto');
            $table->integer('amount');
            $table->integer('iva');
            $table->integer('tax');
            $table->bigInteger('identification')->nullable();
            $table->timestamps();
        });

        Schema::create('credit_notes', function (Blueprint $table) {
            $table->id();
            $table->integer('sale_id');
            $table->integer('bill_id');
            $table->string('type')->default('B');
            $table->string('cae');
            $table->date('cae_fch_vto');
            $table->timestamps();
        });

        Schema::create('financials', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->timestamps();
        });
        Schema::create('fees', function (Blueprint $table) {
            $table->id();
            $table->float('n');
            $table->float('p');
            $table->bigInteger('financial_id');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('sales');
        Schema::dropIfExists('financials');
        Schema::dropIfExists('salefeess');
    }
}
