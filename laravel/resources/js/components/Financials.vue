<template>
    <div class="container">

        <div class="col-12">
            <div class="row">
                <div class="col-6 card">
                    <div class="col-12 pt-4">
                        <h4>Financieras</h4>
                        <hr class="red accent-4">
                        <div class="row">
                            <div class="col-6">
                                <button type="button" v-on:click="cleanSelect()" class="btn btn-sm red accent-4 text-white btn-block" data-toggle="modal" data-target="#formFinancial">
                                    Nueva Financiera
                                </button>
                            </div>
                            <div class="col-6">
                                <button class="btn btn-outline-danger btn-sm btn-block" data-toggle="modal" data-target="#confirmDeleteModal" :disabled="b_SelectFinancial === null"  >
                                    Eliminar Financiera
                                </button>
                            </div>
                        </div>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Financieras</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr
                                    v-for="(f, i)  in financials" 
                                    :key="i" 
                                    :class="{'red accent-1 font-weight-bold': i === b_SelectFinancial }"
                                    v-on:click="selectFinancial(i)"
                                >
                                    <td>
                                        {{f.name}}
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    
                </div>

                <div class="col-6 pt-2">
                    <div class="form-group" style="min-height: 30px">
                        <div class="col-12">
                            <div class="row">
                                <div class="col-8">
                                    <input type="text" v-model="financial.name" class="form-control">
                                </div>
                                <div class="col-4">
                                    <button class="btn btn-sm btn-block red accent-4 text-white" v-on:click="updateFinancial()">
                                        Cambiar Nombre
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <table class="table table-sm text-center">
                        <thead>
                            <tr>
                                <th>Cuotas</th>
                                <th>Porcentaje</th>
                                <th>Coeficiente</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr
                                v-for="(fee, i)  in financial.fee" 
                                :key="i"
                                :class="{'red lighten-4': fee.p != 0 }"
                            >
                                <td class="red-store-text"><b>{{fee.n}}</b></td>
                                <td>%{{fee.p}}</td>
                                <td>{{parseFloat(((fee.p/100)+1)/fee.n).toFixed(4)}}</td>
                                <td>
                                    <div v-if="fee.p == 0">
                                        <a v-on:click="selectFee(i)" class="btn py-0 btn-outline-danger" data-toggle="modal" data-target="#editFee">
                                            Editar
                                        </a>
                                    </div>
                                    <div v-else>
                                        <a v-on:click="selectFee(i)" class="btn py-0 red text-white accent-4" data-toggle="modal" data-target="#editFee">
                                            Editar
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div id="formFinancial" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Nueva Financiera</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Financiera Nombre</label>
                            <input  v-on:keyup.13="storeFinancial()" type="text" v-model="financial.name" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-6"></div>
                            <div class="col-6">
                                <button v-on:click="storeFinancial()" type="button" class="btn btn-sm red accent-4 text-white btn-block">Guardar</button>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>

        <div id="editFee" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Cantidad de Cuotas: {{fee.n}}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="red-store-text">Porcentaje %</label>
                                    <input v-on:keyup.13="enterInputModal()" @change="calculateCoeficiente()" v-on:keyup="calculateCoeficiente()" v-model.number="fee.p"  type="number" class="form-control text-center">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="red-store-text">Coeficiente</label>
                                    <input v-on:keyup.13="enterInputModal()" @change="calculateP()" v-on:keyup="calculateP()" v-model.number="coeficiente" type="number" :min="-100" :max="100" class="form-control text-center">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-6"></div>
                            <div class="col-6">
                                <button v-on:click="updateFee()" data-dismiss="modal" type="button" class="btn btn-sm red accent-4 text-white btn-block">Guardar</button>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
        <!-- Modal Eliminar -->
        <div class="modal fade top" id="confirmDeleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true" data-backdrop="true">
            <div class="modal-dialog modal-frame modal-top modal-notify modal-info" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="row d-flex justify-content-center align-items-center">
                            <p class="pt-3 pr-2">Confirma que realmente desea eliminar el Cliente <b>{{financial.name}}</b>?</p>
                            <a type="button" v-on:click="deleteFinancial()"  class="btn btn-danger btn-sm" data-dismiss="modal">Si, Eliminar <i class="fas fa-check-double"></i></a>
                            <a type="button" class="btn btn-outline-danger btn-sm waves-effect" data-dismiss="modal">Mejor no</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        props: ['uri'],
        data(){
            return{
                financial:{},
                financials:[],
                fee:{},

                b_SelectFinancial: null,
                coeficiente: 1,
            }
        },
        mounted() {
            this.getFinancials()
        },
        methods:{
            deleteFinancial(){              
                axios.delete(this.uri+`/financial/${this.financial.id}`).then(res=>{
                    this.getFinancials()
                    this.cleanSelect()
                })
            },
            updateFinancial(){
                axios.put(`updateFinancial/${this.financial.id}`, {'name': this.financial.name}).then(res=>{   
                    if(res.data.statusCode == 200){
                        const index = _.findIndex(this.financials, { 
                            'id': res.data.data.id
                        });//busqueda suprema

                        console.log(index)

                        if(index > -1){
                            this.financials[index].name = res.data.data.name
                            //this.customer.accounts[index].updated_at = res.data.data.updated_at
                        }
                    }else{
                        alert("algo salio mal")
                    }

                    //this.resetDatatables()
                }).catch(error => {
                    console.log(error.response)
                })
            },
            enterInputModal(){
                this.updateFee()
                $('#editFee').modal('hide');
            },
            calculateCoeficiente(){

                var coef = parseFloat(((this.fee.p/100)+1)/this.fee.n).toFixed(4)

                this.coeficiente = coef
            },
            calculateP(){

                var p = parseFloat(((this.coeficiente*this.fee.n)-1) *100).toFixed(4)

                if(p>0){
                    this.fee.p = parseFloat(((this.coeficiente*this.fee.n)-1) *100).toFixed(4)
                }else{
                    this.fee.p == 0
                }
            },
            selectFee(index){
                this.fee = Object.assign({},this.financial.fee[index])
                this.calculateCoeficiente()
            },
            updateFee(){
                axios.put(`updateFee/${this.fee.id}`, {'p': this.fee.p}).then(res=>{   
                    if(res.data.statusCode == 200){
                        const index = _.findIndex(this.financial.fee, { 
                            'id': res.data.data.id
                        });//busqueda suprema

                        console.log(index)

                        if(index > -1){
                            this.financial.fee[index].p = res.data.data.p
                            //this.customer.accounts[index].updated_at = res.data.data.updated_at
                        }

                    }else{
                        alert("algo salio mal")
                    }

                    //this.resetDatatables()
                }).catch(error => {
                    console.log(error.response)
                })
            },
            cleanSelect(){
                this.b_SelectFinancial = null
                this.financial = Object.assign({})     
                
                //$('#inputEmail').siblings('label').removeClass('active');
                //$('#inputName').siblings('label').removeClass('active');
                //$('#inputPassword').siblings('label').removeClass('active');
            },
            selectFinancial(index){
                if(this.b_SelectFinancial == index)
                {
                    this.b_SelectFinancial = null
                    this.cleanSelect()
                    return
                }
                this.b_SelectFinancial = index
                this.financial = Object.assign({}, this.financials[index]);
                
                //$('#inputEmail').siblings('label').addClass('active');
                //$('#inputName').siblings('label').addClass('active'); 
            },

            getFinancials(){
                axios.get('get_financials').then(res=>{
                    this.financials = res.data.data
                }).catch(error => {
                    console.log(error.response)
                })
            },

            storeFinancial(){
                axios.post('store_financial', this.financial).then(res=>{
                    this.getFinancials()
                    $('#formFinancial').modal('hide');
                }).catch(error => {
                    console.log(error.response)
                })
            },
        },
    }
</script>
