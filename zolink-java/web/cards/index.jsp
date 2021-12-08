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
    <link href="/apollo14/zolink/assets/styles/cards.css" rel="stylesheet">

  </head>

  <body>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <main>
      <div class="container py-4">

        <jsp:include page='../assets/components/navbar.jsp'>
			<jsp:param name="activeLink" value="My Cards" />
		</jsp:include>

		<c:if test="${user != null}">
			<c:forEach var="card" items="${user.cards}">
					<div class="card mx-auto" style="width: 25rem;">
						<div class="row row-no-gutters" style="height: 130px">
							<div class="col-10 pr-0">
								<a href="/apollo14/zolink/${card.code}">
									<div class="row align-items-center h-100 text-dark">
										<div class="col-4">
											<img class="profile-image mx-3 my-0" src="/apollo14/zolink/assets/images/blank_profile_image.png" alt="Profile Image">
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
									<input type="image" class="m-2" width="20em" src="/apollo14/zolink/assets/images/pencil.svg">
								</form>
							</div>
						</div>
					</div>

			</c:forEach>
		</c:if>

		<form action="/apollo14/zolink/EditCard" id="new_card_form" method="post">
			<input type="hidden" name="edit_code" value="new">
			<div onclick="submit_new_card_form()" class="add-card mx-auto">
			  <img class="add-image" src="/apollo14/zolink/assets/images/plus-lg.svg" alt="add card">
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
