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
    <link href="cards/card.css" rel="stylesheet">

  </head>

  <body>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <main>
      <div class="container py-4">

        <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column mb-5">
          <header class="masthead mb-auto">
            <div class="inner">
              <img class="masthead-brand" width="80px" src="assets/brand/logo-v2-zl.svg" alt="logo">
              <h3 class="masthead-brand">Zolink</h3>
              <nav class="nav nav-masthead justify-content-center">
                <a class="nav-link active" href="#">My Cards</a>
                <a class="nav-link" href="account/">Account</a>
              </nav>
            </div>
          </header>
        </div>

		<c:if test="${user != null}">
			<c:forEach var="card" items="${user.cards}">
					<div class="card mx-auto" style="width: 25rem;">
						<div class="row row-no-gutters" style="height: 130px">
							<div class="col-10 pr-0">
								<a href="/apollo14/zolink/${card.code}">
									<div class="row align-items-center h-100 text-dark">
										<div class="col-4">
											<img class="profile-image mx-3 my-0" src="cards/assets/blank_profile_image.png" alt="Profile Image">
										</div>
										<div class="col px-0">
											<div><h4>${card.card_name}</h4></div>
										</div>
									</div>
								</a>
							</div>
							<div class="col text-end">
								<form action="EditCard" method="post">
									<input type="hidden" name="edit_code" value="${card.code}" />
									<input type="image" class="m-2" width="20em" src="assets/pencil.svg">
								</form>
							</div>
						</div>
					</div>

			</c:forEach>
		</c:if>

		<form action="EditCard" id="new_card_form" method="post">
			<input type="hidden" name="edit_code" value="new">
			<div onclick="submit_new_card_form()" class="add-card mx-auto">
			  <img class="add-image" src="cards/assets/plus-lg.svg" alt="add card">
			</div>
		</form>

		<script type="text/javascript">
			function submit_new_card_form() {
				document.getElementById('new_card_form').submit();
			}

		</script>
                                  
      </div>
    </main>

  </body>
</html>
