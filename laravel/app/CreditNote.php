<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CreditNote extends Model
{
    protected $table = 'credit_notes';
    protected $fillable = ['type', 'cae', 'cae_fch_vto', 'bill_id', 'sale_id'];
}
