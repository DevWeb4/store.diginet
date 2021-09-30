@extends('layouts.home')

@push('app')
    <script src="{{ asset('js/appPersons.js') }}" ></script>
@endpush

@section('content')
    <div class="px-4">
        <provider-component />
    </div>
@endsection

