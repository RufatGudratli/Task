<div class="modal fade" id="createtask" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-md modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title fw-bold" id="createtaskLabel">Create Task</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="createTaskForm">
                @csrf
				<input type="hidden" name="project_id" value="{{ $project->id }}" />
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="createTask-name" class="form-label">Task Name</label>
                        <input type="text" class="form-control" name="title" id="createTask-name" placeholder="Enter Task Name" required>
                    </div>
                    <div class="mb-3">
                        <label for="createTask-description" class="form-label">Description (optional)</label>
                        <textarea class="form-control" name="description" id="createTask-description" rows="3" placeholder="Add any extra details about the task"></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="createTask-priority" class="form-label">Task Priority</label>
                        <select name="priority" class="form-select" id="createTask-priority" required>
                            <option value="low">Low</option>
                            <option value="medium">Medium</option>
                            <option value="high">High</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="createTask-user" class="form-label">Assign To</label>
                        <select name="assigned_id" class="form-select" id="createTask-user" required>
                            @foreach($users as $user)
                                <option value="{{ $user->id }}">{{ $user->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="deadline-form">
                        <div class="row g-3 mb-3">
                            <div class="col">
                                <label for="createTask-start" class="form-label">Start Date</label>
                                <input type="date" name="start_date" class="form-control" id="createTask-start" required>
                            </div>
                            <div class="col">
                                <label for="createTask-end" class="form-label">End Date</label>
                                <input type="date" name="end_date" class="form-control" id="createTask-end">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="createTask-cancel" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Create</button>
                </div>
            </form>
        </div>
    </div>
</div>

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('createTaskForm');
    form.addEventListener('submit', function(e) {
        e.preventDefault();
        
        // Close modal
        $('#createTask-cancel').click();
        
        // Validate dates
        const startDate = new Date(document.getElementById('createTask-start').value);
        const endDate = new Date(document.getElementById('createTask-end').value);
        
        if (endDate && startDate > endDate) {
            Swal.fire({
                icon: 'warning',
                title: 'Invalid Dates',
                text: 'Start date must be before end date'
            });
            return;
        }
        
        const formData = new FormData(form);
        
        fetch('{{ route("tasks.store") }}', {
            method: 'POST',
            body: formData,
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}',
                'Accept': 'application/json',
            },
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
				Swal.fire('Success!', data.message, 'success').then(() => {
					window.location.reload();
				});
                setTimeout(function() { window.location.reload(); }, 1500);
            } else {
                Swal.fire('Error!', data.message, 'error');
            }
        })
        .catch(error => {
            Swal.fire('Error!', 'An unexpected error occurred.', 'error');
        });
    });
});
</script>
@endpush
