<%--
  Created by IntelliJ IDEA.
  User: giovanni
  Date: 1/06/16
  Time: 12:10 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title><g:layoutTitle default="Grails"/></title>

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'landing-page.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/font', file: 'font-awesome.css')}" type="font/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <meta name="google-signin-client_id" content="306825591740-ibgjqls01tg2ii2k73c8u5dfs6qq3gtr.apps.googleusercontent.com">


    <asset:javascript src="jquery.js"/>
    <asset:javascript src="bootstrap.js"/>
    <asset:javascript src="bootbox.min.js"/>
    <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
    <g:layoutHead/>
</head>

<body>
<!-- Navigation -->
<nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
    <div class="container topnav">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand topnav" href="${createLink(controller: 'shortMe',
                    action: 'shortener')}">ShortME! <small>Powered by bit.ly</small></a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#" onclick="signOut();">Cerrar Sesión</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>

<script>

    function signOut() {
        var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function () {
            console.log('User signed out.');
            window.location.href = "${createLink(controller: 'shortMe', action: 'index')}";
        });
    }

    function onLoad() {
        gapi.load('auth2', function() {
            gapi.auth2.init();
        });
    }

</script>
<g:layoutBody/>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <ul class="list-inline">
                    <li>
                        Compartir en Facebook o Twitter
                        <div id="fb-root"></div>
                        <div class="fb-share-button" data-href="http://www.ulsaoaxaca.edu.mx" data-layout="button_count" data-mobile-iframe="false"></div>
                        <a href="https://twitter.com/share" class="twitter-share-button"
                           data-text="Ordinario de Programación Web! #ulsaoaxaca"
                            data-url="http://www.ulsaoaxaca.edu.mx"
                           >Tweetear</a>
                    </li>




                </ul>
                <p class="copyright text-muted small">Copyright &copy; Dimort Inc. 2016. All Rights Reserved</p>
            </div>
        </div>
    </div>
</footer>
<script>
    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s);
        js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.6";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));


    !function(d,s,id) {
        var js,
                fjs = d.getElementsByTagName(s)[0],
                p = /^http:/.test(d.location)?'http':'https';
        if(! d.getElementById(id)) {
            js=d.createElement(s);js.id=id;
            js.src= p + '://platform.twitter.com/widgets.js';
            fjs.parentNode.insertBefore(js,fjs);
        }
    }(document, 'script', 'twitter-wjs');
</script>
</body>
</html>