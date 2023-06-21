@extends('voyager::master')

@section('page_title', __('voyager::generic.view').' '.$dataType->getTranslatedAttribute('display_name_singular'))

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i> {{ __('voyager::generic.viewing') }} {{ ucfirst($dataType->getTranslatedAttribute('display_name_singular')) }} &nbsp;

        @can('edit', $dataTypeContent)
            <a href="{{ route('voyager.'.$dataType->slug.'.edit', $dataTypeContent->getKey()) }}" class="btn btn-info">
                <i class="glyphicon glyphicon-pencil"></i> <span class="hidden-xs hidden-sm">{{ __('voyager::generic.edit') }}</span>
            </a>
        @endcan
        @can('delete', $dataTypeContent)
            @if($isSoftDeleted)
                <a href="{{ route('voyager.'.$dataType->slug.'.restore', $dataTypeContent->getKey()) }}" title="{{ __('voyager::generic.restore') }}" class="btn btn-default restore" data-id="{{ $dataTypeContent->getKey() }}" id="restore-{{ $dataTypeContent->getKey() }}">
                    <i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">{{ __('voyager::generic.restore') }}</span>
                </a>
            @else
                <a href="javascript:;" title="{{ __('voyager::generic.delete') }}" class="btn btn-danger delete" data-id="{{ $dataTypeContent->getKey() }}" id="delete-{{ $dataTypeContent->getKey() }}">
                    <i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">{{ __('voyager::generic.delete') }}</span>
                </a>
            @endif
        @endcan
        @can('browse', $dataTypeContent)
        <a href="{{ route('voyager.'.$dataType->slug.'.index') }}" class="btn btn-warning">
            <i class="glyphicon glyphicon-list"></i> <span class="hidden-xs hidden-sm">{{ __('voyager::generic.return_to_list') }}</span>
        </a>
        @endcan
       

            


             
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
    <div class="page-content read container-fluid">


 <div class="row">
    
    <div class="col-xs-12 col-sm-12   toppad" >


      <div class="panel panel">
       
      
       
      
         <div class="panel-heading">

                 {!! Form::open(['route' => 'voyager.consultas.create', 'autocomplete' => 'off', 'method' => 'get']) !!}
                 {!! Form::hidden('cliente_id', $dataTypeContent->id ) !!}

                 <button type="submit" class="btn btn-info float-left" style="margin-right:10px ;"> <i class="glyphicon voyager-file-text"></i> <span class="hidden-xs hidden-sm">Crear Consulta</span></button>
                 {!! Form::close() !!}
         

      
         
         <h3 class="panel-title">INFORMACION PERSONAL</h3>
                 
        </div>
        <div class="panel-body">
          <div class="row">
            
            <!--<div class="col-xs-10 col-sm-10 hidden-md hidden-lg"> <br>
              <dl>
                <dt>DEPARTMENT:</dt>
                <dd>Administrator</dd>
                <dt>HIRE DATE</dt>
                <dd>11/12/2013</dd>
                <dt>DATE OF BIRTH</dt>
                   <dd>11/12/2013</dd>
                <dt>GENDER</dt>
                <dd>Male</dd>
              </dl>
            </div>-->
            <div class=" col-md-6"> 
              <table class="table table-user-information">
                <tbody>
                  <tr>
                    <td>Nombre:</td>
                    <td>  {{ $dataTypeContent->nombres.' '. $dataTypeContent->apellidos  }}  </td>
                  </tr>
                  <tr>
                    <td>Telefono:</td>
                    <td>{{ $dataTypeContent->telefono }}</td>
                  </tr>
                  <tr>
                    <td>E-mail:</td>
                    <td>{{ $dataTypeContent->email }}</td>
                  </tr>
                  <tr>
                    <td>Dirección:</td>
                    <td>{{ $dataTypeContent->direccion }}</td>
                  </tr>
                  <tr>
                    <td>Genero:</td>
                    <td>{{ $dataTypeContent->genero }}</td>
                  </tr>
                  <tr>
                    <td>Nacimiento:</td>
                    <td>{{ $dataTypeContent->nacimiento }}</td>
                  </tr>
                  <tr>
                    <td>Edad:</td>
                    <td>{{$edad}}</td>
                  </tr>
                   <tr>
                    <td>Tutor o encargado:</td>
                    <td>{{$dataTypeContent->tutor }}</td>
                  </tr>
                  <tr>
                    <td>Ocupacion:</td>
                    <td>{{ $dataTypeContent->ocupacion }}</td>
                  </tr>
                  <tr>
                    <td>HA SIDO EXAMINADO:</td>
                    <td>@if ($dataTypeContent->exanen)<span class="badge badge-success">SI</span> @else <span class="badge badge-danger">NO</span>   @endif</td>
                  </tr>
                  <tr>
                    <td>USA ANETOJOS:</td>
                    <td>@if ($dataTypeContent->anteojos)<span class="badge badge-success">SI</span> @else <span class="badge badge-danger">NO</span>   @endif</td>
                  </tr>
                  <tr>
                    <td>EMBARAZO:</td>
                    <td>@if ($dataTypeContent->embarazo)<span class="badge badge-success">SI</span> @else <span class="badge badge-danger">NO</span>   @endif</td>
                  </tr>
                  <tr>
                    <td>NERVIOS:</td>
                    <td>@if ($dataTypeContent->nervios)<span class="badge badge-success">SI</span> @else <span class="badge badge-danger">NO</span>   @endif</td>
                  </tr>
                   <tr>
                    <td>Jornada Medica:</td>
                    <td>@if ($dataTypeContent->jornada)<span class="badge badge-success">SI</span> @else <span class="badge badge-danger">NO</span>   @endif</td>
                  </tr>
                </tbody>
              </table>
              
            
              </div>


                  <div class="col-md-6">
         <div class="panel panel-bordered" style="padding-bottom:5px;">
           <div class="panel" style="border-bottom:0;">
           {!! Form::open(['route' => 'cita.create', 'autocomplete' => 'off']) !!}
                 {!! Form::hidden('user_id', $dataTypeContent->id ) !!}
                

                 <button type="submit" class="btn btn-info float-left" style="margin-right:10px ;"> <i class="glyphicon voyager-calendar"></i> <span class="hidden-xs hidden-sm">Crear Nueva Cita</span></button>
                 {!! Form::close() !!}
                 <h3 >  Citas</h3>
            </div>

            <div class="panel-body" style="padding-top:0;">
            
                 <table class="table table-hover">
                    <thead>
                       <tr>
                       <th >ID</td>
                        <th >Fecha y hora</th>
                        <th >Nota</th>
                        <th >Tipo</th>
                        <th >Estado</th>
                     
                       </tr>
                    </thead>
                    <tbody>
                   @foreach($dataTypeContent->cita as $item )
                    <tr>
                    <td >{{ $item->id }}</td>
                        <td >{{ $item->fecha_hora }}</td>
                        <td >{{ $item->nota }}</td>
                         <td >{{ $item->tipo }}</td>
                        <td >@if  ($item->estado)Activa @else Cancelada @endif</td>
                     
                        
                    </tr>
                  @endforeach
                    </tbody>
                 </table>   
                  
            </div>
         </div>  
        </div>


          </div>
        </div>
        
        
      </div>
    </div>
  </div>



    <div class="row">
        <div class="col-md-12">
         <div class="panel panel-bordered" style="padding-bottom:5px;">
           <div class="panel-heading" style="border-bottom:0;">
                 <h3 class="panel-title">Historial medico de Consultas</h3>
             
            
            </a>
            </div>

            <div class="panel-body" style="padding-top:0;">
              @foreach($dataTypeContent->consulta as $item )
                 <table class="table table-hover">
                    
                    <tbody>
                 
                    <tr>
                    <td >{{ $item->created_at->format('d-m-Y') }}</td>
                        <td >Diabetes: {{ $item->diabetes }}</td>
                        <td >Presion Arterial: {{ $item->presion_arterial }}</td>
                     <td >  @if ($item->ardor) <span class="badge badge-secondary">Ardor</span>   @endif 
                       @if ($item->dolor_cabeza) <span class="badge badge-secondary">Dolor de Cabeza </span> @endif 
                        @if ($item->irritacion) <span class="badge badge-secondary">Irritacion </span> @endif 
                       @if ($item->prurito) <span class="badge badge-secondary">Prurito </span>  @endif 
                       @if ($item->sensibilidad) <span class="badge badge-secondary">sensibilidad </span> @endif 
                           @if ($item->dolor_ocular) <span class="badge badge-secondary">Dolor Ocular </span>  @endif 
                         @if ($item->sombras) <span class="badge badge-secondary">Sombras </span>  @endif 
                        @if ($item->cataratas) <span class="badge badge-secondary">Cataratas </span>  @endif 
                        @if ($item->glaucoma) <span class="badge badge-secondary">Glaucoma </span>  @endif
                          @if ($item->pterigion)<span class="badge badge-secondary">Pterigion </span> @endif 
                          @if ($item->vision_borrosa) <span class="badge badge-secondary">Visión Borrosa </span> @endif   
                           @if ($item->halos) <span class="badge badge-secondary">Halos </span>  @endif 
                               @if ($item->deslumbra) <span class="badge badge-secondary">Deslumbra </span>  @endif 
                               @if ($item->mareos) <span class="badge badge-secondary">Mareos </span> @endif 
                               @if ($item->inflamacion) <span class="badge badge-secondary">Inflamación </span> @endif 
                               @if ($item->lagrimeo) <span class="badge badge-secondary">agrimeo</span> @endif
                               @if ($item->otros) <span class="badge badge-secondary">Otros </span> @endif</td>  
                                <td >Observaciones: {{ $item->obs }} </td>  
                                <td >Motivo consulta: {{ $item->motivo_consulta }} </td> 
                              <td> 
                              @if ($item->receta) 
                                 
                 {!! Form::open(['route' => 'imprimir.receta', 'autocomplete' => 'off','target'=> '_blank']) !!}
                 {!! Form::hidden('user_id', $dataTypeContent->id ) !!}
                 {!! Form::hidden('receta_id', $item->receta->id) !!}

                 <button type="submit" class="btn btn-info float-right">Imprimir</button>
                 {!! Form::close() !!}
                              @else  
                              {!! Form::open(['route' => 'receta.create.orden', 'autocomplete' => 'off']) !!}
                 {!! Form::hidden('user_id', $dataTypeContent->id ) !!}
                   {!! Form::hidden('consulta_id', $item->id ) !!}

                 <button type="submit" class="btn btn-info float-left" style="margin-right:10px ;"> <i class="glyphicon voyager-file-text"></i> <span class="hidden-xs hidden-sm">Crear Receta</span></button>
                 {!! Form::close() !!}   
                 @endif </td> 
                    </tr>
                 
                    </tbody>
                 </table>   
                    @if ($item->receta) 
                        
                 <div class="panel-body" style="padding-top:0;">
             
              {!! Form::open(['route' => 'trabajo.create.orden', 'autocomplete' => 'off']) !!}
                 {!! Form::hidden('user_id', $dataTypeContent->id ) !!}
                 {!! Form::hidden('receta_id', $item->receta->id ) !!}

                 <button type="submit" class="btn btn-warning float-left">CREAR Orden de Trabajo</button>
                 {!! Form::close() !!}
                 
                 <a href="{{ route('voyager.recetas.edit',  $item->receta->id ) }}" class="btn btn-info">
                <i class="glyphicon glyphicon-pencil"></i> <span class="hidden-xs hidden-sm">{{ __('voyager::generic.edit') }}</span>
            </a>
                 <table class="table  table-user-information">
                    <thead class="black white-text">
                       
                    </thead>
                    <tbody>
                 <tr class="bg-info text-white" >
                       <th >OJO</td>
                        <th >ESF</th>
                        <th >CIL</th>
                        <th >EJE</th>
                        <th >COLOR</th>
                        <th >CARTILLA</th>
                       
                       </tr>
                    <tr>
                    <td class="bg-info text-white">OD</td>
                        <td  >{{ $item->receta->od_esf }}</td>
                        <td >{{ $item->receta->od_cil }}</td>
                         <td >{{ $item->receta->od_eje }}</td>
                            <td >{{ $item->receta->color }}</td>
                          <td >{{ $item->receta->cartilla }}</td>
                      </tr>
                       <tr>
                       <td class="bg-info text-white">OI</td>
                       
                        <td >{{ $item->receta->oi_esf }}</td>
                        <td >{{ $item->receta->oi_cil }}</td>
                        <td >{{ $item->receta->oi_eje }}</td>
                         <td class="bg-info text-white">MATERIAL</td>
                         <td >{{ $item->receta->cartilla_oi }}</td>
                          </tr>
                       <tr>
                         <td class="bg-info text-white">ADD</td>
                       <td >{{ $item->receta->od_add }}</td> 
                        <td >{{ $item->receta->oi_add }}</td>
                            <td >...</td>
                            <td >{{ $item->receta->material }}</td>
                            <td >...</td>
                       
                        
                    </tr>
                    <tr>
                   <td >...</td>
                            <td >...</td>
                            <td >...</td>
                            <td >...</td>
                    <td class="bg-info text-white">DIP</td>
                      <td >...</td>
                   </tr>
                   <tr>
                   <td >...</td>
                            <td >...</td>
                            <td >...</td>
                            <td >...</td>
                    <td >{{ $item->receta->dip }}</td>
                      <td >...</td>
                   </tr>
                  
                    </tbody>
                 </table>  
           
                  
            </div>




                    @endif 
                   @endforeach
            </div>
         </div>  
        </div>
      </div>




    
    </div>


    <div class="row">
        <div class="col-md-12">
         <div class="panel panel-bordered" style="padding-bottom:5px;">
           <div class="panel-heading" style="border-bottom:0;">
                 <h3 class="panel-title">Ordenes de Trabajo</h3>
             
            
            </a>
            </div>

            <div class="panel-body" style="padding-top:0;">
                 <table class="table table-hover">
                    <thead>
                       <tr>
                       <th >ID</td>
                        <th >FECHA VENTA</th>
                        <th >FECHA ENTREGA</th>
                        <th >DIAS ATRASO</th>
                        <th >ESTADO</th>
                        <th >METODO DE PAGO</th>
                        <th >PRECIO TOTAL</th>
                        <th >DEUDA</th>
                         <th >OPCIONES</th>
                       
                       </tr>
                    </thead>
                    <tbody>
                   @foreach($dataTypeContent->trabajo as $item )
                    <tr>
                    <td >{{ $item->id }}</td>
                        <td >{{ $item->fecha_venta }}</td>
                        <td >{{ $item->fecha_entrega }}</td>
                        <td >{{ $item->dias_atraso }}
                     @php
                        $fechaEmision = Carbon::parse($item->fecha_entrega);
                        $fechaExpiracion = Carbon::now()  ;
                        

                        if($item->fecha_entrega > $fechaExpiracion || $item->estado ==1  ){
                        echo 0;
                    }   else{
                        
                        echo $fechaExpiracion->diffInDays($fechaEmision)   ;  
                    }
                         @endphp
                        </td>
                        <td > @if ( $item->estado == "2")
                         <spam class="btn-warning">Pendiente</spam> 
                          @elseif ( $item->estado == "1")
                          <spam class="btn-success">Entregado</spam> 
                        @endif</td>
                        <td >{{ $item->metodo_pago }}</td>
                        <td >{{ $item->total_cuenta }}</td>
                        <td >{{ $item->deuda_cliente }}</td>
                        <td>  
                        {!! Form::open(['route' => 'imprimir.orden', 'autocomplete' => 'off','target'=> '_blank']) !!}
                 {!! Form::hidden('user_id', $dataTypeContent->id ) !!}
                 {!! Form::hidden('orden_id', $item->id ) !!}

                 <button type="submit" class="btn btn-secondary">Imprimir</button>
                 {!! Form::close() !!}      
                @if ($item->deuda_cliente ==0)
                {!! Form::open(['route' => 'entregar.orden', 'autocomplete' => 'off']) !!}
                {!! Form::hidden('user_id', $dataTypeContent->id ) !!}
                 {!! Form::hidden('orden_id', $item->id ) !!}
                <button type="submit" class="btn btn-success">Entregar</button>
                 {!! Form::close() !!} 
                  @else
                   {!! Form::open(['route' => 'cuota.create.orden', 'autocomplete' => 'off']) !!}
                 {!! Form::hidden('user_id', $dataTypeContent->id ) !!}
                 {!! Form::hidden('orden_id', $item->id ) !!}

                 <button type="submit" class="btn btn-primary">Cuota</button>
                 {!! Form::close() !!} 
                @endif                     </td>
                       
                        
                    </tr>
                  @endforeach
                    </tbody>
                 </table>   
                  
            </div>
         </div>  
        </div>
      </div>

      <div class="row">
    
      </div>


    </div>
  
    {{-- Single delete modal --}}
    <div class="modal modal-danger fade" tabindex="-1" id="delete_modal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="{{ __('voyager::generic.close') }}"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title"><i class="voyager-trash"></i> {{ __('voyager::generic.delete_question') }} {{ strtolower($dataType->getTranslatedAttribute('display_name_singular')) }}?</h4>
                </div>
                <div class="modal-footer">
                    <form action="{{ route('voyager.'.$dataType->slug.'.index') }}" id="delete_form" method="POST">
                        {{ method_field('DELETE') }}
                        {{ csrf_field() }}
                        <input type="submit" class="btn btn-danger pull-right delete-confirm"
                               value="{{ __('voyager::generic.delete_confirm') }} {{ strtolower($dataType->getTranslatedAttribute('display_name_singular')) }}">
                    </form>
                    <button type="button" class="btn btn-default pull-right" data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
@stop

@section('javascript')
    @if ($isModelTranslatable)
        <script>
            $(document).ready(function () {
                $('.side-body').multilingual();
            });
        </script>
    @endif
    <script>
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

    </script>
@stop
