<?php




namespace App\Widgets;

use App\Models\Cliente;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
//use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Widgets\BaseDimmer;
class Clientes extends BaseDimmer
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
        $count = Cliente::count();
        
        $string = trans_choice('Clientes', $count);

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-people',
            'title'  => "{$count} {$string}",
            'text'   => __('voyager::dimmer.post_text', ['count' => $count, 'string' => Str::lower($string)]),
            'button' => [
                'text' => __('voyager::dimmer.post_link_text'),
                'link' => route('voyager.clientes.index'),
            ],
            'image' => asset('images/clientes2.jpg'),
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
        return Auth::user()->can('browse', app(Cliente::class));
    }
}
