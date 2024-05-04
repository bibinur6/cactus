<?php

use App\Http\Controllers\Hello;
use Illuminate\Support\Facades\Route;

//Route::get('/', function () {
//    return view('welcome');
//});

Route::view('/', 'welcome');

Route::view('/hello', 'hello/hello');
