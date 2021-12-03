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
                                :disabled="b_selectRow === null" type="button" data-toggle="modal" data-target="#confirmDeleteModal">
                                <b>Eliminar Producto</b>
                                <i class="fas fa-trash-alt"></i>
                            </button>
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
                            <th>stock</th>
                        </tr>

                    </thead>
                    <tbody>
                        <tr v-for="(product, i)  in products" :key="i"
                            :class="{'red accent-1 font-weight-bold': i === b_selectRow }"
                            class="text-center"
                        >
                            <td v-on:click="selectRow(i)">
                                <a class="text-primary" target="_blank" v-bind:href="'https://www.bigdipper.com.ar/File/hojas-de-datos/'+ product.url" >{{product.url}}</a>
                            </td>
                            <td v-on:click="selectRow(i)">{{product.name}}</td>
                            <td v-on:click="selectRow(i)">{{product.partner}}</td>
                            <td v-on:click="selectRow(i)">{{product.gremio}}</td>
                            <td v-on:click="selectRow(i)">{{product.unit_price}}</td>
                            <td v-on:click="selectRow(i)">{{product.stock}}</td>
                        </tr>
                    </tbody>
                </table>
                <div class="col-12">
                    <div class="row">
                        <div class="col-6"></div>
                        <div class="col-6">
                            <button 
                                class="btn btn-outline-danger btn-md btn-block mt-3 text-white btn-sm" 
                                v-on:click="b_delete='product'"
                                type="button" data-toggle="modal" data-target="#confirmDeleteAllModal">
                                <b>Eliminar Inventario</b>
                                <i class="fas fa-trash-alt"></i>
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
                            <p class="pt-3 pr-2" >Confirma que realmente quiere eliminar el Producto <b>{{product.name}}</b>?</p>

                            <a type="button" class="btn btn-outline-danger btn-sm waves-effect" data-dismiss="modal">Mejor no</a>
                            <a type="button"  v-on:click="modalDelete(b_delete)"  class="btn red accent-4 btn-sm" data-dismiss="modal">Si, Eliminar <i class="fas fa-check-double"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Limpiar -->
        <div class="modal fade top" id="confirmDeleteAllModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true" data-backdrop="true">
            <div class="modal-dialog modal-frame modal-top modal-notify modal-info" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="row d-flex justify-content-center align-items-center">
                            <p class="pt-3 pr-2" >Confirma que realmente quiere eliminar el <b> inventario </b> por completo?</p>

                            <a type="button" class="btn btn-outline-danger btn-sm waves-effect" data-dismiss="modal">Mejor no</a>
                            <a type="button"  v-on:click="modalDeleteAll()"  class="btn red accent-4 btn-sm" data-dismiss="modal">Si, Eliminar <i class="fas fa-check-double"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <p>Select local CSV File:</p>
        <form enctype="multipart/form-data">
            <input type="file" @change="onFileChange">
        </form>
        <button v-on:click="this.importCSV" >Importar</button>

        
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

            }
        },
        mounted() {
            this.initDataTables()
        },
        methods:{

            /*getTotales(){
                axios.get('get_totales').then(res=>{

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
            },*/
            importCSV(){
                console.log(this.csv)
                axios.post('import_csv', this.csv).then(res=>{
                    //console.log(res.data.data)
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

            onFileChange: function(e) {
                const file = e.target.files[0];
                const reader = new FileReader();
                reader.onload = e => this.csvJSON( e.target.result);
                reader.readAsText(file);

            },

            csvJSON(csvDATA){

                const reg = /\;/g
                var csvSTR= csvDATA.replace(reg, ",");

                const csv=require('csvtojson')
                csv({
                    //noheader:true,
                    //output: "json",
                    flatKeys: true
                })
                .fromString(csvSTR)
                .then((obj)=>{ 
                    this.csv = obj;
                })

            },

            selectRow(index)
            {
                console.log(index)
                if(this.b_selectRow == index)
                {
                    this.b_selectRow = null
                    return
                }

                this.printSelectedRow(index)
            
            },

            printSelectedRow(index){
                this.b_selectRow = index
                this.product = Object.assign({}, this.products[index])
   
            },
            resetDatatables()
            {
                $('#_tInventory').dataTable().fnDestroy()
                this.getGroupInventory()
                this.$refs.inputName.focus()
            },

            
            modalDeleteAll(){        
                var uri = `delete_all_productos/`
                
                axios.delete(uri).then(res=>{
                    this.resetDatatables()
                }).catch(error => {
                    if(error.response.status == 403){
                        alert("Usted no tiene los permisos suficientes para efectuar esta accion")
                    }
                })
            },
            

            getGroupInventory(){

                console.log("pendiente getGroupInventory")
                /*axios.post('get_inventory').then(res=>{
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
                });*/
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
                            'csv', 'excel',
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
