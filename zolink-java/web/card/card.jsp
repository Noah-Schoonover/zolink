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

	<script src="card/script.js"></script>
	<script src="https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.js"></script>

  </head>

  <body>

	<%@ page isELIgnored="false" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <main>
      <div class="container py-4 text-center">

        <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column mb-5">
          <header class="masthead mb-auto">
            <div class="inner">
              <img class="masthead-brand" width="80px" src="assets/brand/logo-v2-zl.svg" alt="logo">
              <h3 class="masthead-brand">Zolink</h3>
              <nav class="nav nav-masthead justify-content-center">
				<c:if test="${user != null}">
					<a class="nav-link" href="/apollo14/zolink/cards/index.jsp">My Cards</a>
					<a class="nav-link" href="account_page/">Account</a>
				</c:if>
              </nav>
            </div>
          </header>
        </div>


        </header>

        <div class="card mx-auto text-center" style="width: 25rem;">
			<div class="text-left text-secondary">
				<p>${card.card_name}</p>
			</div>
			<img class="profile-image" src="card/assets/blank_profile_image.png" alt="Profile Image">

			<div class="card-body">
				<h5 class="card-title">${card.name}</h5>

				<ul id="infoUL" class="list-group list-group-flush">
					<c:forEach var="info" items="${card.info}">
						<li class="list-group-item">${info.data}</li>
					</c:forEach>
				</ul>

				<ul id="qrUL" style="display: none" class="list-group list-group-flush">
					<li id="qrCodeContainer" class="list-group-item mx-auto d-block mt-5"></li>
				</ul>

				<script type="text/javascript">
					var qrcode = new QRCode(document.getElementById("qrCodeContainer"), {
						text: "http://zolink.me/" + "${card.code}",
						width: 250,
						height: 250,
						colorDark : "#3e2145",
						colorLight : "#ffffff",
						correctLevel : QRCode.CorrectLevel.H
					});
				</script>

			</div>

			</div>
			<button type="button" id="qrBtn" onclick="flip_card()" class="btn btn-primary mt-4">QR Code</button>

      </div>
    </main>

  </body>
</html>
