
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Temporary test page</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="assets/js/jquery.min.js" type="text/javascript"></script>
  
    </head>
    <body>
        <div class="container">   
        <h1>This is a temporary Page to perform tests</h1>
        <input type="button" class="btn btn-success" id="test" value="test">    
    
        <script>
            $(document).on("ready", function(){
               alert("page running okay");
                  $("#test").on("click", function(){
               $.get("http://localhost:8080/CitizenInformationManagementSystem/api/admin/checkadmin","access_token=asdasd",function(data){
                  alert(data); 
               }); 
            });   
        
         
            });
            
            
        </script>
    
    
    </div>
    </body>
</html>
