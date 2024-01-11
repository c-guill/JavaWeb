<%--
  Created by IntelliJ IDEA.
  User: RG21262
  Date: 10/01/2024
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="fr.fisa.javaweb.beans.Specialite" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="fr.fisa.javaweb.beans.Etudiant" %>
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
    <h1>Sélectionnez une option :</h1>

    <form class="row g-3 " method="post" novalidate>
        <select name="specialite" class="form-select" >
            <% ArrayList<Specialite> specialites = (ArrayList<Specialite>) session.getAttribute("specialite");
                if(specialites != null){
                    for( int i = 0 ; i <  specialites.size(); i++){
                        Specialite specialite =specialites.get(i);%>
            <option value="<%=i%>"><%=specialite.getNom()%></option>
            <% }
            }%>
        </select>
        <button type="submit" formaction="home">Valider</button>
    </form>

        <%
            ArrayList<Etudiant> etudiants = (ArrayList<Etudiant>) session.getAttribute("ListeEtudiantTri");
            if (etudiants != null) {
                for (int i = 0; i < etudiants.size(); i++) {
                    Etudiant etu = etudiants.get(i);

        %>
        <p><%= etu.getINE() %> <%= etu.getName() %> <%= etu.getPrenom() %></p>
        <%
            }
        } else {
        %>
        <p>Aucune spécialité trouvée dans la session.</p>
        <%
            }
        %>

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
