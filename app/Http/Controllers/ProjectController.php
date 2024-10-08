<?php

namespace App\Http\Controllers;

use App\Models\Project;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use App\Models\ProjectCategory;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;


class ProjectController extends Controller
{
	use AuthorizesRequests;
	
    public function index()
    {
		//get all categories for modals
		$categories = ProjectCategory::all();
		
		//get my projects
		$projects = Auth::user()->ownedProjects()
			->with(['category' => function ($query) {
				$query->select('id', 'name', 'icon', 'color');
			}, 'users' => function ($query) {
				$query->select('users.id', 'users.name', 'users.profile_photo', 'users.email');
			}])
			->get();

		//get all projects
		$projects_all = Project::with(['category' => function ($query) {
				$query->select('id', 'name', 'icon', 'color');
			}, 'users' => function ($query) {
				$query->select('users.id', 'users.name', 'users.profile_photo', 'users.email');
			}])
			->get();


		//get all users except me to assign project
		$users = User::where('id', '!=', Auth::id())
             ->select('id', 'name')
             ->get();
		
        return view('projects', compact('projects', 'projects_all', 'categories', 'users'));
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
                'owner_id' => Auth::id(),
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

    public function show(Project $project)
    {
        // Authorize the user to view the project
        $this->authorize('view', $project);

        // Eager load the related category, users, and tasks
        $project->load([
            'category' => function ($query) {
                $query->select('id', 'name', 'icon', 'color');
            },
            'users' => function ($query) {
                $query->select('users.id', 'users.name', 'users.profile_photo', 'users.email');
            },
			'tasks' => function ($query) {
				$query->select('*')
					->with(['assignedUser' => function ($query) {
						$query->select('id', 'name', 'profile_photo');
					}]);
			}
        ]);
		// Separate tasks by status
		$tasks = [];
		$tasks[0] = $project->tasks->where('status', 0);  	//new
		$tasks[1] = $project->tasks->where('status', 1);	//inProgress
		$tasks[2] = $project->tasks->where('status', 2);	//inReview
		$tasks[3] = $project->tasks->where('status', 3);	//completed
		
		// Get users assigned to the current project
		$users = User::join('project_user', 'users.id', '=', 'project_user.user_id')
			->where('project_user.project_id', $project->id)
			->select('users.id', 'users.name')
			->get();

        // Pass the project to the view
        return view('tasks', compact('project', 'users', 'tasks'));
    }

	public function update(Request $request, Project $project)
    {
        if (Auth::id() !== $project->owner_id) {
            return response()->json([
                'success' => false,
                'message' => 'Unauthorized action.'
            ], 403);
        }

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
        if (Auth::id() !== $project->owner_id) {
            return response()->json([
                'success' => false,
                'message' => 'Unauthorized action.'
            ], 403);
        }

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