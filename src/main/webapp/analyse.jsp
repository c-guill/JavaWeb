<%--
  Created by IntelliJ IDEA.
  User: w136761
  Date: 11/01/2024
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="fr.fisa.javaweb.beans.Module" %>
<%@ page import="fr.fisa.javaweb.beans.Evaluation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<body>
<link rel="stylesheet" href="assets/css/analyse.css">
<main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
        <div class="container">
            <br>
            <h2>Inscription d'étudiant</h2>

        </div>
    </section><!-- End Breadcrumbs -->

    <section class="inner-page">
        <h1>Sélectionnez une option :</h1>

        <form class="row g-3 " method="post" novalidate>
            <select name="module" class="form-select" >
                <% ArrayList<Module> modules = (ArrayList<Module>) session.getAttribute("module");
                    if(modules != null){
                        for(Module module : modules){%>
                <option value="<%=module.getNom()%>"><%=module.getNom()%></option>
                <% }
                }%>
            </select>


            <button type="submit" formaction="home">Valider</button>
        </form>

        <%ArrayList<Evaluation> evaluations = (ArrayList<Evaluation>) session.getAttribute("evaluations");%>
      <% if(evaluations != null){%>
        <p><%=evaluations.size()%></p>
        <svg viewBox="0 0 36 36" class="circle-svg">

            <path class="around" stroke-dasharray="100, 100" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"></path>

            <path class="percent" stroke-dasharray="<%evaluations%>, 100" d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"></path>

            <text x="18" y="14" text-anchor="middle" dy="7" font-size="20">3/10</text>

        </svg>
        <%}%>



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

