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
            <h2>Accueil</h2>

        </div>
    </section><!-- End Breadcrumbs -->

    <section class="inner-page">
        <div class="container">
            <p>Il s'agit d'un site web appelé "INSA-Stu" qui vise à gérer les notes des étudiants au sein d'un service de scolarité. Voici une description des principales fonctionnalités de l'application :</p>
            <ul class="list-group" style="margin-bottom: 20px">
                <li class="list-group-item list-group-item-action"><b>Inscription d'un étudiant :</b> Un formulaire permettant d'inscrire un étudiant en fournissant son nom, prénom, spécialité, et INE.</li>
                <li class="list-group-item list-group-item-action"><b>Saisie des notes :</b>  Un formulaire pour saisir la note d'un étudiant, incluant le nom, prénom, l'intitulé du module, et la note dans ce module.</li>
                <li class="list-group-item list-group-item-action"><b>Liste des étudiants par spécialité :</b>  Affichage de la liste des étudiants selon leur spécialité.</li>
                <li class="list-group-item list-group-item-action"><b>Affichage des notes par module :</b>  Visualisation des notes des étudiants dans un module spécifique.</li>
                <li class="list-group-item list-group-item-action"><b>Authentification des étudiants / admin:</b>  Les étudiants peuvent s'authentifier dans l'application.</li>
                <li class="list-group-item list-group-item-action"><b>Accès aux notes par semestre et par module :</b>  Permet aux étudiants d'accéder à leurs notes classées par semestre et module.</li>
                <li class="list-group-item list-group-item-action"><b>Évaluation des modules :</b>  Les étudiants peuvent évaluer les modules suivis en fournissant des critères d'évaluation tels que la qualité des supports pédagogiques, l'équipe pédagogique, le temps consacré, etc., accompagnés d'un champ de commentaire libre.</li>
                <li class="list-group-item list-group-item-action"><b>Affichage des résultats d'évaluation sous forme graphique :</b>  Présentation des résultats d'évaluation sous forme de graphiques tels que des histogrammes ou des graphiques circulaires, ainsi que les commentaires des étudiants.</li>
            </ul>
            <p>
                L'application utilise le modèle MVC2, avec une seule Servlet (ServletCentrale.java) qui initialise les listes de spécialités et de modules. Les utilisateurs sont distingués en deux types : administrateurs et étudiants. Les administrateurs peuvent effectuer les actions d'inscription, de saisie des notes, d'affichage des listes, et d'affichage des résultats d'évaluation. Les étudiants ont accès à l'authentification, à l'affichage de leurs propres notes, et à l'évaluation des modules.
                <br style="height: 30px">Les formulaires sont soumis à la ServletCentrale, qui utilise des Java Beans pour enregistrer les données avant de rediriger vers la page d'accueil. L'application propose également des fonctionnalités de filtrage des listes et des évaluations par module ou
            </p>
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