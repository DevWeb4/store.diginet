<template>
    <div class="container">
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
        <div class="card" >
            <div class="card-body pt-0">
                <div class="col-12">
                    <div class="row">
                        <div class="col-6"></div>
                        <div class="col-6">
                            <button 
                                class="btn btn-outline-danger btn-md btn-block mt-3 text-white btn-sm" 
                                v-on:click="b_delete='product'"
                                :disabled="b_SelectProduct === null" type="button" data-toggle="modal" data-target="#confirmDeleteModal">
                                <b>Eliminar Producto</b>
                                <i class="fas fa-trash-alt"></i>
                            </button>
                        </div>
                    
                    </div>
                </div>
                <table id="_tInventory" class="table">
                    <thead>
                        <tr class="text-center">
                            <th></th>
                            <th>#</th>
                            <th>Articulo</th>
                            <th>Codigo</th>
                            <th>Marca</th>
                            <th>Precio Unitario</th>
                            <th></th>
                            <th>Stock</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(product, i)  in products" :key="i"
                            :class="{'red accent-1 font-weight-bold': i === b_SelectProduct }"
                            class="text-center"
                        >
                            <th v-on:click="selectProduct(i)">{{product.bar_code}}</th>
                            <td v-on:click="selectProduct(i)"><a class="text-danger" :href="'audit_product/'+product.id">#{{product.id}}</a></td>
                            <td v-on:click="selectProduct(i)">{{product.name}}</td>

                            <td v-on:click="selectProduct(i)">{{product.bar_code}}</td>

                            <td v-on:click="selectProduct(i)">
                                <span v-if="product.provider">{{product.provider.name}}</span>
                                <span v-else> Inexistente </span>
                            </td>
                            <td v-on:click="selectProduct(i)" class="text-right">
                               <span class="pr-5">${{Number(product.unit_price)}}</span>
                            </td>
                            <td class="text-center">
                                <label class="custom-control custom-checkbox">
                                    <input type="checkbox" v-on:click="printSelected(i)" class="custom-control-input" :value="product.id" v-model="multiUpdate">
                                    <span class="custom-control-label"></span>
                                </label>
                            </td>
                            <td v-on:click="selectProduct(i)">{{product.stock}}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        
        <div class="col-12 py-3">
            <div class="row">
                <div class="col-6">
                    <i>{{new Date(product.created_at) | dateFormat('D MMMM, HH:mm')}} Hs</i>
                </div>
                <div class="col-6">
                    <button type="button" class="btn btn-outline-danger text-white btn-md btn-block btn-sm" 
                        :disabled="b_SelectProduct === null" 
                        v-on:click="emptyForm()"
                    >
                        <b>Cancelar Seleccion</b>
                        <i class="fas fa-ban ml-1"></i>
                    </button>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <form @submit.prevent="submitProduct" class="col-12">
                        <div class="row pt-3">
                            <div class="col-6">
                                <div class="row">
                                    <div class="col-8">                                
                                        <div class="md-form md-outline input-with-post-icon mb-0 pb-0">
                                            <i class="fas fa-signature input-prefix"></i>
                                            <input ref="inputName" required v-model="product.name" id="inputName" type="text" class="form-control">
                                            <label for="inputName">Nombre</label>
                                        </div>
                                    </div>
                                    <div class="col-4 pt-4 text-right">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" v-model="b_edit">
                                            <span class="custom-control-label pt-1">Editar Nombre</span>
                                        </label>
                                    </div>
                                </div>
                                
                                <div class="md-form md-outline input-with-post-icon">
                                    <i class="fas fa-barcode input-prefix"></i>
                                    <input required v-model="product.bar_code" id="inputBarCode" type="text" class="form-control">
                                    <label for="inputBarCode">Código de Barras</label>
                                </div>

                                <div class="md-form md-outline input-with-post-icon">
                                    <i class="fas fa-boxes input-prefix"></i>
                                    <input required v-model="product.stock" id="inputStock" step="1" type="number" class="form-control">
                                    <label for="inputStock">Stock</label>
                                </div>

                            </div>
                            <div class="col-6">
                                <fieldset class="border px-2 pb-2">
                                    <legend class="text-center red-store-text">PROVEEDOR/MARCA</legend>
                                    <div class="row">
                                        <span class="col-12">
                                            <span class="col-6">
                                                Seleccione Proveedor/Marca
                                            </span>
                                        </span>
                                        <div class="col-6 mt-2">
                                            <select v-model="provider.id" class="custom-select-md form-control" @change="onChangeSelectProvider($event)">
                                                <option value="0">Inexistente</option>
                                                <option
                                                    v-for="(provider, i) in providers" :key=i
                                                    :value="provider.id"
                                                >{{provider.name}}</option>
                                            </select>
                                        </div>
                                        <div class="col-6">
                                            <div class="md-form md-outline my-2">
                                                <input 
                                                    v-model="provider.name" 
                                                    v-on:keydown.enter.prevent="enterProvider()"
                                                    id="inputProvider" type="text" class="form-control"
                                                >
                                                <label for="inputProvider">
                                                    <span v-if="provider.id == 0">Nuevo Proveedor/Marca</span>
                                                    <span v-else>Actualizar Proveedor/Marca</span>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <button type="button" class="btn btn-outline-danger text-white btn-md ml-0 btn-sm" 
                                                :disabled="provider.id == 0" 
                                                v-on:click="emptyProvider(true)"
                                            >
                                                <b>Cancelar</b>
                                                <i class="fas fa-ban ml-1"></i>
                                            </button>
                                            <button type="button" class="btn btn-outline-danger btn-sm px-3 float-right mr-0" data-toggle="modal" data-target="#confirmDeleteModal"
                                                :disabled="provider.id == 0"
                                                v-on:click="b_delete='provider'"> 
                                                <i class="fas fa-trash-alt"></i>
                                            </button>
                                        </div>
                                        <div class="col-6 pt-1">
                                            <button 
                                                v-if="provider.id == 0"
                                                type="button" class="btn btn-sm red accent-4 text-white btn-block" 
                                                v-on:click="addProvider()" 
                                                :disabled="provider.name==0"> 
                                                Añadir Nuevo Proveedor/Marca
                                            </button>
                                            <button
                                                v-else
                                                type="button" class="btn btn-outline-danger btn-sm btn-block" 
                                                v-on:click="updateProvider()" 
                                            >
                                                Modificar Proveedor/Marca
                                            </button>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="md-form md-outline input-with-post-icon mt-0">
                                            <i class="fas fa-dollar-sign input-prefix"></i>
                                            <input required v-model="product.unit_price" id="inputUnitPrice" step="1" type="number" class="form-control">
                                            <label for="inputUnitPrice">Precio Unitario</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-6">
                                        <button class="btn red accent-4 btn-md btn-block mb-3 text-white btn-sm" type="submit">
                                            <div v-if="b_LoadingSubmit">
                                                <span class="spinner-border fast spinner-border-sm"></span> 
                                                <b>Guardando</b>
                                            </div>
                                            <div v-else ><b>Guardar</b></div>
                                        </button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </form>                    
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
                            <p class="pt-3 pr-2" v-if="b_delete=='provider'">Confirma que realmente desea eliminar el Proveedor/Marca <b>{{provider.name}}</b>?</p>
                            <p class="pt-3 pr-2" v-else>Confirma que realmente desea eliminar el Producto <b>{{product.name}}</b>?</p>

                            <a type="button" class="btn btn-outline-danger btn-sm waves-effect" data-dismiss="modal">Mejor no</a>
                            <a type="button"  v-on:click="modalDelete(b_delete)"  class="btn red accent-4 btn-sm" data-dismiss="modal">Si, Eliminar <i class="fas fa-check-double"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <notifications group="warning" position="top left"/>
    </div>
