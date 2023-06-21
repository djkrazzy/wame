<?php

namespace App\Http\Controllers;

use App\Models\Cliente;
use App\Models\Receta;
use Illuminate\Http\Request;

class RecetaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    public function __construct()
{
    $this->middleware('auth');
}

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {

        $cliente= Cliente::where('id',$request->user_id  )->first();
        $consulta_id=$request->consulta_id;
        return view('vendor.voyager.clientes.add-receta',compact('cliente','consulta_id'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
       
        $receta = new Receta($request->all());
        $receta->save();
       
        return redirect('admin/clientes/'.$request->cliente_id)->with('info', 'Recetaeada con éxito');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Receta  $receta
     * @return \Illuminate\Http\Response
     */
    public function show(Receta $receta)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Receta  $receta
     * @return \Illuminate\Http\Response
     */
    public function edit(Receta $receta)
    {

        
       
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Receta  $receta
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {   
        $receta = Receta::findOrFail($request->id);
        $receta->fill($request->all());
        $receta->save();
        
        return redirect('admin/clientes/'.$receta->cliente_id)->with('info', 'Recetaeada actualizada éxito');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Receta  $receta
     * @return \Illuminate\Http\Response
     */
    public function destroy(Receta $receta)
    {
        //
    }
}
