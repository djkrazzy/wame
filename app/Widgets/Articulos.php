<?php




namespace App\Widgets;

use App\Models\Articulo;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
//use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Widgets\BaseDimmer;
class Articulos extends BaseDimmer
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
        $count = Articulo::count();
        
        $string = trans_choice('Articulos En inventario', $count);

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-shop',
            'title'  => "{$count} {$string}",
            'text'   => __('voyager::dimmer.post_text', ['count' => $count, 'string' => Str::lower($string)]),
            'button' => [
                'text' => __('voyager::dimmer.post_link_text'),
                'link' => route('voyager.articulos.index'),
            ],
            'image' => asset('images/tienda.jpg'),
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
        return Auth::user()->can('browse', app(Articulo::class));
    }
}
