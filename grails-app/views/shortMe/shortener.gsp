<%--
  Created by IntelliJ IDEA.
  User: giovanni
  Date: 1/06/16
  Time: 12:38 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>ShortME! | URL shortener</title>
    <meta name="layout" content="shorten">

</head>

<body>


<!-- Header -->
<a name="about"></a>
<div class="intro-header">
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <div id="shortUrl">
                    <div class="intro-message">
                        <h1>Acorta tu URL</h1>
                        <h3></h3>
                        <form id="shortener">
                            <input type="text" class="form-control"
                                placeholder="Ejemplo: http://www.ulsaoaxaca.edu.mx" id="url" required>
                            <hr class="intro-divider">
                            <ul class="list-inline intro-social-buttons">
                                <li>
                                    <input type="submit" id="send" class="btn btn-primary btn-lg" value="Enviar">
                                </li>
                            </ul>
                        </form>
                    </div>
                </div>
                <div id="showUrl">
                    <div class="intro-message">
                        <h1>Genial!</h1>
                        <h3></h3>
                            <input type="text" class="form-control" id="resultUrl" required>
                            <hr class="intro-divider">
                            <ul class="list-inline intro-social-buttons">
                                <input type="submit" id="another" class="btn btn-primary btn-lg" value="¿Otro más?">
                            </ul>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- /.container -->

</div>

<g:javascript>
    $(document).ready(function() {
        $("#showUrl").fadeOut();

        $("#shortener").submit(function(e) {
            e.preventDefault();
            var url = $("#url").val();
            var token = '75a3d6fb9c7c29c32efde5be86392c77f022ae54';
            if (url != "") {
                console.log(url);
                $.ajax({
                    type: 'GET',
                    url: 'https://api-ssl.bitly.com/v3/shorten?access_token=' + token + '&longUrl=' + encodeURI(url),
                    success: function(result) {
                        console.log(result);
                        if (result.status_code === 200) {
                            $("#resultUrl").val(result.data.url);
                            $("#shortUrl").fadeToggle();
                            $("#showUrl").fadeToggle();
                            console.log(result.data);
                        } else {
                            bootbox.alert("Oops! Por favor verifica la URL que ingresaste.");
                        }

                    },
                    error: function(error) {
                        console.log(error);
                    }

                });
            }
        });

        $("#another").click(function() {
            $("#showUrl").fadeToggle();
            $("#shortUrl").fadeToggle();
        });

    });
</g:javascript>


</body>
</html>