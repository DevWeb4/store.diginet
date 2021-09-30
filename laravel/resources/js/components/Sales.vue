<template>
    <div>
        <div class="container">
            <div class="card-deck">
                <div class="card ">
                    <div class="md-form md-outline mt-2 mb-0 mx-2">
                        <input placeholder="Efectivo a Declarar en La Caja" v-on:keyup.13="enterInputCash()" id="form-sm" ref="inputCash" class="form-control form-control-sm" v-model="valueCash" type="number">
                    </div>
                </div>
                <div class="card col-4 px-0">
                    <div class="text-center pt-2" v-if="b_Loading">
                        <div class="spinner-border spinner-border-sm fast red-store-text">
                            <span class="sr-only">Loading...</span>
                        </div>
                    </div>
                    <div class="p-2" v-else>
                        <button v-if="cash.status" v-on:click="closeCash()" :disabled="this.b_disabledButton" class="btn btn-outline-danger btn-sm btn-block">Cerrar Caja</button>
                        <button v-else v-on:click="openCash()" 
                            class="btn btn-sm red accent-4 white-text btn-block"
                            :disabled="this.b_disabledButton"
                        >Abrir Caja</button>
                    </div>
                </div>
            </div>

            <div class="row text-center">
                <div class="col-2 mt-4 mb-2">
                    <b><p class="mb-0">Total Efectivo:</p></b>
                    <h5><b>${{summation.cash_payment}}</b></h5>
                </div>

                <div class="col-2 mt-4">
                    <b><p class="mb-0">Total Financiado:</p></b>
                    <h5><b>${{summation.credit_payment}}</b></h5>

                </div>
                <div class="col-2 mt-4">
                    <b><p class="mb-0">Total Cuentas P.:</p></b>
                    <h5><b>${{summation.personal_account_payment}}</b></h5>
                </div>
                <div class="col-6 mt-4 text-center" >
                    <b><p class="mb-0">Total Efectivo en Caja (Ventas en efectiov + Extras + Apertura de Caja)</p></b>
                    <h5><b>${{parseFloat(summation.cash_payment) + getSumExtras() + parseFloat(cash.initial_cash)}}</b></h5>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="text-center" v-if="b_Loading">
                <div class="spinner-border fast red-store-text" style="margin-top: 150px">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <div class="card"  v-else-if="cash.status != 0" >
                <div class="card-body">
                    <div class="row mb-1">
                        <div class="col-6">
                            <pie-chart 
                                :data="[['Efectivo', summation.cash_payment], ['Financiado', summation.credit_payment], ['Cuenta P.', summation.personal_account_payment]]" height="100px"
                            ></pie-chart>
                        </div>
                        <div class="col-2"></div>
                        <div class="col-4 p-2">
                            <a class="btn btn-sm red accent-4 white-text btn-block" href="venta" v-if="cash.status">
                                Nueva Venta
                            </a>
                        </div>
                        <div class="col-12 mt-3 text-right">
                            <i>CAJA ABIERTA con <b>${{cash.initial_cash}}</b>, el {{new Date(cash.created_at) | dateFormat('dddd D MMMM, HH:mm')}} Hs</i>
                        </div>
                    </div>

                    <div class="table-responsive">
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
                                <tr v-for="(item, i)  in billings" :key="i" >
                                    <td>
                                        <h5>
                                            <a :href="'facturacion/'+item.id+'-ventas'" class="badge red accent-4 w-100"># {{item.id}} <i class="far fa-eye"></i></a>
                                        </h5>
                                    </td>
                                    <td class="text-center">
                                        <h5>$ {{item.credit_payment + item.cash_payment + item.personal_account_payment - item.discount}} </h5>
                                    </td>
                                    <td class="text-center">
                                        <h5>$ {{item.discount}}</h5>
                                    </td>
                                    <td class="text-left">
                                        <h5>
                                            <span 
                                                :class="{'fade': item.cash_payment == 0 }"
                                                class="badge badge-light w-25"
                                            >
                                                Efectivo ${{item.cash_payment}}
                                            </span>
                                            <span :class="{'fade': item.credit_payment == 0 }"
                                                class="badge special-color-dark w-25"
                                            >
                                                Financiado ${{item.credit_payment}}
                                            </span>
                                            <span 
                                                :class="{'fade': item.personal_account_payment == 0 }"
                                                class="badge grey darken-2 w-25"
                                            >
                                                Cuenta P. ${{item.personal_account_payment}}
                                            </span>
                                            <img v-if="item.invoiced == 1" class="m-1" width="50" :src="uri+'/images/logos/afip.png'" >
                                            <span class="float-right">$ {{item.credit_payment + item.cash_payment + item.personal_account_payment}}</span>
                                        </h5>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-12 mb-2 text-right">
                    <i v-if="cash.status == 0">CAJA CERRADA con <b>${{cash.final_cash}}</b>, el {{new Date(cash.updated_at) | dateFormat('dddd D MMMM, HH:mm')}} Hs</i>
                </div>
            </div>
        </div>

        <div class="container mt-3 px-4" v-if="cash.status">
            <div class="row"> 
                <h4 class="col-12 red-store-text">
                    <div class="row">
                        <div class="col-8">
                            Extras: Total ${{getSumExtras()}}
                        </div>
                        <div class="col-4">
                            <a v-on:click="$modal.show('extras-modal')" class="btn btn-outline-danger mb-2 btn-sm btn-block">Añadir Extras</a>
                        </div>

                    </div>                
                </h4>
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

        <notifications group="warning" position="top left"/>

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

        <modal name="extras-modal" :height="188" :width="700">
            <div class="modal-content">
                <div class="pl-3 pt-3 h4 text-center border-bottom border-red">
                    Añadir ingreso o egreso de efectivo extra
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-6">
                            <label for="inputTitle">Descripcion</label>
                            <textarea v-model="extra.description" rows="2" class="md-textarea form-control"></textarea>
                        </div>
                        <div class="col-6">
                            <label for="inputTitle">Monto</label>
                            <input v-model="extra.amount" class="form-control form-control-sm" type="number">
                            <button class="btn btn-sm red accent-4 text-white float-right" v-on:click="addExtra(), $modal.hide('extras-modal')">
                                Guardar
                            </button>
                        </div>

                    </div>
                </div>
            </div>
        </modal>
    </div>
