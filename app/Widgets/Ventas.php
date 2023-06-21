<?php




namespace App\Widgets;

use App\Models\Trabajo;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
//use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Widgets\BaseDimmer;
class Ventas extends BaseDimmer
{
    /**
     * The configuration array.
     *
     * @var array
     */
    protected $config = [];

    /**
     * Treat this method as a controller action.
     * Return view() or other content to display.
     */
    public function run()
    {
        
        
        $string = 'Aca puede hacer una venta directa';

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-basket',
            'title'  => " {$string}",
            'text'   =>  'Puede vender directamente a una persona sin que este registrada como cliente',
            'button' => [
                'text' =>'Venta Directa',
                'link' => route('voyager.trabajos.create'),
            ],
            'image' => asset('https://optifuturo.com/storage/imagen_2023-01-04_072454003.png'),
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    public function shouldBeDisplayed()
    {
       // return Auth::user()->can('browse', Voyager::model('Post'));
        return Auth::user()->can('browse', app(Trabajo::class));
    }
}