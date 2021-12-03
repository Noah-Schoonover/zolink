<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Zolink Card</title>
    <link rel="shortcut icon" type="image/png" href="favicon.png"/>

    <!-- Bootstrap core CSS -->
    <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles -->
    <link href="card/card.css" rel="stylesheet">

  </head>

  <body>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <main>
      <div class="container py-4 text-center">

        <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column mb-5">
          <header class="masthead mb-auto">
            <div class="inner">
              <img class="masthead-brand" width="80px" src="assets/brand/logo-v2-zl.svg" alt="logo">
              <h3 class="masthead-brand">Zolink</h3>
              <nav class="nav nav-masthead justify-content-center">
                <a class="nav-link" href="#">My Cards</a>
                <a class="nav-link" href="account_page/index.html">Account</a>
              </nav>
            </div>
          </header>
        </div>


        </header>

        <div class="card mx-auto text-center" style="width: 25rem;">
			<p>name: ${card.card_name}; id: ${card.id}; user: ${card.user_id}; private: ${card.private_card}</p>
			<img class="profile-image" src="card/assets/blank_profile_image.png" alt="Profile Image">

			<div class="card-body">
			  <h5 class="card-title">${card.name}</h5>

			  <ul class="list-group list-group-flush">
				  <li class="list-group-item">555-555-5555</li>
				  <li class="list-group-item">myles.willis@student.nmt.edu</li>
				  <li class="list-group-item">Morbi leo risus</li>
				  <li class="list-group-item">Porta ac consectetur ac</li>
				  <li class="list-group-item">test: ${testAttr}</li>

				  <c:forEach var="info" items="${card.info}">
					  <li class="list-group-item">${info.data}</li>
				  </c:forEach>
			  </ul>

			</div>

			</div>
			<a href="#" class="btn btn-primary mt-4">QR Code</a>

      </div>
    </main>

  </body>
</html>
