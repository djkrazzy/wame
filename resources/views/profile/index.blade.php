@extends('voyager::master')

@section('content')
<style>
fieldset {
    line-height: 16px;
    padding: 0 10px;
    border: 1px solid #e0e0e0;
    background-color: rgb(232 232 232 / 30%);
    margin: 5px;
}
legend {
    background-color: #fff;
    width:inherit; 
    padding:0 10px;
    border-bottom:none;
    border: 1px solid #e0e0e0;
    padding: 10px;
}
</style>
    <div class="container">
        <div class="main-body">
            <div class="row">
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex flex-column align-items-center text-center">
                                <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin"
                                    class="rounded-circle p-1 bg-danger" width="110">
                                <div class="mt-3">
                                    <h4>{{ auth()->user()->name ??''}}</h4>
                                    <p class="text-secondary mb-1">{{ auth()->user()->email ??''}}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-body">
                           
                            <fieldset>
                                <legend>Facebook Token</legend>
                                <div class="row mb-3">
                                @if (Auth::user()->token )
                                  <a href="{{url('/auth/redirect')}}" class="btn btn-block btn-danger" role="button" > Eliminar Acceso a Facebook  </a>

                                @else
                                 <a href="{{url('/auth/redirect')}}" class="btn btn-block btn-info" role="button" > Obtener Acceso a Facebook  </a>

                                @endif

                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" value="{{Auth::user()->token ??''}}" readonly>
                                    </div>
                                   
                                </div>
                              
                            </fieldset>
                             <fieldset>
                                <legend>Paginas de Facebook</legend>
                                  <table id="contenido" class="table table-hover "  >
                                <thead>
                                    <tr >
                                       <th>Nombre</th >
                                      <th >ID</th >
                                      <th >Opciones</th >
                                    </tr> 
                                    @foreach ($fanpages as $fanpage )
                                      <tr >
                                       <td>{{$fanpage->name}}</td >
                                      <td >{{$fanpage->page_id}}</td >
                                      <td >@if ($fanpage->estado)<button type="button" class="btn btn-success btn-sm">Principal</button> @else <button type="button" class="btn btn-warning btn-sm">Hacer Principal</button>
                                          
                                          @endif  <button type="button" class="btn btn-danger btn-sm">Eliminar</button></td >
                                    </tr> 
                                    @endforeach
                                </thead>
                                </table>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>

             <div class="row">
                <div class="col-lg-12">
                     <div class="card">
                        <div class="card-body">
                            
                        </div>
                   </div>
              </div>
            </div>

            
        </div>
    </div>
    @push('script')
    <script>
        $( document ).ready(function() {
            $('body').on('submit', '.formsubmit', function(e) {
                e.preventDefault();
                $.ajax({
                    url:$(this).attr('action'),
                    data:new FormData(this),
                    type:'POST',
                    contentType: false,
                    cache: false,
                    processData: false,
                    beforeSend: function () {
                        $('.submitspinner').html('<i class="fa fa-spinner fa-spin"></i>')
                    },
                    success: function (data) {
                    $('.submitspinner').html('');
                    if (data.status==200) {
                        $.confirm({
                            title: 'Success!',
                            content: data.msg,
                            autoClose: 'cancelAction|3000',
                            buttons: {
                                cancelAction: function (e) {}
                            }
                        });
                    }
                    if (data.status==400) {
                        $.alert({
                            title: 'Success!',
                            content: data.msg,
                        });
                    }
                    },
                })
            });

            $('body').on('click', '.store_page_id', function(e) {
                var data = $('.facebook_page_id').val();
                $.ajax({
                url: '{{route("facebook_page_id")}}',
                data: {facebook_page_id:data},
                type: 'POST',
                headers: {
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                beforeSend: function () {
                    $('.submitspinnerpage').html('<i class="fa fa-spinner fa-spin"></i>')
                },
                success: function (data) {
                    $('.submitspinnerpage').html('');
                    if (data.status == 200) {
                        $.confirm({
                            title: 'Success!',
                            content: data.msg,
                            autoClose: 'cancelAction|3000',
                            buttons: {
                                cancelAction: function (e) {}
                            }
                        });
                    }
                    if (data.status == 400) {
                        $.alert({
                            title: 'Alert!',
                            content: data.msg,
                        });
                    }
                },
            });
            });
        });
    </script>
        
    @endpush
@endsection
