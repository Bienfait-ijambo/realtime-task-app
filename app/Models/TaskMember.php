<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TaskMember extends Model
{
    use HasFactory;

    protected $guarded=[];

    public function members(){

        return $this->hasOne(Member::class,'id');
    }

    
}
