
@extends('layouts.home')

@push('app')
    <script src="{{ asset('js/appSales.js') }}" ></script>
@endpush

@section('content')

    <div class="container">
        <div class="col-3">
            <a class="btn btn-sm red accent-4 white-text btn-block mb-3" href="{{url('/')}}/productos">
                Volver a Prodctos
            </a>
        </div>
        <div class="card p-0 col-12">
            @if ($audits->count())
                <table class="table table-striped">
                    <thead>
                        <tr class="text-center">
                            <th scope="col" class="table_head">#</th>
                            <th scope="col" class="table_head">Evento</th>
                            <th scope="col" class="table_head">Modulo</th>
                            <th scope="col" class="table_head">Usuario</th>
                            <th scope="col" class="table_head">Fecha</th>
                            <th scope="col" class="table_head">Anterior Valor</th>
                            <th scope="col" class="table_head">Nuevo Valor</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        @foreach ($audits as $i=>$audit)
                  
                        @php
                            $direction = explode('/', $audit->url);
                            $direction_key =  array_key_last($direction);

                            if ($audit->event == 'updated')
                                $audit->event = 'Actualizado';
                            elseif ($audit->event == 'create')
                                $audit->event = 'Creado';
                        @endphp

                        <tr>
                            <td>
                                {{$i+1}}
                            </td>
                            <td>
                                {{$audit->event}}
                            </td>
                            <td>
                                {{$direction[$direction_key]}}
                            </td>
                            <td>
                                {{$audit->user->name}}
                            </td>
                            <td>
                                {{ \Carbon\Carbon::parse($audit->created_at)->format('d/m/Y')}}
                            </td>
                            <td>
                                <ul class="list-group">
                                    @foreach ($audit->old_values as $key=>$item)
                                        @php
                                            if ($key == 'unit_price')
                                                $key = 'precio unitario';
                                            elseif ($key == 'bar_code')
                                                $key = 'codigo de barras';
                                        @endphp
                                        <li class="list-group-item">{{$key}} => {{$item}}</li>
                                    @endforeach
                                </ul>
                            </td>
                            <td>
                                <ul class="list-group">
                                    
                                    @foreach ($audit->new_values as $key=>$item)
                                        @php
                                            if ($key == 'unit_price')
                                                $key = 'precio unitario';
                                            elseif ($key == 'bar_code')
                                                $key = 'codigo de barras';
                                        @endphp
                                        <li class="list-group-item">{{$key}}=>{{$item}}</li>
                                    @endforeach
                                </ul>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            @else
                <div class="text-center mt-3">
                    <h2>No hay registros auditables de este producto</h2>
                </div>
            @endif
        </div>
    </div>
@endsection
