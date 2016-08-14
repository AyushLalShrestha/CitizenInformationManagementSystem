
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator Home page</title>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="assets/js/jquery.min.js" type="text/javascript"></script>
    </head>
    <style>
        body{
            background:url("assets/images/admin-background.jpg");
            color: whitesmoke;
        }
    </style>
    <div class="container">
        <body >
            <h2>Welcome ADMINISTRATOR</h2>
            <% String token = request.getParameter("access_token");%>
            <h5><i> <%=token%></i> was sent as a Token.</h5>  
            <a href="javascript:void(0)" class="btn btn-success" id="viewCitizens"><span class="glyphicon glyphicon-eye-open"> View Citizens</span></a>
            <a href="javascript:void(0)" class="btn btn-success"><span class="glyphicon glyphicon-eye-open"> View Official Viewers</span></a>
            <a href="javascript:void(0)" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"> Admins</span></a></br>
            </br><input type="button" id="testJquery" class="btn btn-default" value="test Jquery">
            <a href="index.html" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-backward">  Back to Index</span></a>
            </br></br>
            <input type="text" id="citizenId" class="form-control" placeholder="citizen's Id to be searched"/>
            </br>
            <button class="btn btn-info" id="searchId"><span class="glyphicon glyphicon-search"> Search ID </span></button>    
            
           </br></br>

            <div id="output">
                <div class="alert"> Any Outputs will be displayed here.  </div>
             </div>
            <script>
                $(document).on("ready", function () {
                    alert("Admin Home is Ready");


                    $("#testJquery").on("click", function () {
                        alert("jquery TRUE");
                    });
                    
                          $("#searchId").on("click", function () {
                            var id = $("#citizenId").val();  
                            $.get("http://localhost:8080/CitizenInformationManagementSystem/api/admin/getcitizen/"+id, {access_token:"adminAccountU902Gas84S51f9t7SMHBVqTNzcFqZL5h"},function(data){
                                var str= "Name : "+data.firstName +" "+ data.lastName+"\n\
                        "+    "</br>address : "+data.permanentAddress+"\n\
                        "+    "</br>citizenId : "+ data.citizenId+"\n\
                        "+    "</br>fathersName : "+ data.fathersName+"\n\
                        "+    "</br>mothersName : "+ data.mothersName+"\n\
                        "+    "</br>userName : "+ data.userName+ "\n\
                        "+    "</br>viewPassword : "+ data.viewPassword+"\n\
                        "+    "</br>password : "+ data.password;
                                
                               $("#output").html(str);
                            });
                    });
                    
                });

            </script>      
        </body>
    </div> 
</html>
