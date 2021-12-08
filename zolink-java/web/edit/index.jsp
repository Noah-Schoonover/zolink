<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Zolink - Edit Card</title>
    <link rel="shortcut icon" type="image/png" href="/apollo14/zolink/favicon.png"/>

    <!-- Bootstrap core CSS -->
    <link href="/apollo14/zolink/assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles -->
    <link href="/apollo14/zolink/assets/styles/card.css" rel="stylesheet">

	<script src="/apollo14/zolink/assets/scripts/edit.js"></script>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  </head>

  <body>


    <main>
      <div class="container py-4 text-center">

        <jsp:include page='../assets/components/navbar.jsp'>
			<jsp:param name="activeLink" value="none" />
		</jsp:include>

		<form autocomplete="off" action="SaveCard" method="post">
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
				<img class="profile-image" src="/apollo14/zolink/assets/images/blank_profile_image.png" alt="Profile Image">


				<div class="card-body">
					<div id="zolink-list-group" class="list-group list-group-flush">
						<h5 class="card-title">
							<input class="w-100" name="name" type="text" placeholder="Name" value="${card.name}" required>
						</h5>
						<c:set var="infoNum" value="${1}"/>
						<c:if test="${card != null}">
							<c:forEach var="info" items="${card.info}">
								<div class="list-group-item">
									<div class="row">
										<div id="inputColumn" class="col-11 px-0">
											<input type="text" class="w-100 zolink-info-field" name="${infoNum}" onkeyup='allocate_field();' placeholder="Enter some info" value="${info.data}">
										</div>
										<div id="minusColumn" class="col-1 px-0">
											<a href="#"><img onclick="remove_field(this); return false;" width="25px" style="margin-left: 10px; margin-top: -5px" src="/apollo14/zolink/assets/images/dash-circle.svg"></a>
										</div>
									</div>
								</div>
								<c:set var="infoNum" value="${infoNum + 1}"/>
							</c:forEach>
						</c:if>
			
						<div class="list-group-item">
							<div class="row">
								<div id="inputColumn" class="px-0">
									<input class="w-100 zolink-info-field" onkeyup='allocate_field();' type="text" name="${infoNum}" placeholder="Enter some info">
								</div>
								<div id="minusColumn" class="px-0">
								</div>
							</div>
						</div>
						
					</div>

				</div>

			</div>

			<input type="submit" class="btn btn-primary mt-4" value="Save">

		</form>

		<form class=" my-4" action="DeleteCard" method="post">
			<c:choose>
				<c:when test="${card != null}">
					<input type="hidden" name="delete_id" value="${card.id}">
				</c:when>
				<c:otherwise>
					<input type="hidden" name="delete_id" value="new">
				</c:otherwise>
			</c:choose>
			<a href="#" class="link-danger" onclick="this.closest('form').submit();return false;">delete card</a>
		</form>

      </div>
    </main>

  </body>
</html>
