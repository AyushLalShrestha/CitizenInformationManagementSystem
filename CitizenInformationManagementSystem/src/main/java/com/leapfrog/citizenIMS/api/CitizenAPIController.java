
package com.leapfrog.citizenIMS.api;

import com.leapfrog.citizenIMS.dao.AdminDAO;
import com.leapfrog.citizenIMS.dao.impl.AdminDAOImpl;
import com.leapfrog.citizenIMS.entity.Citizen;
import java.util.ArrayList;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path(value = "/citizen")
     public class CitizenAPIController {
   
     @GET
    @Path(value = "/index")
    @Produces(value = "text/HTML")
    public String test2() {
        String str = "<h2><i>Hello, this is from Citizen API</i></h2>";
        return str;

    }

    
      @POST
    @Path(value = "logincitizen")
    @Produces(value = "text/plain")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public String login(@FormParam("userName") String userName, @FormParam("password") String password) throws Exception {
        ArrayList<Citizen> citizenList;
        AdminDAO adminDAO = new AdminDAOImpl();
        citizenList = adminDAO.getAllCitizen();

        for (Citizen c : citizenList) {
            if (c.getUserName().equalsIgnoreCase(userName) && c.getPassword().equals(password)) {
                return "citizenAccountU902Gas84S51f9t7SMHBVqTNzcFqZL5h";
            }
        }
        return "null";
    }
    
      @POST
    @Path(value = "getcitizen")
    @Produces(value = "application/json")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public Citizen givescitizen(@FormParam("userName") String userName, @FormParam("viewPassword") String viewPassword) throws Exception {
        ArrayList<Citizen> citizenList;
        AdminDAO adminDAO = new AdminDAOImpl();
        citizenList = adminDAO.getAllCitizen();

        for (Citizen c : citizenList) {
            if (c.getUserName().equalsIgnoreCase(userName) && c.getViewPassword().equalsIgnoreCase(viewPassword)) {
                c.setPassword("Fuck It");
                return c;
            }
        }
        return null;
    }
    
    
}
