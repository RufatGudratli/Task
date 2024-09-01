<div class="header">
	<nav class="navbar py-4">
		<div class="container-xxl">
			<div class="h-right d-flex align-items-center mr-5 mr-lg-0 order-1">
				<div class="dropdown user-profile ml-2 ml-sm-3 d-flex align-items-center">
					<div class="u-info me-2">
						<p class="mb-0 text-end line-height-sm "><span class="font-weight-bold">{{ Auth::user()->name }}</span></p>
						<small>{{ Auth::user()->email }}</small>
					</div>
					<a class="nav-link dropdown-toggle pulse p-0" href="#" role="button" data-bs-toggle="dropdown" data-bs-display="static">
						<img class="avatar lg rounded-circle img-thumbnail" src="/{{ Auth::user()->profile_photo }}">
					</a>
					<div class="dropdown-menu rounded-lg shadow border-0 dropdown-animation dropdown-menu-end p-0 m-0">
						<div class="card border-0 w280">
							<div class="card-body pb-0">
								<div class="d-flex py-1">
									<img class="avatar rounded-circle" src="/{{ Auth::user()->profile_photo }}">
									<div class="flex-fill ms-3">
										<p class="mb-0"><span class="font-weight-bold">{{ Auth::user()->name }}</span></p>
										<small class="">{{ Auth::user()->email }}</small>
									</div>
								</div>
								<div><hr class="dropdown-divider border-dark"></div>
							</div>
							<div class="list-group m-2 ">
								<a href="#" id="logout-link" class="list-group-item list-group-item-action border-0"><i class="icofont-logout fs-6 me-3"></i>Logout</a>
							</div>
						</div>
					</div>

				</div>
			</div>


			<div class="order-0 col-lg-4 col-md-4 col-sm-12 col-12 mb-3 mb-md-0 ">
				<div class="input-group flex-nowrap input-group-lg">
					<button type="button" class="input-group-text" id="addon-wrapping"><i class="icofont-search"></i></button>
					<input type="search" class="form-control" placeholder="Searcsh" aria-label="search" aria-describedby="addon-wrapping">
				</div>
			</div>

		</div>
	</nav>
</div>

@push('scripts')
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const logoutLink = document.getElementById('logout-link');

        logoutLink.addEventListener('click', function(e) {
            e.preventDefault();

            Swal.fire({
                title: 'Are you sure?',
                text: "You will be logged out!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, logout!',
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if (result.isConfirmed) {
                    fetch('{{ route("logout") }}', {
                        method: 'POST',
                        headers: {'Content-Type': 'application/json','X-Requested-With': 'XMLHttpRequest','X-CSRF-TOKEN': '{{ csrf_token() }}'},
                        body: JSON.stringify({
                            _method: 'POST'
                        })
                    }).then(response => {
                        if (!response.ok) {
							 Swal.fire('Error!','There was a problem logging you out.','error');
						}
						return response.json();
					}).then(data => {
						if (data.success) {
							Swal.fire('Logged out!', data.message, 'success').then(() => {
								window.location.href = data.redirect;
							});
							setTimeout(function() { window.location.href = '/'; }, 1500);
						} else {
							Swal.fire('Error!', 'There was a problem logging you out.', 'error');
						}
					}).catch(error => {
                        Swal.fire('Error!','There was a problem logging you out.','error');
                    });
                }
            });
        });
    });
</script>
@endpush