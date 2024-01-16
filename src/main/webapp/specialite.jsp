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
            <h2>Spécialités des étudiants</h2>

        </div>
    </section><!-- End Breadcrumbs -->

    <section class="inner-page">
        <div class="container">
            <h5><i>Sélectionnez une spécialité :</i></h5>
            <form class="row g-3 form-supply" method="post" novalidate>
                <div class="supply-select-button">
                    <select name="specialite" class="form-select" >
                        <% ArrayList<Specialite> specialites = (ArrayList<Specialite>) session.getAttribute("specialite");
                            if(specialites != null){
                                for(int i = 0 ; i < specialites.size(); i++) {
                                    Specialite specialite =specialites.get(i);%>
                                    <option value="<%=i%>"><%=specialite.getNom()%></option>
                                <%}
                            }
                        %>
                    </select>
                    <button class="btn btn-primary" type="submit" formaction="home">Valider</button>
                </div>
            </form>
            <table class="table table-bordered table-hover" style="width: 900px">
                <thead>
                <tr>
                    <th scope="col">INE</th>
                    <th scope="col">Nom</th>
                    <th scope="col">Prénom</th>
                    <th scope="col">Spécialité</th>
                </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<Etudiant> etudiants = (ArrayList<Etudiant>) session.getAttribute("ListeEtudiantTri");
                        if (etudiants != null) {
                            for (int i = 0; i < etudiants.size(); i++) {
                                Etudiant etu = etudiants.get(i);%>
                                <tr>
                                    <td><%= etu.getINE()%></td>
                                    <td><%= etu.getName()%></td>
                                    <td><%= etu.getPrenom()%></td>
                                    <td><%= etu.getSpecialite().getNom()%></td>
                                </tr>
                            <%}
                        } else {%>
                            <p>Aucune spécialité trouvée dans la session.</p>
                        <%
                        }
                    %>
                </tbody>
            </table>
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
