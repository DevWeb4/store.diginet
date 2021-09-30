<template>
    <div class="container">
        <div class="card col-12">
            <div class="row" id="pruebaff">
                <div class="col-8 table-responsive">
                    <div class="md-form md-outline input-with-post-icon">
                        <i class="fas fa-search red-store-text input-prefix"></i>
                        <input 
                            ref="inputSearch" 
                            id="inputSearch"
                            value="" type="text" 
                            class="form-control" 
                            placeholder="Codigo, Nombre del articulo o use el lector de barras"
                        >
                    </div>
                    <table class="table table-sm " id="_tInventory">
                        <thead>
                            <tr>
                                <th width="1px">#</th>
                                <th></th>
                                <th>Nombre</th>
                                <th width="1px">Proveedor</th>
                                <th>Código</th>
                                <th width="1px">Stock</th>
                                <th width="1px">Precio</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id="_tBodyInventory">
                            <tr
                                v-for="(product, i)  in inventory" 
                                :key="i" 
                            >
                                <td class="text-center">{{i+1}}</td>
                                <td>{{product.id}}</td>
                                <td>{{product.name}}</td>
                                <td v-if="product.provider">{{product.provider.name}}</td><td v-else>Inexistente</td>
                                <td>{{product.bar_code}}</td>
                                <td class="text-center">{{product.stock}}</td>
                                <td class="text-right">${{Number(product.unit_price)}}</td>
                                <td class="text-center">
                                    <a v-on:click="addItem(product.id)" title="Añadir a la lista de compra."  >
                                        <i class="red-store-text fas fa-shopping-basket"></i>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-4 border-left table-responsive p-1">
                    <table class="table table-sm mb-0">
                        <thead>
                            <tr class="">
                                <th>#</th>
                                <th>Articulo</th>
                                <th width="10px" >Monto</th>
                                <th width="10px" >Extra</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(item, i) in shoppingCart" :key="i">
                                <td>{{i+1}}</td>
                                <td>{{ item.name | truncate(30) }}</td>
                                <td class="text-right">${{item.price}}</td>
                                <td><a v-on:click="showModalDiscount(item, i)">
                                    <span class="badge red accent-4 accent-4 text-white w-100 py-1">
                                        ${{item.discount}}
                                    </span>
                                </a></td>
                                <td><a v-on:click="deleteItem(i)" title="Eliminar del listado de compras." ><i class="red-store-text fas fa-backspace"></i></a></td>
                            </tr>
                            <tr v-if="shoppingCart.length <= 0 ">
                                <td>1</td><td colspan="4"></td>
                            </tr>
                            <tr v-if="shoppingCart.length <= 1 ">
                                <td>2</td><td colspan="4"></td>
                            </tr>
                            <tr v-if="shoppingCart.length <= 2 ">
                                <td>3</td><td colspan="4"></td>
                            </tr>
                            <tr v-if="shoppingCart.length <= 3 ">
                                <td>4</td><td colspan="4"></td>
                            </tr>
                            <tr v-if="shoppingCart.length <= 4 ">
                                <td>5</td><td colspan="4"></td>
                            </tr>
                            <tr v-if="shoppingCart.length <= 5 ">
                                <td>6</td><td colspan="4"></td>
                            </tr>
                            <tr v-if="shoppingCart.length <= 6 ">
                                <td>7</td><td colspan="4"></td>
                            </tr>
                            <tr v-if="shoppingCart.length <= 7 ">
                                <td>8</td><td colspan="4"></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="col-12 border-top pt-2 pb-2">
                        <div class="row">
                            <div class="col-3">
                                <a v-on:click="showModalDiscountGeneral()">
                                    <span class="mt-4 badge red accent-4 accent-4 text-white w-100 py-1">
                                        Editar
                                    </span>
                                </a>
                            </div>
                            <div class="col-6 text-right">
                                <p class="m-0">subTotal:</p>
                                <p class="m-0">extrasTotal:</p>
                            </div>
                            <div class="col-3">
                                <p class="m-0">${{purchase.total}}</p>
                                <p class="m-0">${{purchase.totalDiscount}}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 border-top pt-2 pb-1">
                        <div class="row red-store-text">
                            <div class="col-9 text-right">
                                <p class="m-0 h5">TOTAL FINAL:</p>
                            </div>
                            <div class="col-3">
                                <p class="m-0"><b>${{purchase.totalFinal}}</b></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12">
            <div class="row">
                <div class="col-4 mt-2">
                    <button v-on:click="$modal.show('financial-modal')" type="button" class="btn-sm btn btn-outline-danger btn-block">
                        Calculadora
                    </button>
                </div>
                <div class="col-4"></div>
                <div class="col-4 mt-2">
                    <a class="btn btn-sm btn-outline-danger btn-block" data-toggle="modal" data-target="#exampleModal">
                        Presupuesto
                    </a>
                </div>
            </div>
        </div>
        <div class="col-12 mt-4">
            <div class="row"> 
                <div class="col-7">
                    <h4 class="text-center red-store-text">
                        <b v-if="client.name == '' || client.identification == ''">
                            Consumidor Final
                        </b>
                        <b v-else>
                            Cliente
                        </b>
                    </h4>
                    <hr class="red accent-4">
                    
                    <div class="row">
                        <div class="col-6">
                            <label for="basic-url">DNI (*)</label>
                            <input class="form-control form-control-sm" ref="clientDNI" v-on:keyup="shearchClient()" type="number">
                        </div>
                        <div class="col-6">
                            <label for="basic-url">Apellido y Nombre (*)</label>
                            <input v-model="client.name" class="form-control form-control-sm" ref="" placeholder="" type="text">
                        </div>
                        <div class="col-12 mt-3 mb-3">
                            <label for="inputTitle">Direccion</label>
                            <textarea id="inputTitle" v-model="client.address" rows="1" class="md-textarea form-control"></textarea>
                        </div>
                        <div class="col-6">
                            <label for="basic-url">Telefono</label>
                            <input v-model="client.phone" class="form-control form-control-sm" ref="" placeholder="" type="text">
                        </div>
                        <div class="col-6">
                            <label for="basic-url">Correo Electronico</label>
                            <input v-model="client.email" class="form-control form-control-sm" ref="" placeholder="" type="text">
                        </div>
                    </div>
                    <hr class="red accent-4">
                    <div class="row">
                        <div class="col-12">
                            <button 
                                v-if="loading_toPay == false"
                                v-on:click="pay()" 
                                type="button" 
                                class="btn-sm btn red accent-4 text-white btn-block mt-3" 
                                :disabled="this.purchase.toPay != 0 || shoppingCart.length == 0 || (client.name == '' || client.identification == '') && getSumPayment('Cuenta P.') > 0"
                            >
                                Pagar
                            </button>
                            <button v-else class="btn-sm btn red accent-4 text-white btn-block mt-3" disabled >
                                <span
                                    class="spinner-border spinner-border-sm"
                                    role="status"
                                    aria-hidden="true"
                                ></span>
                                <span class="visually-hidden"> Cargando Venta...</span>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
                <div class="col-4 card p-1">
                    <table class="table table-sm mb-0">
                        <thead>
                            <tr>
                                <th>Resta por pagar</th>
                                <th class="text-left" :class="{'red-store-text': purchase.toPay > 0, }">$ {{purchase.toPay}}</th>
                                <th>
                                    <a v-on:click="showModalDiscountRemainsPaid()">
                                        <span class="badge red accent-4 accent-4 text-white w-100 py-1">
                                            Editar
                                        </span>
                                    </a>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr  v-for="(item, i)  in payments" :key="i">
                                <td class="text-right">{{item.type}}</td>
                                <td class="text-left">${{item.mount}}</td>
                                <td class="text-right">
                                    <a v-on:click="cancelPayment(i)" title="Eliminar del listado de pagos." ><i class="red-store-text fas fa-backspace"></i></a>
                                </td>
                            </tr>
                            <tr v-if="payments.length <= 0 ">
                                <td colspan="3"><span class="p-3"></span></td>
                            </tr>
                            <tr v-if="payments.length <= 1 ">
                                <td colspan="3"><span class="p-3"></span></td>
                            </tr>
                            <tr v-if="payments.length <= 2 ">
                                <td colspan="3"><span class="p-3"></span></td>
                            </tr>
                            <tr v-if="payments.length <= 3 ">
                                <td colspan="3"><span class="p-3"></span></td>
                            </tr>
                            <tr v-if="payments.length <= 4 ">
                                <td colspan="3"><span class="p-3"></span></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="p-2">
                        <div class="row border-top">
                            <div class="col-12 p-1">
                                <div class="btn-group btn-group-sm btn-block" role="group">
                                    <span class="btn btn-blue-grey" :class="{'active text-white2': radioType == 'Efectivo'}" v-on:click="selectPaymontType('Efectivo')">Efectivo</span>
                                    <span class="btn btn-blue-grey" :class="{'active text-white2': radioType == 'Financiado'}" v-on:click="selectPaymontType('Financiado')" >Financiado</span>
                                    <span class="btn btn-blue-grey" :class="{'active text-white2': radioType == 'Cuenta P.'}" v-on:click="selectPaymontType('Cuenta P.')">Cuenta P.</span>
                                </div>
                            </div>
                            <div class="col-6 p-2">
                                <input class="form-control form-control-sm" ref="inputPay" v-on:keyup.13="addPayment()" :placeholder="radioType" type="number">
                            </div>
                            <div class="col-6 p-2">
                                <a v-on:click="addPayment()" class="btn btn-sm m-0 btn-block red accent-4 white-text">Añadir Pago<i class="fas fa-level-up-alt"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <modal name="financial-modal" :height="750">
            <div class="modal-content">
                <div class="mr-2">
                    <button type="button" class="close" v-on:click="hideModal('financial-modal')">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body py-0">
                    <div class="row">
                        <div class="col-6">
                            <div class="md-form md-outline">
                                <input v-model.number="amount" ref="inputAmount" type="number" class="form-control text-right">
                                <label class="active" for="">Monto</label>
                            </div>
                        </div>
                        <div class="col-6 ">
                            <div class="md-form">                            
                                <select v-model="indexFinancialTarget" class="custom-select-md form-control">
                                    <option
                                        v-for="(element, i) in financial" :key=i
                                        :value="i"
                                    >
                                        {{element.name}}
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class="table-responsive mx-2" style="min-height: 600px;">
                            <table class="table table-sm">
                                <thead>
                                    <tr>
                                        <th class="text-center">Cuotas</th>
                                        <th class="text-center">Porcentaje</th>
                                        <th class="text-right">Monto Mensual</th>
                                        <th class="text-right">Monto Final</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(element, n) in financial[indexFinancialTarget].fee" 
                                        :key="n" 
                                        v-if="element.p > 0"
                                    >
                                        
                                        <td class="text-center">{{element.n}}</td>
                                        <td class="text-center"><span v-if="element.p > 0">%{{element.p}}</span></td>
                                        <td class="text-right"><span v-if="element.p > 0 && amount != ''">${{ parseFloat(((parseFloat(amount)/100 * element.p)+parseFloat(amount))/element.n).toFixed(2)}}</span></td>
                                        <td class="text-right"><span v-if="element.p > 0 && amount != ''">${{ parseFloat((parseFloat(amount)/100 * element.p)+parseFloat(amount)).toFixed(2)}}</span></td>
                                        <td v-if="element.p > 0">
                                            <a v-if="element.b_selected" v-on:click="cancelFinancialToBudget(element)">
                                                <span class="badge red accent-4 text-white w-100 py-1"><span>Cancelar</span></span>
                                            </a>
                                            <a v-else v-on:click="addToBudget(element)" >
                                                <span class="badge white accent-4 text-danger w-100 py-1 border border-danger"><span class="text-danger">Añadir al Presupuesto</span></span>
                                            </a>
                                        </td>
                                        <td v-else></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-6"></div>
                        <div class="col-6">
                            <button type="button" class="mb-2 btn btn-block btn-sm red accent-4 text-white" v-on:click="addFinancial()">
                                Añadir Pago
                                <i class="fas fa-long-arrow-alt-right"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </modal>

        <modal name="modal-discount" :height="295" :width="600">
            <div class="card">
                <div class="card-header">
                    <h4> {{ discountItem.name | truncate(50) }}</h4> 
                </div>
                <div class="card-body pt-0 row">
                    <div class="col-6">
                        <div class="md-form md-outline">
                            <input @change="calculatePorcentage()" v-on:keyup="calculatePorcentage()" v-model.number="discountItem.discount"  type="number" class="form-control text-center">
                            <label class="active" for="">$ Descuento/Recargo</label>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="md-form md-outline">
                            <input @change="calculateDiscount()" v-on:keyup="calculateDiscount()" v-model.number="discountItem.porcentage" type="number" :min="-100" :max="100" class="form-control text-center">
                            <label class="active" for="">Descuento/Recargo %</label>
                        </div>
                    </div>

                    <div class="col-3">
                        <a v-on:click="porcentajeDiscoutn(30)" >
                            <span class="badge red accent-4 text-white w-100 py-1">
                                +30%
                            </span>
                        </a>
                    </div>
                    <div class="col-3">
                        <a v-on:click="porcentajeDiscoutn(-10)" >
                            <span class="badge red accent-4 text-white w-100 py-1">
                                -10%
                            </span>
                        </a>
                    </div>
                    <div class="col-3">
                        <a v-on:click="porcentajeDiscoutn(-50)" >
                            <span class="badge red accent-4 text-white w-100 py-1">
                                -50%
                            </span>
                        </a>
                    </div>
                    <div class="col-3">
                        <a v-on:click="porcentajeDiscoutn(-100)" >
                            <span class="badge red accent-4 text-white w-100 py-1">
                                -100%
                            </span>
                        </a>
                    </div>
                    <div class="col-12">
                        <p class="mt-3">
                            <i> 
                                Precio:<b>$ {{discountItem.price}}</b>,
                                Descuento/Recargo: <b>$ {{discountItem.discount}}</b>,
                                Total: <b>$ {{discountItem.price + discountItem.discount}}</b>
                            </i>
                        </p>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="row">                    
                        <div class="col-6">
                            <button v-on:click="hideModal('modal-discount')" type="button" class="btn btn-outline-danger btn-sm btn-block">Cancelar</button>
                        </div>
                        <div class="col-6">
                            <button v-on:click="applyModalDiscount()" type="button" class="btn red accent-4 text-white btn-sm btn-block">Aplicar</button>
                        </div>
                    </div>
                </div>
            </div>
        </modal>
        <modal name="modal-general-discount" :height="245" :width="600">
            <div class="card">
                <div class="card-header">
                    <h4>Editar Extras General</h4> 
                </div>
                <div class="card-body pt-0 row">
                    <div class="col-6">
                        <div class="md-form md-outline">
                            <input @change="calculateGeneralPorcentage()" 
                                v-on:keyup="calculateGeneralPorcentage()" 
                                v-model.number="purchase.generalExtra"  
                                type="number" class="form-control text-center">
                            <label class="active" for="">$ Descuento/Recargo</label>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="md-form md-outline">
                            <input @change="calculateGeneralDiscount()" 
                                v-on:keyup="calculateGeneralDiscount()" 
                                v-model.number="purchase.porcentageGeneralExtra" 
                                type="number" :min="-100" :max="100" class="form-control text-center">
                            <label class="active" for="">Descuento/Recargo %</label>
                        </div>
                    </div>

                    <div class="col-3">
                        <a v-on:click="porcentajeGeneralDiscoutn(15)" >
                            <span class="badge red accent-4 text-white w-100 py-1">
                                +15%
                            </span>
                        </a>
                    </div>
                    <div class="col-3">
                        <a v-on:click="porcentajeGeneralDiscoutn(10)" >
                            <span class="badge red accent-4 text-white w-100 py-1">
                                +10%
                            </span>
                        </a>
                    </div>
                    <div class="col-3">
                        <a v-on:click="porcentajeGeneralDiscoutn(-10)" >
                            <span class="badge red accent-4 text-white w-100 py-1">
                                -10%
                            </span>
                        </a>
                    </div>
                    <div class="col-3">
                        <a v-on:click="porcentajeGeneralDiscoutn(-15)" >
                            <span class="badge red accent-4 text-white w-100 py-1">
                                -15%
                            </span>
                        </a>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="row">                    
                        <div class="col-6">
                            <button v-on:click="hideModal('modal-general-discount')" type="button" class="btn btn-outline-danger btn-sm btn-block">Cancelar</button>
                        </div>
                        <div class="col-6">
                            <button v-on:click="applyModalGeneralDiscount()" type="button" class="btn red accent-4 text-white btn-sm btn-block">Aplicar</button>
                        </div>
                    </div>
                </div>
            </div>
        </modal>

        <modal name="modal-general-discount-Remains-Paid" :height="245" :width="600">
            <div class="card">
                <div class="card-header">
                    <h4>Editar Extras Restante Por Pagar</h4> 
                </div>
                <div class="card-body pt-0 row">
                    <div class="col-6">
                        <div class="md-form md-outline">
                            <input @change="calculateToPayPorcentage()" 
                                v-on:keyup="calculateToPayPorcentage()" 
                                v-model.number="purchase.toPayExtra"  
                                type="number" class="form-control text-center">
                            <label class="active" for="">$ Descuento/Recargo</label>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="md-form md-outline">
                            <input @change="calculateToPayDiscount()" 
                                v-on:keyup="calculateToPayDiscount()" 
                                v-model.number="purchase.toPayPorcentageExtra" 
                                type="number" :min="-100" :max="100" class="form-control text-center">
                            <label class="active" for="">Descuento/Recargo %</label>
                        </div>
                    </div>

                    <div class="col-3">
                        <a v-on:click="porcentajeToPayDiscoutn(15)" >
                            <span class="badge red accent-4 text-white w-100 py-1">
                                +15%
                            </span>
                        </a>
                    </div>
                    <div class="col-3">
                        <a v-on:click="porcentajeToPayDiscoutn(10)" >
                            <span class="badge red accent-4 text-white w-100 py-1">
                                +10%
                            </span>
                        </a>
                    </div>
                    <div class="col-3">
                        <a v-on:click="porcentajeToPayDiscoutn(-10)" >
                            <span class="badge red accent-4 text-white w-100 py-1">
                                -10%
                            </span>
                        </a>
                    </div>
                    <div class="col-3">
                        <a v-on:click="porcentajeToPayDiscoutn(-15)" >
                            <span class="badge red accent-4 text-white w-100 py-1">
                                -15%
                            </span>
                        </a>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="row">                    
                        <div class="col-6">
                            <button v-on:click="hideModal('modal-general-discount-Remains-Paid')" type="button" class="btn btn-outline-danger btn-sm btn-block">Cancelar</button>
                        </div>
                        <div class="col-6">
                            <button v-on:click="applyModalToPayDiscount()" type="button" class="btn red accent-4 text-white btn-sm btn-block">Aplicar</button>
                        </div>
                    </div>
                </div>
            </div>
        </modal>

        <div id="exampleModal" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="col-12">
                            <div class="row">
                                <div class="col-12 pt-2">
                                    Presupuesto valido por:
                                    <!-- inline 1-->
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input v-model="picked" type="radio" value="24 hs" class="custom-control-input" id="defaultInline1" name="inlineDefaultRadiosExample">
                                        <label class="custom-control-label" for="defaultInline1">24 hs</label>
                                    </div>
                                    <!-- inline 2-->
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input v-model="picked" type="radio" value="48 hs" class="custom-control-input" id="defaultInline2" name="inlineDefaultRadiosExample">
                                        <label class="custom-control-label" for="defaultInline2">48 hs</label>
                                    </div>
                                    <!-- inline 3-->
                                    <div class="custom-control custom-radio custom-control-inline">
                                        <input v-model="picked" type="radio" value="72 hs" class="custom-control-input" id="defaultInline3" name="inlineDefaultRadiosExample">
                                        <label class="custom-control-label" for="defaultInline3">72 hs</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-body">
                        <section class="card-body row" v-if="store.id">
                            <div class="col-md-12" id="printMe">
                                <!-- First row -->
                                <div class="row invoice-data">
                                    <div class="col-8">
                                        <p><strong class="h4">{{store.name}}</strong></p>
                                        <p class="m-0"><strong>Direccion: </strong>{{store.address}}</p>
                                        <p class="m-0"><strong>Fecha Presupuesto: </strong> {{new Date() | dateFormat('dddd D MMMM, HH:mm')}} Hs</p>
                                        <p class="m-0"><strong>Contacto: </strong>{{store.contact}}</p>
                                    </div>
                                    <div class="col-4 text-right">
                                        <img class="m-1" width="100" :src="uri+'/images/logos/'+store.id+'.png'" >
                                    </div>
                                </div>
                                <hr class="red">
                                <div class="row mt-2">
                                    <div class="col-md-12">
                                        <div class="table-responsive">
                                            <table class="table table-bordered table-sm">
                                                <thead>
                                                    <tr class="grey lighten-3 text-center">
                                                        <th class="text-center">#</th>
                                                        <th scope="col" class="text-left" >Descripción</th>
                                                        <th scope="col">Cantidad</th>
                                                        <th scope="col">Precio Unitario</th>
                                                        <th scope="col">Extra</th>
                                                        <th scope="col">Precio Final</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr v-for="(item, i)  in shoppingCart" :key="i" >
                                                        <th class="grey lighten-3 text-center">{{i+1}}</th>
                                                        <td>{{item.name}}</td>
                                                        <td class="text-center"></td>
                                                        <td class="text-center">${{item.price}}</td>
                                                        <td class="text-center">${{item.discount}}</td>
                                                        <td class="text-center">${{(item.price)+item.discount}}</td>
                                                    </tr>
                                                    <tr class="table-borderless">
                                                        <td colspan="6"></td>
                                                    </tr>
                                                    <tr class="table-borderless">
                                                        <th colspan="5" class="text-right">subTotal:</th>
                                                        <th class="text-center">${{purchase.total}}</th>
                                                    </tr>
                                                    <tr class="table-borderless m-0">
                                                        <th colspan="5" class="text-right">extrasTotal:</th>
                                                        <th class="text-center">${{purchase.totalDiscount}}</th>
                                                    </tr>
                                                    <tr>
                                                        <th colspan="5" class="text-left"><b class="h5">TOTAL FINAL:</b></th>
                                                        <th class="text-center grey lighten-3"><b class="h5">${{purchase.totalFinal}}</b></th>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <hr>
                                        <ul class="list-group" v-for="(withFinancial, i)  in financialBudget" :key="i">
                                            <p class="mb-0 pb-0"><b class="font-weight-bold">${{withFinancial.financialQuantitative}}</b> Financiados Con <b class="font-weight-bold">{{withFinancial.financialName}}</b></p>
                                            <li class="list-group-item mb-2" >
                                                <b class="font-weight-bold">{{withFinancial.feeQuantitative}}x</b>
                                                <b class="">${{withFinancial.feeMonthly}}</b>

                                                <b class="float-right">${{withFinancial.feeTotal}}</b>
                                            </li>
                                        </ul>
                                        <p class="text-right">Presupuesto valido Por {{ picked }}</p>
                                    </div>
                                </div>
                            </div>
                        </section>
                        
                    </div>
                    <div class="modal-footer">
                        <div class="col-4">
                            <a  v-on:click="$htmlToPaper('printMe')" class="btn btn-sm red accent-4 white-text btn-block"><i class="fa fa-print left"></i> Imprimir Presupuesto</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <modal name="budget-modal" :width="800">
            <div class="modal-header">
                <div class="col-12">
                    <div class="row">
                        <div class="col-8 pt-2">
                            Presupuesto valido por:
                            <!-- inline 1-->
                            <div class="custom-control custom-radio custom-control-inline">
                                <input v-model="picked" type="radio" value="24 hs" class="custom-control-input" id="defaultInline1" name="inlineDefaultRadiosExample">
                                <label class="custom-control-label" for="defaultInline1">24 hs</label>
                            </div>
                            <!-- inline 2-->
                            <div class="custom-control custom-radio custom-control-inline">
                                <input v-model="picked" type="radio" value="48 hs" class="custom-control-input" id="defaultInline2" name="inlineDefaultRadiosExample">
                                <label class="custom-control-label" for="defaultInline2">48 hs</label>
                            </div>
                            <!-- inline 3-->
                            <div class="custom-control custom-radio custom-control-inline">
                                <input v-model="picked" type="radio" value="72 hs" class="custom-control-input" id="defaultInline3" name="inlineDefaultRadiosExample">
                                <label class="custom-control-label" for="defaultInline3">72 hs</label>
                            </div>
                        </div>
                        <div class="col-4">
                            <a  v-on:click="$htmlToPaper('printMe')" class="btn btn-sm red accent-4 white-text btn-block"><i class="fa fa-print left"></i> Imprimir Presupuesto</a>
                        </div>
                        <div class="col-12 mt-4">
                            <p class="text-right">Total Final: $<b>{{purchase.totalFinal}}</b></p>

                            <ul class="list-group" v-for="(withFinancial, i)  in financialBudget" :key="i">
                                <p class="mb-0 pb-0"><b class="font-weight-bold">${{withFinancial.financialQuantitative}}</b> Financiados Con <b class="font-weight-bold">{{withFinancial.financialName}}</b></p>
                                <li class="list-group-item mb-2" >
                                    <b class="font-weight-bold">{{withFinancial.feeQuantitative}}x</b>
                                    <b class="">${{withFinancial.feeMonthly}}</b>

                                    <b class="float-right">${{withFinancial.feeTotal}}</b>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <section class="card-body row fade " v-if="store.id">
                <div class="col-md-12" id="printMe">
                    <!-- First row -->
                    <div class="row invoice-data">
                        <div class="col-8">
                            <p><strong class="h4">{{store.name}}</strong></p>
                            <p class="m-0"><strong>Direccion: </strong>{{store.address}}</p>
                            <p class="m-0"><strong>Fecha Presupuesto: </strong> {{new Date() | dateFormat('dddd D MMMM, HH:mm')}} Hs</p>
                            <p class="m-0"><strong>Contacto: </strong>{{store.contact}}</p>
                        </div>
                        <div class="col-4 text-right">
                            <img class="m-1" width="100" :src="uri+'/images/logos/'+store.id+'.png'" >
                        </div>
                    </div>
                    <hr class="red">
                    <div class="row mt-2">
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-bordered table-sm">
                                    <thead>
                                        <tr class="grey lighten-3 text-center">
                                            <th class="text-center">#</th>
                                            <th scope="col" class="text-left" >Descripción</th>
                                            <th scope="col">Cantidad</th>
                                            <th scope="col">Precio Unitario</th>
                                            <th scope="col">Extra</th>
                                            <th scope="col">Precio Final</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(item, i)  in shoppingCart" :key="i" >
                                            <th class="grey lighten-3 text-center">{{i+1}}</th>
                                            <td>{{item.name}}</td>
                                            <td class="text-center"></td>
                                            <td class="text-center">${{item.price}}</td>
                                            <td class="text-center">${{item.discount}}</td>
                                            <td class="text-center">${{(item.price)+item.discount}}</td>
                                        </tr>
                                        <tr class="table-borderless">
                                            <td colspan="6"></td>
                                        </tr>
                                        <tr class="table-borderless">
                                            <th colspan="5" class="text-right">subTotal:</th>
                                            <th class="text-center">${{purchase.total}}</th>
                                        </tr>
                                        <tr class="table-borderless m-0">
                                            <th colspan="5" class="text-right">extrasTotal:</th>
                                            <th class="text-center">${{purchase.totalDiscount}}</th>
                                        </tr>
                                        <tr>
                                            <th colspan="5" class="text-left"><b class="h5">TOTAL FINAL:</b></th>
                                            <th class="text-center grey lighten-3"><b class="h5">${{purchase.totalFinal}}</b></th>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <hr>
                            <ul class="list-group" v-for="(withFinancial, i)  in financialBudget" :key="i">
                                <p class="mb-0 pb-0"><b class="font-weight-bold">${{withFinancial.financialQuantitative}}</b> Financiados Con <b class="font-weight-bold">{{withFinancial.financialName}}</b></p>
                                <li class="list-group-item mb-2" >
                                    <b class="font-weight-bold">{{withFinancial.feeQuantitative}}x</b>
                                    <b class="">${{withFinancial.feeMonthly}}</b>

                                    <b class="float-right">${{withFinancial.feeTotal}}</b>
                                </li>
                            </ul>

                            <p class="text-right">Presupuesto valido Por {{ picked }}</p>
                        </div>
                    </div>
                </div>
            </section>
        </modal>
        <notifications group="warning" position="top left"/>
    </div>        
