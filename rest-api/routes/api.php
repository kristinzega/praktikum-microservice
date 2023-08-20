<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use Illuminate\Http\Request;

Route::prefix('v1')->group(function () {
  Route::prefix('auth')->group(function () {
    // API route for register new user
    Route::post('/register', [App\Http\Controllers\API\AuthController::class, 'register']);
    // API route for login user
    Route::post('/login', [App\Http\Controllers\API\AuthController::class, 'login']);
  });

  // Protecting Routes
  Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::prefix('user')->group(function () {
      Route::get('profile', function(Request $request) {
        return auth()->user();
      });
      Route::post('logout', [App\Http\Controllers\API\AuthController::class, 'logout']);
    });
    Route::apiResource('/tutorials', App\Http\Controllers\Api\TutorialsController::class);
  });
});