@extends('voyager::master')

@section('page_title', __('voyager::generic.viewing').' '.$dataType->getTranslatedAttribute('display_name_plural'))

@section('page_header')
<div class="container-fluid">
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i>HIstorial de Ventas
    </h1>
    
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
                      

                        
                        



                        <div class="row mb-3">
                      
                            <div class="col-md-3">
                                <input type="text" name="start_date" class="form-control start_date" placeholder="Seleccione fecha inicial" readonly />
                            </div>
                            <div class="col-md-3">
                                <input type="text" name="end_date" class="form-control end_date"  placeholder="Seleccione fecha final" readonly />
                            </div>
                        
                            <div class="col-md-1">
                                <button id="filtrar" class="btn btn-danger">Filtrar</button>
                            </div>
                        </div>

                        <table id="contenido" class="table table-hover">
                            <thead>
                                <tr>
                                    
                                    <th> ID</th>
                                    <th> Articulo </th>
                                    <th> Cantidad</th>
                                    <th> Precio</th>
                                    <th> Descuento</th>
                                    <th> Total </th>
                                    <th> Cliente </th>
                                    <th> Fecha</th>
                                 
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

<link rel="stylesheet" href="{{ voyager_asset('lib/css/responsive.dataTables.min.css') }}">

<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.2.2/css/buttons.dataTables.min.css">

<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.0.3/css/buttons.dataTables.min.css">
@if(!$dataType->server_side && config('dashboard.data_tables.responsive'))
<link rel="stylesheet" href="{{ voyager_asset('lib/css/responsive.dataTables.min.css') }}">
@endif
@stop

@section('javascript')

<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>


<script src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js"></script>

<script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.print.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/select/1.3.4/js/dataTables.select.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>
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

$(".start_date").flatpickr({
    defaultDate:'{{Carbon::now()->startOfMonth()}}',
  
   
  });
        $(".end_date").flatpickr({
    defaultDate:'today',
  
  
  });



    // Setting datatable defaults
    $.extend( $.fn.dataTable.defaults, {
            autoWidth: false,
            dom: '<"datatable-header"fBl><"datatable-scroll-wrap"t><"datatable-footer"ip>',
            language: {
                search: '<span>Busqueda:</span> _INPUT_',
                searchPlaceholder: 'Escriba aqui...',
                lengthMenu: '<span>Mostrar:</span> _MENU_',
                paginate: { 'first': 'Inicio', 'last': 'Ultimo', 'next': $('html').attr('dir') == 'rtl' ? '&larr;' : '&rarr;', 'previous': $('html').attr('dir') == 'rtl' ? '&rarr;' : '&larr;' }
            }
        });
	//////////////////////


    var table = $('#contenido').DataTable({
            processing: true,
            serverSide: false,
            "autoWidth": false,
            "responsive": true,
            lengthMenu: [
                [10, 25, 50, -1],
                [10, 25, 50, 'All'],
            ],
            "lengthChange": true,

            buttons: {  

buttons: [
     {
        extend: 'copyHtml5',
        className: 'btn ',
text: '<i class="fas fa-copy"></i> Copiar',
        exportOptions: {
            columns: [ 0, ':visible' ]
        }
    },
    {
        extend: 'excelHtml5',
        className: 'btn btn-outline-success waves-effect waves-light',
text: '<i class="fas fa-file-excel"></i> Excel',
        exportOptions: {
            columns: ':visible'
        }
    },
    {
        extend: 'pdfHtml5',
orientation: 'landscape',
pageSize: 'LEGAL' ,
         className: 'btn btn-outline-danger waves-effect waves-light',
text: '<i class="fas fa-file-pdf"></i> PDF',
        exportOptions: {
            columns: [0, 1, 2, 4]
        }
    },
{
        extend: 'print',
         className: 'btn btn-outline-secondary waves-effect waves-light',
text: '<i class="icon-printer mr-2"></i> Imprimir',
        exportOptions: {
            columns: [0, 1, 2, 4]
        }
    },
   
]
},
            ajax: {
                url: "{{ route('voyager.venta-items.index') }}",
                data: function(d) {
                  
                    d.start_date = $(".start_date").val(),
                    d.end_date = $(".end_date").val()

                }
            },

            columns: [{
                    data: 'id',
                    name: 'id'
                },
                {
                    data: 'nombre',
                    name: 'nombre'
                },
                {
                    data: 'cantidad',
                    name: 'cantidad'
                },
                {
                    data: 'precio',
                    name: 'precio'
                },
                {
                    data: 'descuento',
                    name: 'descuento'
                },
                {
                    data: 'total',
                    name: 'total'
                },
                {
                    data: 'cliente_id',
                    name: 'cliente_id'
                },
                {
                    data: 'created_at',
                    name: 'created_at'
                },
               

                {
                    data: 'action',
                    name: 'action',
                    orderable: true,
                    searchable: true
                },




            ]

        })
       .buttons().container().appendTo('#contenido_wrapper .col-md-6:eq(0)');

    $('#filtrar').click(function() {

        $("#contenido").DataTable().ajax.reload();
    })
</script>
@stop