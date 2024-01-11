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

        <button type="submit" formaction="home">Valider</button>
    </form>

    </section>
</main><!-- End #main -->
</body>
</html>
