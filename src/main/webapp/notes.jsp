<%--
  Created by IntelliJ IDEA.
  User: RG21262
  Date: 10/01/2024
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="fr.fisa.javaweb.beans.*" %>
<%@ page import="fr.fisa.javaweb.beans.Module" %>
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
            <h2>Notes étudiants</h2>

        </div>
    </section><!-- End Breadcrumbs -->

    <section class="inner-page">
        <div class="container">
            <h5><i>Sélectionnez un semestre :</i></h5>
            <form class="row g-3 form-supply" method="post" novalidate>
                <div class="supply-select-button">
                    <select name="semestre" class="form-select" >
                        <option value="1">Semestre 1</option>
                        <option value="2">Semestre 2</option>
                        <option value="3">Semestre 3</option>
                        <option value="4">Semestre 4</option>
                        <option value="5">Semestre 5</option>
                        <option value="6">Semestre 6</option>
                        <option value="7">Semestre 7</option>
                        <option value="8">Semestre 8</option>
                        <option value="9">Semestre 9</option>
                        <option value="10">Semestre 10</option>
                    </select>
                    <select name="module" class="form-select" style="margin-left: 20px">
                        <% ArrayList<Module> modules = (ArrayList<Module>) session.getAttribute("module");
                            if(modules != null){
                                for( int i = 0 ; i <  modules.size(); i++){
                                    Module module =modules.get(i);%>
                                    <option value="<%=i%>"><%=module.getNom()%></option>
                                <%}
                            }
                        %>
                    </select>
                    <%  User user = (User) session.getAttribute("user");
                        if (user instanceof Administrateur) {%>
                            <button class="btn btn-primary" type="submit" >Aucun droit</button>
                        <%} else {%>
                            <button class="btn btn-primary" type="submit" formaction="home">Valider</button>
                        <%}
                    %>
                </div>
                <%  if (user instanceof Etudiant) {
                        ArrayList<Float> etudiantNotes = (ArrayList<Float>) session.getAttribute("ListeNotesTri");
                        ArrayList<String> details = (ArrayList<String>) session.getAttribute("details");
                        String module = "";
                        String semestre = "";
                        if (details!=null){
                            module = details.get(0);
                            semestre = details.get(1);
                        }%>
                        <h2> Notes <%= module %> pour le semestre <%= semestre %></h2>
                        <table class="table table-bordered table-hover" style="width: 500px; border-radius: 10px">
                            <thead>
                            <tr>
                                <th scope="col">N° #</th>
                                <th scope="col">Notes</th>
                            </tr>
                            </thead>
                            <tbody>
                                <%
                                    if (etudiantNotes != null) {
                                        for (int i=0;i<etudiantNotes.size();i++) {
                                            Float note = etudiantNotes.get(i);%>
                                            <tr>
                                                <td><%= i+1 %></td>
                                                <td><%= note %></td>
                                            </tr>
                                        <%}
                                    } else {%>
                                        <p>Aucune note pour ce semestre et ce module.</p>
                                    <%}
                                %>
                            </tbody>
                        </table>
                <%} else {%>
                    <p style="color: rgb(197,194,194)"><i>L'accès n'est disponible que si l'utilisateur est un étudiant.</i></p>
                <%}%>
            </form>
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
