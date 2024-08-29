<?php

namespace App\Http\Controllers;

use App\Models\Project;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProjectController extends Controller
{
    public function index()
    {
        $projects = Auth::user()->projects;
        return view('projects.projects', compact('projects'));
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
            'users' => 'array'
        ]);

        $project = Project::create([
            'name' => $validatedData['name'],
            'description' => $validatedData['description'],
            'owner_id' => Auth::id(),
        ]);

        if (isset($validatedData['users'])) {
            $project->users()->attach($validatedData['users']);
        }

        return response()->json([
            'success' => true,
            'message' => 'Project created successfully',
            'redirect' => route('projects.projects')
        ]);
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