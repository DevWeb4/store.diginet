<template>
    <div class="card">
        <div class="card-header grey lighten-1 font-weight-bold text-center">
            AUDITORIA
        </div>
        <div class="card-body pt-4">
            <div v-if="b_loadingTable">
                <p class="pt-4 text-center" v-if="err_msg_tableAudits==''" >
                    <span class="spinner-border fast spinner-border-sm"></span>
                    Cargando tabla...</p> 
                <p v-else >{{err_msg_tableAudits}}</p> 
            </div>
            <div v-else>
                <table class="table table-striped table-responsive-md" id="_tAudits">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Usuario</th>
                            <th scope="col">Evento</th>
                            <th scope="col">Modelo</th>
                            <th scope="col">ID</th>
                            <!--<th scope="col">Valor Anterior</th>
                            <th scope="col">Valor Nuevo</th>-->
                            <th scope="col">URL</th>
                            <th scope="col">Última Modificación</th>
                            <th scope="col">Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr
                            v-for="(audit, i)  in audits" 
                            :key="i" 
                        >
                            <td>{{i+1}}</td>
                            <td>{{audit.user.name}}</td>
                            <td>{{events(audit.event)}}</td>
                            <td>{{models(audit.auditable_type)}}</td>
                            <td>{{audit.auditable_id}}</td>
                            <!--<td>{{audit.old_values}}</td>
                            <td>{{audit.new_values}}</td>-->
                            <td>{{audit.url}}</td>
                            <td>{{new Date(audit.updated_at) | dateFormat('DD/MM/YYYY HH:m')}}</td>
                            <td>
                                <button type="button" class="px-1 btn btn-md btn-block orange accent-4 text-white" 
                                    data-toggle="modal" data-target="#fullHeightModalRight"
                                    @click="selectAudit(i)"
                                >DETALLE</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="card-footer text-right text_footer">
            Total de auditorias: {{audits.length}}
        </div>
        
        <div class="modal fade right" id="fullHeightModalRight" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-full-height modal-right" role="document">
                <div class="modal-content">
                    <div class="modal-header orange accent-4 text-white">
                        <h4 class="modal-title w-100" id="myModalLabel">{{models(audit.auditable_type)}} - {{events(audit.event)}}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead>
                                <tr class="grey lighten-3">
                                    <th scope="col" class="table_head">Campo</th>
                                    <th scope="col" class="table_head">Valor Anterior</th>
                                    <th scope="col" class="table_head">Valor Nuevo</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(date, i) in detail" :key="i">
                                    <td>{{i}}</td>
                                    <td>{{detailOld[i]}}</td>
                                    <td>{{detailNew[i]}}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-outline-elegant" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import 'datatables.net-bs4'
    export default {
        data(){
            return{
                detail:[],
                detailNew:[],
                detailOld:[],
                audits:[],
                audit:{},
                b_loadingTable: true,
                err_msg_tableAudits: '',
            }
        },
        mounted() {
            this.getAudits()
        },
        methods:{
            getAudits(){
                axios.get('get_audits').then(res =>{
                    res.data.data.forEach((element, index) => {
                        let uri = element.url.split('/')[3]
                        if(uri != 'logout'){
                            this.audits.push(element)
                        }
                    });
                    this.initDataTables()
                    this.b_loadingTable = false
                }).catch(error => {
                    console.log('error in methods getAudits(): return error in controller')
                    this.err_msg_tablePersons= 'Error al cargar la tabla de Audits'
                });
            },
            initDataTables()
            {
                $(document).ready( function () {
                    $('#_tAudits').dataTable({            
                        language: {
                            url: 'http://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json'
                        },
                    })
                })
            },
            events(e){
                switch (e) {
                    case 'updated': return 'Actualizado'; break;
                    case 'deleted': return 'Borrado'; break;
                    case 'created': return 'Creado'; break;
                }
            },
            models(e){
                switch (e) {
                    case 'App\\User': return 'Usuario'; break;
                    case 'App\\Cash': return 'Caja'; break;
                    case 'App\\Movement': return 'Movimientos'; break;
                    case 'App\\Note': return 'Notas'; break;
                    case 'App\\Person': return 'Personas'; break;
                    case 'App\\Product': return 'Productos'; break;
                    case 'App\\Store': return 'Local'; break;
                }
            },
            selectAudit(index){
                this.audit = Object.assign({}, this.audits[index]);
                this.detailNew = Object(this.audit.new_values)
                this.detailOld = Object(this.audit.old_values)
                if(Object(this.audit.new_values).length == 0){
                    this.detail = this.detailOld
                }else{
                    this.detail = this.detailNew
                }       
            },
        }
    }
</script>
