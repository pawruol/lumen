<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserAccount extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'type', 'username', 'password'
    ];

    public function user()
    {
        return $this->belongsTo('App\User');
    }

    public function workers()
    {
        return $this->hasMany('App\Worker');
    }
}