<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

use OwenIt\Auditing\Contracts\Auditable;
use Spatie\Permission\Traits\HasRoles;


class User extends Authenticatable implements Auditable
{
    use Notifiable, HasRoles, \OwenIt\Auditing\Auditable;

    protected $auditStrict = true;
    protected $auditThreshold = 20;
    
    protected $fillable = [
        'name', 'email', 'password',
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function store(){
        return $this->belongsTo('App\Store');
    }

}
