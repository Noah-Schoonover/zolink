<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" type="image/png" href="/apollo14/zolink/favicon.png"/>
    <title>Account</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/cover/">

    <!-- Bootstrap core CSS -->
    <link href="/apollo14/zolink/assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/apollo14/zolink/assets/styles/account.css" rel="stylesheet">
  </head>

  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
  <body>

		<main>
		<div class="container py-4">
			<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
				<header class="masthead mb-auto">
				  <div class="inner">
					<img class="masthead-brand" width="80px" src="/apollo14/zolink/assets/brand/logo-v2-zl.svg" alt="logo">
					<h3 class="masthead-brand">Zolink</h3>
					<nav class="nav nav-masthead justify-content-center">
					  <c:if test="${user != null}">
						  <a class="nav-link" href="../MyCards">My Cards</a>
						  <a class="nav-link active" href="#">Account</a>
					  </c:if>
					</nav>
				  </div>
				</header>

				<div class="my-5"></div>

				<div class="pt-5 px-3">
				  <c:choose>
					  <c:when test="${user != null}">
						  <div class="email">
							<h3> Email: </h3>
							<span>${user.email}</span>
						  </div>
						  <div style="clear:both"></div>

						  <div class="password mt-5">
							<h3> Password: </h3>
							<span>***********</span>
						  </div>

						  <form class="form-inline mt-5 pt-5">
							  <button class="btn btn-primary btn-lg" onclick="location.href='/apollo14/zolink/Logout'" type="button">Logout</button>
						  </form>

					  </c:when>
					  <c:otherwise>
						  <h3 class="mb-5">You are not logged in.</h3>
						  <form class="form-inline">

							  <button class="btn btn-primary btn-lg" onclick="location.href='/apollo14/zolink/register/'" type="button">Register</button>

							  <button class="btn btn-primary btn-lg" onclick="location.href='/apollo14/zolink/login/'" type="button">Login</button>

						  </form>
					  </c:otherwise>
				  </c:choose>
				  <div style="clear:both"></div>
				</div>
			</div>
	   </div>
	   </main>

      <footer class="mastfoot mt-auto">
      </footer>

    </div>

  </body>
</html>
