window._ = require('lodash');
//import Popper from 'popper.js/dist/umd/popper.js';


try {
    window.Popper = require('popper.js').default;
    window.$ = window.jQuery = require('jquery');

    require( 'datatables.net-bs4' )
    require('bootstrap');
} catch (e) {}


window.axios = require('axios');
window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

