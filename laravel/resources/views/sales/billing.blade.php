@extends('layouts.home')

@push('app')
    <script src="{{ asset('js/appSales.js') }}" ></script>
    <script src="{{ asset('js/jasonday-printThis/printThis.js') }}" ></script>    
@endpush

@section('content')
    <billing-component uri="{{url('/')}}" array="{{$billing}}" origin="{{$origin}}" organization="{{ Auth::user()->store->organization }}" />
@endsection