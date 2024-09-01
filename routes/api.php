<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\ProjectController;
use App\Http\Controllers\Api\TaskController;

Route::prefix('projects')->group(function () {
    Route::get('/', [ProjectController::class, 'index']);      				// List all projects
    Route::post('/', [ProjectController::class, 'store']);     				// Create a new project
    Route::put('/{project}', [ProjectController::class, 'update']); 		// Update a project
    Route::delete('/{project}', [ProjectController::class, 'destroy']); 	// Delete a project
});

Route::prefix('tasks')->group(function () {
    Route::get('/{project}', [TaskController::class, 'index']);     // List all tasks
    Route::post('/', [TaskController::class, 'store']);     		// Create a new task
    Route::put('/{task}', [TaskController::class, 'update']); 		// Update a task
    Route::delete('/{task}', [TaskController::class, 'destroy']); 	// Delete a task
});