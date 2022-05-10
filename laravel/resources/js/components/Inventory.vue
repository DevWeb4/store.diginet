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
                        <div class="col-6">
                            <a 
                                class="btn btn-outline-danger btn-md mt-3 text-white btn-sm" 
                                type="button" href="productos" >
                                <b>Ir a productos</b>
                            </a>
                        </div>
                        <div class="col-6">

                        </div>
                    
                    </div>
                </div>
                <table id="_tInventory" class="table">
                    <thead>
                        <tr>
                            <th>enlace</th>
                            <th>descripcion</th>
                            <th>partner</th>
                            <th>gremio</th>
                            <th>pmp</th>
                            <th>iva%</th>
                            <th>stock</th>
                        </tr>

                    </thead>
                    <tbody>
                        <tr v-for="(product, i)  in products" :key="i"
                            :class="{'red accent-1 font-weight-bold': i === b_selectRow }"
                            class="text-center"
                        >
                            <td v-on:click="selectRow(i)">
                                <a class="text-primary" target="_blank" v-bind:href="'https://www.bigdipper.com.ar/File/hojas-de-datos/'+ product.bar_code +'.pdf'" >
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-link-45deg" viewBox="0 0 16 16">
                                        <path d="M4.715 6.542 3.343 7.914a3 3 0 1 0 4.243 4.243l1.828-1.829A3 3 0 0 0 8.586 5.5L8 6.086a1.002 1.002 0 0 0-.154.199 2 2 0 0 1 .861 3.337L6.88 11.45a2 2 0 1 1-2.83-2.83l.793-.792a4.018 4.018 0 0 1-.128-1.287z"/>
                                        <path d="M6.586 4.672A3 3 0 0 0 7.414 9.5l.775-.776a2 2 0 0 1-.896-3.346L9.12 3.55a2 2 0 1 1 2.83 2.83l-.793.792c.112.42.155.855.128 1.287l1.372-1.372a3 3 0 1 0-4.243-4.243L6.586 4.672z"/>
                                    </svg>                
                                </a>
                            </td>
                            <td v-on:click="selectRow(i)">{{product.name}}</td>
                            <td v-on:click="selectRow(i)">{{product.partner}}</td>
                            <td v-on:click="selectRow(i)">{{product.gremio}}</td>
                            <td v-on:click="selectRow(i)">{{product.unit_price}}</td>
                            <td v-on:click="selectRow(i)">{{product.iva}}</td>
                            <td v-on:click="selectRow(i)" >
                                <span v-if="product.stock < 6 && product.stock > 1" class="text-danger">
                                    {{product.stock}}
                                </span>
                                <span v-else >
                                    {{product.stock}}
                                </span>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="row">
                    <div class="col-12">
                        <div class="border">
                            <form @submit.prevent="submitProduct" class="col-12">
                                <div class="row pt-3">
                                    <div class="col-6">
                                        <div class="row">
                                            <div class="col-12">                                
                                                <div class="md-form md-outline input-with-post-icon mb-0 pb-0">
                                                    <i class="fas fa-signature input-prefix"></i>
                                                    <input ref="inputName" required v-model="product.name" id="inputName" type="text" class="form-control">
                                                    <label for="inputName">Nombre</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="row">
                                            <div class="col-6">
                                                <div class="md-form md-outline input-with-post-icon mt-0">
                                                    <i class="fas fa-dollar-sign input-prefix"></i>
                                                    <input required v-model="publicPrice" id="inputUnitPrice" step="0.01" type="number" class="form-control">
                                                    <label for="inputUnitPrice">Publico</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="row">
                                            <div class="col-6">
                                                <div class="md-form md-outline input-with-post-icon mt-0">
                                                    <i class="fas fa-dollar-sign input-prefix"></i>
                                                    <input required v-model="product.gremio" id="inputGremio" step="0.01" type="number" class="form-control">
                                                    <label for="inputGremio">Gremio</label>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="md-form md-outline input-with-post-icon mt-0">
                                                    <input v-model="product.v_added" id="inputVAdded" step="0.01" type="number" class="form-control" v-on:keyup="calculateUnitPrice($event)">
                                                    <label for="inputVAdded">Valor Agregado %</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <div class="row">
                                            <div class="col-6">
                                                <div class="md-form md-outline input-with-post-icon mt-0">
                                                    <i class="fas fa-dollar-sign input-prefix"></i>
                                                    <input required v-model="product.partner" id="inputPartner" step="0.01" type="number" class="form-control">
                                                    <label for="inputPartner">Partner</label>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div>
                                                    <input type="radio" id="iva_21" v-model="product.iva" value="21">
                                                    <label for="huey">%21</label>
                                            
                                                    <input type="radio" id="iva_10.5" v-model="product.iva" value="10.5">
                                                    <label for="dewey">%10.5</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-12">
                                        <div class="row">
                                            <div class="col-12">
                                                <button class="btn red accent-4 btn-md btn-block mb-3 text-white btn-sm" type="submit">
                                                    <div v-if="b_LoadingSubmit">
                                                        <span class="spinner-border fast spinner-border-sm"></span> 
                                                        <b>Guardando</b>
                                                    </div>
                                                    <div v-else >
                                                        <b v-if="b_selectRow == null">Guardar</b>                                            
                                                        <b v-else >Editar</b>                                            
                                                    </div>
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </form>                    
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
                            <p class="pt-3 pr-2" >Confirma que realmente quiere eliminar el Producto <b>{{product.name}}</b>?</p>

                            <a type="button" class="btn btn-outline-danger btn-sm waves-effect" data-dismiss="modal">Mejor no</a>
                            <a type="button"  v-on:click="confirmDelete(b_delete)"  class="btn red accent-4 btn-sm" data-dismiss="modal">Si, Eliminar <i class="fas fa-check-double"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <notifications group="warning" position="top left"/>

        <div class="col-12">
            <div class="row">
                <div class="col-6">
                    <p>Seleccione Archivo Local CSV:</p>
                    <form enctype="multipart/form-data">
                        <input type="file" @change="onFileChange">
                    </form>
                    <button v-on:click="this.importCSV"> Importar </button>
                </div>
                <div class="col-6" v-if="this.myRol.id == 2" >
                    <table class="col-12">
                        <tr>
                            <td class="text-right">Total Partner:</td>
                            <td class="text-right border-bottom">${{calculateValInStock('partner')}}</td>
                        </tr>
                        <tr>
                            <td class="text-right">Total Gremio:</td>
                            <td class="text-right border-bottom">${{calculateValInStock('gremio')}}</td>
                        </tr>
                        <tr>
                            <td class="text-right">Total PMP:</td>
                            <td class="text-right border-bottom">${{calculateValInStock('unit_price')}}</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        props: ['inventory'],
        data(){
            return{
                products:JSON.parse(this.inventory),
                product:{},

                b_selectRow: null,

                csv : [],
                myRol:{id:0, name:''},

                prueba: false,
                publicPrice: 0,

                b_LoadingSubmit:false,

            }
        },
        mounted() {
            this.initDataTables()
            this.getRol()
        },
        methods:{

            submitProduct(){
                console.log(this.product)

                axios.put(`inventario/${this.product.id}`, this.product).then(res=>{   
                    this.b_LoadingSubmit = false
                    this.emptyForm()
                    this.resetDatatables()

                    console.log(res.data)

                }).catch(error => {
                    console.log(error.response)
                    this.b_LoadingSubmit = false
                })
            },

            emptyForm()
            {
                this.b_selectRow = null
                this.product = Object.assign({provider_id:0})
                this.publicPrice = 0

                $('#inputName').siblings('label').removeClass('active');
                $('#inputGremio').siblings('label').removeClass('active');
                $('#inputPartner').siblings('label').removeClass('active');
                $('#inputVAdded').siblings('label').addClass('active');                    
                $('#inputIVA').siblings('label').addClass('active');                    
            },

            calculateUnitPrice(e){
                let publicValue = Number(this.product.gremio) + Number((this.product.gremio / 100 * e.target.value))

                this.publicPrice = this.product.unit_price = publicValue;
                console.log(this.product.unit_price)
            },

            calculateValInStock(type){
                var val = 0
                this.products.forEach(product => {
                    val += product[type] * product.stock;
                });

                return val;
            },

            importCSV(){
                axios.post('import_csv', this.csv).then(res=>{
                    if(res.data.statusCode == 200){
                        this.$notify({
                            group: 'warning',
                            type: 'error',
                            title: 'Exito!',
                            text: 'Importacion completada'
                        })
                        this.resetDatatables()
                    }

                }).catch(error => {
                    console.log(error.response)
                })
            },

            onFileChange: function(e) {
                const file = e.target.files[0];
                const reader = new FileReader();
                reader.onload = e => this.csvJSON( e.target.result);
                reader.readAsText(file);
            },

            csvJSON(csvDATA){
                //csvDATA = csvDATA.replace(",", ".")

                csvDATA = csvDATA.replace(/,/g, ".")

                const reg = /\;/g
                var csvSTR= csvDATA.replace(reg, ",");

                //console.log(csvSTR)

                const csv=require('csvtojson')
                csv({
                    //noheader:true,
                    output: "json",
                    flatKeys: true
                })
                .fromString(csvSTR)
                .then((obj)=>{ 
                    this.csv = obj;
                })
            },

            selectRow(index)
            {

                
                if(this.b_selectRow == index)
                {
                    this.emptyForm()
                    this.b_selectRow = null
                    return
                }

                this.printSelectedRow(index)
            },

            printSelectedRow(index){
                this.b_selectRow = index
                this.product = Object.assign({}, this.products[index])

                $('#inputName').siblings('label').addClass('active');
                $('#inputUnitPrice').siblings('label').addClass('active');
                $('#inputGremio').siblings('label').addClass('active');                
                $('#inputPartner').siblings('label').addClass('active');    
                $('#inputVAdded').siblings('label').addClass('active');                    
                $('#inputIVA').siblings('label').addClass('active');  
            },

            resetDatatables()
            {
                $('#_tInventory').dataTable().fnDestroy()
                this.getInventoryGrouped()
            },

            getRol(){
                axios.get('get_rol').then(res=>{
                    this.myRol = res.data.data
                }).catch(error => {
                    console.log("error getRol")
                    console.log(error)
                });
            },
            
            confirmDelete(){        
                axios.delete(`delete_inventory_grouped/${this.product['bar_code']}`).then(res=>{
                    console.log(res.data.data)

                    if(res.data.statusCode == 200){
                        this.$notify({
                            group: 'warning',
                            type: 'error',
                            title: 'Exito!',
                            text: 'Eliminado Correctamente'
                        })
                    }

                    this.resetDatatables()

                }).catch(error => {
                    console.log(error)
                })
            },

            getInventoryGrouped(){
                axios.get('get_inventory_grouped').then(res=>{
                    if(res.data.statusCode == 200){
                        this.products = res.data.data
                        this.initDataTables()
                        //this.b_loadingTable = false
                    }else{
                        console.log('error in methods getPersons(): return error in controller')
                        this.err_msg_tableProducts= 'Error al cargar la tabla de Productos'
                    }
                }).catch(error => {
                    console.log("error getInventoryGrouped()")
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

                        //"lengthChange": false,   

                        buttons: [
                            //'csv', 'excel',
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
        }
    }
</script>
