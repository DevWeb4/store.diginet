require('./bootstrap');
window.Vue = require('vue');
Vue.prototype.$ = $;

import VueFilterDateFormat from 'vue-filter-date-format';
Vue.use(VueFilterDateFormat);

import Notifications from 'vue-notification';
Vue.use(Notifications)


Vue.component('products-component', require('./components/Products.vue').default);
Vue.component('inventory-component', require('./components/Inventory.vue').default);

const app = new Vue({
    el: '#app',
});
