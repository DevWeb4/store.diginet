<?php
 
use DaveJamesMiller\Breadcrumbs\Facades\Breadcrumbs;
 
// Inicio
Breadcrumbs::for('home', function ($trail) {
    $trail->push('Inicio', route('home'));
});

Breadcrumbs::for('videos', function ($trail) {
    $trail->parent('home');
    $trail->push('Videos');
});

Breadcrumbs::for('autoridades', function ($trail) {
    $trail->parent('home');
    $trail->push('Autoridades');
});
// Inicio > Noticias
Breadcrumbs::for('noticias', function ($trail) {
    $trail->parent('home');
    $trail->push('Noticias');
});

// Inicio > Galeria
Breadcrumbs::for('galerias', function ($trail) {
    $trail->parent('home');
    $trail->push('Galeria');
});

// Inicio > Usuarios
Breadcrumbs::for('usuarios', function ($trail) {
    $trail->parent('home');
    $trail->push('Usuarios');
});

Breadcrumbs::for('login', function ($trail) {
    $trail->push('Login', route('login'));
});
 