</template>

<script>
    export default {
        props: ['uri'],
        data(){
            return{
                cash:{
                    status:0,
                    initial_cash:0
                },
                billings:[],
                extra:{},
                valueCash:'',
                summation:{
                    cash:0, personal_account_payment:0, credit_payment:0, cash_payment:0
                },
                b_Loading: true,
                b_extra: null,
                b_disabledButton: false,
            }
        },
        mounted() {
            this.lastCash() 
        },
        methods:{

            getSumExtras(){
                let toPay = _.sumBy(this.cash.extras, function (element) {
                    return parseFloat(element.amount);
                });

                if( toPay == undefined){ toPay = 0 }

                return toPay ;
            },
            
            enterInputCash(){
                if(this.cash.status == 1){
                    this.closeCash()
                }else{
                    this.openCash()
                }
            },
            addExtra(){
                if(this.extra.description != undefined && this.extra.amount != undefined){
                    axios.post(this.uri+'/extra', this.extra).then(res =>{
                        if(res.data.statusCode == 200){
                            this.cash.extras.push(res.data.data)
                            this.getBillings(this.cash.id)
                            this.extra = Object.assign({})
                        }
                    }).catch(error => {
                        console.log(error.response)
                    })
                }else{
                    this.$notify({
                        group: 'warning',
                        type: 'warn',
                        title: 'ATENCION!',
                        text: 'Debe completar los Campos'
                    });
                }

            },

            deleteExtra(){              
                axios.delete(`extra/${this.b_extra}`).then(res=>{
                    if (res.data.statusCode == 200) {
                        const index = _.findIndex(this.cash.extras, { 'id': this.b_extra });//busqueda suprema
                        if(index > -1) {
                            this.cash.extras.splice(index, 1);
                            this.getBillings(this.cash.id)
                        }

                        this.b_extra = null
                    }
                }).catch(error => {
                    if(error.response.status == 403){
                        alert("Usted no tiene los permisos suficientes para efectuar esta accion")
                    }
                })
            },
            restart(){
                this.valueCash='',

                this.summation = Object.assign({
                    cash:0,
                    personal_account_payment:0, 
                    credit_payment:0,
                    cash_payment:0
                })
                this.billings = Object.assign({})
                this.cash = Object.assign({
                    status:0,
                    initial_cash:0
                })

            },
            control(){
                if(this.valueCash == ''){
                    this.$refs.inputCash.focus()
                    
                    this.$notify({
                        group: 'warning',
                        type: 'warn',
                        title: 'ATENCION!',
                        text: 'Debe ingresar un monto'
                    });
                    return false
                }
                return true
            },
            getBillings(cashId){
                axios.get(`get_billings/${cashId}`).then(res =>{
                    if(res.data.statusCode == 200){
                        this.billings = res.data.data

                        console.log(this.billings)

                        //this.summation.cash_payment = _.sumBy(this.billings, 'cash_payment') /*+ this.getSumExtras()*/;

                        this.summation.cash_payment = _.sumBy(this.billings, item => Number(item.cash_payment));

                        this.summation.personal_account_payment = _.sumBy(this.billings, 'personal_account_payment');
                        this.summation.credit_payment = _.sumBy(this.billings, 'credit_payment');

                        console.log(this.summation)

                    }
                }).catch(error => {
                    console.log(error.response)
                })
            },
            lastCash(){
                axios.get('get_last_cash').then(res =>{
                    if(res.data.statusCode == 200){
                        this.cash = res.data.data[0]                       
                        this.getBillings(this.cash.id)
                    }
                    this.b_Loading=false
                }).catch(error => {
                    console.log(error.response)
                })
            },
            openCash(){
                if(this.control()){
                    this.b_disabledButton = true;
                    axios.post('open_cash', {'cash_value': this.valueCash }).then(res =>{
                        if(res.data.statusCode == 200){
                            this.cash = res.data.data
                            this.valueCash=''
                            this.b_disabledButton = false
                        }
                    }).catch(error => {
                        console.log(error.response)
                    })
                }
            },
            closeCash(){
                if(this.control()){
                    this.b_disabledButton = true;
                    axios.post('close_cash', {'cash_value': this.valueCash, 'id': this.cash.id }).then(res =>{
                        if(res.data.statusCode == 200){
                            this.cash = res.data.data
                            this.restart()
                            this.b_disabledButton = false
                        }
                    }).catch(error => {
                        console.log(error.response)
                    })
                }
            },
            
        }
    }
</script>
