<%@ page import="fr.fisa.javaweb.beans.User" %>
<%@ page import="fr.fisa.javaweb.beans.Etudiant" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="fr.fisa.javaweb.beans.Module" %><%--
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
                    <label for="module" class="form-label">Choississez le module à évaluer</label>
                    <select id="module" name="module" class="form-select" >
                        <% User user = (User) session.getAttribute("user");
                            if(user instanceof Etudiant){
                                Etudiant etudiant = (Etudiant) user;
                                ArrayList<Module> modules = etudiant.getSpecialite().getListeModule();
                                for (Module module : modules){
                                    if(!etudiant.getEvaluations().containsKey(module)){ %>
                        <option value="<%=module.getNom()%>"><%=module.getNom()%></option>


                        <%}
                                }

                            }
                        %>
                    </select>
                    <div class="">
                        <label for="supports" class="form-label">Qualité des supports pédagiques (/100)</label>
                        <input type="number" name="supports" id="supports" class="form-control" />
                    </div>

                    <div class="">
                        <label for="equipe" class="form-label">Qualité de l'équipe pédagogique (/100)</label>
                        <input type="number" name="equipe" id="equipe" class="form-control" />
                    </div>

                    <div class="">
                        <label for="time" class="form-label">temps consacrer aux activités (/100)</label>
                        <input type="number" name="time" id="time" class="form-control" />
                    </div>

                    <div class="">
                        <label for="commentaire" class="form-label">Commentaire sur le module</label>
                        <textarea class="form-control" name="commentaire" id="commentaire" rows="3"></textarea>
                    </div>
                    <div class="d-flex justify-content-center">
                        <input class="btn btn-primary" type="submit" formaction="home" value="Ajouter évaluation">
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
