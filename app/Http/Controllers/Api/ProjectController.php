<?php

namespace App\Http\Controllers\Api;

use App\Models\Project;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;


class ProjectController extends Controller
{
	public function index()
    {
		//get all projects
		$projects = Project::with(['category' => function ($query) {
				$query->select('id', 'name', 'icon', 'color');
			}, 'users' => function ($query) {
				$query->select('users.id', 'users.name', 'users.profile_photo', 'users.email');
			}])
			->get();

		return response()->json($projects);
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|max:255',
            'description' => 'nullable',
            'category_id' => 'required|exists:project_categories,id',
            'start_date' => 'required|date',
            'end_date' => 'nullable|date|after_or_equal:start_date',
            'users' => 'nullable|array',
            'users.*' => 'exists:users,id'
        ]);

        try {
            $project = Project::create([
                'name' => $validatedData['name'],
                'description' => $validatedData['description'],
                'category_id' => $validatedData['category_id'],
                'start_date' => $validatedData['start_date'],
                'end_date' => $validatedData['end_date'],
                'owner_id' => $validatedData['owner_id'],
            ]);
			
			$validatedData['users'][] = $project->owner_id;

            if (isset($validatedData['users'])) {
                $project->users()->attach($validatedData['users']);
            }

            return response()->json([
                'success' => true,
                'message' => 'Project created successfully',
                'redirect' => route('projects.index')
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error creating project: ' . $e->getMessage()
            ], 500);
        }
    }


	public function update(Request $request, Project $project)
    {
 
        $validatedData = $request->validate([
            'name' => 'required|max:255',
            'description' => 'nullable',
            'category_id' => 'required|exists:project_categories,id',
            'start_date' => 'required|date',
            'end_date' => 'nullable|date|after_or_equal:start_date',
            'users' => 'nullable|array',
            'users.*' => 'exists:users,id'
        ]);

        try {
            $project->update($validatedData);

			$validatedData['users'][] = $project->owner_id;

            if (isset($validatedData['users'])) {
                $project->users()->sync($validatedData['users']);
            }

            return response()->json([
                'success' => true,
                'message' => 'Project updated successfully',
                'redirect' => route('projects.show', $project)
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error updating project: ' . $e->getMessage()
            ], 500);
        }
    }

	
    public function destroy(Project $project)
    {
        try {
            DB::beginTransaction();

            // Delete related records in project_user table
            DB::table('project_user')->where('project_id', $project->id)->delete();

            // Delete related tasks
            $project->tasks()->delete();

            // Delete the project
            $project->delete();

            DB::commit();

            return response()->json(['success' => true]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }
}