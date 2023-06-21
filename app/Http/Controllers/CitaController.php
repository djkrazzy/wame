<?php

namespace App\Http\Controllers;

use App\Models\Cita;
use App\Models\Cliente;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

class CitaController extends Controller
{

    public function __construct()
{
    $this->middleware('auth');
}

    public function createCita(Request $request)
    {

        $cliente= Cliente::where('id',$request->user_id  )->first();
        return view('vendor.voyager.clientes.add-cita',compact('cliente'));
    }

    public function store(Request $request)
    {
       // return $request->fecha_hora;
        Cita::create([
            'fecha_hora' => $request->fecha_hora,
            'nota' =>  $request->nota,
            'estado' =>  1,
            'tipo' =>   $request->tipo,
            'cliente_id' =>  $request->cliente_id,
        ]);

        
       
        return redirect('admin/clientes/'.$request->cliente_id)->with('info', 'Cita con éxito');
    }
}
