require('./bootstrap');
window.Vue = require('vue');

import VueFilterDateFormat from 'vue-filter-date-format';
Vue.use(VueFilterDateFormat);

Vue.component('financials-component', require('./components/Financials.vue').default);

const app = new Vue({
    el: '#app',
});
