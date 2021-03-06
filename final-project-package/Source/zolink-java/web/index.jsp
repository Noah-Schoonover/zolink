<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Zolink</title>
    <link rel="shortcut icon" type="image/png" href="favicon.png"/>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/jumbotron/">

    <!-- Bootstrap core CSS -->
    <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles -->
    <link href="assets/styles/style.css" rel="stylesheet">
    <link href="assets/styles/nav.css" rel="stylesheet">

  </head>

  <body>
    <main>
      <div class="container py-4">
        <header class="pb-3 mb-4 border-bottom">

        <nav class="navbar navbar-light">
            <a class="navbar-brand" href="#">
              <img src="assets/brand/logo-v2-zl.svg" width="80" class="d-inline-block align-top" alt="">
            </a>
            <h1 class="text-white">Zolink</h3>

			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<c:choose>
				<c:when test="${user == null}">
					<form class="form-inline">
					  <button class="btn btn-primary btn-lg" onclick="location.href='register/'" type="button">Register</button>
					  <button class="btn btn-primary btn-lg" onclick="location.href='login/'" type="button">Login</button>
					</form>
				</c:when>
				<c:otherwise>
					<nav class="nav nav-masthead justify-content-center">
						<a class="nav-link" href="/apollo14/zolink/MyCards">My Cards</a>
						<a class="nav-link" href="/apollo14/zolink/account/">Account</a>
					</nav>
				</c:otherwise>
			</c:choose>

        </nav>

        </header>

        <div class="p-5 mb-4 bg-light rounded-3">
          <div class="container-fluid py-5">
            <h1 class="display-6 fw-bold">Digital Contact Cards</h1>
            <p class="col-md-8 fs-4">
                Zolink allows users to add the information they
                desire to their own personal contact cards. Users can
                have multiple contact cards each with their own purpose. Contact
                cards also have the option to be either public or private, as well as
                contain a unique URL and QR code for easy sharing.
            </p>
          </div>
        </div>

        <div class="row align-items-md-stretch">
          <div class="col-md-6">
            <div class="h-100 p-5 text-white bg-dark rounded-3">
              <h2>Features</h2>
              <p>
                <ul>
                  <li>Create Multiple Contact Cards</li>
                  <li>Public and Private Cards</li>
                  <li>Unique URLs</li>
                  <li>Easy Sharing with QR Codes</li>
                  <li>Card Profile Pictures</li>
                </ul>
              </p>
            </div>
          </div>
          <div class="col-md-6">
            <div class="h-100 p-5 bg-light border rounded-3">
              <h2>Examples</h2>
			  <a href="https://docs.google.com/presentation/d/1Me4xjeL-XBRkJaUgWIclAJZR7e82Vj7NvqZE5ANJElU/edit?usp=sharing">Presentation Slides</a>
              <p></p>
            </div>
          </div>
        </div>

        <footer class="pt-3 mt-4 text-muted border-top">
          <a href="../project/" target="_blank">
              Click here for the project report website.</a>
        </footer>
      </div>
    </main>
  </body>
</html>
