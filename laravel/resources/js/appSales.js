require('./bootstrap');
window.Vue = require('vue');
Vue.prototype.$ = $;

import VueFilterDateFormat from 'vue-filter-date-format';
Vue.use(VueFilterDateFormat, {
    dayOfWeekNames: [
      'Domingo', 'Lunes', 'Martes', 'Miercoles', 
      'Jueves', 'Viernes', 'Sabado'
    ],
    monthNames: [
      'de Enero', 'de Febrero', 'de Marzo', 'de Abril', 'de Mayo', 'de Junio',
      'de Julio', 'de Agosto', 'de Septiembre', 'de Octubre', 'de Noviembre', 'de Diciembre'
    ],

    dayOfWeekNamesShort: [
        'Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'
    ],
    monthNamesShort: [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ],

    timezone: 0
});

import Chartkick from 'vue-chartkick'
import Chart from 'chart.js'

Vue.use(Chartkick.use(Chart))

Chartkick.options = {
  colors: ["#bdbdbd", "#616161", "#263238"]
}

import VModal from 'vue-js-modal'
Vue.use(VModal)

import Notifications from 'vue-notification'
Vue.use(Notifications)
import VueHtmlToPaper from 'vue-html-to-paper'
const optPrint = {
    name: '_blank',
    specs: [
        'fullscreen=yes',
        'titlebar=no',
        'scrollbars=yes'
    ],
    styles: [
        '/css/app.css',
        '/css/style.css',
        //'https://unpkg.com/kidlat-css/css/kidlat.css'
    ]
}
Vue.use(VueHtmlToPaper, optPrint);  

const moment = require('moment')
require('moment/locale/es')
Vue.use(require('vue-moment'), {moment})

var VueTruncate = require('vue-truncate-filter')
Vue.use(VueTruncate)

Vue.component('sales-component', require('./components/Sales.vue').default);
Vue.component('sale-component', require('./components/Sale.vue').default);

Vue.component('cashs-component', require('./components/Cashs.vue').default);

Vue.component('billing-component', require('./components/Billing.vue').default);

const app = new Vue({
    el: '#app',
});
