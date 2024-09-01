<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\View;

class LoginController extends Controller
{
    /**
     * Show login form.
     *
     * @return \Illuminate\View\View
     */
    public function showLoginForm()
    {
        return view('auth.login');
    }

    /**
     * Handle login request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function login(Request $request)
    {
        // Validate request
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        // Check login attempt
        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            return response()->json([
                'success' => true,
                'message' => 'Login successful',
                'redirect' => Redirect::intended('/projects')->getTargetUrl()
            ]);
        }

        // Failed auth
        return response()->json([
            'success' => false,
            'message' => 'The provided credentials do not match our records.'
        ], 422);
    }

    /**
     * Handle logout request.
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return response()->json([
            'success' => true,
            'message' => 'Logout successful',
            'redirect' => route('landing')
        ]);
    }
}