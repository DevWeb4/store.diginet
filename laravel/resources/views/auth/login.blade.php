@extends('layouts.home')

<style>
    .container{
        padding-top: 50px;
    }

    body{
        background: linear-gradient(0deg, rgba(184,184,184, 0.5), rgba(184,184,184, 0.5)), url(https://i.imgur.com/HgflTDf.jpg);
	    background-size: cover;
        background-repeat: no-repeat;
    }

    .btn-acceder{
        width: 100%;
	 height: 100%;
	 background: transparent;
	 color: #fff;
	 display: block;
	 border: none;
     padding-top: 20px;
	 margin-bottom: 10px;
	 max-height: 80px;
    }

    .card-footer-login{
	 background-color: #c50707;
	 border-radius: 0 0 2px 2px;
	 border: 0px solid rgba(71, 71, 71, 0.2);
	 border-bottom-width: 7px;
	 height: auto;

    }

    
    .container input + i.fa {
        color: #fff !important;
        font-size: 1em;
        position: absolute;
        margin-top: -32px;
        opacity: 0;
        left: 0;
        transition: all 0.1s ease-in;
    }
    .container input:focus {
        outline: none;
        border-left-width: 40px;
    }
    .container input:focus + i.fa {
        opacity: 1;
        left: 30px;
        transition: all 0.25s ease-out;
    }
    
</style>

@section('content')
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<div class="container">
    <div class="row justify-content-center entire-card">
        <div class="col-md-4">
            <div class="card card-login">
                <form method="POST" action="{{ route('login') }}" class="mb-0 pb-0">
                <div class="card-body">

                    <h5 style="color:#474747;"><b>{{ __('Inicio de Sesión') }}</b></h5>
                    <hr>
                        @csrf

                        <div class="form-group row pt-3">
                            <div class="col-md-12">
                                <input value="" style="height: 50px; border-radius: 0px; font-size: 16px;" id="name" type="text" placeholder="Usuario" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>
                                <i class="fa fa-user"></i>

                                @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-md-12">
                                <input value="" style="height: 50px; border-radius: 0px; font-size: 16px;" id="password" type="password" placeholder="Contraseña" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password">
                                <i class="fa fa-key"></i>

                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                </div>

                <div class="card-footer-login">
                    <div class="col-md-12">
                        <button type="submit" class="btn-acceder">
                            {{ __('Acceder') }}
                        </button>

                    </div>
                </div>
            </form>

            </div>
        </div>
    </div>
</div>
@endsection
