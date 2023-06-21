@extends('voyager::master')

@section('page_title', __('voyager::generic.viewing').' '.$dataType->getTranslatedAttribute('display_name_plural'))

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i>Ordenes de {{ $dataType->getTranslatedAttribute('display_name_plural') }}
    </h1>
    @can('add', app($dataType->model_name))
    <a href="{{ route('voyager.'.$dataType->slug.'.create') }}" class="btn btn-success btn-add-new">
        <i class="voyager-plus"></i> <span>{{ __('voyager::generic.add_new') }}</span>
    </a>
    @endcan
    @can('delete', app($dataType->model_name))
    
    @endcan
    @can('edit', app($dataType->model_name))
    @if(!empty($dataType->order_column) && !empty($dataType->order_display_column))
    <a href="{{ route('voyager.'.$dataType->slug.'.order') }}" class="btn btn-primary btn-add-new">
        <i class="voyager-list"></i> <span>{{ __('voyager::bread.order') }}</span>
    </a>
    @endif
    @endcan
    @can('delete', app($dataType->model_name))
    @if($usesSoftDeletes)
    <input type="checkbox" @if ($showSoftDeleted) checked @endif id="show_soft_deletes" data-toggle="toggle" data-on="{{ __('voyager::bread.soft_deletes_off') }}" data-off="{{ __('voyager::bread.soft_deletes_on') }}">
    @endif
    @endcan
    @foreach($actions as $action)
    @if (method_exists($action, 'massAction'))
    @include('voyager::bread.partials.actions', ['action' => $action, 'data' => null])
    @endif
    @endforeach
    @include('voyager::multilingual.language-selector')
</div>
@stop

@section('content')
<div class="page-content browse container-fluid">
    @include('voyager::alerts')
    

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-bordered">
                <div class="panel-body">

                    <div class="table-responsive">
                        <div class="col-md-4">
                            <select class="form-control estado" name="estado" id="estado">

                                <option value="2">Pendiente</option>
                                <option value="1">Entregado</option>

                            </select>
                        </div>

                        <div class="col-md-1">
                            <button id="filtrar" class="btn btn-danger">Filtrar</button>
                        </div>
                        <table id="contenido" class="table table-hover">
                            <thead>
                                <tr>
                                    
                                    <th> ID</th>
                                    <th> Cliente </th>
                                    <th> Pago Cliente </th>
                                    <th> Fecha Venta </th>
                                    <th> Fecha Entrega </th>
                                    <th> Dias Atraso </th>
                                    <th> Estado </th>
                                    <th> Metodo Pago </th>
                                    <th> Descuento Venta </th>
                                    <th> Total Cuenta </th>
                                    <th> Deuda Cliente </th>
                                    <th> Debe Cliente</th>
                                   
                                    <th> Origen</th>
                                    <th class="actions text-right dt-not-orderable">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>


                </div>
            </div>
        </div>
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
                <form action="#" id="delete_form" method="POST">
                    {{ method_field('DELETE') }}
                    {{ csrf_field() }}
                    <input type="submit" class="btn btn-danger pull-right delete-confirm" value="{{ __('voyager::generic.delete_confirm') }}">
                </form>
                <button type="button" class="btn btn-default pull-right" data-dismiss="modal">{{ __('voyager::generic.cancel') }}</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
@stop

@section('css')
@if(!$dataType->server_side && config('dashboard.data_tables.responsive'))
<link rel="stylesheet" href="{{ voyager_asset('lib/css/responsive.dataTables.min.css') }}">
@endif
@stop

