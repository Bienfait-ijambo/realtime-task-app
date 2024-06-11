<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\MemberController;
use App\Http\Controllers\TaskController;
use App\Http\Controllers\ProjectController;

// Route::get('/check',function (Request $request){

// 	return ['goo'=>'okay'];
// });


Route::controller(AuthController::class)->group(function(){
    Route::post('/register','register');
    Route::post('/login','login');
});


Route::group(['middleware'=>['auth:sanctum']],function(){

    // 

    Route::controller(AuthController::class)->group(function(){
        Route::post('/logout','logoutUser');
      
    });
    
    Route::controller(ProjectController::class)->group(function(){
        Route::post('/projects','store');
        Route::put('/projects','update');
        Route::get('/projects','index');
        Route::post('/projects/pinned','pinnedProject');
        Route::get('/projects/{slug}','getProject');
        Route::get('/count/projects','countProject');
        Route::get('/pinned/projects','getPinnedProject');
        Route::get('/chart-data/projects','getProjectChartData');


        
    
    });
    
    
    Route::controller(MemberController::class)->group(function(){
        Route::post('/members','store');
        Route::put('/members','update');
        Route::get('/members','index');
    });
    
    
    Route::controller(TaskController::class)->group(function(){
        Route::post('/tasks','createTask'); //finish
        Route::post('tasks/not_started_to_pending','TaskToNotStartedToPending'); //work on
        Route::post('tasks/pending_to_completed','TaskToPendingToCompleted'); //work on
        Route::post('tasks/completed_to_pending','TaskToCompletedToPending'); //work on

        Route::post('tasks/completed_to_not_started','TaskToCompletedToNotStarted'); //home work
        Route::post('tasks/not_started_to_completed','TaskToNotStartedToCompleted');  //home work
        Route::post('tasks/pending_to_not_started','TaskToPendingToNotStarted');  //home work
       
    });
// 
});





Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');
