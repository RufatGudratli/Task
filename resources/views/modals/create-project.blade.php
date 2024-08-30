<div class="modal fade" id="createproject" tabindex="-1"  aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-md modal-dialog-scrollable">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title  fw-bold" id="createprojectlLabel"> Create Project</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form id="createProjectForm">
            @csrf
            <div class="modal-body">
                <div class="mb-3">
                    <label for="createProject-name" class="form-label">Project Name</label>
                    <input type="text" class="form-control" name="name" id="createProject-name" placeholder="Explain what the Project Name" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Project Category</label>
                    <select name="category_id" class="form-select" aria-label="Default select Project Category" required>
                        @foreach($categories as $category)
                            <option value="{{ $category->id }}">{{ $category->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="deadline-form">
                    <div class="row g-3 mb-3">
                      <div class="col">
                        <label for="createProject-start" class="form-label">Project Start Date</label>
                        <input type="date" name="start_date" class="form-control" id="createProject-start" required>
                      </div>
                      <div class="col">
                        <label for="createProject-end" class="form-label">Project End Date</label>
                        <input type="date" name="end_date" class="form-control" id="createProject-end">
                      </div>
                    </div>
                    <div class="row g-3 mb-3">
                        <div class="col-sm-12">
                            <label for="formFileMultipleone" class="form-label">Task Assign Person</label>
                            <select name="users[]" class="form-select" multiple aria-label="Default select Priority">
                                @foreach($users as $user)
                                    <option value="{{ $user->id }}">{{ $user->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="createProject-description" class="form-label">Description (optional)</label>
                    <textarea class="form-control" name="description" id="createProject-description" rows="3" placeholder="Add any extra details about the request"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Create</button>
            </div>
        </form>
    </div>
    </div>
</div>

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('createProjectForm');
    form.addEventListener('submit', function(e) {
        e.preventDefault();
        
        // Validate dates
        const startDate = new Date(document.getElementById('createProject-start').value);
        const endDate = new Date(document.getElementById('createProject-end').value);
        
        if (endDate && startDate > endDate) {
			Swal.fire({
				icon: 'warning',
				title: 'Wrong dates',
				text: 'Start date must be before end date'
			});
            return;
        }
        
        const formData = new FormData(form);
        
        fetch('{{ route("projects.store") }}', {
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
			Swal.fire('Error!', error, 'error');
        });
    });
});
</script>
@endpush