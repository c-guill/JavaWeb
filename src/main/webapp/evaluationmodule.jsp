<%--
  Created by IntelliJ IDEA.
  User: w136761
  Date: 11/01/2024
  Time: 08:26
  To change this template use File | Settings | File Templates.
--%>
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
            <h2>Notation de module</h2>

        </div>
    </section><!-- End Breadcrumbs -->

    <section class="inner-page">
        <div class="container d-flex justify-content-center login-register-form">
            <div class=" col-md-4 flex-column justify-content-center">
                <img src="assets/img/student.png" class="col-12 d-flex justify-content-center">
                <form class="row g-3 " method="post" novalidate>
                    <div class="">
                        <label for="nom" class="form-label">Nom de l'étudiant</label>
                        <input type="text" class="form-control " id="nom" name="nom" required>
                    </div>

                    <div class="">
                        <label for="prenom" class="form-label">Prenom</label>
                        <input type="text" class="form-control" id="prenom" name="prenom" required>
                    </div>
                    <div class="">
                        <label for="INE" class="form-label">INE</label>
                        <input type="text" class="form-control" id="INE" name="INE" required>
                    </div>
                    <div class="">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" name="password" id="password" required>
                    </div>
                    <select name="specialite" class="form-select" >
                    </select>
                    <div class="d-flex justify-content-center">
                        <input class="btn btn-primary" type="submit" formaction="home" value="Inscrire étudiant">
                    </div>
                </form>
            </div>
        </div>
    </section>

</main><!-- End #main -->



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
<%@include file="footer.jsp"%>

</html>
