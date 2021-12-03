<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Zolink Card</title>
    <link rel="shortcut icon" type="image/png" href="../favicon.png"/>

    <!-- Bootstrap core CSS -->
    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles -->
    <link href="card.css" rel="stylesheet">

  </head>

  <body>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <main>
      <div class="container py-4 text-center">

        <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column mb-5">
          <header class="masthead mb-auto">
            <div class="inner">
              <img class="masthead-brand" width="80px" src="../assets/brand/logo-v2-zl.svg" alt="logo">
              <h3 class="masthead-brand">Zolink</h3>
              <nav class="nav nav-masthead justify-content-center">
                <a class="nav-link" href="#">My Cards</a>
                <a class="nav-link" href="../account_page/index.html">Account</a>
              </nav>
            </div>
          </header>
        </div>


        <div class="card mx-auto text-center" style="width: 25rem;">           
            <div class="row row-no-gutters" style="height: 130px">
                <div class="col-sm">
                    <img class="profile-image" src="/apollo14/zolink/cards/assets/blank_profile_image.png" alt="Profile Image">
                </div>
                <div class="col-sm">
                    <div class="card-title"><h5>Myles Willis</h5></div>
                </div>
            </div>
        </div>
          
        <div class="card mx-auto text-center" style="width: 25rem;">           
            <div class="row row-no-gutters" style="height: 130px">
                <div class="col-sm">
                    <img class="profile-image" src="/apollo14/zolink/cards/assets/blank_profile_image.png" alt="Profile Image">
                </div>
                <div class="col-sm">
                    <div class="card-title"><h5>Noah Schoonover</h5></div>
                </div>
            </div>
        </div>
          
        <div class="card mx-auto text-center" style="width: 25rem;">           
            <div class="row row-no-gutters" style="height: 130px">
                <div class="col-sm">
                    <img class="profile-image" src="/apollo14/zolink/cards/assets/blank_profile_image.png" alt="Profile Image">
                </div>
                <div class="col-sm">
                    <div class="card-title"><h5>Adam Schmidt</h5></div>
                </div>
            </div>
        </div> 
          
        <div class="add-card mx-auto">
          <img class="add-image" src="assets/plus-lg.svg" alt="add card">
        </div>
                                  
      </div>
    </main>

  </body>
</html>
