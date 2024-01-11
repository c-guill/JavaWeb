<%@ page import="fr.fisa.javaweb.beans.Specialite" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="fr.fisa.javaweb.beans.Module" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Set" %>
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
                <form class="row g-3 " method="post" novalidate>
                    <div class="">
                        <label for="nom" class="form-label">Nom de l'étudiant</label>
                        <input type="text" class="form-control " id="nom" name="nom-etu" required>
                    </div>
                    <div class="">
                        <label for="INE" class="form-label">INE</label>
                        <input type="text" class="form-control" id="INE" name="INE" required>
                    </div>
                    <div class="">
                        <label for="modules">Sélectionner un module:</label>
                        <select name="modules" id="modules" class="form-select">
                            <%
                                Set<String> uniqueModules = new HashSet<>(); // Using a set to store unique module names
                                ArrayList<Specialite> specialites = (ArrayList<Specialite>) session.getAttribute("specialite");

                                if (specialites != null) {
                                    for (Specialite specialite : specialites) {
                                        if (specialite.getListeModule() != null) {
                                            for (Module module : specialite.getListeModule()) {
                                                uniqueModules.add(module.getNom()); // Adding module name to the set
                                            }
                                        }
                                    }
                                }

                                for (String moduleName : uniqueModules) { %>
                                    <option value="<%= moduleName %>"><%= moduleName %></option>
                                <% }
                            %>
                        </select>
                    </div>
                    <div class="">
                        <label for="semester" class="form-label">Semestre</label>
                        <input type="number" class="form-control" id="semester" name="semester" max="10" required>
                    </div>
                    <div class="">
                        <label for="notes" class="form-label">Notes</label>
                        <input type="number" class="form-control" id="notes" name="notes" step="0.01" placeholder="0.00" required>
                    </div>
                    <div class="d-flex justify-content-center">
                        <button class="btn btn-primary" type="submit" formaction="home">Entrer notes d'étudiant</button>
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