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
                        <div class="card-header py-3 no-bg bg-transparent d-flex align-items-center px-0 justify-content-between border-bottom flex-wrap">
                            <h3 class="fw-bold mb-0">Task Management</h3>
                            <div class="col-auto d-flex w-sm-100">
                                <button type="button" class="btn btn-dark btn-set-task w-sm-100" data-bs-toggle="modal" data-bs-target="#createtask"><i class="icofont-plus-circle me-2 fs-6"></i>Create Task</button>
                            </div>
                        </div>
                    </div>
                </div> 
                <div class="row clearfix  g-3">
                    <div class="col-lg-12 col-md-12 flex-column">
                        <div class="row g-3 row-deck">
							<div class="col-xxl-8 col-xl-8 col-lg-8 col-md-6 col-sm-6">
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
<p class="py-2 mb-0">{{ $project->description }}</p>
										</div>
										<div class="row g-2 pt-4">
											<div class="col-3">
												<div class="d-flex align-items-center">
													<i class="icofont-group-students "></i>
													<span class="ms-2">{{ $project->users->count() }} Members</span>
												</div>
											</div>
											<div class="col-3">
												<div class="d-flex align-items-center">
													<i class="icofont-ui-text-chat"></i>
													<span class="ms-2">{{ $project->tasks->count() }} tasks</span>
												</div>
											</div>
											<div class="col-3">
												<div class="d-flex align-items-center">
													<i class="icofont-sand-clock"></i>
													<span class="ms-2">Start date: {{ $project->start_date->format('j F, Y') }}</span>
												</div>
											</div>
											<div class="col-3">
												<div class="d-flex align-items-center">
													<i class="icofont-sand-clock"></i>
													<span class="ms-2">End date: {{ $project->end_date->format('j F, Y') }}</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
                           <div class="col-xxl-4 col-xl-4 col-lg-4 col-md-12">
                                <div class="card">
                                    <div class="card-header py-3">
                                        <h6 class="mb-0 fw-bold ">Allocated Task Members</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="flex-grow-1 mem-list">
@foreach($project->users as $user)
                                            <div class="py-2 d-flex align-items-center border-bottom">
                                                <div class="d-flex ms-2 align-items-center flex-fill">
                                                    <img src="/{{ $user->profile_photo }}" class="avatar lg rounded-circle img-thumbnail" alt="{{ $user->name }}">
                                                    <div class="d-flex flex-column ps-2">
                                                        <h6 class="fw-bold mb-0">{{ $user->name }}</h6>
                                                        <span class="small text-muted">{{ $user->email }}</span>
                                                    </div>
                                                </div>
                                            </div>
@endforeach

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row taskboard g-3 py-xxl-4">
	@php $taskCategory = ['planned_task','progress_task','review_task','completed_task']; @endphp
    @foreach(['New tasks', 'In Progress', 'In Review', 'Completed'] as $index => $status)
    <div class="col-xxl-3 col-xl-3 col-lg-3 col-md-12 mt-xxl-3 mt-xl-3 mt-lg-3 mt-md-3 mt-sm-3 mt-3">
        <h6 class="fw-bold py-3 mb-0">{{ $status }}</h6>
		<div class="{{ $taskCategory[$index] }}">
		@foreach($tasks[$index] as $task)
			<li class="dd-item" >
				<div class="dd-handle">
					<div class="task-info d-flex align-items-center justify-content-between">
						<h6 class="light-success-bg py-1 px-2 rounded-1 d-inline-block fw-bold small-14 mb-0">{{ $task->title }}</h6>
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-outline-secondary edit-task-btn" data-bs-toggle="modal" data-bs-target="#edittask" data-task="{{ json_encode($task) }}"><i class="icofont-edit text-success"></i></button>
							<button type="button" class="btn btn-outline-secondary delete-task" data-task-id="{{ $task->id }}"><i class="icofont-ui-delete text-danger"></i></button>
						</div>
					</div>
					<p class="py-2 mb-0">{{ $task->description }}</p>
					<div class="tikit-info row g-3 align-items-center">
						<div class="col-sm">
							<ul class="d-flex list-unstyled align-items-center flex-wrap mb-0">
								<li >
									<div class="d-flex align-items-center">
										<i class="icofont-flag"></i>
										<span class="ms-1">Start date : {{ $task->start_date->format('j M') }}</span>
									</div>
								</li>
								<li >
									<div class="d-flex align-items-center">
										<i class="icofont-flag"></i>
										<span class="ms-1">Deadline : {{ $task->end_date->format('j M') }}</span>
									</div>
								</li>
							</ul>
						</div>
						<div class="col-sm text-end">
							<div class="task-priority">
								<span class="badge {{ $task->priority == 'low' ? 'bg-success' : ($task->priority == 'medium' ? 'bg-warning' : 'bg-danger') }}  text-end mt-2">{{ $task->priority }}</span>
							</div>
						</div>
						<div class="dividers-block"></div>
						<div class="d-flex align-items-center justify-content-between mt-0">
							<h4 class="small fw-bold mb-0">{{ $task->assignedUser->name }}</h4>
							<div class="avatar-list avatar-list-stacked m-0">
								<img class="avatar rounded-circle small-avt" src="/{{ $task->assignedUser->profile_photo }}" alt="{{ $task->assignedUser->name }}">
							</div>
						</div>
					</div>
				</div>
			</li>
			@endforeach
        </div>
    </div>
    @endforeach
						
						
	
 </div>
                    </div>
                </div>
            </div>
        </div>
@include('modals.create-task')
@include('modals.edit-task')
    </div>

</div>

@endsection

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function() {
    const deleteButtons = document.querySelectorAll('.delete-task');
    
    deleteButtons.forEach(button => {
        button.addEventListener('click', function() {
            const taskId = this.getAttribute('data-task-id');
            
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
                    fetch(`/tasks/${taskId}`, {
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
							Swal.fire('Deleted!', 'Your task has been deleted.', 'success').then(() => {
								window.location.reload();
							});
							setTimeout(function() { window.location.reload(); }, 1500);
                        } else {
                            Swal.fire(
                                'Error!',
                                'Failed to delete the task.',
                                'error'
                            );
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        Swal.fire(
                            'Error!',
                            'An error occurred while deleting the task.',
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
