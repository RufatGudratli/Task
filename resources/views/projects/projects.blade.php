@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Your Projects</h1>
    <a href="{{ route('projects.create') }}" class="btn btn-primary mb-3">Create New Project</a>
    
    <div class="row">
        @foreach($projects as $project)
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">{{ $project->name }}</h5>
                        <p class="card-text">{{ Str::limit($project->description, 100) }}</p>
                        <a href="{{ route('projects.show', $project) }}" class="btn btn-info">View</a>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
</div>
@endsection