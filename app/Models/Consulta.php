<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Consulta extends Model
{
    protected $guarded =[
        'id'
    ];
    
    public function cliente(){
        return $this->belongsTo(Cliente::class);
    }

    public function receta(){
        return $this->hasOne(Receta::class);
    }


    
    use HasFactory;
}
