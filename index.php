<?php

use Illuminate\Contracts\Http\Kernel;
use Illuminate\Http\Request;

define('LARAVEL_START', microtime(true));
define('LARAVEL_BASE_DIR', __DIR__ . '/laravel');

require LARAVEL_BASE_DIR.'/vendor/autoload.php';

$app = require_once LARAVEL_BASE_DIR.'/bootstrap/app.php';


/*
|--------------------------------------------------------------------------
| Check If Application Is Under Maintenance
|--------------------------------------------------------------------------
|
| If the application is maintenance / demo mode via the "down" command we
| will require this file so that any prerendered template can be shown
| instead of starting the framework, which could cause an exception.
|
*/

if (file_exists(__DIR__.'../storage/framework/maintenance.php')) {
    require __DIR__.'../storage/framework/maintenance.php';
}


$kernel = $app->make(Kernel::class);

$response = tap($kernel->handle(
    $request = Request::capture()
))->send();

$kernel->terminate($request, $response);
