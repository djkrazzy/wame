@php
    $edit = !is_null($dataTypeContent->getKey());
    $add  = is_null($dataTypeContent->getKey());
@endphp

@extends('voyager::master')

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@stop

@section('page_title', __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular')) 

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i>
        {{ __('voyager::generic.'.($edit ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular') }}
    </h1>
    @include('voyager::multilingual.language-selector')
@stop

@section('content')
    <div class="page-content edit-add container-fluid">
        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered">
                    <!-- form start -->
                    <form role="form"
                            class="form-edit-add"
                            action="{{ $edit ? route('voyager.'.$dataType->slug.'.update', $dataTypeContent->getKey()) : route('voyager.'.$dataType->slug.'.store') }}"
                            method="POST" enctype="multipart/form-data">
                        <!-- PUT Method if we are editing -->
                        @if($edit)
                            {{ method_field("PUT") }}
                        @endif

                        <!-- CSRF TOKEN -->
                        {{ csrf_field() }}

                        <div class="panel-body">

                            @if (count($errors) > 0)
                                <div class="alert alert-danger">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif

                            <!-- Adding / Editing -->
                            @php
                                $dataTypeRows = $dataType->{($edit ? 'editRows' : 'addRows' )};
                            @endphp

                            @foreach($dataTypeRows as $row)
                                <!-- GET THE DISPLAY OPTIONS -->
                                @php
                                    $display_options = $row->details->display ?? NULL;
                                    if ($dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')}) {
                                        $dataTypeContent->{$row->field} = $dataTypeContent->{$row->field.'_'.($edit ? 'edit' : 'add')};
                                    }
                                @endphp
                                @if (isset($row->details->legend) && isset($row->details->legend->text))
                                    <legend class="text-{{ $row->details->legend->align ?? 'center' }}" style="background-color: {{ $row->details->legend->bgcolor ?? '#f0f0f0' }};padding: 5px;">{{ $row->details->legend->text }}</legend>
                                @endif

                                <div class="form-group @if($row->type == 'hidden') hidden @endif col-md-{{ $display_options->width ?? 6 }} {{ $errors->has($row->field) ? 'has-error' : '' }}" @if(isset($display_options->id)){{ "id=$display_options->id" }}@endif>
                                    {{ $row->slugify }}
                                    <label class="control-label" for="name">{{ $row->getTranslatedAttribute('display_name') }}</label>
                                    @include('voyager::multilingual.input-hidden-bread-edit-add')
                                    @if ($add && isset($row->details->view_add))
                                        @include($row->details->view_add, ['row' => $row, 'dataType' => $dataType, 'dataTypeContent' => $dataTypeContent, 'content' => $dataTypeContent->{$row->field}, 'view' => 'add', 'options' => $row->details])
                                    @elseif ($edit && isset($row->details->view_edit))
                                        @include($row->details->view_edit, ['row' => $row, 'dataType' => $dataType, 'dataTypeContent' => $dataTypeContent, 'content' => $dataTypeContent->{$row->field}, 'view' => 'edit', 'options' => $row->details])
                                    @elseif (isset($row->details->view))
                                        @include($row->details->view, ['row' => $row, 'dataType' => $dataType, 'dataTypeContent' => $dataTypeContent, 'content' => $dataTypeContent->{$row->field}, 'action' => ($edit ? 'edit' : 'add'), 'view' => ($edit ? 'edit' : 'add'), 'options' => $row->details])
                                    @elseif ($row->type == 'relationship')
                                        @include('voyager::formfields.relationship', ['options' => $row->details])
                                    @else
                                        {!! app('voyager')->formField($row, $dataType, $dataTypeContent) !!}
                                    @endif

                                    @foreach (app('voyager')->afterFormFields($row, $dataType, $dataTypeContent) as $after)
                                        {!! $after->handle($row, $dataType, $dataTypeContent) !!}
                                    @endforeach
                                    @if ($errors->has($row->field))
                                        @foreach ($errors->get($row->field) as $error)
                                            <span class="help-block">{{ $error }}</span>
                                        @endforeach
                                    @endif
                                </div>
                            @endforeach
                            
                        </div><!-- panel-body -->



  <div class="row">
        <div class="col-md-6">

            <div class="panel panel-bordered">
                <!-- form start -->
              
                    <!-- PUT Method if we are editing -->

                    <!-- CSRF TOKEN -->

                    <div class="panel-body">


                        <!-- Adding / Editing -->

                        <!-- GET THE DISPLAY OPTIONS -->
                    <div class="row">
                    <h3>Datos de la consulta</h3>
                        <div class="form-group  col-md-3 ">

                            <label class="control-label" for="name">Diabetes</label>
                            <input type="text" class="form-control" name="diabetes" placeholder="Diabetes" value="">


                        </div>
                        <!-- GET THE DISPLAY OPTIONS -->

                        <div class="form-group  col-md-3 ">

                            <label class="control-label" for="name">Presion Arterial</label>
                            <input type="text" class="form-control" name="presion_arterial" placeholder="Presion Arterial" value="">


                        </div>
                     </div>
                        <!-- GET THE DISPLAY OPTIONS -->

                        <div class="form-group  col-md-3 ">
                                <div class="form-check ">
                                <label class="form-check-label" for="defaultCheck1">
                                Ardor
                                </label>
                                <br>
                                <input class="form-check-input" type="checkbox"  data-toggle="toggle"  data-1="SI" data-off="NO" id="ardor"  name="ardor" >
                                </div>
                        </div>
                        <!-- GET THE DISPLAY OPTIONS -->

                        <div class="form-group  col-md-3 ">
                        <div class="form-check">
                        <label class="form-check-label" for="defaultCheck1">
                                Dolor de Cabeza
                                </label>
                                <br>
                                <input class="form-check-input" type="checkbox" data-toggle="toggle"  data-on="SI" data-off="NO" id="dolor_cabeza"  name="dolor_cabeza" >
                                </div>
                        </div>
                        <!-- GET THE DISPLAY OPTIONS -->

                        <div class="form-group  col-md-3 ">

                            <label class="control-label" for="name">Irrtitacion</label>
                            <br>


                            <div class="form-check">
                            <input type="checkbox" name="irrtitacion" data-toggle="toggle"  data-on="SI" data-off="NO">
                                
                            </div>


                        </div>
                        <!-- GET THE DISPLAY OPTIONS -->

                        <div class="form-group  col-md-3 ">

                            <label class="control-label" for="name">Prurito</label>
                            <br>


                            <div class="form-check">
                            <input type="checkbox" name="prurito" data-toggle="toggle"  data-on="SI" data-off="NO">
                                
                            </div>


                        </div>
                        <!-- GET THE DISPLAY OPTIONS -->

                        <div class="form-group  col-md-3 ">

                            <label class="control-label" for="name">Sensibilidad</label>
                            <br>


                            <div class="form-check">
                            <input type="checkbox" name="sensibilidad" data-toggle="toggle"  data-on="SI" data-off="NO">
                                
                            </div>

                        </div>
                        <!-- GET THE DISPLAY OPTIONS -->

                        <div class="form-group  col-md-3 ">

                            <label class="control-label" for="name">Dolor Ocular</label>
                            <br>


                            <div class="form-check">
                            <input type="checkbox" name="dolor_ocular" data-toggle="toggle"  data-on="SI" data-off="NO">
                                
                            </div>



                        </div>
                        <!-- GET THE DISPLAY OPTIONS -->

                        <div class="form-group  col-md-3 ">

                            <label class="control-label" for="name">Sombras</label>
                            <br>


                            <div class="form-check">
                            <input type="checkbox" name="combras" data-toggle="toggle"  data-on="SI" data-off="NO">
                                
                            </div>



                        </div>
                        <!-- GET THE DISPLAY OPTIONS -->

                        <div class="form-group  col-md-3 ">

                            <label class="control-label" for="name">Cataratas</label>
                            <br>


                            <div class="form-check">
                            <input type="checkbox" name="cataratas" data-toggle="toggle"  data-on="SI" data-off="NO">
                                
                            </div>



                        </div>
                        <!-- GET THE DISPLAY OPTIONS -->

                        <div class="form-group  col-md-3 ">

                            <label class="control-label" for="name">Glaucoma</label>
                            <br>


                            <div class="form-check">
                            <input type="checkbox" name="glaucoma" data-toggle="toggle"  data-on="SI" data-off="NO">
                                
                            </div>



                        </div>
                        <!-- GET THE DISPLAY OPTIONS -->

                        <div class="form-group  col-md-3 ">

                            <label class="control-label" for="name">Pterigion</label>
                            <br>


                            <div class="form-check">
                            <input type="checkbox" name="pterigion" data-toggle="toggle"  data-on="SI" data-off="NO">
                                
                            </div>


                        </div>
                        <!-- GET THE DISPLAY OPTIONS -->

                        <div class="form-group  col-md-3 ">

                            <label class="control-label" for="name">Vision Borrosa</label>
                            <br>


                            <div class="form-check">
                            <input type="checkbox" name="vision_borrosa" data-toggle="toggle"  data-on="SI" data-off="NO">
                                
                            </div>


                        </div>
                        <!-- GET THE DISPLAY OPTIONS -->

                        <div class="form-group  col-md-3 ">

                            <label class="control-label" for="name">Halos</label>
                            <br>


                            <div class="form-check">
                            <input type="checkbox" name="halos" data-toggle="toggle"  data-on="SI" data-off="NO">
                                
                            </div>


                        </div>
                        <!-- GET THE DISPLAY OPTIONS -->

                        <div class="form-group  col-md-3 ">

                            <label class="control-label" for="name">Deslumbramiento</label>
                            <br>


                            <div class="form-check">
                            <input type="checkbox" name="deslumbra" data-toggle="toggle"  data-on="SI" data-off="NO">
                                
                            </div>

                        </div>
                        <!-- GET THE DISPLAY OPTIONS -->

                        <div class="form-group  col-md-3 ">

                            <label class="control-label" for="name">Mareos</label>
                            <br>


                            <div class="form-check">
                            <input type="checkbox" name="mareos" data-toggle="toggle"  data-on="SI" data-off="NO">
                                
                            </div>


                        </div>
                        <!-- GET THE DISPLAY OPTIONS -->

                        <div class="form-group  col-md-3 ">

                            <label class="control-label" for="name">Inflamacion</label>
                            <br>


                            <div class="form-check">
                            <input type="checkbox" name="inflamacion" data-toggle="toggle"  data-on="SI" data-off="NO">
                                
                            </div>


                        </div>
                        <!-- GET THE DISPLAY OPTIONS -->

                        <div class="form-group  col-md-3 ">

                            <label class="control-label" for="name">Lagrimeo</label>
                            <br>


                            <div class="form-check">
                            <input type="checkbox" name="lagrimeo" data-toggle="toggle"  data-1="SI" data-off="NO">
                                
                            </div>



                        </div>
                        <!-- GET THE DISPLAY OPTIONS -->

                        <div class="form-group  col-md-3 ">

                            <label class="control-label" for="name">Otros</label>
                            <br>


                            <div class="form-check">
                            <input type="checkbox" name="otros" data-toggle="toggle"  data-1="SI" data-off="NO">
                                
                            </div>



                        </div>
                        <!-- GET THE DISPLAY OPTIONS -->

                        <div class="form-group  col-md-9 ">

                            <label class="control-label" for="name">Observaciones</label>
                            <input required="" type="text" class="form-control" name="obs" placeholder="Obs" value="">


                        </div>
                        <!-- GET THE DISPLAY OPTIONS -->

                        <div class="form-group  col-md-12 ">

                            <label class="control-label" for="name">Motivo Consulta</label>
                            <input required="" type="text" class="form-control" name="motivo_consulta" placeholder="Motivo Consulta" value="">
                         
                        

                        </div>
                        <!-- GET THE DISPLAY OPTIONS -->

                        
                      
                    </div><!-- panel-body -->

                    <div class="panel-footer">
                     
                    </div>

                <div style="display:none">
                   
                  
              
                   
                     
                </div>
            </div>
        </div>
    </div>







<div class="row">
            <div class="col-md-12">

                <div class="panel panel-bordered">
                    <!-- form start -->
                   
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
                          <td >{!! Form::text('cartilla_oi', '',['class' => 'form-control'] ) !!}</td>
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

                       
                  
                </div>

                


            </div>
        </div>














                       
                    </form>

                    <div style="display:none">
                        <input type="hidden" id="upload_url" value="{{ route('voyager.upload') }}">
                        <input type="hidden" id="upload_type_slug" value="{{ $dataType->slug }}">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade modal-danger" id="confirm_delete_modal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i class="voyager-warning"></i> {{ __('voyager::generic.are_you_sure') }}</h4>
                </div>

                <div class="modal-body">
                    <h4>{{ __('voyager::generic.are_you_sure_delete') }} '<span class="confirm_delete_name"></span>'</h4>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
                    <button type="button" class="btn btn-danger" id="confirm_delete">{{ __('voyager::generic.delete_confirm') }}</button>
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

        function deleteHandler(tag, isMulti) {
          return function() {
            $file = $(this).siblings(tag);

            params = {
                slug:   '{{ $dataType->slug }}',
                filename:  $file.data('file-name'),
                id:     $file.data('id'),
                field:  $file.parent().data('field-name'),
                multi: isMulti,
                _token: '{{ csrf_token() }}'
            }

            $('.confirm_delete_name').text(params.filename);
            $('#confirm_delete_modal').modal('show');
          };
        }

        $('document').ready(function () {
            $('.toggleswitch').bootstrapToggle();

            //Init datepicker for date fields if data-datepicker attribute defined
            //or if browser does not handle date inputs
            $('.form-group input[type=date]').each(function (idx, elt) {
                if (elt.hasAttribute('data-datepicker')) {
                    elt.type = 'text';
                    $(elt).datetimepicker($(elt).data('datepicker'));
                } else if (elt.type != 'date') {
                    elt.type = 'text';
                    $(elt).datetimepicker({
                        format: 'L',
                        extraFormats: [ 'YYYY-MM-DD' ]
                    }).datetimepicker($(elt).data('datepicker'));
                }
            });

            @if ($isModelTranslatable)
                $('.side-body').multilingual({"editing": true});
            @endif

            $('.side-body input[data-slug-origin]').each(function(i, el) {
                $(el).slugify();
            });

            $('.form-group').on('click', '.remove-multi-image', deleteHandler('img', true));
            $('.form-group').on('click', '.remove-single-image', deleteHandler('img', false));
            $('.form-group').on('click', '.remove-multi-file', deleteHandler('a', true));
            $('.form-group').on('click', '.remove-single-file', deleteHandler('a', false));

            $('#confirm_delete').on('click', function(){
                $.post('{{ route('voyager.'.$dataType->slug.'.media.remove') }}', params, function (response) {
                    if ( response
                        && response.data
                        && response.data.status
                        && response.data.status == 200 ) {

                        toastr.success(response.data.message);
                        $file.parent().fadeOut(300, function() { $(this).remove(); })
                    } else {
                        toastr.error("Error removing file.");
                    }
                });

                $('#confirm_delete_modal').modal('hide');
            });
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
@stop