</template>

<script>
    import financial_ from "../jsons/financial";
    export default {
        props: ['uri'],
        data(){
            return{
                radioType: 'Efectivo',
                inventory:[],

                b_loadingTable: true,
                b_LoadingSubmit:false,
                err_msg_tableInventory: '',
                loading_toPay: false,

                shoppingCart: [
                    /*{
                        productId:1,
                        name: 'remera prueb aremera prueba remera prueba remera prueba',
                        price: 1000,
                        provider: "Puma",
                        discount: -100
                    }*/
                ],

                financialBudget:[],

                payments : [],
                store:[],
                clients:[],
                client:{
                    name: '',
                    identification: '',
                    phone: '',
                    address: '',
                    email: ''
                },

                discountItem:{
                    name:'',
                    porcentage:0
                },

                purchase:{
                    total:0,
                    totalDiscount:0, 
                    totalFinal:0,
                    generalExtra: 0,
                    porcentageGeneralExtra: 0,

                    toPay: 0,
                    toPayExtra: 0,
                    toPayPorcentageExtra: 0,
                },

                financial : financial_,
                indexFinancialTarget : 0,
                amount: '',

                picked: '24 hs',
            }
        },

        watch: {
            shoppingCart: function (newObj, oldObj) {
                this.refreshPurchase()
            },
            payments: function (newObj, oldObj) {
                this.refreshPurchase()
            },

        },

        mounted() {
            this.getInventory()
            this.$refs.inputSearch.focus()
            this.getCustomers()
            this.getStore()

            this.refreshPurchase()//pendiente borrar

            /*_.map(this.financial, (element) => {
                _.each(element.fee, function (fee) {
                    return fee.b_selected = 0;
                });
            });*/

            this.getFinancials()

            /*window.addEventListener('keyup', function(event) {
                console.log(event)
            });*/

        },
        methods:{
            refreshPurchase(){
                this.purchase.total = _.sumBy(this.shoppingCart, item => Number(item.price));
                this.purchase.totalDiscount = _.sumBy(this.shoppingCart, item => Number(item.discount)) + this.purchase.generalExtra;
                
                this.purchase.totalFinal = this.purchase.total + this.purchase.totalDiscount;
                this.purchase.toPay = this.purchase.totalFinal - _.sumBy(this.payments,  item => Number(item.mount)) + this.purchase.toPayExtra

                this.amount = this.purchase.toPay
            },
            
            getFinancials(){
                axios.get('get_financials').then(res=>{
                    if(res.data.data == ''){
                        _.map(this.financial, (element) => {
                            _.each(element.fee, function (fee) {
                                return fee.b_selected = 0;
                            });
                        }) 
                    }else{
                        this.financial = res.data.data
                    }
                    console.log(this.financials)
                }).catch(error => {
                    console.log(error.response)
                })
            },
            addToBudget(e){
                e.b_selected = 1

                this.financialBudget.push({
                    financialQuantitative:this.amount,
                    financialName: this.financial[this.indexFinancialTarget].name,
                    feeQuantitative: e.n,
                    feePorcentage: e.p,
                    feeMonthly: parseFloat(((this.amount/100 * e.p)+this.amount)/e.n).toFixed(2),
                    feeTotal: parseFloat((this.amount/100 * e.p)+this.amount).toFixed(2)
                })

                this.financial[this.indexFinancialTarget].fee = Object.assign({},this.financial[this.indexFinancialTarget].fee)
            },
            cancelFinancialToBudget(e){
                e.b_selected = 0

                const index = _.findIndex(this.financialBudget, { 'feeQuantitative': e.n, 'financialName': this.financial[this.indexFinancialTarget].name });//busqueda suprema
                
                if(index > -1) {
                    this.financialBudget.splice(index, 1);
                    console.log("financialBudget deleted")
                }

                this.financial[this.indexFinancialTarget].fee = Object.assign({},this.financial[this.indexFinancialTarget].fee)
            },
            calculatePorcentage(){
                this.discountItem.porcentage = (100*this.discountItem.discount)/(this.discountItem.price)  
            },

            calculateGeneralPorcentage(){
                this.purchase.porcentageGeneralExtra = (100*this.purchase.generalExtra)/(this.purchase.total)
            },

            calculateToPayPorcentage(){

                this.purchase.toPayPorcentageExtra = (100*this.purchase.toPayExtra)/(this.purchase.toPay)
            },

            calculateDiscount(){

                this.discountItem.discount = this.discountItem.price / 100 * this.discountItem.porcentage
            },

            calculateGeneralDiscount(){

                this.purchase.generalExtra = this.purchase.total / 100 * this.purchase.porcentageGeneralExtra
            },
            calculateToPayDiscount(){

                this.purchase.toPayExtra = this.purchase.toPay / 100 * this.purchase.toPayPorcentageExtra
            },

            getStore(){
                axios.get('get_store',).then(res=>{                    
                    if(res.data.statusCode == 200){
                        this.store= res.data.data
                    }else{
                        console.log("error get store")//pendiente notificable y redirect
                    }
                }).catch(error => {
                    console.log("error getInventory")
                    console.log(error.response)
                });
            },

            cleanClient(){
                this.client = Object.assign({},{
                    name: '',
                    identification: '',
                    phone: '',
                    address: '',
                    email: ''
                })
            },

            shearchClient(){
                this.cleanClient()
                let inputDNI = this.$refs.clientDNI.value
                if(inputDNI.length == 7 || inputDNI.length == 8){
                    const c = this.clients.find( element => parseFloat(element.identification) === parseFloat(inputDNI))
                    console.log(c)

                    if(c == undefined){ 
                        this.client.identification = inputDNI
                        return 
                    }
                    this.client = Object.assign(c)
                    
                }
                //const rowSelect = this.inventory.find( product => product.id === id );
            },

            scrollToBottom() {
                for (let index = 0; index < 30; index++) {
                    setTimeout(() => {
                        window.scrollTo(0, 90 + 10*index);
                    }, 10*index)
                }

                this.$refs.inputPay.focus()
            },

            selectPaymontType(type){
                this.radioType = type
                //if(){
                    this.addPayment()
                //}

                this.$refs.inputPay.focus()
                
            },

            getSumPayment(wayToPay){
                let toPay = _.sumBy(this.payments, function (element) {
                    if (element.type == wayToPay){
                        return element.mount;
                    }
                });

                if( toPay == undefined){ toPay = 0 }

                return toPay ;
            },
            pay(){
                var products = []
                this.shoppingCart.forEach(element => {
                    products.push(element.productId)
                });

                var payment = {
                    cash_payment: this.getSumPayment('Efectivo'),
                    credit_payment: this.getSumPayment('Financiado'),
                    personal_account_payment: this.getSumPayment('Cuenta P.'),
                    discount: this.purchase.totalDiscount,
                    description: JSON.stringify(this.shoppingCart),
                }

                this.client.identification =  parseFloat(this.$refs.clientDNI.value)
                this.loading_toPay = true

                axios.post('venta', {payment: payment, client: this.client, products: products}).then(res=>{        
                    if(res.data.statusCode == 200){
                        window.location.href = this.uri+'/facturacion/'+res.data.id+'-ventas';
                    }else{
                        console.log("La caja ya fue cerrada por otro usuario")//pendiente notificable y redirect
                    }
                }).catch(error => {
                    console.log("error getInventory")
                    console.log(error.response)
                });
            },

            cancelPayment(index){
                if(index > -1) {
                    this.payments.splice(index, 1);
                }
            },
            addPayment(){
                if(this.$refs.inputPay.value == ''){
                    //pendiente notificable
                }else{
                    this.payments.push({type:this.radioType, mount:parseFloat(this.$refs.inputPay.value)})
                    this.$refs.inputPay.value= ''
                }
            },

            addFinancial(){
                if(this.amount == ''){
                    this.$refs.inputAmount.focus()
                }else{
                    this.payments.push({type:'Financiado', mount:parseFloat(this.amount)})
                    this.amount= ''
                    this.hideModal('financial-modal')
                }
            },

            getInventory(){
                axios.post('get_products').then(res=>{
                    if(res.data.statusCode == 200){
                        this.inventory = res.data.data
                        this.initDataTables()
                        this.b_loadingTable = false
                    }else{
                        console.log('error in methods getInventory')
                        this.err_msg_tableInventory= 'Error al cargar la tabla de Inventario'
                    }
                }).catch(error => {
                    console.log("error getInventory")
                    console.log(error.response)
                });
            },

            deleteItem(index){
                if (index > -1) {
                    this.shoppingCart.splice(index, 1);
                }

                if(this.shoppingCart.length == 0){
                    this.payments = Object.assign([])
                }
            },
            addItem(id){
                const rowSelect = this.inventory.find( product => product.id === id );
                let row = [];

                console.log(rowSelect)

                var privder = null
                if(rowSelect.provider){
                    privder = rowSelect.provider.name
                }
                
                row = Object.assign({
                    productId : rowSelect.id,
                    name : rowSelect.name,
                    price : rowSelect.unit_price,
                    provider : privder,
                    discount : 0,
                })

                this.shoppingCart.push(row)             
            },

            initDataTables()
            {
                var shoppingCart = this.shoppingCart
                $(document).ready( function () {
                    var dataTableInventory =  $('#_tInventory').DataTable({       
                        "pageLength": 5,  
                        "paging": true,
                        "bInfo": false,
                        "lengthChange": false,    
                        "columnDefs": [
                            { 
                                "targets": [5, 7],
                                "orderable": false,
                                "searchable": false
                            },
                            {
                                "targets": [1,4],
                                "visible": false,
                                "orderable": false,
                            }
                        ],
                        language: {
                            url: 'http://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json'
                        },
                        
                    })       
                    
                    
                    window.addEventListener('keydown', function(e) {
                        if(e.keyCode === 39){
                            dataTableInventory.page('next').draw('page')
                        }else if(e.keyCode === 37){
                            dataTableInventory.page('previous').draw('page')
                        }
                    });         

                    tBodyVisibility("")
                    $('#inputSearch').on('keyup', function(e){
                        tBodyVisibility(this.value)
                        dataTableInventory.search(this.value).draw();
                        if (e.keyCode === 13){
                            var rowItem = getRow([])
                            if(rowItem.productId != undefined){
                                shoppingCart.push(rowItem)
                            }
                        }
                    })

                    function getRow(row){
                        dataTableInventory.rows({page:'current'}).every(function () { 
                            var price = this.data()[6].replace("$", "");
                            row = Object.assign({
                                productId : parseFloat(this.data()[1]),
                                name : this.data()[2],
                                price : parseFloat(price),
                                provider : this.data()[3],
                                discount : 0,
                            })
                        })
                        return row;
                    }

                    function tBodyVisibility(val){
                        if(val != ""){
                            $('#_tBodyInventory').show();
                            $('#_tInventory_paginate').show();
                        }else{
                            $('#_tBodyInventory').hide();
                            $('#_tInventory_paginate').hide();
                        }
                    }
                })
            },
            showModalDiscount(item, i) {
                this.discountItem = Object.assign({
                    index: i,
                    name: item.name,
                    price: item.price,
                    discount: item.discount,
                    porcentage: 0,
                });

                this.$modal.show('modal-discount')
            },

            showModalDiscountGeneral() {
                this.$modal.show('modal-general-discount')
            },
            showModalDiscountRemainsPaid() {
                this.$modal.show('modal-general-discount-Remains-Paid')
            },

            hideModal(modal) {
                this.$modal.hide(modal);
            },
            porcentajeDiscoutn(porcentage){
                this.discountItem.discount = this.discountItem.price / 100 * porcentage
                this.discountItem.porcentage = porcentage
            },
            porcentajeGeneralDiscoutn(porcentage){
                this.purchase.generalExtra = this.purchase.total / 100 * porcentage
                this.purchase.porcentageGeneralExtra = porcentage
            },
            porcentajeToPayDiscoutn(porcentage){
                this.purchase.toPayExtra = this.purchase.toPay / 100 * porcentage
                this.purchase.toPayPorcentageExtra = porcentage
            },
            applyModalGeneralDiscount(){
                if (this.purchase.generalExtra == ''){
                    this.purchase.generalExtra = 0
                }
                this.hideModal('modal-general-discount')
                this.refreshPurchase()
            },
            applyModalToPayDiscount(){
                if (this.purchase.toPayExtra == ''){
                    this.purchase.toPayExtra = 0
                }
                this.hideModal('modal-general-discount-Remains-Paid')
                this.refreshPurchase()
            },
            applyModalDiscount(){
                if (this.discountItem.discount == ''){
                    this.discountItem.discount = 0
                }
                const itemShoppingCart = this.shoppingCart.find((element, index)=>index == this.discountItem.index);
                itemShoppingCart.discount = parseFloat(this.discountItem.discount)
                this.hideModal('modal-discount')

                this.refreshPurchase()
            },
            getCustomers(){
                axios.post('get_persons', {'category': 1}).then(res=>{
                    if(res.data.statusCode == 200){
                        this.clients = res.data.data
                    }else{
                        console.log('error in methods getCustomers(): return error in controller')
                    }
                }).catch(error => {
                    console.log("error get_persons")
                    console.log(error.response)
                });
            },
        }
    }
</script>