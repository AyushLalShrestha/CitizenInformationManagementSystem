
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator Home page</title>
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
        <body >
            <h2>Welcome ADMINISTRATOR</h2>
            <% String token = request.getParameter("access_token");%>
            <h5><i><div id="token_print"><%=token%></div> </i> was sent as a Token.</h5>  
            <a href="javascript:void(0)" class="btn btn-success" id="viewCitizens"><span class="glyphicon glyphicon-eye-open"> View Citizens</span></a>
            <a href="javascript:void(0)" class="btn btn-success"><span class="glyphicon glyphicon-eye-open"> View Official Viewers</span></a>
            <a href="javascript:void(0)" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"> Admins</span></a></br>
            </br><input type="button" id="testJquery" class="btn btn-default" value="test Jquery">
            <a href="index.html" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-backward"> Log Out</span></a>
            </br></br>
            <input type="text" id="citizenId" class="form-control form-inline" placeholder="citizen's Id to be searched"/>
            </br>
            <button class="btn btn-info" id="searchId"><span class="glyphicon glyphicon-search"> Search ID </span></button>    
            </br> </br>

            <div id="output">
                <div class="alert"> Any Outputs will be displayed here.  </div>
            </div>



            <!-- Modal 1 View All Citizens Modal -->
            <div class="modal fade bs-example-modal-lg" id="citizens" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div style="color:black">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">Citizens List</h4>
                                <button type="button" id="add-citizen-button" class="btn btn-primary"><span class="glyphicon glyphicon-plus">Add</span></button>
                            </div>
                            <div class="modal-body">

                                <table class="table table-bordered table-hover" id="citizen-table">
                                <!--  This Table is empty for now    -->
                                </table>  			

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" data-dismiss="modal">Done Viewing</button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal 2 ADD citizen MODAL -->
            <div class="modal fade bs-example-modal-lg" id="add-citizen" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div style="color:black">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">Enter a new Citizen</h4>
                            </div>
                            <div class="modal-body">
                                <form  id="add-citizen-form" name="add-citizen" method="post">
                                    <div class="form-group form-inline">
                                        <label>FirstName</label> 
                                        <input type="text" name="firstName" placeholder="Enter First Name" required="required" class="form-control"/>
                                        <label>MiddleName</label>
                                        <input type="text" name="middleName" placeholder="Enter Middle Name"  class="form-control"/>
                                        <label>LastName</label>
                                        <input type="text" name="lastName" placeholder="Enter Last Name"  class="form-control"/>
                                    </div>
                                    <div class="form-group form-inline">
                                        <label>Citizen ID</label>
                                        <input type="text" name="citizenId" placeholder="Citizen's Unique ID" required="required" class="form-control"/>
                                        <label>DOB</label>
                                        <input type="date" name="DOB" required="required" class="form-control"/>
                                    </div>
                                    <div class="form-group form-inline">
                                        <label>Father's Name</label>
                                        <input type="text" name="fathersName" placeholder="Enter Father's Name" required="required" class="form-control"/>
                                        <label>Mother's Name</label>
                                        <input type="text" name="mothersName" placeholder="Enter Mother's Name Name"  required="required" class="form-control"/>

                                    </div>

                                    <div class="form-group form-inline">
                                        <label>Father's ID</label>
                                        <input type="text" name="fathersId" placeholder="Enter Father's ID" required="required" class="form-control"/>
                                        <label>Mother's ID</label>
                                        <input type="text" name="mothersId" placeholder="Enter Mother's ID" required="required" class="form-control"/>
                                    </div>

                                    <div class="form-group form-inline">
                                        <label>Bloodgroup</label>
                                        <input type="text" name="bloodGroup" placeholder="Enter BloodGroup" required="required" class="form-control"/>
                                        <label>DNA Details</label>
                                        <input type="text" name="dnaDetails" placeholder="Enter DNA Details"  class="form-control"/>
                                    </div>

                                    <div class="form-group form-inline">
                                        <label>Permanent Address</label>
                                        <input type="text" name="permanentAddress" placeholder="Enter Permanent Address" required="required" class="form-control"/>
                                        <label>Contact No.</label>
                                        <input type="text" name="contactNo" placeholder="Citizen's Contact info" required="required" class="form-control"/>

                                    </div>

                                    <div class="form-group form-inline">
                                        <label>Work Details</label>
                                        <input type="text" name="workDetails" placeholder="Enter Work Details" class="form-control"/>
                                        <label>Health Details</label>
                                        <input type="text" name="healthDetails" placeholder="Enter Health Details" class="form-control"/>
                                    </div>

                                    <div class="form-group form-inline">
                                        <label>Education Details</label>
                                        <input type="text" name="educationDetails" placeholder="Education Details" class="form-control"/>
                                        <label>Criminal Details</label>
                                        <input type="text" name="criminalDetails" placeholder="Criminal Record (clear or state if any)"  required="required" class="form-control"/>
                                    </div>

                                    <div class="form-group form-inline">
                                        <label>Username</label>
                                        <input type="text" name="userName" placeholder="Citizen's System Username" required="required" class="form-control"/>
                                        <label>Password</label>
                                        <input type="text" name="password" placeholder="Citizen's Account Password" required="required" class="form-control"/>
                                        <label>View Password</label>
                                        <input type="text" name="viewPassword" placeholder="Password to view Citizen's Information" required="required" class="form-control"/>
                                    </div>

                                    <button type="submit" id="submitForm" class="btn btn-success"><span class="glyphicon glyphicon-ok"> Add the Citizen</span></button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <script>
                $(document).on("ready", function () {
                    var token = $("#token_print").html();
                    alert("Admin Home is Ready. Token sent : " + token);


                    $("#testJquery").on("click", function () {
                        alert("jquery TRUE");
                    });

                    $("#searchId").on("click", function () {
                        var id = $("#citizenId").val();
                        $.get("http://localhost:8080/CitizenInformationManagementSystem/api/admin/getcitizen/" + id, {access_token: token}, function (data) {
                            var str = "Name : " + data.firstName + " " + data.lastName + "\n\
                        " + "</br>address : " + data.permanentAddress + "\n\
                        " + "</br>citizenId : " + data.citizenId + "\n\
                        " + "</br>educationDetails : " + data.educationDetails + "\n\
                        " + "</br>Work Details : " + data.workDetails + "\n\
                        " + "</br>Father's Name : " + data.fathersName + "\n\
                        " + "</br>Mother's Name : " + data.mothersName + "\n\
                        " + "</br>Username : " + data.userName + "\n\
                        " + "</br>View Password : " + data.viewPassword + "\n\
                        " + "</br>password : " + data.password;


                            $("#output").html(str);
                        });
                    });


                    $("#viewCitizens").on("click", function () {
                        $.getJSON("http://localhost:8080/CitizenInformationManagementSystem/api/admin/getallcitizens", {access_token: token}, function (data) {

                            var $tbl = $("#citizen-table");
                            $('#citizen-table tbody > tr').remove();
                               var $tr1 = $("<tr></tr>");

                                $tr1.append("<th>First Name</th>");
                                $tr1.append("<th>DOB</th>");
                                $tr1.append("<th>Permanent Address</th>");
                                $tr1.append("<th>Citizen ID</th>");
                                $tr1.append("<th>Father's Name</th>");
                                $tr1.append("<th>Username</th>");
                                $tr1.append("<th>View Password</th>");
                                $tr1.append("<th>Work Details</th>");


                                $tbl.append($tr1);
                            
                            
                            for (var i = 0; i < data.length; i++) {
                                var $tr = $("<tr></tr>");

                                $tr.append("<td>" + data[i].firstName + "</td>");
                                $tr.append("<td>" + data[i].DOB + "</td>");
                                $tr.append("<td>" + data[i].permanentAddress + "</td>");
                                $tr.append("<td>" + data[i].citizenId + "</td>");
                                $tr.append("<td>" + data[i].fathersName + "</td>");
                                $tr.append("<td>" + data[i].userName + "</td>");
                                $tr.append("<td>" + data[i].viewPassword + "</td>");
                                $tr.append("<td>" + data[i].workDetails + "</td>");


                                $tbl.append($tr);
                            }

                        });
                        $("#citizens").modal("show");
                    });

                    $("#add-citizen-button").on("click", function () {
                        $("#citizens").modal("hide");
                        $("#add-citizen").modal("show");
                    });

                    $("#submitForm").on("click", function () {
                        $.post("http://localhost:8080/CitizenInformationManagementSystem/api/admin/insertcitizen", $("#add-citizen-form").serialize(), function (data) {
                            alert(data);
                            $("#add-citizen").modal("hide");
                        });

                        return false;
                    });

                });

            </script>      
        </body>
    </div> 
</html>
