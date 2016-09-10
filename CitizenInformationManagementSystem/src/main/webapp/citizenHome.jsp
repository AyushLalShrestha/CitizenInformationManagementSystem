
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Citizen Home page</title>
        <script src="assets/js/jquery.min.js" type="text/javascript"></script>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/bootstrap-theme.css" rel="stylesheet" type="text/css"/>
        <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

    </head>
    <style>
        body{
            color: whitesmoke;
            background: url("assets/images/darkRed3.jpg");
        }
    </style>
    <div class="container">
        <body>
            <h2>Welcome CITIZEN</h2>
            <% String token = request.getParameter("access_token");%>
            <h5><i><div id="token_print"><%=token%></div> </i> was sent as a Token.</h5>  
            <a href="javascript:void(0)" class="btn btn-success" id="viewCitizen"><span class="glyphicon glyphicon-eye-open"> Search & View a Citizen</span></a>
            <a href="index.html" class="btn btn-danger"><span class="glyphicon glyphicon-backward"> LogOut to Index</span></a>
            </br></br>
            <div id="searchCitizen" style="display:none">
                <form  id="viewCitizen-form" name="viewCitizen-form" method="post">
                    <div class="form-group">
                        <label>Username of the Citizen to be viewed</label>
                        <input type="text" name="userName" id="userName" required="required" placeholder="Citizen's Username" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>View Password to view the Citizen's Account <div class="info">Is given by the Citizen</div></label>
                        <input type="password" name="viewPassword" id="viewPassword"  required="required" placeholder="Citizen's account's view Password" class="form-control"/>
                    </div>
                    <button type="submit" id="submitForm" class="btn btn-info"><span class="glyphicon glyphicon-search"> Search and View</span></button>
                </form>
                </br>

                <div id="output">
                    <div class="alert"> Any Outputs will be displayed here.  </div>
                </div>
            </div>
    </div>

    <!-- Modal 6 Citizen Details modal -->
    <div style="color: black" class="modal fade" id="citizenIndividual" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel"><div id="citizenIndividualTitle"></div></h4>
                </div>
                <div class="modal-body" style="font-size: 17px">
                    <label>Full Name : </label><span> </span><div id="fullNameInd" style="display: inline"></div></br>
                    <label>Date of Birth :</label><span> </span><div id="DOBInd" style="display: inline"></div> </br>
                    <label>Citizen ID :</label><span> </span><div id="citizenIdInd" style="display: inline"></div></br>
                    <label>Contact No. :</label><span> </span><div id="contactInd" style="display: inline"></div></br>
                    <label>Permanent Address :</label><span> </span><div id="addressInd" style="display: inline"></div> </br>
                    <label>Blood-Group :</label><span> </span><div id="bloodGroupInd" style="display: inline"></div> </br>
                    <label>Father's Name :</label><span> </span><div id="fathersNameInd" style="display: inline"></div>
                    ,<label>ID</label> :<span> </span><div id="fathersIdInd" style="display: inline"></div></br>
                    <label>Mother's Name :</label><span> </span><div id="mothersNameInd" style="display: inline"></div>
                    ,<label>ID</label> :<span> </span><div id="mothersIdInd" style="display: inline"></div></br>
                    <label>Work Details :</label><span> </span><div id="workDetailsInd" style="display: inline"></div></br>
                    <label>Education Details :</label><span> </span><div id="educationDetailsInd" style="display: inline"></div></br>
                    <label>Health Details :</label><span> </span><div id="healthDetailsInd" style="display: inline"></div></br>
                    <label>DNA Details :</label><span> </span><div id="dnaDetailsInd" style="display: inline"></div></br>
                    <label>Criminal Details :</label><span> </span><div id="criminalDetailsInd" style="display: inline"></div></br>
                    <label>Username :</label><span> </span><div id="usernameInd" style="display: inline"></div></br>
                    <label>View Password :</label><span> </span><div id="viewPasswordInd" style="display: inline"></div></br>

                </div>
                <div class="modal-footer">
                    <button type="button" id="closeIndividualCitizen" class="btn btn-block" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>



    <script>
        $(document).on("ready", function () {
            var token = $("#token_print").html();
            alert("Citizen Home is Ready" + token);

            $("#submitForm").on("click", function () {
                $.post("http://localhost:8080/CitizenInformationManagementSystem/api/citizen/getcitizen/", $("#viewCitizen-form").serialize(), function (data) {
                    var str = "<h4>Name : " + data.firstName + " " + data.lastName + "</h4>\n\
                   " + "Permanent Address : " + data.permanentAddress + "\n\
                   " + "</br>Citizen's ID : " + data.citizenId + "\n\
                   " + "</br>Education Details : " + data.educationDetails + "\n\
                   " + "</br>Work Details : " + data.workDetails + "\n\
                   " + "</br>Father's Name : " + data.fathersName + ", ID : " + data.fathersId + "\n\
                   " + "</br>Mother's Name : " + data.mothersName + ", ID : " + data.mothersId + "\n\
                   " + "</br>Username : " + data.userName + "\n\
                   " + "</br>Blood Group : " + data.bloodGroup + "\n\
                   " + "</br>Contact No. : " + data.contactNo + "\n\
                   " + "</br>Health Details : " + data.healthDetails + "\n\
                   " + "</br>Criminal Details : " + data.criminalDetails + "\n\
                   " + "</br>DNA Details : " + data.dnaDetails;

                    $("#output").html(str);

                    //---------------------------------
                    $("#fullNameInd").html(data.firstName + " " + data.middleName + " " + data.lastName);
                    $("#DOBInd").html(data.DOB);
                    $("#citizenIdInd").html(data.citizenId);
                    $("#contactInd").html(data.contactNo);
                    $("#fathersNameInd").html(data.fathersName);
                    $("#workDetailsInd").html(data.workDetails);
                    $("#addressInd").html(data.permanentAddress);
                    $("#bloodGroupInd").html(data.bloodGroup);
                    $("#fathersIdInd").html(data.fathersId);
                    $("#mothersNameInd").html(data.mothersName);
                    $("#mothersIdInd").html(data.mothersId);
                    $("#educationDetailsInd").html(data.educationDetails);
                    $("#healthDetailsInd").html(data.healthDetails);
                    $("#dnaDetailsInd").html(data.dnaDetails);
                    $("#criminalDetailsInd").html(data.criminalDetails);
                    $("#usernameInd").html(data.userName);
                    $("#viewPasswordInd").html(data.viewPassword);
                    $("#citizenIndividualTitle").html(data.citizenId + " : " + data.firstName + " " + data.lastName);

                    $("#citizenIndividual").modal("show");

                });
                return false;
            });

            $("#viewCitizen").on("click", function () {
                $("#searchCitizen").slideToggle(1000);
            });

        });

    </script>      
</body>
</div> 
</html>
