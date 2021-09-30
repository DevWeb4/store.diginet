<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Store extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;
    public function users()
    {
        return $this->hasMany('App\User');
    }

    public function organization(){
        return $this->belongsTo('App\Organization');
    }
}
