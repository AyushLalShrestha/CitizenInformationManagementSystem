
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Temporary test page</title>
        <script src="assets/js/jquery.min.js" type="text/javascript"></script>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>


    </head>
    <body>

        <div class="container">   
            <h1>This is a temporary Page to perform tests</h1>

            <!-- HTML to write -->
            <a href="#" data-toggle="tooltip"  title="Some tooltip text!">Hover over me</a>

            <!-- Generated markup by the plugin -->
            <div  class="tooltip top" role="tooltip">
                <div class="tooltip-arrow"></div>
                <div class="tooltip-inner">
                    Some tooltip text! hehe
                </div>
            </div>


        </div>

        <script>
            $(document).on("ready", function () {
                alert("Temp page jQuery Ready");
            });
        </script>
    </body>
</html>
