@extends('layouts.home')

@push('app')
    <script src="{{ asset('js/appUsers.js') }}" ></script>
@endpush

@section('content')
    <div class="px-4">
        <users-component uri="{{url('/')}}"/>
    </div>
@endsection

