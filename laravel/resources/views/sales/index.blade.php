@extends('layouts.home')

@push('app')
    <script src="{{ asset('js/appSales.js') }}" ></script>
@endpush

@section('content')
    <sales-component uri="{{url('/')}}"/>
@endsection

