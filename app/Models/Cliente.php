<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cliente extends Model
{
    use HasFactory;


    public function trabajo(){
        return $this->hasMany(Trabajo::class);
    }


    public function receta(){
        return $this->hasMany(Receta::class);
    }

    public function cita(){
        return $this->hasMany(Cita::class);
    }

    public function consulta(){
        return $this->hasMany(Consulta::class);
    }

}
