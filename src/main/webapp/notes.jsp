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
        <h1>Sélectionnez un Semestre :</h1>

        <form class="row g-3 " method="post" novalidate>
            <select name="semestre" class="form-select" >
                <option value="1">Semestre 1</option>
                <option value="2">Semestre 2</option>
            </select>

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

            <%
                ArrayList<Float> etudiantNotes = (ArrayList<Float>) session.getAttribute("ListeNotesTri");
                ArrayList<String> details = (ArrayList<String>) session.getAttribute("details");
                String module = "";
                String semestre = "";
                if (details!=null){
                    module = details.get(0);
                    semestre = details.get(1);
                }

            %>
            <h2> Notes <%= module %> pour le semestre <%= semestre %></h2>
            <%
                if (etudiantNotes != null) {
                    for (int i=0;i<etudiantNotes.size();i++) {
                        Float note = etudiantNotes.get(i);


            %>
            <p> Note n° <%= i+1 %> : <%= note %> </p>
            <%
                    }
            } else {
            %>
            <p>Aucune Note pour ce semestre et ce module.</p>
            <%
                }
            %>
        </form>



    </section>
</main><!-- End #main -->
</body>
</html>
