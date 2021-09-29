<?php

namespace App\Models\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sale extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'operation_id',
        'user_id',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'operation_id' => 'integer',
        'user_id' => 'integer',
    ];


    public function operation()
    {
        return $this->belongsTo(\App\Models\Models\Operation::class);
    }

    public function user()
    {
        return $this->belongsTo(\App\Models\Models\User::class);
    }
}
