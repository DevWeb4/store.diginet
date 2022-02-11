<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cash extends Model
{
    protected $table = 'cashs';
    protected $fillable = ['status', 'initial_cash', 'final_cash', 'initial_user_id','final_user_id', 'store_id', 'dolar'];

    protected $casts = [
        'initial_cash' => 'integer',
        'final_cash' => 'integer',
    ];

    public function store(){
        return $this->belongsTo('App\Store', 'store_id');
    }
    public function sales(){
        return $this->hasMany('App\Sale');
    }

    public function extras(){
        return $this->hasMany('App\Extra');
    }

    public function initial_user(){
        return $this->belongsTo('App\User', 'initial_user_id');
    }
    
    public function final_user(){
        return $this->belongsTo('App\User', 'final_user_id');
    }
}
