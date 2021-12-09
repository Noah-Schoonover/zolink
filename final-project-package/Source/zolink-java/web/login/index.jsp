<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="shortcut icon" type="image/png" href="/apollo14/zolink/favicon.png"/>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">

    <!-- Bootstrap core CSS -->
	<link href="/apollo14/zolink/assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/apollo14/zolink/assets/styles/login.css" rel="stylesheet">
  </head>
  <body class="text-center">

<main class="form-signin">
  <form action="/apollo14/zolink/Authenticate" method="post">
    <a class="text-white text-decoration-none" href="/apollo14/zolink/">
		<img class="mb-4" src="/apollo14/zolink/assets/brand/logo-v2-zl.svg" alt="" width="100">
	</a>
	<c:choose>
		<c:when test="${user == null}">
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
			<input type="submit" class="w-100 btn btn-lg btn-primary" value="Sign in">
			<p class="mt-1 text-danger "><strong>${message}</strong></p>
			<c:set var="message" scope="session" value=""></c:set>
			<p class="mt-3 mb-3 text-muted">Forgot password?</p>
			<p class="mt-3 text-white">
				Don't have an account?
				<br>
				Click <a class="text-decoration-none" href="/apollo14/zolink/register/">here</a> to register.
			</p>
		</c:when>
		<c:otherwise>
			<h4 class="h4 mb-3 fw-normal text-white">You are already signed in.</h4>
			<button type="button" class="w-100 btn btn-lg btn-primary"
					onclick="window.location.href='/apollo14/zolink/MyCards';">
				Go to my cards
			</button>
			<button type="button" class="w-100 btn btn-lg btn-danger mt-4"
					onclick="window.location.href='/apollo14/zolink/Logout';">
				Logout
			</button>
		</c:otherwise>
	</c:choose>
  </form>
	
</main>



  </body>
</html>