</template>

<script>

    export default {
        data(){
            return{
                products:[],
                product:{provider_id:0},
                providers:[],
                provider:{id:0, name:''},
                
                err_msg_tableProducts: '',

                b_edit: false,
                b_LoadingSubmit:false,
                b_SelectProduct: null,
                b_delete: null,

                multiUpdate: []
            }
        },
        mounted(){
            this.getInventory()
            this.getProviders()
        },
        methods:{
            
            enterProvider(){
                if (this.provider.id == 0) {
                    this.addProvider()
                }else{
                    this.updateProvider()
                }
            },
            updateProvider(){
                axios.put(`update_provider/${this.provider.id}`, this.provider).then(res=>{   
                    this.getProviders()
                    //this.emptyForm()
                    this.resetDatatables()
                    this.emptyProvider(false)

                    this.$notify({
                        group: 'warning',
                        type: 'error',
                        title: 'Exito!',
                        text: 'Se Modifico el Proveedor/Marca'
                    })

                }).catch(error => {
                    console.log(error.response)
                    if(error.response.status == 403){
                        alert("Usted no tiene los permisos suficientes para efectuar esta accion")
                    }
                })
            },  
            emptyProvider(b_class){
                this.provider = Object.assign({id:0, name:''})
                if (b_class) {
                    $('#inputProvider').siblings('label').removeClass('active');
                }
            },
            onChangeSelectProvider(e){
                $('#inputProvider').siblings('label').addClass('active')
                //e.target.value
                if (this.provider.id > 0) {
                    const p = this.providers.find( element => element.id === parseFloat(e.target.value))

                    this.provider = Object.assign({}, p);
                }else{
                    this.emptyProvider(true)
                }
            },
            modalDelete(b){        
                var uri = ``
                
                if(b == 'product'){
                    uri = `delete_productos/${this.product.id}`  
                }else{
                    uri = `delete_provider/${this.provider.id}`  
                }

                axios.delete(uri).then(res=>{
                    this.getProviders()
                    this.emptyForm()
                    this.resetDatatables()
                }).catch(error => {
                    if(error.response.status == 403){
                        alert("Usted no tiene los permisos suficientes para efectuar esta accion")
                    }
                })
            },
            addProvider(){
                axios.post('add_provider', {name:this.provider.name}).then(res=>{
                    this.providers.push({id:res.data.data.id, name:res.data.data.name})
                    this.emptyProvider(false)
                    this.$notify({
                        group: 'warning',
                        type: 'error',
                        title: 'Exito!',
                        text: 'Se Agrego el Proveedor/Marca'
                    })
                }).catch(error => {
                    if(error.response.status == 422){
                        this.$notify({
                            group: 'warning',
                            type: 'error',
                            title: 'Error!',
                            text: 'El Proveedor/Marca '+this.provider.name+' ya existe'
                        })
                    }else if(error.response.status == 403){
                        alert("Usted no tiene los permisos suficientes para efectuar esta accion")
                    }
                    console.log(error.response)
                })
            },
            submitProduct(){
                this.b_LoadingSubmit = true
                if(this.multiUpdate.length > 0){
                    
                    axios.post('multi_update', {'ids':this.multiUpdate, 'unit_price': this.product.unit_price}).then(res=>{
                        this.resetDatatables()
                        this.emptyForm()

                        this.b_LoadingSubmit = false
                        this.multiUpdate = []
                    }).catch(error => {
                        console.log(error.response)
                        this.b_LoadingSubmit = false

                        if(error.response.status == 403){
                            alert("Usted no tiene los permisos suficientes para efectuar esta accion")
                        }
                        
                    })
                }else{

                    this.product.provider_id = this.provider.id 
                    if (this.b_edit) {
                        axios.put(`productos/${this.product.id}`, this.product).then(res=>{   
                            this.b_LoadingSubmit = false
                            this.emptyForm()
                            this.resetDatatables()
                        }).catch(error => {
                            console.log(error.response)
                            this.b_LoadingSubmit = false
                            if(error.response.status == 403){
                                alert("Usted no tiene los permisos suficientes para efectuar esta accion")
                            }
                        })
                    }else{
                        axios.post('productos', this.product).then(res=>{
                            this.resetDatatables()
                            this.emptyForm()
                            console.log(res.data)
                            this.b_LoadingSubmit = false
                        }).catch(error => {
                            console.log(error.response)
                            this.b_LoadingSubmit = false
                            if(error.response.status == 403){
                                alert("Usted no tiene los permisos suficientes para efectuar esta accion")
                            }
                        })
                    }
                }
            },
            resetDatatables()
            {
                $('#_tInventory').dataTable().fnDestroy()
                this.getInventory()
                this.$refs.inputName.focus()
            },
            getProviders(){
                axios.post('get_providers').then(res=>{
                    if(res.data.statusCode == 200){
                        this.providers = res.data.data
                        this.b_loadingTable = false
                    }else{
                        console.log('error in methods getProviders(): return error in controller')
                        this.err_msg_tableProducts= 'Error al cargar la tabla de Proveedores'
                    }
                }).catch(error => {
                    console.log("error getInventory()")

                    if(error.response.status == 403){
                        alert("Usted no tiene los permisos suficientes para efectuar esta accion")
                    }
                });
            },
            getInventory(){
                axios.post('get_inventory').then(res=>{
                    if(res.data.statusCode == 200){
                        this.products = res.data.data
                        this.initDataTables()
                        this.b_loadingTable = false
                    }else{
                        console.log('error in methods getPersons(): return error in controller')
                        this.err_msg_tableProducts= 'Error al cargar la tabla de Productos'
                    }
                }).catch(error => {
                    console.log("error getInventory()")
                    console.log(error.response)

                    if(error.response.status == 403){
                        alert("Usted no tiene los permisos suficientes para efectuar esta accion")
                    }
                });
            },
            initDataTables()
            {
                $(document).ready( function () {
                    var dataTableInventory = $('#_tInventory').DataTable({       
                        "pageLength": 5,  
                        "paging": true,
                        "bInfo": false,
                        "order": [[ 0, "desc" ]],
                        dom: 'Bfrtip',
                        buttons: [
                            {
                                extend: 'pdfHtml5',
                                orientation: 'landscape',
                                pageSize: 'LEGAL'
                            }
                        ],
                        //"lengthChange": false,   
                        "columnDefs": [
                            {
                                "targets": [0],
                                "visible": false,
                            },
                            {
                                "targets": [0,5],
                                "orderable": false,
                            },
                            {
                                "targets": [1,4,5,6],
                                "searchable": false,
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
                        }
                    });

                    $('#inputSearch').on('keyup', function(e){
                        dataTableInventory.search(this.value).draw();
                    })
                })
            },
            printSelected(index){
                this.b_SelectProduct = index
                this.product = Object.assign({}, this.products[index])

                if (this.product.provider == null) {
                    this.emptyProvider(true)
                }else{
                    this.provider = Object.assign({}, this.product.provider)
                    $('#inputProvider').siblings('label').addClass('active');
                }

                /*if (this.product.provider == null) {
                    this.emptyProvider(true)
                }*///pendiente borrar

                $('#inputName').siblings('label').addClass('active');
                $('#inputBarCode').siblings('label').addClass('active');
                $('#inputUnitPrice').siblings('label').addClass('active');
                $('#inputStock').siblings('label').addClass('active');
                $('#inputUnitPrice2').siblings('label').addClass('active');                
                $('#inputUnitPrice3').siblings('label').addClass('active');    
            },

            selectProduct(index)
            {
                console.log(index)
                if(this.b_SelectProduct == index)
                {
                    this.b_SelectProduct = null
                    this.emptyForm()
                    return
                }

                this.printSelected(index)
            
            },
            emptyForm()
            {
                this.b_SelectProduct = null
                this.product = Object.assign({provider_id:0})
                this.emptyProvider(true)

                $('#inputName').siblings('label').removeClass('active');
                $('#inputBarCode').siblings('label').removeClass('active');
                $('#inputUnitPrice').siblings('label').removeClass('active');
                $('#inputStock').siblings('label').removeClass('active');
                $('#inputUnitPrice2').siblings('label').removeClass('active');
                $('#inputUnitPrice3').siblings('label').removeClass('active');   
            },
        }
    }
</script>
