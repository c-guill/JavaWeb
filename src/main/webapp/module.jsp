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
<%@ page import="fr.fisa.javaweb.beans.Module" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
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
            <h2>Notes étudiants par module</h2>

        </div>
    </section><!-- End Breadcrumbs -->

    <section class="inner-page">
        <div class="container">
            <h5><i>Sélectionnez un module :</i></h5>
            <form class="row g-3 form-supply" method="post" novalidate>
                <div class="supply-select-button">
                    <select name="module" class="form-select" >
                        <% ArrayList<Module> modules = (ArrayList<Module>) session.getAttribute("module");
                            if(modules != null) {
                                for( int i = 0 ; i <  modules.size(); i++){
                                    Module module =modules.get(i);%>
                                    <option value="<%=i%>"><%=module.getNom()%></option>
                                <%}
                            }
                        %>
                    </select>
                    <button class="btn btn-primary" type="submit" formaction="home">Valider</button>
                </div>
            </form>
            <h2><%String module = (String)session.getAttribute("ModuleToGet");%><%=module%></h2>
            <table class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th scope="col">INE</th>
                    <th scope="col">Nom</th>
                    <th scope="col">Prénom</th>
                    <th scope="col">Spécialité</th>
                    <th scope="col">Notes</th>
                </tr>
                </thead>
                <tbody>
                <%
                    ArrayList<HashMap> etudiantNotes = (ArrayList<HashMap>) session.getAttribute("ListeEtudiantNote");
                    ArrayList<Etudiant> etudiants = (ArrayList<Etudiant>) session.getAttribute("ListeEtudiantID");
                    if (etudiantNotes != null) {
                        for (HashMap<Integer, Float> etudiantNoteMap : etudiantNotes) {
                            // Parcourir les entrées de la HashMap
                            for (Map.Entry<Integer, Float> entry : etudiantNoteMap.entrySet()) {
                                Integer numetu = entry.getKey();
                                Float note = entry.getValue();%>
                                <tr>
                                    <td><%=etudiants.get( numetu).getINE()%></td>
                                    <td><%= etudiants.get(numetu).getName()%></td>
                                    <td><%= etudiants.get(numetu).getPrenom()%></td>
                                    <td><%= etudiants.get(numetu).getSpecialite().getNom()%></td>
                                    <td><%= note %></td>
                                </tr>
                            <%}
                        }
                    } else {%>
                        <p>Aucune spécialité trouvée dans la session.</p>
                    <%}
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
