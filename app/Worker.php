<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Worker extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'job', 'progress', 'status', 'result'
    ];

    public function userAccount()
    {
        return $this->belongsTo('App\UserAccount');
    }
}