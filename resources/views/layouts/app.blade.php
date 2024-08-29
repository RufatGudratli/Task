<!doctype html>
<html class="no-js" lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>{{ $title ?? 'Project Management' }} | {{ $page_title ?? '' }}</title>

	<link rel="apple-touch-icon" sizes="180x180" href="/assets/favicon/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/assets/favicon/assets/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/assets/favicon/favicon-16x16.png">
	<link rel="manifest" href="/assets/favicon/site.webmanifest">

    <link rel="stylesheet" href="/assets/css/style.min.css">

	<link rel="stylesheet" href="/assets/js/jquery-3.7.1.min.js">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body  data-mytask="theme-indigo">

@yield('content')

@stack('scripts')

</body>
</html>