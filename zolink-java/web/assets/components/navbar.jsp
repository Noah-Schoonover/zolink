<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column mb-5 text-center">
	<header class="masthead mb-auto">
		<div class="inner">
			<a class="text-white text-decoration-none" href="/apollo14/zolink/">
				<img class="masthead-brand" width="80px" src="/apollo14/zolink/assets/brand/logo-v2-zl.svg" alt="logo">
				<h3 class="masthead-brand">Zolink</h3>
			</a>
			<nav class="nav nav-masthead justify-content-center">
				<c:if test="${user != null}">
					<c:choose>
						<c:when test="${param.activeLink == 'My Cards'}">
							<a class="nav-link active" href="/apollo14/zolink/MyCards">My Cards</a>
						</c:when>
						<c:otherwise>
							<a class="nav-link" href="/apollo14/zolink/MyCards">My Cards</a>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${param.activeLink == 'Account'}">
							<a class="nav-link active" href="/apollo14/zolink/account/">Account</a>
						</c:when>
						<c:otherwise>
							<a class="nav-link" href="/apollo14/zolink/account/">Account</a>
						</c:otherwise>
					</c:choose>
				</c:if>
			</nav>
		</div>
	</header>
</div>
