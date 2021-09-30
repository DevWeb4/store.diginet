require('./bootstrap');
window.Vue = require('vue');

import VueFilterDateFormat from 'vue-filter-date-format';
Vue.use(VueFilterDateFormat);

Vue.component('users-component', require('./components/Users.vue').default);
Vue.component('audits-component', require('./components/Audits.vue').default);

const app = new Vue({
    el: '#app',
});
