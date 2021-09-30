@extends('layouts.home')

@push('app')
    <script src="{{ asset('js/appSales.js') }}" ></script>
@endpush

@section('content')
    <div>
        <cashs-component uri="{{url('/')}}" array="{{$cashs}}"/>
    </div>
@endsection

