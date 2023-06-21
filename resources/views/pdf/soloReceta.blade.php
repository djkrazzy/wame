
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
              <div   id="politicas"    >   No se aseptan cambios ni devoluciones .    </div>

           
            <table style="margin-top: 0;">
              <tbody>
                <tr>
                  <td style="width: 300px;" > </td>
                  <td> 
                       <table>
                         <tr>   
                          <td> Receta: </td>
                           
                         </tr>
                          <tr>   
                          <td><b> #{{ $receta->id }}</b></td>
                            
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
                    <table class="table  table-user-information">
                    
                    <tbody>
                 
                    <tr>
                    <td >{{ $receta->consulta->created_at->format('d-m-Y') }}</td>
                        <td >Diabetes: {{ $receta->consulta->diabetes }}</td>
                        <td >Presion Arterial: {{ $receta->consulta->presion_arterial }}</td>
                     <td >SINTOMAS:  @if ($receta->consulta->ardor) <span class="badge badge-secondary">Ardor -</span>   @endif 
                       @if ($receta->consulta->dolor_cabeza) <span class="badge badge-secondary">Dolor de Cabeza -</span> @endif 
                        @if ($receta->consulta->irritacion) <span class="badge badge-secondary">Irritacion -</span> @endif 
                       @if ($receta->consulta->prurito) <span class="badge badge-secondary">Prurito -</span>  @endif 
                       @if ($receta->consulta->ensibilidad) <span class="badge badge-secondary">sensibilidad- </span> @endif 
                           @if ( $receta->consulta->dolor_ocular) <span class="badge badge-secondary">Dolor Ocular -</span>  @endif 
                         @if ( $receta->consulta->sombras) <span class="badge badge-secondary">Sombras -</span>  @endif 
                        @if ( $receta->consulta->ataratas) <span class="badge badge-secondary">Cataratas -</span>  @endif 
                        @if ( $receta->consulta->glaucoma) <span class="badge badge-secondary">Glaucoma -</span>  @endif
                          @if ( $receta->consulta->pterigion)<span class="badge badge-secondary">Pterigion -</span> @endif 
                          @if ( $receta->consulta->vision_borrosa) <span class="badge badge-secondary">Visión Borrosa -</span> @endif   
                           @if ( $receta->consulta->halos) <span class="badge badge-secondary">Halos  -</span>  @endif 
                               @if ( $receta->consulta->deslumbra) <span class="badge badge-secondary">Deslumbra -</span>  @endif 
                               @if ( $receta->consulta->mareos) <span class="badge badge-secondary">Mareos -</span> @endif 
                               @if ( $receta->consulta->inflamacion) <span class="badge badge-secondary">Inflamación -</span> @endif 
                               @if ( $receta->consulta->lagrimeo) <span class="badge badge-secondary">agrimeo -</span> @endif
                               @if ( $receta->consulta->otros) <span class="badge badge-secondary">Otros -</span> @endif</td>  
                               
                              
                    </tr>
                 
                    </tbody>
                 </table>
                 

                     <table class="table  table-user-information">
                    
                    <tbody>
                 
                    <tr>
                     
                                <td >Observaciones: {{  $receta->consulta->obs }} </td>  
                                <td >Motivo consulta: {{  $receta->consulta->motivo_consulta }} </td> 
                              
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