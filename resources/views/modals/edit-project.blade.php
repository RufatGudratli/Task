<div class="modal fade" id="editproject" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-md modal-dialog-scrollable">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title fw-bold" id="editprojectLabel">Edit Project</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form id="editProjectForm">
            @csrf
            @method('PUT')
            <input type="hidden" id="editProject-id" name="id">
            <div class="modal-body">
                <div class="mb-3">
                    <label for="editProject-name" class="form-label">Project Name</label>
                    <input type="text" class="form-control" name="name" id="editProject-name" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Project Category</label>
                    <select name="category_id" id="editProject-category" class="form-select" required>
                        @foreach($categories as $category)
                            <option value="{{ $category->id }}">{{ $category->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="deadline-form">
                    <div class="row g-3 mb-3">
                      <div class="col">
                        <label for="editProject-start" class="form-label">Project Start Date</label>
                        <input type="date" name="start_date" class="form-control" id="editProject-start" required>
                      </div>
                      <div class="col">
                        <label for="editProject-end" class="form-label">Project End Date</label>
                        <input type="date" name="end_date" class="form-control" id="editProject-end">
                      </div>
                    </div>
                    <div class="row g-3 mb-3">
                        <div class="col-sm-12">
                            <label for="editProject-users" class="form-label">Task Assign Person</label>
                            <select name="users[]" id="editProject-users" class="form-select" multiple required>
                                @foreach($users as $user)
                                    <option value="{{ $user->id }}">{{ $user->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="editProject-description" class="form-label">Description (optional)</label>
                    <textarea class="form-control" name="description" id="editProject-description" rows="3"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="editProject-cancel" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </form>
    </div>
    </div>
</div>

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function() {
    const editForm = document.getElementById('editProjectForm');
    
    // Function to format date to YYYY-MM-DD
    function formatDate(dateString) {
        if (!dateString) return '';
        const date = new Date(dateString);
        return date.toISOString().split('T')[0];
    }

    // Function to populate the edit form
    window.populateEditForm = function(project) {
        document.getElementById('editProject-id').value = project.id;
        document.getElementById('editProject-name').value = project.name;
        document.getElementById('editProject-category').value = project.category_id;
        document.getElementById('editProject-start').value = formatDate(project.start_date);
        document.getElementById('editProject-end').value = formatDate(project.end_date);
        document.getElementById('editProject-description').value = project.description;
        
        // Populate users (assuming it's a multi-select)
        const userSelect = document.getElementById('editProject-users');
        // First, clear all selections
        Array.from(userSelect.options).forEach(option => option.selected = false);
        // Then, select the project users
        project.users.forEach(user => {
            Array.from(userSelect.options).forEach(option => {
                if (option.value == user.id) {
                    option.selected = true;
                }
            });
        });
    }

    editForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
		//close modal
		$('#editProject-cancel').click();

        // Validate dates
        const startDate = new Date(document.getElementById('editProject-start').value);
        const endDate = new Date(document.getElementById('editProject-end').value);
        
        if (endDate && startDate > endDate) {
            Swal.fire({
                icon: 'warning',
                title: 'Wrong dates',
                text: 'Start date must be before end date'
            });
            return;
        }
        
        const formData = new FormData(editForm);
        const projectId = document.getElementById('editProject-id').value;
        
        fetch(`/projects/${projectId}`, {
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
    const editButtons = document.querySelectorAll('.edit-project-btn');
    editButtons.forEach(button => {
        button.addEventListener('click', function() {
            const projectData = JSON.parse(this.getAttribute('data-project'));
            populateEditForm(projectData);
        });
    });

});
</script>
@endpush