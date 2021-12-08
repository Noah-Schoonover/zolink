<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Zolink Card</title>
    <link rel="shortcut icon" type="image/png" href="/apollo14/zolink/favicon.png"/>

    <!-- Bootstrap core CSS -->
    <link href="/apollo14/zolink/assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles -->
    <link href="/apollo14/zolink/assets/styles/card.css" rel="stylesheet">

  </head>

  <body>

	<%@ page isELIgnored="false" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <main>
      <div class="container py-4 text-center">

        <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column mb-5">
          <header class="masthead mb-auto">
            <div class="inner">
              <img class="masthead-brand" width="80px" src="/apollo14/zolink/assets/brand/logo-v2-zl.svg" alt="logo">
              <h3 class="masthead-brand">Zolink</h3>
              <nav class="nav nav-masthead justify-content-center">
				<c:if test="${user != null}">
					<a class="nav-link" href="MyCards">My Cards</a>
					<a class="nav-link" href="account/">Account</a>
				</c:if>
              </nav>
            </div>
          </header>
        </div>


        </header>

        <div class="card mx-auto text-center" style="width: 25rem;">
			<div class="text-left text-secondary">
				<p></p>
			</div>
			<img class="profile-image" src="/apollo14/zolink/assets/images/exclamation-circle.svg" alt="Card Not Found">

			<div class="card-body">
				<div class="my-5"></div>
				<div class="my-5"></div>
				<h5 class="card-title">Card Not Found</h5>

				<ul class="list-group list-group-flush">
						<li class="list-group-item">We couldn't find the card you're looking for.</li>
				</ul>

			</div>

			</div>

      </div>
    </main>

  </body>
</html>
