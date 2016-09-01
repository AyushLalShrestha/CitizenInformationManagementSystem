
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
            background: url("assets/images/purple2.jpg");
        }
    </style>
    <div class="container">
        <body>
            <h2>Welcome OFFICIAL-VIEWER</h2>
            <% String token = request.getParameter("access_token");%>
            <h5><i><div id="token_print"><%=token%></div> </i> was sent as a Token.</h5>  
            <a href="javascript:void(0)" class="btn btn-success" id="viewCitizens"><span class="glyphicon glyphicon-eye-open"> View Citizens</span></a>
            <a href="index.html" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-backward"> LogOut to Home</span></a>
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
                    alert("Officials Home Ready. Token sent : " + token);

                    $("#searchId").on("click", function () {
                        var id = $("#citizenId").val();
                        $.get("http://localhost:8080/CitizenInformationManagementSystem/api/admin/getcitizen/" + id, {access_token: token}, function (data) {
                            var str = "<h4>Name : " + data.firstName + " " + data.lastName + "</h4>\n\
                " + "Permanent Address : " + data.permanentAddress + "\n\
                " + "</br>Citizen's ID : " + data.citizenId + "\n\
                " + "</br>Education Details : " + data.educationDetails + "\n\
                " + "</br>Work Details : " + data.workDetails + "\n\
                " + "</br>Father's Name : " + data.fathersName + ", ID : "+data.fathersId+ "\n\
                " + "</br>Mother's Name : " + data.mothersName + ", ID : "+data.mothersId+ "\n\
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
                            $tr1.append("<th>No.</th>");
                            $tr1.append("<th>Full Name</th>");
                            $tr1.append("<th>DOB</th>");
                            $tr1.append("<th>Address</th>");
                            $tr1.append("<th>Citizen ID</th>");
                            $tr1.append("<th>Father's Name</th>");
                            $tr1.append("<th>Contact</th>");
                            $tr1.append("<th>Work Details</th>");
                           
						$tbl.append($tr1);


                            for (var i = 0; i < data.length; i++) {
                                var $tr = $("<tr></tr>");
                                
                                $tr.append("<td>" +(i+1)+"." + "</td>");
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
                                    $("#viewPasswordInd").html(data.viewPassword);
                                    $("#citizenIndividualTitle").html(data.citizenId + " : " + data.firstName + " " + data.lastName);
                                });

                                $("#citizens").modal("hide");
                                $("#citizenIndividual").modal("show");
                            });

                           

                        });
                        $("#citizens").modal("show");


                    });


                       $("#searchIt").on("click", function () {
                        var searchByAny = $("#searchByAny").val();
                        $.getJSON("http://localhost:8080/CitizenInformationManagementSystem/api/admin/searchbyany", {keyword: searchByAny, access_token: token}, function (data) {
			var $tbl = $("#citizen-table");
                            $('#citizen-table tbody > tr').remove();
                            var $tr1 = $("<tr></tr>");
                            
                            $tr1.append("<th>No.</th>");
                            $tr1.append("<th>Full Name</th>");
                            $tr1.append("<th>DOB</th>");
                            $tr1.append("<th>Address</th>");
                            $tr1.append("<th>Citizen ID</th>");
                            $tr1.append("<th>Father's Name</th>");
                            $tr1.append("<th>Contact</th>");
                            $tr1.append("<th>Work Details</th>");
                           
                            $tbl.append($tr1);


                            for (var i = 0; i < data.length; i++) {
                                var $tr = $("<tr></tr>");
                                
                                $tr.append("<td>" +(i+1)+"."+ "</td>");
                                $tr.append("<td>" + data[i].firstName + " " + data[i].lastName + "</td>");
                                $tr.append("<td>" + data[i].DOB + "</td>");
                                $tr.append("<td>" + data[i].permanentAddress + "</td>");
                                //$tr.append("<td>" + data[i].citizenId + "</td>");
                                var l = $('<td><a href="javascript:void(0)" class="viewIndividualCitizen" data="' + data[i].citizenId + '">' + data[i].citizenId + '</a></td>');
                                $tr.append(l);
                                $tr.append("<td>" + data[i].fathersName + "</td>");
                                $tr.append("<td>" + data[i].contactNo + "</td>");
                                $tr.append("<td>" + data[i].workDetails + "</td>");
                             
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
                                    $("#viewPasswordInd").html(data.viewPassword);
                                    $("#citizenIndividualTitle").html(data.citizenId + " : " + data.firstName + " " + data.lastName);
                                });

                                $("#citizens").modal("hide");
                                $("#citizenIndividual").modal("show");
                            });

                            

                           
    
						});
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
