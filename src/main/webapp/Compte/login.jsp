<%--
  Created by IntelliJ IDEA.
  User: RG21262
  Date: 10/01/2024
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <ol>
        <li><a href="/">Home</a></li>
        <li>Sign in</li>
    </ol>
    <h2>Sign in</h2>
</div>

<div class="container d-flex justify-content-center login-register-form">
    <div class=" col-md-4 flex-column justify-content-center">
        <img src="" alt="?">
        <form class="row g-3 " novalidate>
            <div class="">
                <label for="email" class="form-label">Email address</label>
                <input type="email" class="form-control " id="email" aria-describedby="emailHelp" required>
                <div class="valid-feedback">
                    Looks good!
                </div>
                <div class="invalid-feedback">
                    Email incorrect.
                </div>
            </div>

            <div class="">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control " id="password" required>
                <div class="valid-feedback">
                    Looks good!
                </div>

                <div class="invalid-feedback">
                    Wrong password.
                </div>
            </div>

            <div class="d-flex justify-content-center">
                <button class="btn btn-primary" type="button" onclick="submitLoginForm()">Sign in</button>
            </div>
            <p style="place-content: center; display: flex">New to INSA ?<a href="/register">Create an account now.</a></p>
        </form>
    </div>
</div>
</body>
</html>




<