@section('javascript')
<!-- DataTables -->
@if(!$dataType->server_side && config('dashboard.data_tables.responsive'))
<script src="{{ voyager_asset('lib/js/dataTables.responsive.min.js') }}"></script>
@endif
<script>
    $(document).ready(function () {
            @if (!$dataType->server_side)
                var table = $('#dataTable').DataTable({!! json_encode(
                    array_merge([
                        "order" => $orderColumn,
                        "language" => __('voyager::datatable'),
                        "columnDefs" => [
                            ['targets' => 'dt-not-orderable', 'searchable' =>  false, 'orderable' => false],
                        ],
                    ],
                    config('voyager.dashboard.data_tables', []))
                , true) !!});
            @else
                $('#search-input select').select2({
                    minimumResultsForSearch: Infinity
                });
            @endif

            @if ($isModelTranslatable)
                $('.side-body').multilingual();
                //Reinitialise the multilingual features when they change tab
                $('#dataTable').on('draw.dt', function(){
                    $('.side-body').data('multilingual').init();
                })
            @endif
            $('.select_all').on('click', function(e) {
                $('input[name="row_id"]').prop('checked', $(this).prop('checked')).trigger('change');
            });
        });


        var deleteFormAction;
        $('td').on('click', '.delete', function (e) {
            $('#delete_form')[0].action = '{{ route('voyager.'.$dataType->slug.'.destroy', '__id') }}'.replace('__id', $(this).data('id'));
            $('#delete_modal').modal('show');
        });

        @if($usesSoftDeletes)
            @php
                $params = [
                    's' => $search->value,
                    'filter' => $search->filter,
                    'key' => $search->key,
                    'order_by' => $orderBy,
                    'sort_order' => $sortOrder,
                ];
            @endphp
            $(function() {
                $('#show_soft_deletes').change(function() {
                    if ($(this).prop('checked')) {
                        $('#dataTable').before('<a id="redir" href="{{ (route('voyager.'.$dataType->slug.'.index', array_merge($params, ['showSoftDeleted' => 1]), true)) }}"></a>');
                    }else{
                        $('#dataTable').before('<a id="redir" href="{{ (route('voyager.'.$dataType->slug.'.index', array_merge($params, ['showSoftDeleted' => 0]), true)) }}"></a>');
                    }

                    $('#redir')[0].click();
                })
            })
        @endif
        $('input[name="row_id"]').on('change', function () {
            var ids = [];
            $('input[name="row_id"]').each(function() {
                if ($(this).is(':checked')) {
                    ids.push($(this).val());
                }
            });
            $('.selected_ids').val(ids);
        });



    var table = $('#contenido').DataTable({
            processing: true,
            serverSide: true,
            "autoWidth": false,
            "responsive": true,
            lengthMenu: [
                [10, 25, 50, -1],
                [10, 25, 50, 'All'],
            ],
            "lengthChange": false,

            dom: 'Bfrtip',
            "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"],
            ajax: {
                url: "{{ route('voyager.trabajos.index') }}",
                data: function(d) {
                    d.estado = $(".estado").val()


                }
            },

            columns: [{
                    data: 'id',
                    name: 'id'
                },
                {
                    data: 'cliente_id',
                    name: 'cliente_id'
                },
                {
                    data: 'pago_cliente',
                    name: 'pago_cliente'
                },
                {
                    data: 'fecha_venta',
                    name: 'fecha_venta'
                },
                {
                    data: 'fecha_entrega',
                    name: 'fecha_entrega'
                },
                {
                    data: 'dias_atraso',
                    name: 'dias_atraso'
                },
                {
                    data: 'estado',
                    name: 'estado'
                },
                {
                    data: 'metodo_pago',
                    name: 'metodo_pago'
                },
                {
                    data: 'descuento_venta',
                    name: 'descuento_venta'
                },
                {
                    data: 'total_cuenta',
                    name: 'total_cuenta'
                },
                {
                    data: 'deuda_cliente',
                    name: 'deuda_cliente',
                    searchable: false
                },
                {
                    data: 'debe_cliente',
                    name: 'debe_cliente',
                    searchable: false
                },
                {
                    data: 'cliente',
                    name: 'cliente',
                    searchable: false
                },

                {
                    data: 'action',
                    name: 'action',
                    orderable: true,
                    searchable: true
                },




            ]

        })
      //  .buttons().container().appendTo('#contenido_wrapper .col-md-6:eq(0)');

    $('#filtrar').click(function() {

        $("#contenido").DataTable().ajax.reload();
    })
</script>
@stop