<template>
    <div class="container">
        <div class="card-deck">
            <div class="card ">
                <div class="md-form md-outline mt-2 mb-0 mx-2">
                    <input placeholder="Buscar" id="inputSearch" ref="inputSearch" class="form-control form-control-sm" type="text">
                </div>
            </div>
        </div>
        <div class="card-deck mt-4">
            <div class="card pt-0 px-2">
                <div class="col-12">
                    <div class="row">
                        <div class="col-6"></div>
                        <div class="col-6">
                            <button 
                                class="btn btn-outline-danger btn-md btn-block mt-3 text-white btn-sm float-right" 
                                :disabled="b_SelectCustomer === null" 
                                type="button" data-toggle="modal" data-target="#confirmDeleteModal">
                                <b>Eliminar Cliente</b>
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </div>
                        <div class="col-12">
                            <table id="_tCustomers" class="table">
                                <thead>
                                    <tr>
                                        <th>DNI</th>
                                        <th>Nombre</th>
                                        <th>Email</th>
                                        <th>Telefono</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr 
                                        v-for="(customer, i)  in customers" :key="i" 
                                        :class="{'red accent-1 font-weight-bold': i === b_SelectCustomer }"
                                        v-on:click="selectCustomer_(i)"
                                    >
                                        <td>{{customer.identification}}</td>
                                        <td>{{customer.name}}</td>
                                        <td>{{customer.email}}</td>
                                        <td>{{customer.phone}}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12 mt-3">
            <div class="row"> 
                <div class="col-5">
                    <h4 class="mt-1 text-center red-store-text mb-3">
                        <b>Cuenta Personal</b>
                    </h4>
                    <div class="card">
                        <table class="table table-sm mb-0">
                            <thead>
                                <tr>
                                    <th class="text-center">Resumen</th>
                                    <th class="text-center">Deuda</th>
                                    <th>Ultima Act.</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody v-if="customer.accounts">
                                <tr  v-for="(item, i)  in customer.accounts" :key="i">
                                    <td class="text-left">
                                        <a :href="'facturacion/'+item.sale_id+'-clientes'" class="badge red accent-4 w-100">#{{item.sale_id}} <i class="far fa-eye"></i></a>
                                    </td>
                                    <td class="text-center">${{item.rest_account}}</td>
                                    <td class="text-left">
                                        hace {{ item.updated_at | moment("from", Date.now(), true) }}
                                    </td>
                                    <td class="text-right">
                                        <a v-on:click="selectAccount_(i), $modal.show('account-modal')" title="Gestionar." ><i class="red-store-text fas fa-edit"></i></a>
                                    </td>
                                </tr>
                                <tr v-if="customer.accounts.length <= 0 ">
                                    <td colspan="4"><span class="p-3"></span></td>
                                </tr>
                                <tr v-if="customer.accounts.length <= 1 ">
                                    <td colspan="4"><span class="p-3"></span></td>
                                </tr>
                                <tr v-if="customer.accounts.length <= 2 ">
                                    <td colspan="4"><span class="p-3"></span></td>
                                </tr>
                                <tr v-if="customer.accounts.length <= 3 ">
                                    <td colspan="4"><span class="p-3"></span></td>
                                </tr>
                                <tr v-if="customer.accounts.length <= 4 ">
                                    <td colspan="4"><span class="p-3"></span></td>
                                </tr>
                                <tr v-if="customer.accounts.length <= 5 ">
                                    <td colspan="4"><span class="p-3"></span></td>
                                </tr>
                                <tr v-if="customer.accounts.length <= 6 ">
                                    <td colspan="4"><span class="p-3"></span></td>
                                </tr>
                            </tbody>
                            <tbody v-else>
                                <tr>
                                    <td colspan="4"><span class="p-3"></span></td>
                                </tr>
                                <tr>
                                    <td colspan="4"><span class="p-3"></span></td>
                                </tr>
                                <tr>
                                    <td colspan="4"><span class="p-3"></span></td>
                                </tr>
                                <tr>
                                    <td colspan="4"><span class="p-3"></span></td>
                                </tr>
                                <tr>
                                    <td colspan="4"><span class="p-3"></span></td>
                                </tr>
                                <tr>
                                    <td colspan="4"><span class="p-3"></span></td>
                                </tr>
                                <tr>
                                    <td colspan="4"><span class="p-3"></span></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-1"></div>
                <div class="col-6">
                    <div class="row">
                        <div class="col-12 mb-3">
                            <button 
                                type="button" 
                                class="btn btn-outline-danger btn-md btn-block mt-3 text-white btn-sm float-right"
                                data-toggle="modal"
                                data-target="#recordModal"
                                :disabled="b_SelectCustomer === null" 
                            >
                                Historial
                            </button>
                        </div>
                        <div class="col-6">
                            <label for="basic-url">DNI (*)</label>
                            <input v-model="customer.identification" class="form-control form-control-sm" ref="customerDNI" type="number">
                        </div>
                        <div class="col-6">
                            <label for="basic-url">Apellido y Nombre (*)</label>
                            <input v-model="customer.name" class="form-control form-control-sm" ref="" placeholder="" type="text">
                        </div>
                        <div class="col-12 mt-3 mb-3">
                            <label for="inputTitle">Direccion</label>
                            <textarea id="inputTitle" v-model="customer.address" rows="1" class="md-textarea form-control"></textarea>
                        </div>
                        <div class="col-6">
                            <label for="basic-url">Telefono</label>
                            <input v-model="customer.phone" class="form-control form-control-sm" ref="" placeholder="" type="text">
                        </div>
                        <div class="col-6">
                            <label for="basic-url">Correo Electronico</label>
                            <input v-model="customer.email" class="form-control form-control-sm" ref="" placeholder="" type="text">
                        </div>
                        <div class="col-12">
                            <button 
                                v-on:click="submitCustomer()"
                                type="button" 
                                class="btn mt-4 btn-sm red accent-4 btn-block text-white"
                                :disabled="this.customer.identification === '' || this.customer.name === ''"
                            >
                                Guardar Cliente
                            </button>
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
                            <p class="pt-3 pr-2">Confirma que realmente desea eliminar el Cliente <b>{{customer.name}}</b>?</p>
                            <a type="button"  v-on:click="deleteCustomer()"  class="btn btn-danger btn-sm" data-dismiss="modal">Si, Eliminar <i class="fas fa-check-double"></i></a>
                            <a type="button" class="btn btn-outline-danger btn-sm waves-effect" data-dismiss="modal">Mejor no</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <modal name="account-modal" :height="240" :width="600">
            <div class="modal-content">
                <div class="pl-3 pt-3 h4">
                    (Cuenta #{{account.sale_id}}) <b>{{customer.name}}</b>
                </div>
                <div class="modal-body">
                    <table class="table">
                        <tbody>
                            <tr>
                                <td>Deuda Inicial: <b class="red-store-text">${{account.total_account}}</b></td>
                                <td class="text-right pr-0">
                                    Resta por Pagar: 
                                </td>
                                <td class="text-left pl-1">
                                    <b class="red-store-text">${{account.rest_account - account.pay}}</b>
                                </td>
                                <td>
                                    <input 
                                        ref="inputRestAccount" 
                                        v-on:keyup.13="editAccount(), $modal.hide('account-modal')" 
                                        v-model.number="account.pay" class="form-control form-control-sm" type="number"
                                    >
                                </td>
                            </tr>

                        </tbody>
                    </table>
                    <div class="col-12">
                        <div class="row ">
                            <div class="col-12">
                                <label class="float-right custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" v-model="account.impact_cash" :disabled="b_editAcount == false">
                                    <span class="custom-control-label pt-1" >Impactar pago en la caja</span>
                                </label>
                            </div>
                            <div class="col-12">
                                <button class="btn btn-sm red accent-4 text-white float-right" v-on:click="editAccount(), $modal.hide('account-modal')">
                                    Actualizar Cuenta
                                </button>              
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </modal>

        <div id="recordModal" class="modal fade" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Historial de Pagos</h4>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <tr>
                                <th>Description</th>
                                <th>Caja</th>
                                <th>Monto</th>
                                <th>Fecha</th>
                            </tr>
                            <tr v-for="(customer, i)  in this.customer.extras" :key="i" >
                                <td>{{customer.description}}</td>
                                <td><a class="red-store-text" href="/caja">#{{customer.cash_id}}</a></td>
                                <td>${{customer.amount}}</td>
                                <td>
                                    {{new Date(customer.created_at) | dateFormat('D MMMM, HH:mm')}}
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data(){
            return{
                customers: [],
                customer:{
                    identification:'',
                    name:'',
                    phone:'',
                    address:'',
                    email:'',
                },
                b_SelectCustomer: null,

                account : {},

                b_editAcount : false
            }
        },
        mounted() {
            this.getCustomers()
            this.getPermissionDistilEditAcount()
        },
        methods:{
            getPermissionDistilEditAcount(){
                axios.get('get_permission_distil_edit_acount').then(res=>{
                    //console.log(res.status)
                    this.b_editAcount = true
                }).catch(error => {
                    console.log("error getPermissionDistilEditAcount")
                    console.log(error)
                });
            },

            getCustomers(){
                axios.post('get_persons', {'category': 1}).then(res=>{
                    if(res.data.statusCode == 200){
                        this.customers = res.data.data
                        this.initDataTables()

                    }else{
                        console.log('error in methods getCustomers(): return error in controller')
                        this.err_msg_tablePersons= 'Error al cargar la tabla de customeres'
                        if(error.response.status == 403){
                            alert("Usted no tiene los permisos suficientes para efectuar esta accion")
                        }
                    }
                }).catch(error => {
                    console.log("error getCustomers")
                    console.log(error.response)
                });
            },
            editAccount(){
                this.account.client_id = this.customer.id
                this.account.client_name = this.customer.name

                axios.put(`edit_account/${this.account.id}`, this.account).then(res=>{
                    if(res.data.statusCode==200){
                        const index = _.findIndex(this.customer.accounts, { 
                            'id': res.data.data.id
                        });//busqueda suprema
                        
                        console.log(res.data.data)

                        if(index > -1){
                            this.customer.accounts[index].rest_account = res.data.data.rest_account
                            this.customer.accounts[index].updated_at = res.data.data.updated_at
                        }
                    }else{
                        alert("La caja esta cerrada")//pendiente
                    }
                    //console.log(res.data)
                }).catch(error => {
                    console.log("error edit account")
                    console.log(error.response)

                    if(error.response.status == 403){
                        alert("Usted no tiene los permisos suficientes para efectuar esta accion")
                    }
                });
            },
            initDataTables()
            {
                $(document).ready( function () {
                    $('#_tCustomers').DataTable({                
                        language: {
                            url: 'http://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json'
                        },
                    })
                })
            },

            selectCustomer_(index)
            {
                if(this.b_SelectCustomer == index)
                {
                    this.b_SelectCustomer = null
                    this.emptyForm()
                    return
                }
                this.b_SelectCustomer = index
                this.customer = Object.assign({}, this.customers[index])
            },

            selectAccount_(index){
                this.account = Object.assign({pay: '', impact_cash : true}, this.customer.accounts[index])
            },
            deleteCustomer(){              
                axios.delete(`persons/${this.customer.id}`).then(res=>{
                    this.resetDatatables()
                    this.emptyForm()
                }).catch(error => {
                    console.log(error.response)
                    if(error.response.status == 403){
                        alert("Usted no tiene los permisos suficientes para efectuar esta accion")
                    }
                });
                //console.log(this.customer.id)
            },

            submitCustomer(){
                axios.post('persons', this.customer).then(res=>{
                    this.resetDatatables()
                    this.emptyForm()
                }).catch(error => {
                    console.log(error.response)
                    if(error.response.status == 403){
                        alert("Usted no tiene los permisos suficientes para efectuar esta accion")
                    }
                });
            },
            resetDatatables()
            {
                $('#_tCustomers').dataTable().fnDestroy()
                this.getCustomers()
            },

            emptyForm()
            {
                this.b_SelectCustomer = null
                this.customer = Object.assign({})
            },

            cleancustomer(){
                this.customer = Object.assign({},{
                    name: '',
                    identification: '',
                    phone: '',
                    address: '',
                    email: ''
                })
            },

            initDataTables()
            {
                $(document).ready( function () {
                    var dataTableInventory = $('#_tCustomers').DataTable({       
                        "pageLength": 5,  
                        "paging": true,
                        "bInfo": false,
                        "order": [[ 1, "desc" ]],
                        //"lengthChange": false,   
                        "columnDefs": [
                            {
                                "targets": [0],
                                //"visible": false,
                            },

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
                        }else if(e.keyCode === 27){
                            $("#recordModal").modal('hide');
                        }
                    });

                    $('#inputSearch').on('keyup', function(e){
                        dataTableInventory.search(this.value).draw();
                    })

                })
            },
        }
    }
</script>
