@php
    
@endphp

@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@stop



@section('page_header')
    <h1 class="page-title">
        <i class="glyphicon voyager-file-text"></i>  Nueva receta para {{ $cliente->nombres.' '. $cliente->apellidos  }} 
      
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
    <div class="page-content edit-add container-fluid">
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered">
                    <!-- form start -->
                      {!! Form::open(['route' => 'receta.store.cliente', 'autocomplete' => 'off']) !!}
                     <table class="table  table-user-information">
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
                        <td  >{!! Form::text('od_esf', '',['class' => 'form-control'] ) !!}</td>
                        <td >{!! Form::text('od_cil', '',['class' => 'form-control'] ) !!}</td>
                         <td >{!! Form::text('od_eje', '',['class' => 'form-control'] ) !!}</td>
                            <td >{!! Form::text('color', '',['class' => 'form-control'] ) !!}</td>
                          <td >{!! Form::text('cartilla', '',['class' => 'form-control'] ) !!}</td>
                      </tr>
                       <tr>
                       <td class="bg-primary text-white">OI</td>
                       
                        <td > {!! Form::text('oi_esf', '',['class' => 'form-control'] ) !!}</td>
                        <td >{!! Form::text('oi_cil', '',['class' => 'form-control'] ) !!}</td>
                        <td >{!! Form::text('oi_eje', '',['class' => 'form-control'] ) !!}</td>
                         <td class="bg-primary text-white">MATERIAL</td>
                         <td >..0</td>
                          </tr>
                       <tr>
                         <td class="bg-primary text-white">ADD</td>
                       <td >{!! Form::text('od_add', '',['class' => 'form-control'] ) !!}</td> 
                        <td >{!! Form::text('oi_add', '',['class' => 'form-control'] ) !!}</td>
                            <td >...</td>
                            <td >{!! Form::text('material', '',['class' => 'form-control'] ) !!}</td>
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
                    <td >{!! Form::text('dip', '',['class' => 'form-control'] ) !!}{!! Form::hidden('receta_id', '' ) !!}</td>
                      <td >...</td>
                   </tr>
                  
                    </tbody>
                 </table>
                  <div class="panel-footer">
                            @section('submit-buttons')
                                <button type="submit" class="btn btn-primary save">Guardar</button>
                            @stop
                            @yield('submit-buttons')
                        </div>

                          {!! Form::hidden('cliente_id', $cliente->id ) !!}
                           {!! Form::hidden('consulta_id', $consulta_id ) !!}
                   {!! Form::close() !!}
                </div>

                


            </div>
        </div>
    </div>

   
    <!-- End Delete File Modal -->
@stop

@section('javascript')
    <script>
        var params = {};
        var $file;

       
    </script>
@stop
