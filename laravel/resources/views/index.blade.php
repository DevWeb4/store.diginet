@extends('layouts.home')
@section('content')

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.min.js"></script>

<div class="container">
    <h5>Administrador</h5>
    <div class="card">
        <div class="m-0 card-deck">
            <div class="view overlay col-3 border py-2">
                <div class="img-fluid text-center">
                    <i class="fas fa-cash-register red-store-text fa-3x m-2"></i> 
                    <p>Caja</p>
                </div>
                <div class="mask flex-center rgba-red-light">
                    <a href="caja" class="stretched-link"></a>
                </div>
            </div>
            <div class="view overlay col-3 border py-2">
                <div class="img-fluid text-center">
                    <i class="fab fa-cc-mastercard red-store-text fa-3x m-2"></i>
                    <p>Financieras</p>
                </div>
                <div class="mask flex-center rgba-red-light">
                    <a href="financieras" class="stretched-link"></a>
                </div>
            </div>

            <div class="view overlay col-3 border py-2">
                <div class="img-fluid text-center">
                    <i class="fas fa-users-cog red-store-text fa-3x m-2"></i> 
                    <p>Usuarios</p>
                </div>
                <div class="mask flex-center rgba-red-light">
                    <a href="usuarios" class="stretched-link"></a>
                </div>
            </div>
            <div class="view zoom col-3 px-0">
                <img class="card-img-top" src="images/home/auditory.jpg" height="116" alt="Card image cap">
                <div class="mask rgba-red-light"></div>
            </div>
        </div>
    </div>
    <h5 class="mt-5">Cajero</h5>
    <div class="card-deck">

        <div class="card">
            <a href="ventas">
                <div class="card-body px-0 pb-0">
                    <h4 class="red-store-text border-bottom border-danger pb-2"><b class="ml-3">Ventas</b></h4>
                    <div class="view zoom menu_cajero">
                        <img class="card-img-top" src="images/home/sales.jpg" height="170" alt="Card image cap">
                        <div class="mask rgba-red-light"></div>
                    </div>
                </div>
            </a>
        </div>
       
        <div class="card">
            <a href="productos">
                <div class="card-body px-0 pb-0">
                    <h4 class="red-store-text border-bottom border-danger pb-2"><b class="ml-3">Productos</b></h4>
                    <div class="view zoom menu_cajero">
                        <img class="card-img-top" src="images/home/providers.jpg" height="170" alt="Card image cap">
                        <div class="mask rgba-red-light"></div>
                    </div>
                </div>
            </a>
        </div>
        
        <div class="card">
            <a href="clientes">
                <div class="card-body px-0 pb-0">
                    <h4 class="red-store-text border-bottom border-danger pb-2"><b class="ml-3">Clientes</b></h4>
                    <div class="view zoom menu_cajero">
                        <img class="card-img-top" src="images/home/customers.jpg" height="170" alt="Card image cap">
                        <div class="mask rgba-red-light"></div>
                    </div>
                </div>
            </a>
        </div>
    </div>
    
</div>
@endsection
