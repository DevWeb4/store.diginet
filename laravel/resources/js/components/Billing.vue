<style>
.modal-lg {
    max-width: 80% !important;
}

.center {
    text-align: center;
}
.centerDiv{
    padding-left: 100px;   
}

.f11{
    font-size: 10px;
}

.alineado{
    padding-top: 10px;
}

.borderTotal{
    border: 1px solid; 
}
.borderTop{
    border-top: 1px solid; 
}
.borderBottom{
    border-bottom: 1px solid; 
}
.borderLeft{
    border-left: 1px solid;
}
.borderRight{
    border-right: 1px solid;
}
.tab1{
    padding-left: 50px;

}
.tab2{
    padding-left: 10px;
}
.divBorder{border-style: solid;}

.alignRight {
    text-align: right;
}
.font-weight-bold{
    font-weight: bold;
};
</style>
<template>
    <div>
        <div class="container mb-4 px-0">
            <div class="card-deck">
                <div class="card col-3 px-0">
                    <a :href="this.uri+'/'+origin" class="btn btn-sm red accent-4 white-text"><i class="mr-1 fas fa-arrow-left"></i> Volver a {{origin}}</a>
                </div>
                <div class="card col-9 px-0">
                    <div class="row">
                        <div class="col-6 v-aling-text-c text-left">
                            
                            <b class="ml-1" v-if="this.myBilling.client == null">
                                <button id="pruebaFocus" :disabled="this.myBilling.invoiced == 1" class="btn btn-sm btn-outline-danger btn-block" data-toggle="modal" data-target="#modalAddClient">
                                    Agregar Cliente
                                </button>
                            </b>
                        </div>

                        <div class="col-6 text-md-right">
                            <div class="row">
                                <div class="col-6">
                                    <button :disabled="b_billing == true && this.myBilling.invoiced == 0 " v-on:click="print()" class="btn btn-sm orange accent-4 white-text col-12"><i class="fa fa-print left"></i> Imprimir</button>
                                </div>
                                <div class="col-6">
                                    <a v-if="b_billing" v-on:click="b_billing = false" class="btn btn-sm red white-text accent-4 pull-right float-right col-12">Recibo</a>
                                    <a v-else v-on:click="b_billing = true" class="btn btn-sm red white-text accent-4 pull-right float-right col-12">Factura</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 pt-3" v-if="this.myBilling.client != null">
                <b> Cliente: {{this.myBilling.client.name}}, DNI:{{this.myBilling.client.identification}}</b>
            </div>
        </div>
        <div class="container card" style="min-height: 600px;">
            <section class="card-body row mb-r">
                <div class="col-md-12" id="printMe">
                    <!-- Factura -->
                    <div v-if="myBilling.invoiced == 0">
                        <div class="row" v-if="b_billing == true && this.myBilling.invoiced == 0">
                            <div class="col-6">
                                <div v-if="this.bill_types == 'A'">
                                    <div class="input-group mb-3">
                                        <input v-model="cuit.prefix" type="number" class="form-control text-left col-3" placeholder="Prefijo" aria-label="Username" aria-describedby="basic-addon1">
                                        <input v-model="cuit.dni" type="number" class="form-control text-center" placeholder="D.N.I." aria-label="Username" aria-describedby="basic-addon1">
                                        <input v-model="cuit.subfix" type="number" class="form-control text-right col-3" placeholder="Subfijo" aria-label="Username" aria-describedby="basic-addon1">
                                    </div>
                                    <label for="basic-url" class="col-12 text-center">C.U.I.T.</label>
                                </div>
                            </div>
                            <div class="col-3 text-center">
                                <select v-model="bill_types" class="custom-select-md form-control">
                                    <option value="A">Factura A</option>
                                    <option value="B">Factura B</option>
                                </select>
                            </div>
                            <div class="col-3">
                                <button 
                                    v-on:click="afipWS()" 
                                    class="btn btn-sm red accent-4 white-text col-12 mt-1"
                                    :disabled="bill_types == 'A' && (this.cuit.dni < 9000000 || this.cuit.prefix <= 9 || this.cuit.subfix <= 0) "
                                >
                                    <div v-if="b_LoadingAfip == true">
                                        <span class="spinner-border fast spinner-border-sm"></span> <b>Cargando</b>
                                    </div>
                                    <div v-else>
                                        Facturar
                                    </div>
                                </button>
                            </div>
                            
                        </div>
                    </div>
                    <div v-if="b_billing && myBilling.invoiced == 1">
                        <div class="pt-4 px-4">
                            <table class="border" width="100%">
                                <tr>
                                    <th colspan="4" class="center borderTotal alineado font-weight-bold"><h4>ORIGINAL</h4></th>
                                </tr>
                                <tr> 
                                    <th rowspan="2" class="center borderTotal" width="46%" ><h3 style="text-transform: uppercase">{{organization_.name}}</h3></th>
                                    <th colspan="2" class="center borderTotal" width="8%"><h2>{{myBilling.bill.type}}</h2></th>
                                    <th rowspan="2" class="center borderTotal" width="46%"><h3>FACTURA</h3></th>
                                </tr>
                                <tr>
                                    <th colspan="2" class="center borderTotal f11">COD. 01</th>
                                </tr>
                                <tr>
                                    <td colspan="2" class="borderLeft borderRight" width="50%"></td>
                                    <td colspan="2" class="borderLeft borderRight tab1 htmlPtoVta font-weight-bold" width="50%"><b>Punto de Venta: 00001 Comp. Nro. {{padLeadingZeros(myBilling.bill.comp_n, 9)}} </b></td>
                                </tr> 
                                <tr> 
                                    <td colspan="2" class="borderLeft borderRight tab2"><b class="font-weight-bold">Razon Social: </b> <b style="text-transform: uppercase">{{organization_.r_social}}</b></td>
                                    <td colspan="2" class="borderLeft borderRight tab1"><b class="font-weight-bold">Fecha de emision:{{ new Date(myBilling.bill.created_at) | dateFormat('DD/MM/YYYY') }}</b></td>
                                </tr>
                                <tr> 
                                    <td colspan="2" class="borderLeft borderRight tab2" id="htmlDomicilio"><b class="font-weight-bold">Domicilio Comercial: </b> <b style="text-transform: uppercase">{{myBilling.cash.store.address}}</b></td>
                                    <td colspan="2" class="borderLeft borderRight tab1"><b class="font-weight-bold">CUIT:</b>{{organization_.cuit}}</td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="borderLeft borderRight tab2"></td>
                                    <td colspan="2" class="borderLeft borderRight tab1"><b class="font-weight-bold">Ingresos Brutos:</b> {{organization_.cuit}} </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="borderLeft borderRight borderBottom tab2"><b class="font-weight-bold">Condicion frente al IVA: IVA Responsable Inscripto</b></td>
                                    <td colspan="2" class="borderLeft borderRight borderBottom tab1"><b class="font-weight-bold">Fecha de Inicio de Actividades: </b>{{organization_.init}}</td>
                                </tr>
                            </table>
                            <table width="100%" class="border mt-2">
                                <tr>
                                    <td class="borderLeft borderTop tab2 htmlCuitFacturaA"><b class="font-weight-bold">DNI:</b><span v-if="myBilling.client_id"> {{myBilling.client.identification}}</span></td>
                                    <td colspan="3" class="borderTop borderRight htmlNombreFacturaA"><b class="font-weight-bold">Apellido y Nombre / Razon Social:</b><span v-if="myBilling.client_id"> {{myBilling.client.name}}</span></td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="borderLeft tab2"><b class="font-weight-bold">Condicion frente al IVA:</b> Consumidor Final</td>
                                    <td colspan="2" class="borderRight htmlDomicilioFacturaA"><b class="font-weight-bold">Domicilio: </b> <span v-if="myBilling.client_id">{{myBilling.client.address}}</span></td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="borderBottom borderLeft borderRight tab2"><b class="font-weight-bold">Condicion de venta:</b> Contado</td>
                                </tr>
                            </table>
                            <div class="" style="min-height: 300px;">
                                <table width="100%" class="mt-2">
                                    <tr class="table-secondary">
                                        <th class="borderTotal font-weight-bold pl-1">
                                            Codigo
                                        </th>
                                        <th class="borderTotal font-weight-bold pl-1">
                                            Producto/Servicio
                                        </th>
                                        <th class="borderTotal font-weight-bold pl-1">
                                            Cantidad
                                        </th>
                                        <th class="borderTotal font-weight-bold pl-1">
                                            U. Medida
                                        </th>
                                        <th class="borderTotal font-weight-bold pl-1">
                                            Precio Unitario
                                        </th>
                                        <th class="borderTotal font-weight-bold pl-1">
                                            % Bonif
                                        </th>
                                        <th class="borderTotal font-weight-bold pl-1">
                                            Imp Bonif.
                                        </th>
                                        <th class="borderTotal font-weight-bold pl-1">
                                            Subtotal
                                        </th>
                                    </tr>
                                    <tr v-for="(item, i)  in items" :key="i" >
                                        <td></td>
                                        <td>{{item.name}}</td>
                                        <td class="text-right">1.00</td>
                                        <td class="text-right">Unidades</td>
                                        <td class="text-right">
                                            <b v-if="hiddenItems == false">{{parseFloat(item.price).toFixed(2)}}</b>
                                            <b v-else> 0.00 </b>
                                        </td>
                                        <td class="text-right">0.00</td>
                                        <td class="text-right">
                                            <b v-if="hiddenItems == false">{{parseFloat(item.discount).toFixed(2)}}</b>
                                            <b v-else> 0.00 </b>
                                        </td>
                                        <td class="text-right">
                                            <b v-if="hiddenItems == false">{{parseFloat((item.price)+item.discount).toFixed(2)}}</b>
                                            <b v-else> 0.00 </b>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <table width="100%" class="mt-2 borderTotal">
                                <tr>
                                    <th colspan="3" class="p-3"></th>
                                </tr>
                                <tr>
                                    <th width="50%"></th>
                                    <th class="text-right">
                                        Subtotal: $
                                    </th>
                                    <th class="text-right pr-2">
                                        <!-- {{parseFloat(purchase.total).toFixed(2)}} -->
                                        {{parseFloat(myBilling.bill.amount).toFixed(2)}}
                                    </th>
                                </tr>
                                <tr>
                                    <th width="50%"></th>
                                    <th class="text-right">
                                        Importe Otros Tributos %IVA: $
                                    </th>
                                    <th class="text-right pr-2">
                                        {{parseFloat(myBilling.bill.iva).toFixed(2)}}
                                    </th>
                                </tr>
                                <tr>
                                    <th width="50%"></th>
                                    <th class="text-right pb-2">
                                        Importe Total: $
                                    </th>
                                    <th class="text-right pr-2 pb-2">
                                        <!-- {{parseFloat(purchase.totalFinal).toFixed(2)}} -->
                                        {{parseFloat(myBilling.bill.amount).toFixed(2)}}
                                    </th>
                                </tr>
                            </table>
                            <table width="100%" class="mt-2 borderTotal">
                                <tr>
                                    <th class="text-center font-weight-bold">
                                        "{{myBilling.cash.store.name}}"
                                    </th>
                                </tr>
                            </table>
                            <div class="col-12 pt-2">
                                <div class="row">
                                    <div class="col-5">
                                        <img class="m-3" width="150" :src="this.uri+'/images/logos/afip.png'" >
                                    </div>
                                    <div class="col-2 text-center">
                                        <b class="pt-0">Pàg. 1/1</b>
                                    </div>
                                    <div class="col-5 p-0">
                                        <table width="100%" class="m-0">
                                            <tr>
                                                <td class="text-right pr-2 font-weight-bold" width="50%"><b>CAE Nº</b></td>
                                                <td class="text-left pl-2" width="50%">{{myBilling.bill.cae}}</td>
                                            </tr>
                                            <tr>
                                                <td class="text-right pr-2 font-weight-bold" width="50%"><b>Fecha de Vto. de CAE Nº</b></td>
                                                <td class="text-left pl-2" width="50%">{{myBilling.bill.cae_fch_vto}}</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>   
                        </div>
                    </div>
                    <!-- Recibo -->
                    <div v-else-if="b_billing == false">
                        <div class="row invoice-data">
                            <div class="col-8">
                                <p><strong class="h4">{{myBilling.cash.store.name}}</strong></p>
                                <p class="m-0"><strong>Direccion: </strong>{{myBilling.cash.store.address}}</p>
                                <p class="m-0"><strong>Fecha Compra: </strong> {{new Date(myBilling.updated_at) | dateFormat('dddd D MMMM, HH:mm')}} Hs</p>
                                <p class="m-0"><strong>Contacto: </strong>{{myBilling.cash.store.contact}}</p>
                            </div>
                            <div class="col-4 text-right">
                                <p class="m-0 h4-responsive"><strong><span class="red-text">Recibo N° {{myBilling.id}}</span></strong></p>
                                <img class="m-1" width="100" :src="this.uri+'/images/logos/'+myBilling.cash.store.id+'.png'" >
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
                                            <tr v-for="(item, i)  in items" :key="i" >
                                                <th class="grey lighten-3 text-center">{{i+1}}</th>
                                                <td>{{item.name}}</td>
                                                <td class="text-center">1</td>
                                                <td class="text-center">${{parseFloat(item.price).toFixed(2)}}</td>
                                                <td class="text-center">${{parseFloat(item.discount).toFixed(2)}}</td>
                                                <td class="text-center">${{parseFloat((item.price)+item.discount).toFixed(2)}}</td>
                                            </tr>
                                            <tr class="table-borderless">
                                                <td colspan="6"></td>
                                            </tr>
                                            <tr class="table-borderless">
                                                <th colspan="5" class="text-right">subTotal:</th>
                                                <th class="text-center">${{parseFloat(purchase.total).toFixed(2)}}</th>
                                            </tr>
                                            <tr class="table-borderless m-0">
                                                <th colspan="5" class="text-right">extraTotal:</th>
                                                <th class="text-center">${{parseFloat(purchase.totalDiscount).toFixed(2)}}</th>
                                            </tr>
                                            <tr>
                                                <th colspan="5" class="text-left"><b class="h5">TOTAL FINAL:</b></th>
                                                <th class="text-center grey lighten-3"><b class="h5">${{parseFloat(purchase.totalFinal).toFixed(2)}}</b></th>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </section>
            <div class="row">
                <div class="col-9">{{this.cancel_response}}</div>
                <div class="col-3">
                    <button 
                        v-if="this.myBilling.invoiced == 1"
                        v-on:click="cancel_bill()" 
                        class="btn btn-sm red accent-4 white-text col-12 mt-1"
                    >
                        <div v-if="b_LoadingAfip_cancel == true">
                            <span class="spinner-border fast spinner-border-sm"></span> <b>Cargando</b>
                        </div>
                        <div v-else>
                            Anular Factura
                        </div>
                    </button>
                </div>
            </div>
        </div>
        <div id="modalAddClient" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-6">
                                <label for="basic-url">DNI (*)</label>
                                <input v-on:keyup.13="enterModalAddClient()" class="form-control form-control-sm" ref="clientDNI" v-on:keyup="shearchClient()" type="number">
                            </div>
                            <div class="col-6">
                                <label for="basic-url">Apellido y Nombre (*)</label>
                                <input v-on:keyup.13="enterModalAddClient()" v-model="client.name" class="form-control form-control-sm" ref="" placeholder="" type="text">
                            </div>
                            <div class="col-12 mt-3 mb-3">
                                <label for="inputTitle">Direccion</label>
                                <textarea id="inputTitle" v-model="client.address" rows="1" class="md-textarea form-control"></textarea>
                            </div>
                            <div class="col-6">
                                <label for="basic-url">Telefono</label>
                                <input v-on:keyup.13="enterModalAddClient()" v-model="client.phone" class="form-control form-control-sm" ref="" placeholder="" type="text">
                            </div>
                            <div class="col-6">
                                <label for="basic-url">Correo Electronico</label>
                                <input v-on:keyup.13="enterModalAddClient()" v-model="client.email" class="form-control form-control-sm" ref="" placeholder="" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="col-4">
                            <a  v-on:click="saveClient()" class="btn btn-sm red accent-4 white-text btn-block"><i class="fa fa-print left"></i> Guardar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>       
