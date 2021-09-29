<?php

namespace App\Models\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cash extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'branch_id',
        'opened_user_id',
        'closed_user_id',
        'opened_amount',
        'closed_amount',
        'closed_date',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'branch_id' => 'integer',
        'opened_user_id' => 'integer',
        'closed_user_id' => 'integer',
        'closed_date' => 'date',
    ];


    public function branch()
    {
        return $this->belongsTo(\App\Models\Models\Branch::class);
    }

    public function openedUser()
    {
        return $this->belongsTo(\App\Models\Models\OpenedUser::class);
    }

    public function closedUser()
    {
        return $this->belongsTo(\App\Models\Models\ClosedUser::class);
    }
}
