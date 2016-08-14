

<%@page import="com.leapfrog.citizenIMS.dao.impl.AdminDAOImpl"%>
<%@page import="com.leapfrog.citizenIMS.dao.AdminDAO"%>
<%@page import="com.leapfrog.CitizenIMS.entity.Citizen"%>
<%@page import="com.leapfrog.citizenIMS.dao.impl.CitizenDAOImpl"%>
<%@page import="com.leapfrog.citizenIMS.dao.CitizenDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Citizens List Page</title>
    </head>
    <body>

        <div class="container">   
        <h1>Citizens View Page</h1>


        <% if (request.getMethod().equalsIgnoreCase("post")) { %> 
        <h2>Citizens List</h2>

        <% AdminDAO adminDAO = new AdminDAOImpl();   %>

        <div class="pull-right">
            <p>
                <a href="addCitizen.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-plus">Add</span></a>
            </p>
        </div>
        <table  class="table table-bordered table-hover table-striped ">
            <tr>
                <th>Citizen ID</th>
                 <th>UserName</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Address</th>
                <th>Fathers Name</th>
                <th>Mothers Name</th>
                <th>Contact Number</th>
            </tr>  
            <% for (Citizen c : adminDAO.getAllCitizen()) {%>
            <tr>
                <th><%=c.getCitizenId()%></th>
                <th><%=c.getUserName()%></th>
                <th><%=c.getFirstName()%></th>
                <th><%=c.getLastName()%>  </th>
                <th><%=c.getPermanentAddress()%></th>
                <th><%=c.getFathersName()%></th>
                <th><%=c.getMothersName()%></th>
                <th><%=c.getContactNo()%></th>
                <th><a href="editCitizen.jsp?citizen_id=<%=c.getCitizenId()%>" class="btn btn-success"><span class="glyphicon glyphicon-pencil"></span></a>   <a href="deleteCitizen.jsp?citizen_id=<%=c.getCitizenId()%>" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></a></th>
            </tr>    
            <% }%> 
        </table>

        </div>
        <%
            } else {
                out.println("<h1>Hero palteko Bro, illegally view garna khojera</h1>");
            }

        %>
    </body>
</html>
