<%@ page import="java.util.ArrayList" %>
<%@ page import="fr.fisa.javaweb.beans.*" %>
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
            <h2>Inscription d'étudiant</h2>

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
                    <div class="">
                        <label for="specialite" class="form-label">Choississez la spécialité à inscrire</label>
                        <select id="specialite" name="specialite" class="form-select" >
                            <% User user = (User) session.getAttribute("user");
                                if (user instanceof Administrateur) {
                                    ArrayList<Specialite> specialites = (ArrayList<Specialite>) session.getAttribute("specialite");
                                    if(specialites != null){
                                        for(Specialite specialite : specialites){%>
                                            <option value="<%=specialite.getNom()%>"><%=specialite.getNom()%></option>
                                        <%}
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <div class="d-flex justify-content-center">
                        <%  user = (User) session.getAttribute("user");
                            if (user instanceof Etudiant) {%>
                                <button class="btn btn-primary" type="submit" >Aucun droit</button>
                            <%} else {%>
                                <button class="btn btn-primary" type="submit" formaction="home">Inscrire étudiant</button>
                            <%}
                        %>
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
