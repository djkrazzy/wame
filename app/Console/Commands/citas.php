<?php

namespace App\Console\Commands;
use App\Mail\RecordatorioCita;
use Illuminate\Support\Facades\Mail;

use App\Models\Cita;
use Illuminate\Console\Command;
use Carbon\Carbon;
class citas extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'mail:citas';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Recordatorio de cita a los clientes';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $fecha= Carbon::now();
    $endDate = $fecha->addDay();
   
    $citas = Cita::whereDate('fecha_hora', $endDate->toDateString())->get();

    foreach( $citas as $cita ) {
        if($cita->cliente && $cita->cliente->email ){
        Mail::to($cita->cliente->email )->bcc('info@optifuturo.com')->send(new RecordatorioCita($cita));
        }
      }
      $this->info('Los mensajes de recordatorio an sido enviados correctamente');
    }
}
