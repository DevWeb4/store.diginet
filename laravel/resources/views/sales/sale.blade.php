@extends('layouts.home')

@push('app')
    <script src="{{ asset('js/appSales.js') }}" ></script>
@endpush


@section('content')
    <div class="mx-4">
        <sale-component uri="{{url('/')}}" gremio="{{$_GET ['gremio']}}" />
    </div>
@endsection