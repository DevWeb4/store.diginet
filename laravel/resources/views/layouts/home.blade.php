<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- CSRF Token -->
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>Store</title>

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@600;700&display=swap" rel="stylesheet">
        
        <!-- Styles -->
        <link href="{{ asset('css/app.css') }}" rel="stylesheet">
        <link href="{{ asset('css/style.css') }}" rel="stylesheet">

    </head>
<style>
    body{
        font-family: 'Quicksand', sans-serif;
    }
</style>
    <body class="grey lighten-4">
        <div id="app">
            @guest
                <!--<li class="nav-item">
                    <a class="nav-link" href="{{ route('login') }}">{{ __('Acceder') }}</a>
                </li>-->
                <!--@if (Route::has('register'))
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                    </li>
                @endif-->
            @else
                <nav class="navbar navbar-expand-md navbar-light accent-4 shadow-sm white">
                    <div class="container">
                        <!-- LOGO 
                        <a class="navbar-brand" href="{{ url('/home') }}">
                            <img class="" src="/images/logo.png" height="40" alt="logo">
                        </a>
                        -->
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <!-- Right Side Of Navbar -->
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="{{url('/')}}" role="button" >
                                        {{ __('Inicio') }} <span class="caret"></span>
                                    </a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                                        <i class="fas fa-user"></i> {{ Auth::user()->name }} <span class="caret"></span>
                                    </a>

                                    <div class="dropdown-menu dropdown-menu-left" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="{{ route('logout') }}"
                                            onclick="event.preventDefault();
                                            document.getElementById('logout-form').submit();">
                                            {{ __('Salir') }}
                                        </a>

                                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                            @csrf
                                        </form>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            @endguest
                
            <main class="py-4">
                <div class="container">
                    @if(Request::path() != 'prensa')

                    @endif
                </div>
                @yield('content')
            </main>
        </div>
        @stack('app')
        <!-- Javascript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.15.0/js/mdb.min.js"></script>
    </body>
</html>
<script type="text/javascript">
$(function(){
    $('.navbar-nav a').filter(function(){return this.href==location.href}).parent().addClass('active').siblings().removeClass('active');
    $('.navbar-nav a').click(function(){
        $(this).parent().addClass('active').siblings().removeClass('active')    
    });
});
</script>