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


                    </thead>
                    <tbody>
                        <tr v-for="(product, i)  in products" :key="i"
                            :class="{'red accent-1 font-weight-bold': i === b_SelectProduct }"
                            class="text-center"
                        >
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</template>

<script>
    import 'datatables.net-bs4'
    export default {
        data(){
            return{
                products:[],

                b_SelectProduct: null,

            }
        },
        mounted() {
            
        },
        methods:{
            
        }
    }
</script>
