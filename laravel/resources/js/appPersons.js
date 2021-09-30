require('./bootstrap');
window.Vue = require('vue');

const moment = require('moment')
require('moment/locale/es')
Vue.use(require('vue-moment'), {moment})

import VModal from 'vue-js-modal'
Vue.use(VModal)

import VueFilterDateFormat from 'vue-filter-date-format';
Vue.use(VueFilterDateFormat);

Vue.component('provider-component', require('./components/Provider.vue').default);
Vue.component('customers-component', require('./components/Customers.vue').default);

const app = new Vue({
    el: '#app',
});
