
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
  <!-- Meta Tags -->
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="author" content="Laralink">

 <style type="text/css">
 table {
    margin-bottom: 20px;
    max-width: 100%;
    width: 100%;
}
table {
    background-color: transparent;
}

table {
    border-collapse: collapse;
    border-spacing: 0;
}
* {
    outline: none;
}
*, :after, :before {
    box-sizing: border-box;
}
table {
    display: table;
    border-collapse: separate;
    box-sizing: border-box;
    text-indent: initial;
    border-spacing: 2px;
    border-color: grey;
}
.table {
    color: #76838f;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
}
table {
    border-collapse: separate;
    text-indent: initial;
    border-spacing: 2px;
    margin: 10;
}
.bg-primary {
    background-color: #1cbbb4;
    color: #fff;
    height: 2px;
}
.bg-totales {
    background-color: #eff7f6;
    color: #2a2a2a;
    height: 2px;
}
	body, html {
  
    color: #76838f;
    font-family: Open Sans,sans-serif;
    font-size: 12px;
    height: 100%;
    line-height: 1.57142857;
    margin: 0;
    padding: 0;
}
	
table td {
 

  padding: 0px;
  /* Alto de las celdas */
  height: 2px;
}
html{
            
        }
         #inner {
   width: 30em;
   height: 2em;
    
   top: 31.8em;
   right: 0;
   bottom: 3em;
   left: 5em;
   color: #ffffff;
    font-family: Open Sans,sans-serif;
    
   
   position: absolute;
}
#politicas {
   width: 30em;
   height: 2em;
    
   top: 33.8em;
   right: 0;
   bottom: 3em;
   left: 15em;
   
    font-family: Open Sans,sans-serif;
    font-size:10px;
   
   position: absolute;
}
        @page {margin:0px;}
</style>
  <!-- Site Title -->
  <title>Orden de Trabajo</title>

</head>

<body style="background-image: 
url({{asset('img/bg.png')}})">
  <div class="tm_container">
    <div class="tm_invoice_wrap">
         
             <div id="inner">Dirección: {{setting('site.direccion')}} Tel: {{setting('site.telefono')}}</div>
                 <div   id="politicas"    >   No se aseptan cambios ni devoluciones     </div>
           
            <table style="margin-top: 0;">
              <tbody>
                <tr>
                  <td style="width: 300px;" > </td>
                  <td> 
                       <table>
                         <tr>   
                          <td> Orden de Trabajo: </td>
                            <td>Fecha de Encargo: </td>
                            <td>Fecha de entrega: </td>
                         </tr>
                          <tr>   
                          <td><b> #{{ $orden->id }}</b></td>
                            <td> <b>{{$orden->fecha_venta}}</b></td>
                            <td> <b>{{$orden->fecha_entrega}}</b></td>
                         </tr>
                        </table>
                  </td>
                </tr>
              </tbody>
            </table>
            <table style="margin-top: 0;">
              <tbody>
                <tr>
                 
                  <td>A nombre de </b> {{$cliente->nombres.' '.$cliente->apellidos}}</td>
                 
              
                  <td>Tel :   {{$cliente->telefono}}</td>
                
                </tr>
              
              </tbody>
            </table>
        



         
          
        
            
                 <table class="table  table-user-information" style="margin-top: 0;">
                    <thead class="black white-text">
                       
                    </thead>
                    <tbody>
                 <tr class="bg-primary text-white" >
                       <th >OJO</td>
                        <th >ESF</th>
                        <th >CIL</th>
                        <th >EJE</th>
                        <th >COLOR</th>
                        <th >CARTILLA</th>
                       
                       </tr>
                    <tr>
                    <td class="bg-primary text-white">OD</td>
                        <td  >{{ $receta->od_esf }}</td>
                        <td >{{ $receta->od_cil }}</td>
                         <td >{{ $receta->od_eje }}</td>
                            <td >{{ $receta->color }}</td>
                         <td >{{ $receta->cartilla }}</td>
                      </tr>
                       <tr>
                       <td class="bg-primary text-white">OI</td>
                       
                        <td >{{ $receta->oi_esf }}</td>
                        <td >{{ $receta->oi_cil }}</td>
                        <td >{{ $receta->oi_eje }}</td>
                         <td class="bg-primary text-white">MATERIAL</td>
                        <td >{{ $receta->cartilla_oi }}</td>
                          </tr>
                       <tr>
                         <td class="bg-primary text-white">ADD</td>
                       <td >{{ $receta->od_add }}</td> 
                        <td >{{ $receta->oi_add }}</td>
                            <td >...</td>
                            <td >{{ $receta->material }}</td>
                            <td >...</td>
                       
                        
                    </tr>
                    <tr>
                   <td >...</td>
                            <td >...</td>
                            <td >...</td>
                            <td >...</td>
                    <td class="bg-primary text-white">DIP</td>
                      <td >...</td>
                   </tr>
                   <tr>
                   <td >...</td>
                            <td >...</td>
                            <td >...</td>
                            <td >...</td>
                    <td >{{ $receta->dip }}</td>
                      <td >...</td>
                   </tr>
                  
                    </tbody>
                 </table>  
               
        
          <div class="tm_table tm_style1">
            <div class="">
              <div class="tm_table_responsive">
                <table>
                  <thead>
                    <tr class="tm_accent_bg">
                      <th class="tm_width_3 tm_semi_bold tm_white_color">Descripción</th>
                      
                      <th class="tm_width_1 tm_semi_bold tm_white_color">Precio</th>
                      <th class="tm_width_1 tm_semi_bold tm_white_color">Descuento</th>
                      <th class="tm_width_1 tm_semi_bold tm_white_color">Cantidad</th>
                      <th class="tm_width_2 tm_semi_bold tm_white_color tm_text_right">Total</th>
                    </tr>
                  </thead>
                  <tbody>
                  @foreach ($items as $item)
                      
              
                    <tr>
                      <td class="tm_width_3">{{$item->nombre}}</td>
                      <td class="tm_width_2">{{$item->precio}}</td>
                      <td class="tm_width_2">{{$item->descuento}}</td>
                      <td class="tm_width_1">{{$item->cantidad}}</td>
                      <td class="tm_width_2 tm_text_right">{{$item->total}}</td>
                    </tr>
                   @endforeach
                    <tr class="bg-totales">
                      <td class="tm_width_3"></td>
                      <td class="tm_width_2"></td>
                      <td class="tm_width_2">Adelanto</td>
                      <td class="tm_width_1">Debe</td>
                      <td class="tm_width_2 tm_text_right">Precio Total</td>
                    </tr>
                      <tr>
                      <td class="tm_width_3"></td>
                      <td class="tm_width_2"></td>
                      <td class="tm_width_2">{{$orden->pago_cliente}}</td>
                      <td class="tm_width_1"> Q.{{$orden->total_cuenta-$orden->pago_cliente}}</td>
                      <td class="tm_width_2 tm_text_right">Q.{{$orden->total_cuenta}}</td>
                    </tr>
                  </tbody>
                </table>
              
              </div>
            </div>
           
           
          </div>
       
        </div>
      </div>
     
    </div>
  </div>
 
</body>
</html>