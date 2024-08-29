@extends('layouts.app')

@section('content')

<div id="mytask-layout">
    <div class="main p-2 py-3 p-xl-5">
        <div class="body d-flex p-0 p-xl-5">
            <div class="container-xxl">

                <div class="row g-0">
                    <div class="col-lg-6 d-none d-lg-flex justify-content-center align-items-center rounded-lg auth-h100">
                        <div style="max-width: 35rem;">
                            <div class="mb-5">
                                <h2 class="color-900 text-center">Create your account</br>Let's Management Better</h2>
                            </div>
                            <div class="">
                                <img src="/assets/img/register.gif" alt="login-img">
                            </div>
                        </div>
                    </div>

					<div class="col-lg-6 d-flex justify-content-center align-items-center border-0 rounded-lg auth-h100">
						<div class="w-100 p-3 p-md-5 card border-0 bg-dark text-light" style="max-width: 32rem;">
							<form id="registrationForm" class="row g-1 p-3 p-md-4">
								@csrf
								<div class="col-12 text-center mb-1 mb-lg-5">
									<h1>Create your account</h1>
									<span>Free access to our dashboard.</span>
								</div>
								<div class="col-6">
									<div class="mb-2">
										<label class="form-label">First name</label>
										<input type="text" name="first_name" class="form-control form-control-lg" placeholder="John">
									</div>
								</div>
								<div class="col-6">
									<div class="mb-2">
										<label class="form-label">Last name</label>
										<input type="text" name="last_name" class="form-control form-control-lg" placeholder="Parker">
									</div>
								</div>
								<div class="col-12">
									<div class="mb-2">
										<label class="form-label">Email address</label>
										<input type="email" name="email" class="form-control form-control-lg" placeholder="name@example.com">
									</div>
								</div>
								<div class="col-12">
									<div class="mb-2">
										<label class="form-label">Password</label>
										<input type="password" name="password" class="form-control form-control-lg" placeholder="8+ characters required">
									</div>
								</div>
								<div class="col-12">
									<div class="mb-2">
										<label class="form-label">Confirm password</label>
										<input type="password" name="password_confirmation" class="form-control form-control-lg" placeholder="8+ characters required">
									</div>
								</div>
								<div class="col-12">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value="ok" id="flexCheckDefault" name="terms">
										<label class="form-check-label" for="flexCheckDefault">
											I accept the <a href="#" title="Terms and Conditions" class="text-secondary">Terms and Conditions</a>
										</label>
									</div>
								</div>
								<div class="col-12 text-center mt-4">
									<button type="submit" class="btn btn-lg btn-block btn-light lift text-uppercase">SIGN UP</button>
								</div>
								<div class="col-12 text-center mt-4">
									<span class="text-muted">Already have an account? <a href="{{ route('login') }}" title="Sign in" class="text-secondary">Sign in here</a></span>
								</div>
							</form>
						</div>
					</div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function() {
    const registrationForm = document.getElementById('registrationForm');

    registrationForm.addEventListener('submit', function(e) {
        e.preventDefault();

        const formData = new FormData(registrationForm);

        fetch('{{ route("register") }}', {
            method: 'POST',
            body: formData,
            headers: {
                'X-Requested-With': 'XMLHttpRequest',
                'Accept': 'application/json',
            },
            credentials: 'same-origin'
        })
        .then(response => response.json())
        .then(data => {
			console.log(data);
            if (data.success) {
                Swal.fire({
                    icon: 'success',
                    title: 'Registration Successful',
                    text: 'You will be redirected to the dashboard.',
                    timer: 1500,
                    showConfirmButton: false
                }).then(() => {
                    window.location.href = data.redirect;
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Registration Failed',
                    text: data.message || 'Please check your input and try again.'
                });
            }
        })
        .catch(error => {
            console.error('Error:', error);
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Something went wrong! Please try again later.'
            });
        });
    });
});
</script>
@endpush