<?php

use Illuminate\Support\Facades\Route;
Auth::routes();

Route::get('/afip', function () {
    return view('sales/afip');
})->middleware('auth');

Route::get('/', function () {
    return view('index');
})->middleware('auth')->name('home');

Route::post('get_products','ProductController@getProducts');
Route::post('get_inventory','ProductController@getInventory');
Route::post('get_providers','ProductController@getProviders');

Route::post('import_csv','ProductController@importCSV')->middleware('auth');


//-------- PERSONS --------//
Route::get('persons','PersonController@idnex')->middleware('auth');
Route::post('persons','PersonController@store')->middleware('auth');
Route::put('persons{id}','PersonController@update')->middleware('auth');

Route::get('clientes', function () {return view('persons.customer');})->middleware('auth');
Route::post('get_persons','PersonController@getPersons');

//-------- SALES --------//
Route::resource('venta/','SaleController')->middleware('auth');

Route::get('ventas', function () {
    return view('sales.index');
})->middleware('auth')->name('venta');


Route::get('facturacion/{id}','SaleController@indexBilling')->middleware('auth');
Route::get('get_billings/{id}','SaleController@getBillings')->middleware('auth');
Route::post('extra','SaleController@addExtra');

Route::get('get_last_cash','SaleController@getLastCash');
Route::post('open_cash','SaleController@openCash');
Route::post('close_cash','SaleController@closeCash');

Route::get('get_store','SaleController@getStore');

Route::get('productos','ProductController@index')->middleware('auth');
Route::get('get_financials','FinancialController@getFinancials');

Route::get('inventario','ProductController@inventory')->middleware('auth');

Route::get('get_inventory_grouped','ProductController@getInventoryGrouped');

Route::delete('delete_inventory_grouped/{barCode}','ProductController@destroyInventoryGrouped')->middleware('auth');

Route::put('save_client/{id}','SaleController@saveClient');


Route::put('afip_ws/{id}','SaleController@afipWS');
Route::put('cancel_bill/{id}','SaleController@cancelBill');

Route::put('edit_account/{id}','PersonController@editAccount');


Route::middleware(['role:administrador'])->group( function () {

    Route::get('get_permission_distil_edit_acount', function () {
        return 200;
    })->middleware('auth');
    
    Route::get('desarrollo', function () {return view('desarrollo');})->middleware('auth');
    Route::resource('caja','CashController')->middleware('auth');

    Route::put('caja_/{id}','CashController@update')->middleware('auth');

    //-------- Financieras --------//
    Route::get('financieras', function () {return view('financials.index');})->middleware('auth');
    Route::post('store_financial','FinancialController@store');

    Route::put('updateFee/{id}','FinancialController@updateFee');
    Route::put('updateFinancial/{id}','FinancialController@updateFinancial');
    Route::delete('financial/{id}','FinancialController@destroy');


    Route::post('productos','ProductController@store')->middleware('auth');
    Route::put('productos/{id}','ProductController@update')->middleware('auth');
    Route::delete('delete_productos/{id}','ProductController@destroy')->middleware('auth');
    Route::delete('persons/{id}','PersonController@destroy')->middleware('auth');



    //-------- USERS --------//
    Route::resource('usuarios','UserController')->middleware('auth');
    Route::get('get_users','UserController@getUsers');
    Route::get('get_roles','UserController@getRoles');

    Route::get('auditoria', function () {return view('users.audit');})->middleware('auth');
    Route::get('get_audits','UserController@getAudits');

    Route::get('get_rol','UserController@getRol');


    //-------- PRODUCTS --------//
    Route::post('add_provider','ProductController@addProvider');
    Route::delete('delete_provider/{id}','ProductController@deleteProvider');
    Route::put('update_provider/{id}','ProductController@updateProvider');

    Route::get('audit_product/{id}','ProductController@auditProduct');


    Route::post('multi_update','ProductController@multiProduct');

    //Route::get('proveedores', function () {return view('persons.provider');})->middleware('auth');

    Route::delete('extra/{id}','SaleController@deleteExtra');
});


