@extends('layouts.home')

@push('app')
    <script src="{{ asset('js/appSales.js') }}" ></script>
@endpush
@php
    $sales = App\Sale::get();
    $data=array();
    foreach ($sales as $key => $sale) {
        //print_r($sale);
        $detail = json_decode($sale->description, true);

        foreach ($detail as $key => $d) {
            $d['sale_id']= $sale->id;
            $d['created_at']= $sale->created_at;
            array_push($data,$d);
        }
    }
@endphp
@section('content')
    <div class="container">
        <h1>Historial de ventas</h1>
        <div class="card">

            <div class="card-body">
                <table id="t_record" class="table">
                    <thead>
                        <tr class="text-center">
                            <th>Venta</th>
                            <th>Descripcion</th>
                            <th>Codigo</th>
                            <th>Fecha</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($data as $item)
                        <tr>
                            <td>
                                <h5>
                                    <a href="facturacion/{{$item['sale_id']}}-ventas" class="badge red accent-4 w-100"># {{$item['sale_id']}} <i class="far fa-eye"></i></a>
                                </h5>
                            </td>
                            <td>{{$item['name']}}</td>
                            <td><b>{{$item['barCode']}}</b></td>
                            <td class="text-right">{{$item['created_at']}}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>

<script>

    $(document).ready( function () {
        $('#t_record').DataTable({
            'order': [[0, 'desc']],
            'language': {
                'url': 'http://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json'
            },
        });
    });

</script>
