@php
    
@endphp

@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@stop



@section('page_header')
    <h1 class="page-title">
        <i class="glyphicon voyager-file-text"></i>  Nueva cita para {{ $cliente->nombres.' '. $cliente->apellidos  }} 
      
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
  <div class="page-content edit-add container-fluid">
        <div class="row">
            <div class="col-md-3">

                <div class="panel panel-bordered">
                    <!-- form start -->
                      {!! Form::open(['route' => 'cita.store.cliente', 'autocomplete' => 'off']) !!}
                        <!-- PUT Method if we are editing -->
                        
                        <!-- CSRF TOKEN -->
                      

                        <div class="panel-body">

                            
                            <!-- Adding / Editing -->
                            
                                                            <!-- GET THE DISPLAY OPTIONS -->
                                                                
                                <div class="form-group  col-md-12 ">
                                    
                                    <label class="control-label" for="name">Fecha Hora</label>
                            <input type="datetime-local" id="datetimepicker" class="form-control " name="fecha_hora" value="">

                                    
                                                                                                        </div>
                                                            <!-- GET THE DISPLAY OPTIONS -->
                                                                
                                <div class="form-group  col-md-12 ">
                                    
                                    <label class="control-label" for="name">Nota</label>
                                 <input type="text" class="form-control" name="nota" placeholder="Nota" value="">

                                    
                            </div>

                             <div class="form-group  col-md-12 ">
                                    
                                    <label class="control-label" for="name">Tipo:</label>
                                <select name="tipo" id="tipo">
                                        <option value="Cita">Cita</option>
                                        <option value="Consulta">Consulta</option>
                                    
                                    </select>

                                    
                            </div>
                                                            <!-- GET THE DISPLAY OPTIONS -->
                                                                
                                <div class="form-group  col-md-12 ">
                                    
                                    <label class="control-label" for="name">Estado</label>
                                                                                                                <br>
    

    <div class="toggle btn btn-primary" data-toggle="toggle" style="width: 115.412px; height: 29px;"><input type="checkbox" name="estado" class="toggleswitch" data-on="Activa" checked="checked" data-off="Cancelada"><div class="toggle-group"><label class="btn btn-primary toggle-on">Activa</label><label class="btn btn-default active toggle-off">Cancelada</label><span class="toggle-handle btn btn-default"></span></div></div>

                                    
                                                                                                        </div>
                                                            <!-- GET THE DISPLAY OPTIONS -->
                                                                
                       

                        <div class="panel-footer">
                                                                                        <button type="submit" class="btn btn-primary save">Guardar</button>
                                                    </div>
                      {!! Form::hidden('cliente_id', $cliente->id ) !!}
                        {!! Form::close() !!}
                    </form>

                    <div style="display:none">
                        <input type="hidden" id="upload_url" value="http://optica.test:8080/admin/upload">
                        <input type="hidden" id="upload_type_slug" value="citas">
                    </div>
                </div>
            </div>
        </div>
    </div>

   
    <!-- End Delete File Modal -->
@stop

@section('javascript')
    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.26.0/moment.min.js"></script>
<script>
        var params = {};
        var $file;
      function init(){

          
                
                  //$('#datetimepicker').datetimepicker();
           
      }

      init();
       
    </script>
@stop
