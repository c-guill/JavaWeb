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

    </section>
</main><!-- End #main -->
</body>
</html>
