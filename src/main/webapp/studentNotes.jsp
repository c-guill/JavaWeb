<%@ page import="fr.fisa.javaweb.beans.Specialite" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
            <h2>Saisir la note d'étudiant</h2>

        </div>
    </section><!-- End Breadcrumbs -->

    <section class="inner-page">
        <div class="container d-flex justify-content-center login-register-form">
            <div class=" col-md-4 flex-column justify-content-center">
                <img src="assets/img/Enter_data.png" class="col-12 d-flex justify-content-center">
                <form class="row g-3 " novalidate>
                    <div class="">
                        <label for="nom" class="form-label">Nom de l'étudiant</label>
                        <input type="text" class="form-control " id="nom" required>
                    </div>

                    <div class="">
                        <label for="prenom" class="form-label">Prénom</label>
                        <input type="text" class="form-control" id="prenom" required>
                    </div>
                    <div class="">
                        <label for="nom-module" class="form-label">Nom de module</label>
                        <input type="text" class="form-control" id="nom-module" required>
                    </div>
                    <div class="">
                        <label for="notes" class="form-label">Notes</label>
                        <input type="number" class="form-control" id="notes" required>
                    </div>
                    <div class="d-flex justify-content-center">
                        <button class="btn btn-primary" type="button">Entrer notes d'étudiant</button>
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