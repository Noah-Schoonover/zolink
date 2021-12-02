<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Signin - Zolink</title>
    <link rel="shortcut icon" type="image/png" href="favicon.png"/>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">



    <!-- Bootstrap core CSS -->
	<link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>


    <!-- Custom styles for this template -->
    <link href="login.css" rel="stylesheet">
  </head>
  <body class="text-center">

<main class="form-signin">
  <form action="Authenticate" method="post">
    <img class="mb-4" src="assets/brand/logo-v2-zl.svg" alt="" width="100">
    <h1 class="h3 mb-3 fw-normal text-white">Please sign in</h1>

    <div class="form-floating">
      <input type="email" name="email" class="form-control" id="floatingInput" 
			 placeholder="username" required>
      <label for="floatingInput">Email</label>
    </div>
    <div class="form-floating">
      <input type="password" name="password" class="form-control" id="floatingPassword" 
			 placeholder="password" required>
      <label for="floatingPassword">Password</label>
    </div>

    <div class="checkbox mb-3 text-white">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <input type="submit" class="w-100 btn btn-lg btn-primary" action="/Authenticate" value="Sign in">
	<p class="mt-1 text-danger "><strong>${message}</strong></p>
    <p class="mt-3 mb-3 text-muted">Forgot password?</p>
  </form>
	
</main>



  </body>
</html>
