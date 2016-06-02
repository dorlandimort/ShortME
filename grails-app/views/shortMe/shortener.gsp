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
    <script type="text/javascript" src="https://www.dropbox.com/static/api/2/dropins.js" id="dropboxjs" data-app-key="uu5cx9q3huq3q92"></script>


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
                        <h3>O comparte un archivo</h3>
                        <div id="dropbox"></div>
                        <br />
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
                                <li>
                                    <div id="twtButton"></div>
                                </li>
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

    var options = {

        // Required. Called when a user selects an item in the Chooser.
        success: function(files) {
            console.log("Here's the file link: " + files[0].link);
            $("#url").val(files[0].link);
        },

        // Optional. Called when the user closes the dialog without selecting a file
        // and does not include any parameters.
        cancel: function() {

        },

        // Optional. "preview" (default) is a preview link to the document for sharing,
        // "direct" is an expiring link to download the contents of the file. For more
        // information about link types, see Link types below.
        linkType: "preview", // or "direct"

        // Optional. A value of false (default) limits selection to a single file, while
        // true enables multiple file selection.
        multiselect: false, // or true

        // Optional. This is a list of file extensions. If specified, the user will
        // only be able to select files with these extensions. You may also specify
        // file types, such as "video" or "images" in the list. For more information,
        // see File types below. By default, all extensions are allowed.
        extensions: [],
    };

        var button = Dropbox.createChooseButton(options);
        document.getElementById("dropbox").appendChild(button);


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
                        if (result.status_code === 200) {
                            $.ajax({
                                type: 'GET',
                                url: '${createLink(controller: 'shortMe', action: '_twtButton')}',
                                data: {
                                    url: result.data.url
                                },
                                success: function(resulta) {
                                    $("#twtButton").html(resulta);
                                    twttr.widgets.load();
                                    FB.XFBML.parse();
                                }
                            });
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