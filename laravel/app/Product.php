<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use OwenIt\Auditing\Contracts\Auditable;

class Product extends Model implements Auditable
{
    use \OwenIt\Auditing\Auditable;
    
    protected $table = 'products';
    protected $fillable = ['name', 'bar_code', 'unit_price', 'provider_id', 'stock', 'store_id','organization_id', 'partner', 'gremio', 'iva',  'v_added', ];

    protected $casts = [
        'unit_price' => 'integer',
    ];
    
    public function provider(){
        return $this->belongsTo('App\Provider');
    }
}
