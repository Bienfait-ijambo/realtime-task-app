<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/check',function (Request $request){

	return ['goo'=>'okay'];
});

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
