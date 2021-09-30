<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Account extends Model
{
    protected $table = 'accounts';
    protected $fillable = ['sale_id', 'person_id', 'total_account', 'rest_account'];
}
