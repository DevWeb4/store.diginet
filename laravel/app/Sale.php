<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Sale extends Model
{
    protected $fillable = ['user_id', 'cash_id', 'client_id', 'cash_payment', 'credit_payment', 'personal_account_payment', 'discount', 'invoiced','description'];

    protected $casts = [
        'user_id' => 'integer',
        'cash_id' => 'integer',
        'client_id' => 'integer',
        'cash_payment' => 'integer',
        'credit_payment' => 'integer',
        'personal_account_payment' => 'integer',
        'discount' => 'integer',
        'invoiced' => 'integer',
        'bill_id' => 'integer',
    ];

    public function cash(){
        return $this->belongsTo('App\Cash');
    }

    public function bill(){
        return $this->belongsTo('App\Bill', 'bill_id');
    }

    public function client(){
        return $this->belongsTo('App\Person', 'client_id');
    }
}
