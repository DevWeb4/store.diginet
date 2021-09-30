<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Person extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;
    protected $table = 'persons';
    protected $fillable = ['name', 'email', 'phone', 'description', 'address', 'identification', 'identification_type', 'category', 'organization_id'];

 
    public function accounts(){
        return $this->hasMany('App\Account');//->orderBy('id');
    }

    public function extras(){
        return $this->hasMany('App\Extra', 'client_id')->orderBy('id', 'desc');
    }

}