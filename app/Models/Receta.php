<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Receta extends Model
{
    use HasFactory;

    protected $guarded =[
        'id'
    ];
    //relacion uno a muchos inversa


    public function cliente(){
        return $this->belongsTo(Cliente::class);
    }

    public function consulta(){
        return $this->belongsTo(Consulta::class);
    }


  
}
