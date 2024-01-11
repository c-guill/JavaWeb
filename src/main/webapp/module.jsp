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
            <h2>Note étudiants</h2>

        </div>
    </section><!-- End Breadcrumbs -->

    <section class="inner-page">
        <h1>Sélectionnez un module :</h1>

        <form class="row g-3 " method="post" novalidate>
            <select name="module" class="form-select" >
                <% ArrayList<Module> modules = (ArrayList<Module>) session.getAttribute("module");
                    if(modules != null){
                        for( int i = 0 ; i <  modules.size(); i++){
                            Module module =modules.get(i);%>
                <option value="<%=i%>"><%=module.getNom()%></option>
                <% }
                }%>
            </select>
            <button type="submit" formaction="home">Valider</button>
        </form>

        <%
            ArrayList<HashMap> etudiantNotes = (ArrayList<HashMap>) session.getAttribute("ListeEtudiantNote");
            ArrayList<Etudiant> etudiants = (ArrayList<Etudiant>) session.getAttribute("ListeEtudiantID");
            if (etudiantNotes != null) {
                for (HashMap<Integer, Float> etudiantNoteMap : etudiantNotes) {
                    // Parcourir les entrées de la HashMap
                    for (Map.Entry<Integer, Float> entry : etudiantNoteMap.entrySet()) {
                        Integer numetu = entry.getKey();
                        Float note = entry.getValue();



        %>
        <p> <%= etudiants.get(numetu).getName() %> <%= etudiants.get(numetu).getPrenom() %>               | Note : <%= note %> </p>
        <%
                }
            }
        } else {
        %>
        <p>Aucune spécialité trouvée dans la session.</p>
        <%
            }
        %>

    </section>
</main><!-- End #main -->
</body>
</html>
