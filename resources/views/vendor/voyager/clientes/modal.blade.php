<div class="modal fade" id="items">
    <div class="modal-dialog modal-lg">
    <div class="modal-content">
     <div class="modal-header ">
    <h4 class="modal-title">Articulos</h4>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
    <span aria-hidden="true">&times;</span>
    </button>
    </div>
    <div class="modal-body">
    <table id="tblarticulos" class="table table-striped table-bordered table-condensed table-hover">
              <thead>
                <th>Opciones</th>
                <th>Nombre</th>
                <th>Categoría</th>
                <th>Marca</th>
                <th>Material</th>
                <th>Código</th>
                <th>En Stock</th>
                <th>Precio Venta</th>
                 <th>Locacion</th>
                <th>Imagen</th>
              </thead>
              <tbody>
               @foreach($articulos as $articulo )
                     <tr>
                <td><button class="btn btn-warning" onclick="agregarDetalle('{{$articulo->id}}','{{$articulo->nombre}}','{{$articulo->precio}}')"><span class="icon voyager-list-add"></span></button></td>
                <td> {{$articulo->nombre}}</td>
                <td>{{$articulo->categoria->nombre}}</td>
                <td> @if ($articulo->marca) {{$articulo->marca->nombre}} @else Sin Datos @endif</td>
                <td>@if ($articulo->material) {{$articulo->material->nombre}} @else Sin Datos @endif</td>
                <td>{{$articulo->codigo}}</td>
                <td>{{$articulo->cantidad}}</td>
                <td>{{$articulo->precio}}</td>
                <td>@if ($articulo->jornada) Jornada @else Clinica @endif </td>
                <td><img src="{{ Storage::url($articulo->imagen)}} " style="width:100px"></td>
              </tr>
               @endforeach
              </tbody>
              <tfoot>
                <th>Opciones</th>
                <th>Nombre</th>
                <th>Categoría</th>
                <th>Marca</th>
                <th>Material</th>
                <th>Código</th>
                <th>En Stock</th>
                <th>Precio Venta</th>
                <th>Locacion</th>
                <th>Imagen</th>
              </tfoot>
            </table>
    </div>
    <div class="modal-footer justify-content-between">
    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
  
    </div>
    </div>
    
    </div>
    
    </div>