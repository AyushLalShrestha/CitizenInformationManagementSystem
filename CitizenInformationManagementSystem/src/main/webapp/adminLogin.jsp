

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator Login Page</title>
        <script src="assets/js/jquery.min.js" type="text/javascript"></script>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <style>
        body {
            background: url("assets/images/glow2.jpg");
              color: whitesmoke;
        } 

    </style>
    <body>
        <div class="container">
            <h1>This is the Login Page for the Administrator</h1>

            <form  id="login-form" name="login-form" method="post">

                <h3>Enter Administrator Sign in details : </h3>
                <div class="form-group">
                    <label>Administrator userName</label>
                    <input type="text" name="userName" id="userName" required="required" placeholder="Admin Username" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>Administrator password</label>
                    <input type="password" name="password" id="password"  required="required" placeholder="Admin Password" class="form-control"/>
                </div>
                <button type="submit" id="submitForm" class="btn btn-success"><span class="glyphicon glyphicon-ok"> Sign In</span></button>
                <a href="index.html" class="btn btn-danger"><span class="glyphicon glyphicon-backward">  Back to Index</span></a>
            </form>
            <p><div id="login-fail" class="alert-danger"></div></p>
        </div>

        <script>
            $(document).on("ready", function () {

                $("#submitForm").on("click", function () {
                    $.post("http://localhost:8080/CitizenInformationManagementSystem/api/admin/loginadmin", $("#login-form").serialize(), function (data) {
                        if (data !== "null") {
                           location.href = "adminHome.jsp?access_token=" + data;
                          
                        } else {
                            $("#userName").val("");
                            $("#password").val("");
                            $("#login-fail").html("Incorrect Username or Password");
                            $("#userName").focus();
                        }
                    });
                    return false;

                });

            });
        </script>        
    </body>
</html>
