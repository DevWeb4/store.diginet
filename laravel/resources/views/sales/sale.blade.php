@extends('layouts.home')

@push('app')
    <script src="{{ asset('js/appSales.js') }}" ></script>
@endpush


@section('content')
    <div class="mx-4">
        <sale-component uri="{{url('/')}}" dolar={{$lastCash->original['data'][0]->dolar}}  gremio="{{$_GET ['gremio']}}" />
    </div>
@endsection