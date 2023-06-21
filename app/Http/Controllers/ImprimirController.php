<?php

namespace App\Http\Controllers;

use App\Models\Cliente;
use App\Models\Receta;
use App\Models\Trabajo;
use App\Models\VentaItems;
use PDF;
use Carbon\Carbon;
use Illuminate\Http\Request;


class ImprimirController extends Controller
{
    //
    public function __construct()
{
    $this->middleware('auth');
}

    public function imprimirOrden(Request $request){
    
         $orden= Trabajo::where('id',$request->orden_id  )->first();
         $receta= Receta::where('id',$orden->receta_id  )->first();
         $cliente= Cliente::where('id',$request->user_id )->first();
         $items= VentaItems::where('trabajo_id',$request->orden_id  )->get();
         
       
        $today = Carbon::now()->format('d/m/Y');
        $pdf = PDF::loadView('pdf.receta', compact('today','receta','orden','cliente','items'))->setPaper('a5', 'landscape');
        return $pdf->stream('Orden_'.$request->orden_id .'.pdf');
        //return $pdf->download('ejemplo.pdf');
       
      }

      public function imprimirReceta(Request $request){
    
       
        $receta= Receta::where('id',$request->receta_id  )->first();
        $cliente= Cliente::where('id',$request->user_id )->first();
        
        $items="";
        $orden="";
        
      
       $today = Carbon::now()->format('d/m/Y');
       $pdf = PDF::loadView('pdf.soloReceta', compact('today','receta','orden','cliente','items'))->setPaper('a5', 'landscape');
       return $pdf->stream('Orden_'.$request->receta_id .'.pdf');
       //return $pdf->download('ejemplo.pdf');
      
     }
}
