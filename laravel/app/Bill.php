<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Bill extends Model
{
    protected $table = 'bills';
    protected $fillable = ['type', 'cae', 'cae_fch_vto', 'comp_n', 'amount', 'iva', 'tax', 'identification'];
}