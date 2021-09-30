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
                    placeholder="Codigo, Nombre del producto o use el lector de Barras"
                >
            </div>
        </div>
        
    </div>
</template>

<script>
    export default {
        data(){
            return{

            }
        },
        mounted() {
            
        },
    }
</script>
