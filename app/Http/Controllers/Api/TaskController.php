<?php

namespace App\Http\Controllers\Api;

use App\Models\Task;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use App\Models\Project;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;

class TaskController extends Controller
{
	public function index($project_id)
    {

		$tasks = Task::where('project_id', $project_id)
        ->with([
            'assignedUser:id,name,email,profile_photo'
        ])
        ->get(['id', 'title', 'description', 'status', 'project_id', 'start_date', 'end_date']); 

		return response()->json($tasks);
    }

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
