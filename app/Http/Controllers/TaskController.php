<?php

namespace App\Http\Controllers;

use App\Models\Task;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use App\Models\Project;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class TaskController extends Controller
{

    // Store a newly created task in storage
    public function store(Request $request)
    {
        // Validation rules
        $validator = Validator::make($request->all(), [
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'priority' => 'required|in:low,medium,high',
            'assigned_id' => 'required|exists:users,id',
            'start_date' => 'required|date',
            'end_date' => 'nullable|date|after_or_equal:start_date',
            'project_id' => 'required|exists:projects,id',
        ]);

        // Return validation errors if any
        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => $validator->errors()->first()], 400);
        }

		// Check access
		$hasAccess = DB::table('project_user')
			->where('project_id', $request->project_id) // Check the project's ID
			->where('user_id', Auth::id())     		 // Check for the current user ID
			->exists();                           	 // Check if a record exists

		if (!$hasAccess) {
			return response()->json([
				'success' => false,
				'message' => 'You do not have access to this project.',
			], 403);
		}

        // Create a new task
        Task::create([
            'title' => $request->title,
            'description' => $request->description,
            'priority' => $request->priority,
            'assigned_id' => $request->assigned_id,
            'start_date' => $request->start_date,
            'end_date' => $request->end_date,
            'project_id' => $request->project_id,
        ]);

        // Return success response
        return response()->json(['success' => true, 'message' => 'Task created successfully']);
    }
	
	// Update an existing task in storage
	public function update(Request $request)
	{
		// Validation rules
		$validator = Validator::make($request->all(), [
			'title' => 'required|string|max:255',
			'description' => 'nullable|string',
			'priority' => 'required|in:low,medium,high',
            'status' => 'required|in:0,1,2,3',
			'assigned_id' => 'required|exists:users,id',
			'start_date' => 'required|date',
			'end_date' => 'nullable|date|after_or_equal:start_date',
			'project_id' => 'required|exists:projects,id',
			'id' => 'required|exists:tasks,id',
		]);

		// Return validation errors if any
		if ($validator->fails()) {
			return response()->json(['success' => false, 'message' => $validator->errors()->first()], 400);
		}

		// Retrieve the task and check if it belongs to the given project
		$task = Task::where('id', $request->id)
					->where('project_id', $request->project_id)
					->first();

		// Check if task exists and belongs to the specified project
		if (!$task) {
			return response()->json(['success' => false, 'message' => 'Task not found or does not belong to the specified project'], 404);
		}

		// Check if the current user has access to the task's parent project
		$userHasAccess = Project::where('id', $request->project_id)
			->whereHas('users', function($query) {
				$query->where('users.id', Auth::id());
			})
			->exists();

		// Update the task fields
		$task->update([
			'title' => $request->title,
			'description' => $request->description,
			'priority' => $request->priority,
			'status' => $request->status,
			'assigned_id' => $request->assigned_id,
			'start_date' => $request->start_date,
			'end_date' => $request->end_date,
			'project_id' => $request->project_id,
		]);

		// Return success response
		return response()->json(['success' => true, 'message' => 'Task updated successfully']);
	}

    public function destroy(Task $task, $id)
    {		
		$task = Task::where('id', $id)->first();

		$hasAccess = DB::table('project_user')
			->where('project_id', $task->project_id) // Check the project's ID
			->where('user_id', Auth::id())     		 // Check for the current user ID
			->exists();                           	 // Check if a record exists

		if (!$hasAccess) {
			return response()->json([
				'success' => false,
				'message' => 'You do not have access to this project.',
			], 403);
		}
		
        try {
            DB::beginTransaction();

            // Delete the task
            $task->delete();

            DB::commit();

            return response()->json(['success' => true]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }
}
