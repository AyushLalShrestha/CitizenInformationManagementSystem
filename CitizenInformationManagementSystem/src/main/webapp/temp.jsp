
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

            <form  id="add-citizen" name="add-citizen" method="post">

                <h3>Enter Citizen Details : </h3>
                <div class="form-group">
                    <label>First Name</label> 
                    <input type="text" name="firstName" placeholder="Enter First Name" required="required" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>Middle Name</label>
                    <input type="text" name="middleName" placeholder="Enter Middle Name"  class="form-control"/>
                </div>
                <div class="form-group">
                    <label>lastName</label>
                    <input type="text" name="lastName" placeholder="Enter Last Name"  class="form-control"/>
                </div>
                <div class="form-group">
                    <label>citizenId</label>
                    <input type="text" name="citizenId" placeholder="Citizen's Unique ID" required="required" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>DOB</label>
                    <input type="date" name="DOB" required="required" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>fathersName</label>
                    <input type="text" name="fathersName" placeholder="Enter Father's Name" required="required" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>mothersName</label>
                    <input type="text" name="mothersName" placeholder="Enter Mother's Name Name"  required="required" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>fathersId</label>
                    <input type="text" name="fathersId" placeholder="Enter Father's ID" required="required" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>mothersId</label>
                    <input type="text" name="mothersId" placeholder="Enter Mother's ID Name" required="required" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>bloodGroup</label>
                    <input type="text" name="bloodGroup" placeholder="Enter BloodGroup" required="required" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>dnaDetails</label>
                    <input type="text" name="dnaDetails" placeholder="Enter DNA Details"  class="form-control"/>
                </div>
                <div class="form-group">
                    <label>permanentAddress</label>
                    <input type="text" name="permanentAddress" placeholder="Enter Permanent Address" required="required" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>contactNo</label>
                    <input type="text" name="contactNo" placeholder="Citizen's Contact info" required="required" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>workDetails</label>
                    <input type="text" name="workDetails" placeholder="Enter Work Details" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>healthDetails</label>
                    <input type="text" name="healthDetails" placeholder="Enter Health Details" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>educationDetails</label>
                    <input type="text" name="educationDetails" placeholder="Education Details" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>criminalDetails</label>
                    <input type="text" name="criminalDetails" placeholder="Criminal Record (clear or state if any)"  required="required" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>userName</label>
                    <input type="text" name="userName" placeholder="Citizen's System Username" required="required" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>password</label>
                    <input type="text" name="password" placeholder="Citizen's Account Password" required="required" class="form-control"/>
                </div>
                <div class="form-group">
                    <label>viewPassword</label>
                    <input type="text" name="viewPassword" placeholder="Password to view Citizen's Information" required="required" class="form-control"/>
                </div>

                <button type="submit" id="submitForm" class="btn btn-success"><span class="glyphicon glyphicon-ok"> Add the Citizen</span></button>
            </form>


        </div>

        <script>
            $(document).on("ready", function () {
                alert("Temp page jQuery Ready");
                $("#submitForm").on("click", function () {
                    $.post("http://localhost:8080/CitizenInformationManagementSystem/api/admin/insertcitizen", $("#add-citizen").serialize(), function(data) {
                    alert(data);    
                    });
                    
                    return false;
                });

            });
        </script>
    </body>
</html>
