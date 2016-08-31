
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
            <a href="javascript:void(0)" class="btn btn-success" id="viewOfficialViewers"><span class="glyphicon glyphicon-eye-open"> View Official Viewers</span></a>
            <a href="javascript:void(0)" class="btn btn-info" id="viewAdmins"><span class="glyphicon glyphicon-eye-open"> Admins</span></a></br>
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

                                <div class="pull-right"> <input type="search" placeholder="Search by any" id="searchByAny" name="searchByAny">
                                    <button type="button" id="searchIt" name="searchIt" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-search"></span></button>
                                </div>
                            </div>
                            <div class="modal-body">

                                <table class="table table-bordered table-striped table-hover" id="citizen-table">
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

            <!-- Modal 3 EDIT citizen MODAL -->
            <div class="modal fade bs-example-modal-lg" id="edit-citizen" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div style="color:black">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">Edit the Citizen</h4>
                            </div>
                            <div class="modal-body">
                                <form  id="edit-citizen-form" name="edit-citizen" method="post">
                                    <div class="form-group form-inline">
                                        <label>FirstName</label> 
                                        <input type="text" id="editFirstName" name="firstName" required="required" class="form-control"/>
                                        <label>MiddleName</label>
                                        <input type="text" id="editMiddleName" name="middleName"   class="form-control"/>
                                        <label>LastName</label>
                                        <input type="text" id="editLastName" name="lastName"   class="form-control"/>
                                    </div>
                                    <div class="form-group form-inline">
                                        <label>Citizen ID</label>
                                        <input type="text" id="editCitizenId" name="citizenId" required="required" class="form-control"/>
                                        <label>DOB</label>
                                        <input type="date" id="editDOB" name="DOB" required="required" class="form-control"/>
                                    </div>
                                    <div class="form-group form-inline">
                                        <label>Father's Name</label>
                                        <input type="text" id="editFathersName" name="fathersName" required="required" class="form-control"/>
                                        <label>Mother's Name</label>
                                        <input type="text" id="editMothersName" name="mothersName" required="required" class="form-control"/>

                                    </div>

                                    <div class="form-group form-inline">
                                        <label>Father's ID</label>
                                        <input type="text" id="editFathersId" name="fathersId" required="required" class="form-control"/>
                                        <label>Mother's ID</label>
                                        <input type="text" id="editMothersId" name="mothersId" required="required" class="form-control"/>
                                    </div>

                                    <div class="form-group form-inline">
                                        <label>Bloodgroup</label>
                                        <input type="text" id="editBloodGroup" name="bloodGroup"  required="required" class="form-control"/>
                                        <label>DNA Details</label>
                                        <input type="text" id="editDnaDetails" name="dnaDetails"  class="form-control"/>
                                    </div>

                                    <div class="form-group form-inline">
                                        <label>Permanent Address</label>
                                        <input type="text" id="editPermanentAddress" name="permanentAddress" required="required" class="form-control"/>
                                        <label>Contact No.</label>
                                        <input type="text" id="editContactNo" name="contactNo" required="required" class="form-control"/>

                                    </div>

                                    <div class="form-group form-inline">
                                        <label>Work Details</label>
                                        <input type="text" id="editWorkDetails" name="workDetails"  class="form-control"/>
                                        <label>Health Details</label>
                                        <input type="text" id="editHealthDetails" name="healthDetails" class="form-control"/>
                                    </div>

                                    <div class="form-group form-inline">
                                        <label>Education Details</label>
                                        <input type="text" id="editEducationDetails" name="educationDetails" class="form-control"/>
                                        <label>Criminal Details</label>
                                        <input type="text" id="editCriminalDetails" name="criminalDetails" required="required" class="form-control"/>
                                    </div>

                                    <div class="form-group form-inline">
                                        <label>Username</label>
                                        <input type="text" id="editUserName" name="userName" required="required" class="form-control"/>
                                        <label>Password</label>
                                        <input type="text" id="editPassword" name="password"  required="required" class="form-control"/>
                                        <label>View Password</label>
                                        <input type="text" id="editViewPassword" name="viewPassword" required="required" class="form-control"/>
                                    </div>

                                    <button type="submit" id="submitEditForm" class="btn btn-success"><span class="glyphicon glyphicon-ok"> Save Changes</span></button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal 4 Delete Citizen Confirmation Modal Small modal -->
            <div class="modal fade" id="delete-citizen-modal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" style="color: black">Sure to Delete ?</h4>
                        </div>
                        <div class="modal-body">
                            <p style="color: black">Are you sure to delete : </p>
                            <div id="delete-citizen-modal-id" style="color: crimson"></div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            <button type="button" class="btn btn-danger" id="finally-delete"><span class="glyphicon glyphicon-trash"> Delete</span></button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

            <!-- Modal 5 View All Admins or OfficialViewers -->
            <div class="modal fade bs-example-modal-lg" id="adminsandovs" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div style="color:black">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel"><div id="adminsandovstitle"></div></h4>
                            </div>
                            <div class="modal-body">

                                <table class="table table-bordered table-striped table-hover" id="adminsandovs-table">
                                    <!--  This Table is empty for now    -->
                                </table>  			

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" data-dismiss="modal">Done Viewing<div id="adminsandovsexit"></div></button>

                            </div>
                        </div>
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
                            <label>Password :</label><span> </span><div id="passwordInd" style="display: inline"></div>
                            , <label>View Password :</label><span> </span><div id="viewPasswordInd" style="display: inline"></div></br>

                        </div>
                        <div class="modal-footer">
                            <button type="button" id="closeIndividualCitizen" class="btn btn-block" data-dismiss="modal">Done</button>
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
                        });
                    });


                    $("#viewCitizens").on("click", function () {
                        $.getJSON("http://localhost:8080/CitizenInformationManagementSystem/api/admin/getallcitizens", {access_token: token}, function (data) {

                            var $tbl = $("#citizen-table");
                            $('#citizen-table tbody > tr').remove();
                            var $tr1 = $("<tr></tr>");

                            $tr1.append("<th>Full Name</th>");
                            $tr1.append("<th>DOB</th>");
                            $tr1.append("<th>Address</th>");
                            $tr1.append("<th>Citizen ID</th>");
                            $tr1.append("<th>Father's Name</th>");
                            $tr1.append("<th>Contact</th>");
                            $tr1.append("<th>Work Details</th>");
                            $tr1.append("<th>Actions</th>");

                            $tbl.append($tr1);


                            for (var i = 0; i < data.length; i++) {
                                var $tr = $("<tr></tr>");

                                $tr.append("<td>" + data[i].firstName + " " + data[i].lastName + "</td>");
                                $tr.append("<td>" + data[i].DOB + "</td>");
                                $tr.append("<td>" + data[i].permanentAddress + "</td>");
                                //$tr.append("<td>" + data[i].citizenId + "</td>");
                                var l = $('<td><a href="javascript:void(0)" class="viewIndividualCitizen" data="' + data[i].citizenId + '">' + data[i].citizenId + '</a></td>');
                                $tr.append(l);
                                $tr.append("<td>" + data[i].fathersName + "</td>");
                                $tr.append("<td>" + data[i].contactNo + "</td>");
                                $tr.append("<td>" + data[i].workDetails + "</td>");
                                // var r = $('<button type="button" class="btn btn-success btn-sm edit-citizen" data="' + data[i].citizenId + '"><span class="glyphicon glyphicon-pencil"></span></button><button type="button" class="btn btn-danger btn-sm delete-citizen" data="' + data[i].citizenId + '"><span class="glyphicon glyphicon-trash"></span></button>');
                                var r = $('<td><button type="button" class="btn btn-success btn-sm edit-citizen" data="' + data[i].citizenId + '"><span class="glyphicon glyphicon-pencil"></span></button><button type="button" class="btn btn-danger btn-sm delete-citizen" data="' + data[i].citizenId + '"><span class="glyphicon glyphicon-trash"></span></button></td>');
                                $tr.append(r);

                                $tbl.append($tr);
                            }

                            $(".viewIndividualCitizen").on("click", function () {
                                var citizenId = $(this).attr("data");
                                $.get("http://localhost:8080/CitizenInformationManagementSystem/api/admin/getcitizen/" + citizenId, {access_token: token}, function (data) {
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
                                    $("#passwordInd").html(data.password);
                                    $("#viewPasswordInd").html(data.viewPassword);
                                    $("#citizenIndividualTitle").html(data.citizenId + " : " + data.firstName + " " + data.lastName);
                                });

                                $("#citizens").modal("hide");
                                $("#citizenIndividual").modal("show");
                            });

                            $(".edit-citizen").on("click", function () {
                                var citizenId = $(this).attr("data");
                                $.getJSON("http://localhost:8080/CitizenInformationManagementSystem/api/admin/getcitizen/" + citizenId, {access_token: token}, function (data) {
                                    $("#editFirstName").val(data.firstName);
                                    $("#editMiddleName").val(data.middleName);
                                    $("#editLastName").val(data.lastName);
                                    $("#editCitizenId").val(data.citizenId);
                                    $("#editDOB").val(data.DOB);
                                    $("#editFathersName").val(data.fathersName);
                                    $("#editMothersName").val(data.mothersName);
                                    $("#editFathersId").val(data.fathersId);
                                    $("#editMothersId").val(data.mothersId);
                                    $("#editBloodGroup").val(data.bloodGroup);
                                    $("#editDnaDetails").val(data.dnaDetails);
                                    $("#editPermanentAddress").val(data.permanentAddress);
                                    $("#editContactNo").val(data.contactNo);
                                    $("#editWorkDetails").val(data.workDetails);
                                    $("#editHealthDetails").val(data.healthDetails);
                                    $("#editEducationDetails").val(data.educationDetails);
                                    $("#editCriminalDetails").val(data.criminalDetails);
                                    $("#editUserName").val(data.userName);
                                    $("#editPassword").val(data.password);
                                    $("#editViewPassword").val(data.viewPassword);
                                });

                                $("#citizens").modal("hide");
                                $("#edit-citizen").modal("show");
                            });

                            $(".delete-citizen").on("click", function () {
                                var citizenId = $(this).attr("data");
                                $("#delete-citizen-modal-id").html(citizenId);
                                $("#delete-citizen-modal").modal("show");
                                $("#finally-delete").on("click", function () {
                                    $.get("http://localhost:8080/CitizenInformationManagementSystem/api/admin/deletecitizen", {citizenId: citizenId, access_token: token}, function (data) {
                                        $("#delete-citizen-modal").modal("hide");
                                        $("#citizens").modal("hide");
                                        $("#output").html(data);
                                        alert(data);

                                    });
                                });
                            });
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

                    $("#submitEditForm").on("click", function () {
                        $.post("http://localhost:8080/CitizenInformationManagementSystem/api/admin/updatecitizen", $("#edit-citizen-form").serialize(), function (data) {
                            alert(data);
                            $("#edit-citizen").modal("hide");
                        });

                        return false;
                    });

                    $("#searchIt").on("click", function () {
                        var searchByAny = $("#searchByAny").val();
                        $.getJSON("http://localhost:8080/CitizenInformationManagementSystem/api/admin/searchbyany", {keyword: searchByAny, access_token: token}, function (data) {
                      var $tbl = $("#citizen-table");
                            $('#citizen-table tbody > tr').remove();
                            var $tr1 = $("<tr></tr>");

                            $tr1.append("<th>Full Name</th>");
                            $tr1.append("<th>DOB</th>");
                            $tr1.append("<th>Address</th>");
                            $tr1.append("<th>Citizen ID</th>");
                            $tr1.append("<th>Father's Name</th>");
                            $tr1.append("<th>Contact</th>");
                            $tr1.append("<th>Work Details</th>");
                            $tr1.append("<th>Actions</th>");

                            $tbl.append($tr1);


                            for (var i = 0; i < data.length; i++) {
                                var $tr = $("<tr></tr>");

                                $tr.append("<td>" + data[i].firstName + " " + data[i].lastName + "</td>");
                                $tr.append("<td>" + data[i].DOB + "</td>");
                                $tr.append("<td>" + data[i].permanentAddress + "</td>");
                                //$tr.append("<td>" + data[i].citizenId + "</td>");
                                var l = $('<td><a href="javascript:void(0)" class="viewIndividualCitizen" data="' + data[i].citizenId + '">' + data[i].citizenId + '</a></td>');
                                $tr.append(l);
                                $tr.append("<td>" + data[i].fathersName + "</td>");
                                $tr.append("<td>" + data[i].contactNo + "</td>");
                                $tr.append("<td>" + data[i].workDetails + "</td>");
                                // var r = $('<button type="button" class="btn btn-success btn-sm edit-citizen" data="' + data[i].citizenId + '"><span class="glyphicon glyphicon-pencil"></span></button><button type="button" class="btn btn-danger btn-sm delete-citizen" data="' + data[i].citizenId + '"><span class="glyphicon glyphicon-trash"></span></button>');
                                var r = $('<td><button type="button" class="btn btn-success btn-sm edit-citizen" data="' + data[i].citizenId + '"><span class="glyphicon glyphicon-pencil"></span></button><button type="button" class="btn btn-danger btn-sm delete-citizen" data="' + data[i].citizenId + '"><span class="glyphicon glyphicon-trash"></span></button></td>');
                                $tr.append(r);

                                $tbl.append($tr);
                            }

                            $(".viewIndividualCitizen").on("click", function () {
                                var citizenId = $(this).attr("data");
                                $.get("http://localhost:8080/CitizenInformationManagementSystem/api/admin/getcitizen/" + citizenId, {access_token: token}, function (data) {
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
                                    $("#passwordInd").html(data.password);
                                    $("#viewPasswordInd").html(data.viewPassword);
                                    $("#citizenIndividualTitle").html(data.citizenId + " : " + data.firstName + " " + data.lastName);
                                });

                                $("#citizens").modal("hide");
                                $("#citizenIndividual").modal("show");
                            });

                            $(".edit-citizen").on("click", function () {
                                var citizenId = $(this).attr("data");
                                $.getJSON("http://localhost:8080/CitizenInformationManagementSystem/api/admin/getcitizen/" + citizenId, {access_token: token}, function (data) {
                                    $("#editFirstName").val(data.firstName);
                                    $("#editMiddleName").val(data.middleName);
                                    $("#editLastName").val(data.lastName);
                                    $("#editCitizenId").val(data.citizenId);
                                    $("#editDOB").val(data.DOB);
                                    $("#editFathersName").val(data.fathersName);
                                    $("#editMothersName").val(data.mothersName);
                                    $("#editFathersId").val(data.fathersId);
                                    $("#editMothersId").val(data.mothersId);
                                    $("#editBloodGroup").val(data.bloodGroup);
                                    $("#editDnaDetails").val(data.dnaDetails);
                                    $("#editPermanentAddress").val(data.permanentAddress);
                                    $("#editContactNo").val(data.contactNo);
                                    $("#editWorkDetails").val(data.workDetails);
                                    $("#editHealthDetails").val(data.healthDetails);
                                    $("#editEducationDetails").val(data.educationDetails);
                                    $("#editCriminalDetails").val(data.criminalDetails);
                                    $("#editUserName").val(data.userName);
                                    $("#editPassword").val(data.password);
                                    $("#editViewPassword").val(data.viewPassword);
                                });

                                $("#citizens").modal("hide");
                                $("#edit-citizen").modal("show");
                            });

                            $(".delete-citizen").on("click", function () {
                                var citizenId = $(this).attr("data");
                                $("#delete-citizen-modal-id").html(citizenId);
                                $("#delete-citizen-modal").modal("show");
                                $("#finally-delete").on("click", function () {
                                    $.get("http://localhost:8080/CitizenInformationManagementSystem/api/admin/deletecitizen", {citizenId: citizenId, access_token: token}, function (data) {
                                        $("#delete-citizen-modal").modal("hide");
                                        $("#citizens").modal("hide");
                                        $("#output").html(data);
                                        alert(data);

                                    });
                                });
                            });   
    
                    });
                    });

                    $("#viewOfficialViewers").on("click", function () {
                        $.getJSON("http://localhost:8080/CitizenInformationManagementSystem/api/officialviewer/getallofficialviewer", {access_token: token}, function (data) {

                            var $tbl2 = $("#adminsandovs-table");
                            $('#adminsandovs-table tbody > tr').remove();
                            var $tr2 = $("<tr></tr>");

                            $tr2.append("<th>Account Holder</th>");
                            $tr2.append("<th>Username</th>");
                            $tr2.append("<th>Password</th>");
                            $tr2.append("<th>Viewer Type</th>");


                            $tbl2.append($tr2);


                            for (var i = 0; i < data.length; i++) {
                                var $tr3 = $("<tr></tr>");

                                $tr3.append("<td>" + data[i].viewerName + "</td>");
                                $tr3.append("<td>" + data[i].userName + "</td>");
                                $tr3.append("<td>" + data[i].password + "</td>");
                                $tr3.append("<td>" + data[i].viewerType + "</td>");


                                $tbl2.append($tr3);
                            }

                        });
                        $("#adminsandovstitle").html("Official-Viewers List");
                        $("#adminsandovsexit").html("Official Viewers");
                        $("#adminsandovs").modal("show");
                    });

                    $("#viewAdmins").on("click", function () {
                        $.getJSON("http://localhost:8080/CitizenInformationManagementSystem/api/admin/getalladmin", {access_token: token}, function (data) {

                            var $tbl2 = $("#adminsandovs-table");
                            $('#adminsandovs-table tbody > tr').remove();
                            var $tr2 = $("<tr></tr>");

                            $tr2.append("<th>Account Holder</th>");
                            $tr2.append("<th>Username</th>");
                            $tr2.append("<th>Password</th>");



                            $tbl2.append($tr2);


                            for (var i = 0; i < data.length; i++) {
                                var $tr3 = $("<tr></tr>");

                                $tr3.append("<td>" + data[i].fullName + "</td>");
                                $tr3.append("<td>" + data[i].userName + "</td>");
                                $tr3.append("<td>" + data[i].password + "</td>");



                                $tbl2.append($tr3);
                            }

                        });
                        $("#adminsandovstitle").html("System Administrators List");
                        $("#adminsandovsexit").html("Admins");
                        $("#adminsandovs").modal("show");
                    });

                    $("#closeIndividualCitizen").on("click", function () {
                        $("#citizenIndividual").modal("hide");
                        $("#citizens").modal("show");
                    });

                });

            </script>      
        </body>
    </div> 
</html>