</template>
<script>

    export default {
        props: ['array', 'origin', 'organization','uri'],
        data(){
            return{
                items :[],
                clients:[],
                client:{
                    name: '',
                    identification: '',
                    phone: '',
                    address: '',
                    email: ''
                },
                bill_types: 'B',

                b_LoadingAfip:false,
                b_LoadingAfip_cancel:false,
                myBilling:JSON.parse(this.array),
                purchase:{},
                organization_:JSON.parse(this.organization),
                b_billing: false ,
                hiddenItems: true,

                cuit: {
                    prefix: '',
                    dni: '',
                    subfix: ''
                },
                cancel_response: '',                
            }
        },
        mounted() {

            if(this.myBilling.client != null){
                this.cuit.dni = this.myBilling.client.identification
            }

            this.init()
            this.getCustomers()
        },
        methods:{
            cancel_bill(){
                var tipo_de_documento = 99 //Consumidor Final

                if(this.myBilling.client != null){
                    tipo_de_documento= 96 // dni
                }
                
                var request = {
                    tipo_de_nota: 8,
                    tipo_factura_asociada: 6,
                    numero_factura_asociada: this.myBilling.bill.comp_n,

                    numero_de_documento:this.myBilling.bill.identification,
                    tipo_de_documento : tipo_de_documento,

                    importe_gravado: this.myBilling.bill.amount,
                    importe_iva: this.myBilling.bill.iva,
                    type: this.myBilling.bill.type,
                    cae: this.myBilling.bill.cae,
                }

                if(this.myBilling.bill.type == 'A'){
                    request.tipo_de_nota = 3,
                    request.tipo_factura_asociada = 1,
                    request.tipo_de_documento = 80 //cuit
                }
                
                this.b_LoadingAfip_cancel= true
                axios.put(this.uri+`/cancel_bill/${this.myBilling.id}`, request).then(res=>{           
                    this.myBilling.invoiced = 0
                    //this.myBilling.bill = res.data.data
                    
                   this.b_LoadingAfip_cancel = false
                   console.log(res.data)
                   this.cancel_response = "Nota de Credito Creada: CAE:"+ res.data['CAE']
                    
                }).catch(error => {
                    console.log(error.response)
                    alert("Error al generar registro en el afip")
                    this.b_LoadingAfip_cancel = false
                });
            },

            padLeadingZeros(num, size) {
                var s = num+"";
                while (s.length < size) s = "0" + s;
                return s;
            },
            afipWS(){
                var identification = 0;
                var tipo_de_documento = 99 //Consumidor Final

                if(this.myBilling.client != null){
                    identification = this.myBilling.client.identification
                    tipo_de_documento= 96 // dni
                }

                var request = {
                    numero_de_documento:identification,
                    tipo_de_documento : tipo_de_documento,
                    tipo_de_factura : 6,
                    type : this.bill_types
                }

                if(this.bill_types == 'A'){
                    request.numero_de_documento = this.cuit.prefix+''+this.cuit.dni+''+this.cuit.subfix
                    request.tipo_de_documento = 80 //cuit
                    request.tipo_de_factura = 1
                }

                this.b_LoadingAfip = true

                axios.put(this.uri+`/afip_ws/${this.myBilling.id}`, request).then(res=>{   
                    //console.log(res.data.data)
                    this.myBilling.invoiced = 1
                    this.b_LoadingAfip = false

                    this.myBilling.bill = res.data.data
                    
                }).catch(error => {
                    console.log(error.response)
                    alert(error.response['data']['message'])
                    this.b_LoadingAfip = false
                });
            },

            enterModalAddClient(){
                this.saveClient()
            },
            saveClient(){ 
                axios.put(this.uri+`/save_client/${this.myBilling.id}`, this.client).then(res=>{   
                    this.client = res.data.data
                    this.cuit.dni = this.client.identification
                    $('#modalAddClient').modal('toggle')

                    this.myBilling.client=Object.assign({},this.client)

                    console.log(this.myBilling.client)

                }).catch(error => {
                    console.log("error getInventory")
                    console.log(error.response)
                    alert("Error al guardar cliente")
                });
            },
            print(){
                //$("#printMe").printThis();

                /*$('#printMe').printThis({
                    importCSS: true,
                    loadCSS: "css/app.css",
                });*/
                $('#printMe').printThis({
                    importCSS: true,            // import parent page css
                    importStyle: true, 
                });
            },
            shearchClient(){
                this.cleanClient()
                let inputDNI = this.$refs.clientDNI.value

                if(inputDNI.length == 7 || inputDNI.length == 8){
                    const c = this.clients.find( element => element.identification === parseFloat(inputDNI))
                    if(c == undefined){ 
                        this.client.identification = inputDNI
                        return 
                    }
                    this.client = Object.assign(c)
                    
                }
                //const rowSelect = this.inventory.find( product => product.id === id );
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

            init(){
                this.items = JSON.parse(this.myBilling.description)

                this.purchase.totalFinal = this.myBilling.cash_payment + this.myBilling.credit_payment + this.myBilling.personal_account_payment
                this.purchase.totalDiscount = this.myBilling.discount

                this.purchase.total = this.purchase.totalFinal -this.purchase.totalDiscount     
            },

            getCustomers(){
                axios.post(this.uri+'/get_persons', {'category': 1}).then(res=>{
                    if(res.data.statusCode == 200){
                        this.clients = res.data.data
                    }else{
                        console.log('error in methods getCustomers(): return error in controller')
                    }
                }).catch(error => {
                    console.log(error.response['data']['message'])
                });
            },
        }
    }
</script>