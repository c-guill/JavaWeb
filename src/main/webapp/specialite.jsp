<%--
  Created by IntelliJ IDEA.
  User: RG21262
  Date: 10/01/2024
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="fr.fisa.javaweb.beans.Specialite" %>
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
        <label for="specialite">Options :</label>
        <select id="specialite" name="specialite">

            <option value="option2">Option 2</option>
            <option value="info"  >Info</option>
            <option value="option3">Option 3</option>
        </select>

        <button type="submit" formaction="home">Valider</button>
    </form>

    </section>
</main><!-- End #main -->
</body>
</html>
