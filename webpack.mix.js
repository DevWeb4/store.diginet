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
    .js('laravel/resources/js/appUsers.js', 'js')
    .js('laravel/resources/js/appProducts.js', 'js')
    .js('laravel/resources/js/appPersons.js', 'js')
    .js('laravel/resources/js/appFinancials.js', 'js')
    .js('laravel/resources/js/appSales.js', 'js')
    .sass('laravel/resources/sass/app.scss', 'css');
