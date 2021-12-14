<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Zolink Card</title>
    <link rel="shortcut icon" type="image/png" href="/favicon.png"/>

    <!-- Bootstrap core CSS -->
    <link href="/assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles -->
    <link href="/assets/styles/card.css" rel="stylesheet">

	<script src="/assets/scripts/card.js"></script>
	<script src="https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.js"></script>

  </head>

  <body>

	<%@ page isELIgnored="false" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <main>
      <div class="container py-4 text-center">

		<jsp:include page='../assets/components/navbar.jsp'>
			<jsp:param name="activeLink" value="none" />
		</jsp:include>

        <div class="card mx-auto text-center">
			<div class="text-left text-secondary">
				<p><c:out value="${card.card_name}"/></p>
			</div>
			<img class="profile-image" src="/assets/images/blank_profile_image.png" alt="Profile Image">

			<div class="card-body">
				<h5 class="card-title"><c:out value="${card.name}"/></h5>

				<ul id="infoUL" class="list-group list-group-flush">
					<c:forEach var="info" items="${card.info}">
						<li class="list-group-item"><c:out value="${info.data}"/></li>
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
