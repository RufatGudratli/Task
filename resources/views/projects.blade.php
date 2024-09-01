@extends('layouts.app')

@section('content')

<div id="mytask-layout">

@include('layouts.sidebar')

    <div class="main px-lg-4 px-md-4">

@include('layouts.header')

        <div class="body d-flex py-lg-3 py-md-2">
            <div class="container-xxl">
                <div class="row align-items-center">
                    <div class="border-0 mb-4">
                        <div class="card-header p-0 no-bg bg-transparent d-flex align-items-center px-0 justify-content-between border-bottom flex-wrap">
                            <h3 class="fw-bold py-3 mb-0">Projects</h3>
                            <div class="d-flex py-2 project-tab flex-wrap w-sm-100">
                                <button type="button" class="btn btn-dark w-sm-100" data-bs-toggle="modal" data-bs-target="#createproject"><i class="icofont-plus-circle me-2 fs-6"></i>Create Project</button>
                                <ul class="nav nav-tabs tab-body-header rounded ms-3 prtab-set w-sm-100" role="tablist">
                                    <li class="nav-item"><a class="nav-link active" data-bs-toggle="tab" href="#My-Projects" role="tab">My Projects</a></li>
                                    <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" href="#All-Projects" role="tab">All projects</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row align-items-center">
                    <div class="col-lg-12 col-md-12 flex-column">
                        <div class="tab-content mt-4">
                            <div class="tab-pane fade show active" id="My-Projects">
                                <div class="row g-3 gy-5 py-3 row-deck">
@foreach($projects as $project)
                                    <div class="col-xxl-4 col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="d-flex align-items-center justify-content-between mt-5">
                                                    <div class="lesson_name">
                                                        <div class="project-block {{ $project->category->color }}">
                                                            <i class="{{ $project->category->icon }}"></i>
                                                        </div>
                                                        <span class="small text-muted project_name fw-bold"> {{ $project->category->name }} </span>
                                                        <a href="{{ route('projects.show', $project->id) }}"><h6 class="mb-0 fw-bold  fs-6  mb-2">{{ $project->name }}</h6></a>
                                                    </div>
                                                    <div class="btn-group" role="group" aria-label="Basic outlined example">
														<button type="button" class="btn btn-outline-secondary edit-project-btn" data-bs-toggle="modal" data-bs-target="#editproject" data-project="{{ json_encode($project) }}"><i class="icofont-edit text-success"></i></button>
                                                        <button type="button" class="btn btn-outline-secondary delete-project" data-project-id="{{ $project->id }}"><i class="icofont-ui-delete text-danger"></i></button>
                                                    </div>
                                                </div>
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar-list avatar-list-stacked pt-2">
@foreach($project->users as $user)<img class="avatar rounded-circle lg" src="{{ $user->profile_photo }}" alt="{{ $user->name }}">@endforeach
                                                    </div>
                                                </div>
                                                <div class="row g-2 pt-4">
                                                    <div class="col-6">
                                                        <div class="d-flex align-items-center">
                                                            <i class="icofont-group-students "></i>
                                                            <span class="ms-2">{{ $project->users->count() }} Members</span>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="d-flex align-items-center">
                                                            <i class="icofont-ui-text-chat"></i>
                                                            <span class="ms-2">{{ $project->tasks->count() }} tasks</span>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="d-flex align-items-center">
                                                            <i class="icofont-sand-clock"></i>
                                                            <span class="ms-2">Start date: {{ $project->start_date->format('j M, Y') }}</span>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="d-flex align-items-center">
                                                            <i class="icofont-sand-clock"></i>
                                                            <span class="ms-2">End date: {{ $project->end_date->format('j M, Y') }}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
@endforeach
                               </div>
                            </div>
                            <div class="tab-pane fade" id="All-Projects">
                                <div class="row g-3 gy-5 py-3 row-deck">
@foreach($projects_all as $project)
                                    <div class="col-xxl-4 col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="d-flex align-items-center justify-content-between mt-5">
                                                    <div class="lesson_name">
                                                        <div class="project-block {{ $project->category->color }}">
                                                            <i class="{{ $project->category->icon }}"></i>
                                                        </div>
                                                        <span class="small text-muted project_name fw-bold"> {{ $project->category->name }} </span>
                                                        <h6 class="mb-0 fw-bold  fs-6  mb-2">{{ $project->name }}</h6>
                                                    </div>
                                                </div>
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar-list avatar-list-stacked pt-2">
@foreach($project->users as $user)<img class="avatar rounded-circle lg" src="{{ $user->profile_photo }}" alt="{{ $user->name }}">@endforeach
                                                    </div>
                                                </div>
                                                <div class="row g-2 pt-4">
                                                    <div class="col-6">
                                                        <div class="d-flex align-items-center">
                                                            <i class="icofont-group-students "></i>
                                                            <span class="ms-2">{{ $project->users->count() }} Members</span>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="d-flex align-items-center">
                                                            <i class="icofont-ui-text-chat"></i>
                                                            <span class="ms-2">{{ $project->tasks->count() }} tasks</span>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="d-flex align-items-center">
                                                            <i class="icofont-sand-clock"></i>
                                                            <span class="ms-2">Start date: {{ $project->start_date->format('j M, Y') }}</span>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="d-flex align-items-center">
                                                            <i class="icofont-sand-clock"></i>
                                                            <span class="ms-2">End date: {{ $project->end_date->format('j M, Y') }}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
        @endforeach
                               </div>
                            </div>
                      </div>
                    </div>
                </div>
            </div>
        </div>
@include('modals.create-project')
@include('modals.edit-project')
    </div>
</div> 
@endsection
@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function() {
    const deleteButtons = document.querySelectorAll('.delete-project');
    
    deleteButtons.forEach(button => {
        button.addEventListener('click', function() {
            const projectId = this.getAttribute('data-project-id');
            
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    fetch(`/projects/${projectId}`, {
                        method: 'DELETE',
                        headers: {
                            'X-CSRF-TOKEN': '{{ csrf_token() }}',
                            'Accept': 'application/json',
                            'Content-Type': 'application/json'
                        },
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
							Swal.fire('Deleted!', 'Your project has been deleted.', 'success').then(() => {
								window.location.reload();
							});
							setTimeout(function() { window.location.reload(); }, 1500);
                        } else {
                            Swal.fire(
                                'Error!',
                                'Failed to delete the project.',
                                'error'
                            );
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        Swal.fire(
                            'Error!',
                            'An error occurred while deleting the project.',
                            'error'
                        );
                    });
                }
            });
        });
    });
});
</script>
@endpush
