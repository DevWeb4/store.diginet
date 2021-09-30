<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Extra extends Model
{
    protected $table = 'extras';
    protected $fillable = ['description', 'user_id', 'cash_id', 'client_id','amount'];
}
