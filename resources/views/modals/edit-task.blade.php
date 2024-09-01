<div class="modal fade" id="edittask" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-md modal-dialog-scrollable">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title fw-bold" id="editTaskLabel">Edit Task</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form id="editTaskForm">
            @csrf
            @method('POST')
            <input type="hidden" id="editTask-id" name="id">
            <input type="hidden" value="{{ $project->id }}" name="project_id">
            <div class="modal-body">
                <div class="mb-3">
                    <label for="editTask-name" class="form-label">Task Name</label>
                    <input type="text" class="form-control" name="title" id="editTask-title" required>
                </div>
                <div class="mb-3">
					<label for="editTask-priority" class="form-label">Task Priority</label>
					<select name="priority" class="form-select" id="editTask-priority" required>
						<option value="low">Low</option>
						<option value="medium">Medium</option>
						<option value="high">High</option>
					</select>
                </div>
                <div class="mb-3">
					<label for="editTask-status" class="form-label">Task Status</label>
					<select name="status" class="form-select" id="editTask-status" required>
						<option value="0">New tasks</option>
						<option value="1">In Progress</option>
						<option value="2">In Review</option>
						<option value="3">Completed</option>
					</select>
                </div>
                <div class="deadline-form">
                    <div class="row g-3 mb-3">
                      <div class="col">
                        <label for="editTask-start" class="form-label">Start Date</label>
                        <input type="date" name="start_date" class="form-control" id="editTask-start" required>
                      </div>
                      <div class="col">
                        <label for="editTask-end" class="form-label">End Date</label>
                        <input type="date" name="end_date" class="form-control" id="editTask-end">
                      </div>
                    </div>
                    <div class="row g-3 mb-3">
                        <div class="col-sm-12">
                            <label for="editTask-users" class="form-label">Task Assign Person</label>
                            <select name="assigned_id" id="editTask-assigned_id" class="form-select" required>
                                @foreach($users as $user)
                                    <option value="{{ $user->id }}">{{ $user->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="editTask-description" class="form-label">Description (optional)</label>
                    <textarea class="form-control" name="description" id="editTask-description" rows="3"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="editTask-cancel" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </form>
    </div>
    </div>
</div>

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function() {
    const editForm = document.getElementById('editTaskForm');
    
    // Function to format date to YYYY-MM-DD
    function formatDate(dateString) {
        if (!dateString) return '';
        const date = new Date(dateString);
        return date.toISOString().split('T')[0];
    }

    // Function to populate the edit form
    window.populateEditForm = function(task) {
		console.log(task);
        document.getElementById('editTask-id').value = task.id;
        document.getElementById('editTask-title').value = task.title;
        document.getElementById('editTask-priority').value = task.priority;
        document.getElementById('editTask-assigned_id').value = task.assigned_id;
        document.getElementById('editTask-status').value = task.status;
        document.getElementById('editTask-start').value = formatDate(task.start_date);
        document.getElementById('editTask-end').value = formatDate(task.end_date);
        document.getElementById('editTask-description').value = task.description;
        
    }

    editForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
		//close modal
		$('#editTask-cancel').click();

        // Validate dates
        const startDate = new Date(document.getElementById('editTask-start').value);
        const endDate = new Date(document.getElementById('editTask-end').value);
        
        if (endDate && startDate > endDate) {
            Swal.fire({
                icon: 'warning',
                title: 'Wrong dates',
                text: 'Start date must be before end date'
            });
            return;
        }
        
        const formData = new FormData(editForm);
        
        fetch('/tasks/'+document.getElementById('editTask-id').value, {
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
            Swal.fire('Error!', 'An unexpected error occurred', 'error');
        });
    });

	// Add event listener for edit buttons
    const editButtons = document.querySelectorAll('.edit-task-btn');
    editButtons.forEach(button => {
        button.addEventListener('click', function() {
            const taskData = JSON.parse(this.getAttribute('data-task'));
            populateEditForm(taskData);
        });
    });

});
</script>
@endpush