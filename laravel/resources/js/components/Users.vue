<template>
    <div class="card-deck">
        <div class="card">
            <div class="card-header grey lighten-1 font-weight-bold text-center">
                <span v-if="b_SelectUser === null"> NUEVO USUARIO</span>
                <span v-else>EDITAR USUARIO</span>
            </div>
            <div class="mr-3 mt-2">
                <button class="float-right btn btn-danger btn-sm" 
                    :disabled="b_SelectUser === null" 
                    v-on:click="cleanForm()"
                >
                    Cancelar 
                    <i class="fas fa-backspace ml-1"></i>
                </button>
            </div>
            <div class="card-body pt-4">
                <form @submit.prevent="submitUser" class="mt-4">
                    <div class="md-form md-outline input-with-post-icon">
                        <i class="fas fa-user input-prefix"></i>
                        <input v-model="user.name" id="inputName" type="text" class="form-control mb-4">
                        <label for="">Nombre</label>
                    </div>

                    <div class="md-form md-outline input-with-post-icon">
                        <i class="fas fa-envelope  input-prefix"></i>
                        <input v-model="user.email" id="inputEmail" type="email" class="form-control mb-4">
                        <label for="">E-mail</label>
                    </div>

                    <div class="md-form md-outline input-with-post-icon">
                        <i class="fas fa-unlock-alt input-prefix"></i>
                        <input v-model="user.password" id="inputPassword" type="text" class="form-control mb-4">
                        <label for="">Contraseña</label>
                    </div>

                    <select v-model="user.roles[0].id" class="custom-select md-form md-outline">
                        <option :value="0"  disabled>Selecciones Rol</option>
                        <option
                            v-for="(role, i)  in roles" 
                            :key="i" 
                            :value="role.id" 
                        >
                            {{role.name}}
                        </option>
                    </select>

                    <button v-if="b_SelectUser === null" class="btn btn-info btn-block" type="submit">
                        <div v-if="b_LoadingSubmit">
                            <span class="spinner-border fast spinner-border-sm"></span> 
                            <b>Guardando</b>
                        </div>
                        <div v-else ><b>Guardar</b></div>
                    </button>
                    <button v-else class="btn btn-info btn-md btn-block" type="submit">
                        <div v-if="b_LoadingSubmit">
                            <span class="spinner-border fast spinner-border-sm"></span> <b>Actualizando</b>
                        </div>
                        <div v-else ><b>Actualizar</b></div>
                    </button>
                </form>
            </div>
            <div class="card-footer text-muted">
                <span v-if="b_SelectUser !== null" class="text_footer">
                    Ultima vez actualizado en {{ new Date(user.updated_at) | dateFormat('DD/MM/YYYY hh:mm') }}
                </span><span v-else class="p-3"></span>
            </div>
        </div>

        <div class="card">
            <div class="card-header grey lighten-1 font-weight-bold text-center">
                LISTA DE USUARIOS
            </div>
            <div>
                <button class="float-right btn btn-danger btn-sm" :disabled="b_SelectUser === null" data-toggle="modal" data-target="#modalConfirmDelete">
                    Eliminar
                    <i class="fas fa-user-times ml-1"></i>
                </button>
            </div>
            <div class="card-body">
                <div v-if="b_loadingTable">
                    <p class="pt-4 text-center" v-if="err_msg_tableUsers==''" >
                        <span class="spinner-border fast spinner-border-sm"></span>
                        Cargando tabla...</p> 
                    <p v-else >{{err_msg_tableUsers}}</p> 
                </div>
                <div v-else>
                    <table class="table table-striped table-responsive-md" id="_tUsers">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">E-mail</th>
                                <th scope="col">Rol</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr
                                v-for="(user, i)  in users" 
                                :key="i" 
                                :class="{'grey lighten-1 font-weight-bold': i === b_SelectUser }"
                                v-on:click="selectUser(i)"
                            >
                                <td>{{i+1}}</td>
                                <td>{{user.name}}</td>
                                <td>{{user.email}}</td>
                                <td><span class="badge orange accent-4 text-white w-100 text-uppercase py-2">{{user.roles[0].name}}</span></td>                               
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card-footer text-right text_footer">
                Total de usuarios: {{users.length}}
            </div>
        </div>
        
        <div class="modal fade" id="modalError" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-notify modal-danger" role="document">
                <div class="modal-content">
                    <!--Header-->
                    <div class="modal-header">
                        <p class="heading lead"><i class="fas fa-cog fa-spin white-text" aria-hidden="true"></i><i class=""></i> <b>Error al generar usuario</b></p>
                    </div>
                    <div class="modal-body">
                        <div class="text-justify">
                            <p id="errorMsg"></p> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade top" id="modalConfirmDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true" data-backdrop="true">
            <div class="modal-dialog modal-frame modal-top modal-notify modal-info" role="document">
                <!--Content-->
                <div class="modal-content">
                <!--Body-->
                    <div class="modal-body">
                        <div class="row d-flex justify-content-center align-items-center">

                        <p class="pt-3 pr-2">Confirma que realmente desea eliminar el usuario <b>{{user.email}}</b>?</p>

                        <a type="button"  v-on:click="deleteUser()"  class="btn btn-danger btn-sm" data-dismiss="modal">Si, Eliminar <i class="fas fa-check-double"></i></a>
                        <a type="button" class="btn btn-outline-danger btn-sm waves-effect" data-dismiss="modal">Mejor no</a>
                        </div>
                    </div>
                </div>
                <!--/.Content-->
            </div>
        </div>
    <!-- End Modals-->
    </div>
