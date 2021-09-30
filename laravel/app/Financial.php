<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Financial extends Model
{
    protected $table = 'financials';
    protected $fillable = ['name'];

    public function fee(){
        return $this->hasMany('App\Fee', 'financial_id');
    }
}