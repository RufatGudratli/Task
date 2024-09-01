<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\LandingController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\TaskController;


//Authentication routes
Route::middleware('guest')->prefix('auth')->group(function () {
    Route::get('login', [LoginController::class, 'showLoginForm'])->name('login');
    Route::post('login', [LoginController::class, 'login']);
    Route::get('register', [RegisterController::class, 'showRegisterForm'])->name('register');
    Route::post('register', [RegisterController::class, 'register']);
});
Route::middleware('auth')->prefix('auth')->group(function () {
    Route::post('logout', [LoginController::class, 'logout'])->name('logout');
});

//Landing page


//Projects
Route::middleware('auth')->group(function () {
	Route::get('/', [ProjectController::class, 'index'])->name('projects');
    Route::resource('projects', ProjectController::class);
    Route::post('/tasks', [TaskController::class, 'store'])->name('tasks.store');
    Route::post('/tasks/{id}', [TaskController::class, 'update'])->name('tasks.update');
    Route::delete('/tasks/{id}', [TaskController::class, 'destroy'])->name('tasks.delete');
});