<%@ page import="fr.fisa.javaweb.beans.Specialite" %><%--
  Created by IntelliJ IDEA.
  User: w136761
  Date: 10/01/2024
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
    <section class="inner-page">
        <div class="container d-flex justify-content-center login-register-form">
            <div class=" col-md-4 flex-column justify-content-center">
                <img src="assets/img/student.png" class="col-12 d-flex justify-content-center">
                <form class="row g-3 " method="post" novalidate>
                    <div class="">
                        <label for="nom" class="form-label">Nom de l'étudiant</label>
                        <input type="text" class="form-control " id="nom" name="nom" required>
                    </div>

                    <div class="">
                        <label for="prenom" class="form-label">Prenom</label>
                        <input type="text" class="form-control" id="prenom" name="prenom" required>
                    </div>
                    <div class="">
                        <label for="INE" class="form-label">INE</label>
                        <input type="text" class="form-control" id="INE" name="INE" required>
                    </div>
                    <div class="">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" name="password" id="password" required>
                    </div>
                    <select name="specialite" class="form-select" >
<%--                        <option selected>Sélectionner la spécialité</option>--%>
                        <%for( Specialite specialite : Specialite.values()){%>
                        <option value="<%=specialite%>"><%=specialite%></option>

                        <% }%>
                    </select>
                    <div class="d-flex justify-content-center">
                        <input class="btn btn-primary" type="submit" formaction="home">Inscrire étudiant</input>
                    </div>
                </form>
            </div>
        </div>
    </section>
</body>
</html>
