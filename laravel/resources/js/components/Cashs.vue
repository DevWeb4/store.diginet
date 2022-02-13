<template>
    <div class="container vh-100">
        <div class="card p-1 mb-4">
            <div class="md-form md-outline input-with-post-icon form-sm m-0">
                <i class="fas fa-search red-store-text input-prefix"></i>
                <input 
                    ref="inputSearch" 
                    id="inputSearch"
                    value="" type="text" 
                    class="form-control m-0" 
                    placeholder="Buscar"
                >
            </div>
        </div>
        <div class="card fade" id="datatablesBody" style="min-height: 350px">
            <div class="card-body" >
                <table class="table table-sm" id="_tInventory">
                    <thead>
                        <tr>
                            <th></th>
                            <th class="border-right"></th>
                            <th class="border-right">Apertura de Caja</th>
                            <th></th>
                            <th></th>
                            <th class="border-left border-right">Cierre de Caja</th>
                            <th></th>
                            <th></th>
                            <th class="border-left text-center">Diferencia</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(cash, i)  in cashs" :key="i"
                            :class="{'red accent-1 font-weight-bold': i === b_SelectCash }"
                            v-on:click="selectCash(i)"
                        >
                            <td class="">{{cash.id}}</td>
                            <td class="border-right text-center">#{{cash.id}}</td>
                            <td>
                                <i class="text-black-50 fas fa-calendar-alt"></i>
                                {{new Date(cash.created_at) | dateFormat('DD/MM/YYYY')}}
                            </td>
                            <td class="text-right">
                                {{new Date(cash.created_at) | dateFormat('HH:mm')}}
                            </td>
                            <td>
                                <b class="float-right">${{cash.initial_cash}}</b>
                            </td>
                            <td class="border-left" v-if="cash.status==0">
                                <i class="text-black-50 fas fa-calendar-alt"></i>
                                {{new Date(cash.updated_at) | dateFormat('DD/MM/YYYY')}}
                            </td><td v-else class="border-left grey lighten-3"></td>
                            <td class="text-right" v-if="cash.status==0">
                                {{new Date(cash.updated_at) | dateFormat('HH:mm')}}
                            </td><td v-else class="grey lighten-3"></td>
                            <td v-if="cash.status==0">
                                <b class="float-right">${{cash.final_cash}}</b>
                            </td><td v-else class="grey lighten-3"></td>
                            <td class="border-left" v-if="cash.status==0">
                                <div class="col-12">

                                    <div class="row">
                                        <span class="col-6">
                                            {{ cash.created_at | moment("from", cash.updated_at, true) }}
                                            <span class="float-right">
                                                <i v-if="inconsistencyAlert(cash)" class="fas fa-exclamation red-store-text" title="Inconsistencia en el valor declarado"></i>
                                            </span>
                                        </span>

                                        <b class="text-right col-6">
                                            <span class="float-left">${{ (cash.final_cash - cash.initial_cash).toFixed(2) }}</span>
                                            <i class="fas fa-long-arrow-alt-up" v-if="cash.final_cash - cash.initial_cash > 0"></i>
                                            <i class="fas fa-long-arrow-alt-down" v-else-if="cash.final_cash - cash.initial_cash < 0"></i>
                                            <i class="fas fa-exchange-alt" v-else></i>
                                        </b>
                                    </div>
                                </div>

                            </td>
                            <td v-else class="text-center grey lighten-3">
                                <span class="badge red accent-4">Caja Aun Abierta</span>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </div>
        <div class="mt-0" v-if="b_SelectCash != null">
            <div class="card-body">
                <h4 class="red-store-text border-bottom border-danger"> 
                    REGISTRO CAJA #{{cash.id}}
                </h4>
                <div class="row">
                    <div class="col-6">
                        <div class="row text-center">
                            <div class="col-4 mt-3">
                                <b><p class="mb-0">Total Efectivo:</p></b>
                                <h5><b>${{summation.cash.toFixed(2)}}</b></h5>
                            </div>
                            <div class="col-4 mt-3">
                                <b><p class="mb-0">Total Credito:</p></b>
                                <h5><b>${{summation.credit.toFixed(2)}}</b></h5>

                            </div>
                            <div class="col-4 mt-3">
                                <b><p class="mb-0">Total Cuenta P.:</p></b>
                                <h5><b>${{summation.debit.toFixed(2)}}</b></h5>
                            </div>
                        </div>
                        <pie-chart 
                            :data="[['Efectivo', summation.cash], ['Credito', summation.credit], ['Cuenta P.', summation.debit]]" height="100px"
                        ></pie-chart>
                    </div>
                    <div class="col-6">
                        <div class="row">
                            <div class="col-6"></div>
                            <div class="col-6">                    
                                <a class="btn red accent-4 btn-sm btn-block" v-on:click="shoModalUpdate()">
                                    Modificar Registro
                                </a>
                            </div>
                        </div>
                        
                    </div>
                    <div class="col-6"></div>
                    <div class="col-6 text-center">
                        <h6 v-if="inconsistencyAlert(cash)">
                            <i class="red-store-text border-bottom border-danger">
                                APERTURA DE CAJA + Ventas en Efectivo + Extras= <b>${{(Number(this.cash.initial_cash) + Number(this.summation.cash) + Number(getSumExtras(cash.extras))).toFixed(2)}}</b>
                            </i>
                            <br>
                            <span>//vs//</span>
                            <br>
                            <i class="red-store-text border-bottom border-danger">
                                CIERRE DE CAJA = <b>${{ Number(this.cash.final_cash).toFixed(2) }}</b>
                            </i>
                        </h6>
                    </div>
                </div>
            </div>
            <div class="card mb-3">
                <div class="card-body">
                    <div class="col-12 mt-3 text-right">
                        <b>APERTURA DE CAJA</b> por <b>{{cash.initial_user.name}}</b> con <b>${{cash.initial_cash.toFixed(2)}}</b>, el dia {{new Date(cash.created_at) | dateFormat('dddd D MMMM, HH:mm')}} Hs
                    </div>
                    <div class="table-responsive" v-if="cash.sales.length > 0" >
                        <table class="table table-sm">
                            <tbody>
                                <tr class="text-center">
                                    <th></th>
                                    <th>subTotal</th>
                                    <th>extrasTotal</th>
                                    <th class="text-right">Total Pagado</th>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr v-for="(item, i)  in cash.sales" :key="i" >
                                    <td>
                                        <h5>
                                            <a :href="'facturacion/'+item.id+'-caja'" class="badge red accent-4 w-100"># {{item.id}} <i class="far fa-eye"></i></a>
                                        </h5>
                                    </td>
                                    <td class="text-center">
                                        <h5>$ {{(Number(item.credit_payment) + Number(item.cash_payment) + Number(item.personal_account_payment) - Number(item.discount)).toFixed(2)}} </h5>
                                    </td>
                                    <td class="text-center">
                                        <h5>$ {{Number(item.discount).toFixed(2)}}</h5>
                                    </td>
                                    <td class="text-left">
                                        <h5>
                                            <span 
                                                :class="{'fade': item.cash_payment == 0 }"
                                                class="badge badge-light w-25"
                                            >
                                                Efectivo ${{ Number(item.cash_payment).toFixed(2)}}
                                            </span>

                                            <span :class="{'fade': item.credit_payment == 0 }"
                                                class="badge special-color-dark w-25"
                                            >
                                                Credito ${{Number(item.credit_payment).toFixed(2)}}
                                            </span>
                                            <span 
                                                :class="{'fade': item.personal_account_payment == 0 }"
                                                class="badge grey darken-2 w-25"
                                            >
                                                Cuenta P. ${{Number(item.personal_account_payment).toFixed(2)}}
                                            </span>
                                            <img v-if="item.invoiced == 1" class="m-1" width="50" :src="uri+'/images/logos/afip.png'" >
                                            <span class="float-right">$ {{(Number(item.credit_payment) + Number(item.cash_payment) + Number(item.personal_account_payment)).toFixed(2)}}</span>
                                        </h5>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div v-else>
                        <h5 class="red-store-text border-bottom border-top my-4">SIN MOVIMIENTOS</h5>
                    </div>
                    <div class="col-12 mb-2 text-right" v-if="cash.status == 0">
                        <b>CIERRE DE CAJA</b> por <b>{{cash.final_user.name}}</b> con <b>${{Number(cash.final_cash).toFixed(2)}}</b>, el {{new Date(cash.updated_at) | dateFormat('dddd D MMMM, HH:mm')}} Hs
                    </div>
                </div>
            </div>
            <p class="red-store-text">
                Precio dolar al momento de abrir la caja: ${{cash.dolar}}
            </p>
        </div>

        
        <div class="container mt-4 px-5">
            <div class="row"> 
                <h4 class="col-12 red-store-text">Total Extras: ${{getSumExtras(cash.extras)}}</h4>

                <table class="table">
                    <thead>
                        <tr class="text-center table-active table-bordered">
                            <th>Descripcion</th>
                            <th colspan="2">Monto</th>
                            <th>Fecha</th>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(item, i)  in cash.extras" :key="i" >
                            <td class="text-left">{{item.description}}</td>
                            <td>$</td>
                            <td class="text-right">{{item.amount}}</td>
                            <td class="text-right">{{ new Date(item.created_at) | dateFormat('DD/MM/YYYY hh:mm') }} </td>
                            <td>
                                <a class="float-right" v-on:click="b_extra = item.id" data-toggle="modal" data-target="#modalConfirmDelete" title="Eliminar Extra." >
                                    <i class="red-store-text fas fa-backspace"></i>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <modal name="update-modal" class="col-6" :height="210">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modificar Registro #{{cash.id}}</h5>
                    <button type="button" class="close" v-on:click="hideModal('update-modal')">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-6">
                            <label for="basic-url" class="mb-0">APERTURA DE CAJA</label>
                            <input  v-model.number="updatedCash.initial_cash" class="form-control form-control"  type="number">
                        </div>
                        <div class="col-6">
                            <label for="basic-url" class="mb-0">CIERRE DE CAJA</label>
                            <input v-model.number="updatedCash.final_cash" class="form-control form-control"  type="number">
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <button class="btn red accent-4 btn-sm text-white mt-0 float-right col-4 mr-0" v-on:click="updateCash()">Guardar</button>
                </div>
            </div>
        </modal>
        <div class="modal fade top" id="modalConfirmDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="true">
            <div class="modal-dialog modal-frame modal-top modal-notify modal-info" role="document">
                <!--Content-->
                <div class="modal-content">
                <!--Body-->
                    <div class="modal-body">
                        <div class="row d-flex justify-content-center align-items-center">

                        <p class="pt-3 pr-2">Confirma que realmente desea eliminar esto?</p>

                        <a type="button"  v-on:click="deleteExtra()"  class="btn btn-danger btn-sm" data-dismiss="modal">Si, Eliminar <i class="fas fa-check-double"></i></a>
                        <a type="button" class="btn btn-outline-danger btn-sm waves-effect" data-dismiss="modal">Mejor no</a>
                        </div>
                    </div>
                </div>
                <!--/.Content-->
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        props: ['array', 'uri'],
        data(){
            return{
                b_SelectCash: null,

                cashs:JSON.parse(this.array),
                cash:{},
                updatedCash:{initial_cash: 100, final_cash:0},
                summation:{
                    cash:0, debit:0, credit:0
                },
                billings:[],
            }
        },
        mounted() {
            this.initDataTables()
        },
        methods:{
            getSumExtras(arr){
                let toPay = _.sumBy(arr, function (element) {
                    return parseFloat(element.amount);
                });

                if( toPay == undefined){ toPay = 0 }

                return toPay.toFixed(2) ;

            },
            deleteExtra(){              
                axios.delete(`extra/${this.b_extra}`).then(res=>{
                    if (res.data.statusCode == 200) {
                        const index = _.findIndex(this.cash.extras, { 'id': this.b_extra });//busqueda suprema
                        if(index > -1) {
                            this.cash.extras.splice(index, 1);
                        }

                        this.b_extra = null
                    }
                }).catch(error => {
                    if(error.response.status == 403){
                        alert("Usted no tiene los permisos suficientes para efectuar esta accion")
                    }
                })
            },
            inconsistencyAlert(arr){
                if(arr.initial_cash + _.sumBy(arr.sales, 'cash_payment') + this.getSumExtras(arr.extras) != arr.final_cash && arr.status == 0){
                    return true
                }
                return false
            },
            updateCash(){

                axios.put(`caja_/${this.cash.id}`, this.updatedCash).then(res=>{
                    
                    this.cashs[this.b_SelectCash] = Object.assign(this.cash, res.data.data)
                    this.cash = Object.assign({}, this.cashs[this.b_SelectCash])

                    console.log(res.data.data)

                    this.hideModal('update-modal')

                }).catch(error => {
                    console.log(error.response)
                    if(error.response.status == 403){
                        alert("Usted no tiene los permisos suficientes para efectuar esta accion")
                    }
                })              
            },
            hideModal(modal) {
                this.$modal.hide(modal);
            },
            shoModalUpdate(){
                this.$modal.show('update-modal')
            },
            selectCash(index)
            {
                if(this.b_SelectCash == index)
                {
                    this.b_SelectCash = null
                    this.emptyCash()
                    return
                }
                this.b_SelectCash = index
                this.cash = Object.assign({}, this.cashs[index])

                this.updatedCash = Object.assign({initial_cash:this.cash.initial_cash, final_cash:this.cash.final_cash})
              

                this.summation.cash = _.sumBy(this.cash.sales, item => Number(item.cash_payment));
                this.summation.debit = _.sumBy(this.cash.sales, item => Number(item.personal_account_payment));
                this.summation.credit = _.sumBy(this.cash.sales, item => Number(item.credit_payment));

                //console.log(this.cash)
            },
            emptyCash(){
                this.cash = Object.assign({})
            },
            initDataTables()
            {
                $(document).ready( function () {
                    var dataTableInventory = $('#_tInventory').DataTable({       
                        "pageLength": 5,  
                        "paging": true,
                        "bInfo": false,
                        "order": [[ 0, "desc" ]],

                        language: {
                            url: 'http://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json'
                        },
                        "columnDefs": [
                            { 
                                "targets": [1, 7],
                                "orderable": false
                            },                           
                            { 
                                "targets": [0],
                                "visible": false,
                                "searchable": true
                            },
                            { 
                                "targets": [3, 4, 6, 7, 8],
                                "searchable": false
                            },
                        ],  
                    })

                    $('#inputSearch').on('keyup', function(e){
                        dataTableInventory.search(this.value).draw();
                    })
                    setTimeout(function(){ $('#datatablesBody').removeClass('fade'); }, 200);
                })
            }
        }
    }
</script>