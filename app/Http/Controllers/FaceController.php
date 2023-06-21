<?php
namespace App\Http\Controllers;
use Facebook\Facebook;
use Facebook\Exceptions\FacebookResponseException;
use Facebook\Exceptions\FacebookSDKException;
use \TCG\Voyager\Http\Controllers\VoyagerBaseController;
// Inicializa la aplicación de Facebook

class FaceController extends Controller
{
 public function face(){

    $fb = new Facebook([
        'app_id' => '3391019474450456',
        'app_secret' => 'e52a0ec50f31e4e2e2a977972e27a6eb',
        'default_graph_version' => 'v8.0',
    ]);
    
    // Obtiene el helper de inicio de sesión de Facebook
    $helper = $fb->getRedirectLoginHelper();
    
    try {
        // Obtiene el token de acceso
        $accessToken = $helper->getAccessToken();
    } catch(FacebookResponseException $e) {
        // Si la solicitud falla
        echo 'Graph returned an error: ' . $e->getMessage();
        exit;
    } catch(FacebookSDKException $e) {
        // Si hay un problema con el SDK
        echo 'Facebook SDK returned an error: ' . $e->getMessage();
        exit;
    }
    
    if (!isset($accessToken)) {
        // Si no se ha obtenido el token de acceso, muestra un enlace para iniciar sesión
        echo '<a href="' . $helper->getLoginUrl('https://optica.test/auth/callback') . '">Iniciar sesión con Facebook</a>';
    } else {
        // Si se ha obtenido el token de acceso, lo puedes utilizar para realizar solicitudes a la API de Graph de Facebook
        echo "Token de acceso obtenido: " . $accessToken->getValue();
    }

 }

}
