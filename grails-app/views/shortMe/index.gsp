<%--
  Created by IntelliJ IDEA.
  User: giovanni
  Date: 1/06/16
  Time: 12:09 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="landing">
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="306825591740-ibgjqls01tg2ii2k73c8u5dfs6qq3gtr.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
</head>

<body>
<!-- Header -->
<a name="about"></a>
<div class="intro-header">
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <div class="intro-message">
                    <h1>ShortME!</h1>
                    <h3>Acorta URLs y mira tus archivos de Drive!</h3>
                    <hr class="intro-divider">
                    <p>Inicia Sesión con Google</p>
                    <ul class="list-inline intro-social-buttons">
                        <li>
                            <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
    <!-- /.container -->

</div>
<g:javascript>
    function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());


        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
        window.location.href = "${createLink(controller: 'shortMe', action: 'shortener')}";
    };
</g:javascript>
</body>
</html>