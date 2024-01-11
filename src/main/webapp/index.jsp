<%@include file="header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<body>
<main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
        <div class="container">
            <br>
            <h2>Authentification - Se Connecter</h2>

        </div>
    </section><!-- End Breadcrumbs -->

    <section class="inner-page">
        <div class="container d-flex justify-content-center login-register-form">
            <div class=" col-md-4 flex-column justify-content-center">
                <img src="assets/img/identification.png" class="col-12 d-flex justify-content-center">
                <form class="row g-3 " method="post" novalidate>
                    <div class="">
                        <label for="name" class="form-label">Nom d'utilisateur</label>
                        <input type="text" class="form-control " id="name" name="name" aria-describedby="emailHelp" required>
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                        <div class="invalid-feedback">
                            Email incorrect.
                        </div>
                    </div>

                    <div class="">
                        <label for="password" class="form-label">Mot de passe</label>
                        <input type="password" class="form-control " id="password" name="password" required>
                        <div class="valid-feedback">
                            C'est bon!
                        </div>

                        <div class="invalid-feedback">
                            Mauvaise mot de passe!
                        </div>
                    </div>

                    <div class="d-flex justify-content-center">
                        <button class="btn btn-primary" type="submit" formaction="home">Se Connecter</button>
                    </div>
                </form>
            </div>
        </div>
    </section>

</main><!-- End #main -->

<%@include file="footer.jsp"%>


<div id="preloader"></div>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="assets/vendor/aos/aos.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
<script src="assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

</body>
</html>