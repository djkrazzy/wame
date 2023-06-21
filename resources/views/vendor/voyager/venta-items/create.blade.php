@extends('voyager::master')
@section('page_header')
<h1 class="page-title">
Abono a cuota de  {{$cliente->nombres}}
    
</h1>

@stop

@section('content')


<div class="page-content edit-add container-fluid">
    
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered">
                

                    <!-- form start -->
                    {!! Form::open(['route' => 'cuota.store.orden', 'autocomplete' => 'off']) !!}
                   

                        <div class="panel-body">
                            
                          
                         <div class="form-group  col-md-12 ">
                                    
                        <label class="control-label" for="name">Nombre</label>
                          <input type="text" class="form-control" name="nombre_cliente"  value="{{$cliente->nombres.' '.$cliente->apellidos}}" readonly >
                         </div>

                         <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                 
                </div>
               
                                 
                                   <input type="hidden"  name="cantidad"  value="1">                                
                         

                          <div class="form-group  col-md-2 ">
                                    
                            <label class="control-label" for="name">Nombre</label>
                            <input type="text" class="form-control" name="nombre"  value="Abono" readonly>

                                    
                         </div>

                         <div class="form-group  col-md-2 ">
                                    
                            <label class="control-label" for="name">Descuento Venta</label>
                            <input type="number" class="form-control" name="descuento_venta" step="any" placeholder="Descuento Venta" value="">

                                    
                         </div>
                                                            <!-- GET THE DISPLAY OPTIONS -->
                                                                
                        <div class="form-group  col-md-2">
                                    
                            <label class="control-label" for="name">Saldo de Cuenta</label>
                            <input type="number" class="form-control" name="total_cuenta"id="total_cuenta" step="any" readonly value="{{$orden->deuda_cliente}}">

                                    
                            </div>
                                                            <!-- GET THE DISPLAY OPTIONS -->
                         <div class="form-group  col-md-2 ">
                                    
                             <label class="control-label" for="name">Pago Cliente</label>
                             <input type="number" class="form-control" name="precio" id="pago_cliente" step="any" onChange="calcularDeuda(this.value)" value="{{$orden->deuda_cliente}}" required>

                                    
                         </div>                                         
                 
                       
                                                                
                       
                            
                    </div><!-- panel-body -->

                        <div class="panel-footer">
                             <button type="submit" class="btn btn-primary save">Guardar</button>
                        </div>
                        {!! Form::hidden('orden_id', $orden->id ) !!}
                           {!! Form::hidden('cliente_id', $cliente->id ) !!}
                        {!! Form::close() !!}
                    <div style="display:none">
                       
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
@include('vendor.voyager.clientes.modal')
@stop

@section('javascript')
 
    <script>
    //Declaración de variables necesarias para trabajar con las compras y
//sus detalles
var impuesto=18;
var cont=0;
var detalles=0;


        var deleteFormAction;
        $('.delete').on('click', function (e) {
            var form = $('#delete_form')[0];

            if (!deleteFormAction) {
                // Save form action initial value
                deleteFormAction = form.action;
            }

            form.action = deleteFormAction.match(/\/[0-9]+$/)
                ? deleteFormAction.replace(/([0-9]+$)/, $(this).data('id'))
                : deleteFormAction + '/' + $(this).data('id');

            $('#delete_modal').modal('show');
        });



        function agregarDetalle(idarticulo,articulo,precio_venta)
  {
    var cantidad=1;
    var descuento=0;

    if (idarticulo!="")
    {
      var subtotal=cantidad*precio_venta;
      var fila='<tr class="filas" id="fila'+cont+'">'+
      '<td><button type="button" class="btn btn-danger" onclick="eliminarDetalle('+cont+')">X</button></td>'+
      '<td><input type="hidden" name="idarticulo[]" value="'+idarticulo+'"><input type="text" name="concepto[]" id="concepto[]" class="form-control" value="'+articulo+'" size="20"></td>'+
      '<td><input type="number" name="cantidad[]" id="cantidad[]" value="'+cantidad+'"><input type="hidden"  id="valor_cuota[]" name="valor_cuota[]" value="'+subtotal+'" ></td>'+
      '<td><input type="number" name="precio_venta[]" id="precio_venta[]" value="'+precio_venta+'"></td>'+
      '<td><input type="number" name="descuento[]" value="'+descuento+'"></td>'+
      '<td><span name="subtotal" id="subtotal'+cont+'">'+subtotal+'</span></td>'+
      '<td><button type="button" onclick="modificarSubototales()" class="btn btn-info"><i class="fa fa-refresh"></i></button></td>'+
      '</tr>';
      cont++;
      detalles=detalles+1;
      $('#detalles').append(fila);
      modificarSubototales();
    }
    else
    {
      alert("Error al ingresar el detalle, revisar los datos del artículo");
    }
  }

  function modificarSubototales()
  {
    var cant = document.getElementsByName("cantidad[]");
    var prec = document.getElementsByName("precio_venta[]");
    var desc = document.getElementsByName("descuento[]");
    var sub = document.getElementsByName("subtotal");

    for (var i = 0; i <cant.length; i++) {
      var inpC=cant[i];
      var inpP=prec[i];
      var inpD=desc[i];
      var inpS=sub[i];

      inpS.value=(inpC.value * inpP.value)-inpD.value;
      document.getElementsByName("subtotal")[i].innerHTML = inpS.value;
    }
    calcularTotales();

  }
  function calcularTotales(){
    var sub = document.getElementsByName("subtotal");
    var total = 0.0;

    for (var i = 0; i <sub.length; i++) {
    total += document.getElementsByName("subtotal")[i].value;
  }
  $("#total").html("Q/. " + total);
    $("#total_venta").val(total);
    
    $("#total_cuenta").val(total);
    evaluar();
  }

  function evaluar(){
    if (detalles>0)
    {
      $("#btnGuardar").show();
    }
    else
    {
      $("#btnGuardar").hide(); 
      cont=0;
    }
  }

  function eliminarDetalle(indice){
    $("#fila" + indice).remove();
    calcularTotales();
    detalles=detalles-1;
    evaluar()
  }

////////////////////FEL ////////////////////////////////////////
function listarArticulos()
{
  tabla=$('#tblarticulos').dataTable(
  {
    "aProcessing": true,//Activamos el procesamiento del datatables
      "aServerSide": true,//Paginación y filtrado realizados por el servidor
      dom: 'Bfrtip',//Definimos los elementos del control de tabla
      buttons: [              
                
            ],
    "ajax":
        {
          url: '../ajax/pos_venta.php?op=listarArticulosVenta',
          type : "get",
          dataType : "json",            
          error: function(e){
            console.log(e.responseText);  
          }
        },
    "bDestroy": true,
    "iDisplayLength": 5,//Paginación
      "order": [[ 0, "desc" ]]//Ordenar (columna,orden)
  }).DataTable();
}
 
 function init(){
   $('#tblarticulos').DataTable();
 }


 function calcularDeuda(pago){
  
   var deuda = $("#total_cuenta").val() -$("#pago_cliente").val();
     $("#deuda_cliente").val(deuda);
 }


init()
    </script>
@stop