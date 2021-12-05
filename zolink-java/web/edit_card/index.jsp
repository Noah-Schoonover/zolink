<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Zolink - Edit Card</title>
    <link rel="shortcut icon" type="image/png" href="favicon.png"/>

    <!-- Bootstrap core CSS -->
    <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles -->
    <link href="edit_card/card.css" rel="stylesheet">

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  </head>

  <body>


    <main>
      <div class="container py-4 text-center">

        <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column mb-5">
          <header class="masthead mb-auto">
            <div class="inner">
              <img class="masthead-brand" width="80px" src="assets/brand/logo-v2-zl.svg" alt="logo">
              <h3 class="masthead-brand">Zolink</h3>
              <nav class="nav nav-masthead justify-content-center">
                <a class="nav-link" href="MyCards">My Cards</a>
                <a class="nav-link" href="account_page/index.jsp">Account</a>
              </nav>
            </div>
          </header>
        </div>

		<form action="SaveCard" method="post">
			<c:choose>
				<c:when test="${card != null}">
					<input type="hidden" name="save_code" value="${card.code}">
					<input type="hidden" name="save_id" value="${card.id}">
				</c:when>
				<c:otherwise>
					<input type="hidden" name="save_code" value="new">
					<input type="hidden" name="save_id" value="new">
				</c:otherwise>
			</c:choose>

			<div class="card mx-auto text-center" style="width: 25rem;">
				<input name="card_name" class="mx-4 mt-1" type="text" placeholder="Card Name" value="${card.card_name}" required>
				<img class="profile-image" src="cards/assets/blank_profile_image.png" alt="Profile Image">


				<div class="card-body">
					<div class="list-group list-group-flush">
						<h5 class="card-title">
							<input class="w-100" name="name" type="text" placeholder="Name" value="${card.name}" required>
						</h5>
						<c:set var="infoNum" value="${1}"/>
						<c:if test="${card != null}">
							<c:forEach var="info" items="${card.info}">
								<div class="list-group-item">
									<div class="row">
										<div class="col-11 px-0">
											<input type="text" class="w-100" name="${infoNum}" placeholder="Enter some info" value="${info.data}">
										</div>
										<div class="col-1 px-0">
											<a href="#"><img width="25px" style="margin-left: 10px; margin-top: -5px" src="edit_card/assets/dash-circle.svg"></a>
										</div>
									</div>
								</div>
								<c:set var="infoNum" value="${infoNum + 1}"/>
							</c:forEach>
						</c:if>
			
						<div class="list-group-item">
							<div class="row">
								<input class="w-100" type="text" name="${infoNum}" placeholder="Enter some info">
							</div>
						</div>
						
					</div>

				</div>

			</div>

			<input type="submit" class="btn btn-primary mt-4" value="Save">

		</form>

      </div>
    </main>

  </body>
</html>
