@extends('layouts.home')

@push('app')
    <script src="{{ asset('js/appFinancials.js') }}" ></script>
@endpush

@section('content')
    <div class="px-4">
        <financials-component uri="{{url('/')}}" />
    </div>
@endsection

