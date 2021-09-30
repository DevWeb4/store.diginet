const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix
    .js('resources/js/appUsers.js', 'public/js')
    /*.js('resources/js/appProducts.js', 'public/js')
    .js('resources/js/appPersons.js', 'public/js')
    .js('resources/js/appFinancials.js', 'public/js')
    //.js('resources/js/appCashs.js', 'public/js')
    .js('resources/js/appSales.js', 'public/js')
    .sass('resources/sass/app.scss', 'public/css')*/;
