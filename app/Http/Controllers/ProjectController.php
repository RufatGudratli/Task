<?php

namespace App\Http\Controllers;

use App\Models\Project;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\ProjectCategory;


class ProjectController extends Controller
{
    public function index()
    {
		//get all categories for modals
		$categories = ProjectCategory::all();
		
		//get my projects
		$projects = Auth::user()->ownedProjects;
		
		//get all users except me to assign project
		$users = User::where('id', '!=', Auth::id())
             ->select('id', 'name')
             ->get();
		
        return view('projects.projects', compact('projects', 'categories', 'users'));
    }

    public function create()
    {
        $users = User::where('id', '!=', Auth::id())->get();
        return view('projects.create', compact('users'));
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|max:255',
            'description' => 'nullable',
            'category_id' => 'required|exists:categories,id',
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
        $this->authorize('view', $project);
        return view('projects.show', compact('project'));
    }

    public function edit(Project $project)
    {
        $this->authorize('update', $project);
        $users = User::where('id', '!=', Auth::id())->get();
        return view('projects.edit', compact('project', 'users'));
    }

    public function update(Request $request, Project $project)
    {
        $this->authorize('update', $project);

        $validatedData = $request->validate([
            'name' => 'required|max:255',
            'description' => 'nullable',
            'users' => 'array'
        ]);

        $project->update($validatedData);

        $project->users()->sync($validatedData['users'] ?? []);

        return response()->json([
            'success' => true,
            'message' => 'Project updated successfully',
            'redirect' => route('projects.show', $project)
        ]);
    }

    public function destroy(Project $project)
    {
        $this->authorize('delete', $project);

        $project->delete();

        return response()->json([
            'success' => true,
            'message' => 'Project deleted successfully',
            'redirect' => route('projects.index')
        ]);
    }
}