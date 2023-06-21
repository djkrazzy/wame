<?php

namespace App\Console\Commands;
use App\Mail\CumpleanosMail;
use Illuminate\Support\Facades\Mail;



use App\Models\Cliente;
use Carbon\Carbon;
use Illuminate\Console\Command;

class birthday extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'mail:birthday';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Envia un mensaje de Cumpleaños Feliz a los usuarios';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        
      $fecha= Carbon::now();
  
      $clientes =Cliente::whereDay('nacimiento', $fecha->day)
                              ->whereMonth('nacimiento',$fecha->month)
                              ->get();

        foreach( $clientes as $cliente ) {
         
          Mail::to($cliente->email)->send(new CumpleanosMail($cliente));
         
        }
        $this->info('Los mensajes de felicitacion han sido enviados correctamente');
    }
}