</template>

<script>
    import 'datatables.net-bs4'   

    export default {
        props: ['uri'],
        data(){
            return{
                users:[],
                user: {
                    name:'', 
                    email :'', 
                    password:'',
                    created_at: '',
                    roles:{0:{id:0}}
                },
                roles:[],

                //errors
                err_msg_tableUsers: '',
                //banners
                b_loadingTable: true,
                b_LoadingSubmit:false,
                b_SelectUser: null,
            }
        },
        mounted() {
            this.getUsers()
            axios.get('get_roles').then(res =>{
                this.roles = res.data
            })
        },
        methods: {
            submitUser()
            {
                if(this.user.name === '' || this.user.email ==='' || this.user.roles[0].id == 0 || (this.user.password === '' && this.b_SelectUser === null )){
                    $('#errorMsg').html('Debe completar todos los campos obligatorios para poder generar un usuario.')
                    $('#modalError').modal('toggle')
                    return
                }

                this.b_LoadingSubmit = true
                if(this.b_SelectUser === null)
                {
                    this.addUser()
                }else{
                    this.updateUser()
                }  
            },
            updateUser(){
                axios.put(this.uri+`/usuarios/${this.user.id}`, this.user).then(res=>{   
                    this.cleanForm()
                    this.b_LoadingSubmit = false
                    this.resetDatatables()
                }).catch(error => {
                    console.log(error.response)
                    this.error422()
                    this.b_LoadingSubmit = false
                })
            },
            addUser()
            {
                axios.post(this.uri+'/usuarios', this.user).then(res=>{
                    this.resetDatatables()
                    this.cleanForm()
                    this.b_LoadingSubmit = false
                }).catch(error => {
                    console.log(error.response)
                    this.error422()
                    this.b_LoadingSubmit = false
                });
                
            },
            getUsers(){
                axios.get('get_users').then(res =>{
                    if(res.data.statusCode == 200){
                        this.users = res.data.data
                        this.initDataTables()
                        this.b_loadingTable = false
                    }else{
                        console.log('error in methods getUsers: return error in controller')
                        this.err_msg_tableUsers= 'Error al cargar la tabla de usuarios'
                    }  
                })
            },
            initDataTables()
            {
                $(document).ready( function () {
                    $('#_tUsers').dataTable({       
                        "pageLength": 7,            
                        language: {
                            url: 'http://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json'
                        }
                    })
                })
            },
            selectUser(index)
            {
                if(this.b_SelectUser == index)
                {
                    this.b_SelectUser = null
                    this.cleanForm()
                    return
                }
                this.b_SelectUser = index
                this.user = Object.assign({}, this.users[index]);
                
                $('#inputEmail').siblings('label').addClass('active');
                $('#inputName').siblings('label').addClass('active');
                
            },
            deleteUser(){              
                axios.delete(this.uri+`/usuarios/${this.user.id}`).then(res=>{
                    this.resetDatatables()
                    this.cleanForm()
                })
            },
            cleanForm()
            {
                this.b_SelectUser = null
                this.user = Object.assign({}, {roles:{0:{id:0}}})     
                
                $('#inputEmail').siblings('label').removeClass('active');
                $('#inputName').siblings('label').removeClass('active');
                $('#inputPassword').siblings('label').removeClass('active');
            },
            resetDatatables()
            {
                $('#_tUsers').dataTable().fnDestroy()
                this.getUsers()
            },
            error422()
            {
                $('#errorMsg').html('<b>Codigo 422</b>: El Email que intenta usar ya se encuentra en registrado en el sistema.')
                $('#modalError').modal('toggle')
            },
            
        }
    }
</script>
