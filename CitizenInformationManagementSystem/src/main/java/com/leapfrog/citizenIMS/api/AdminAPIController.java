package com.leapfrog.citizenIMS.api;

import com.leapfrog.citizenIMS.dao.AdminDAO;
import com.leapfrog.citizenIMS.dao.impl.AdminDAOImpl;
import com.leapfrog.citizenIMS.dbutil.DbConnection;
import com.leapfrog.citizenIMS.entity.Admin;
import com.leapfrog.citizenIMS.entity.Citizen;
import com.leapfrog.citizenIMS.entity.OfficialViewer;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

@Path(value = "admin")
public class AdminAPIController {

    @POST
    @Path(value = "loginadmin")
    @Produces(value = "text/plain")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public String login(@FormParam("userName") String userName, @FormParam("password") String password) throws Exception {
        ArrayList<Admin> adminList;
        AdminDAO admin = new AdminDAOImpl();
        adminList = admin.getAllAdmins();

        for (Admin a : adminList) {
            if (a.getUserName().equalsIgnoreCase(userName) && a.getPassword().equals(password)) {
                return "adminAccountU902Gas84S51f9t7SMHBVqTNzcFqZL5h";
            }
        }
        return "null";
    }

    @GET
    @Path(value = "checkadmin")
    @Produces(value = "text/plain")
    public String checkadmin(@QueryParam("access_token") String token) throws ClassNotFoundException, SQLException {
        if (token.equalsIgnoreCase("adminAccountU902Gas84S51f9t7SMHBVqTNzcFqZL5h")) {
            return "isAdmin";
        }
        return "isNotAdmin";
    }

    @GET
    @Path(value = "index2")
    @Produces(MediaType.APPLICATION_JSON)
    public ArrayList<Admin> test2() {
        ArrayList<Admin> adminList = new ArrayList<>();
        adminList.add(new Admin("Ayush Lal Shrestha", "AyushSHR", "jadugar"));
        adminList.add(new Admin("Astha Shrestha", "AsthaSHR", "magician"));
        return adminList;

    }

    @GET
    @Path(value = "getcitizen/{citizenId}")
    @Produces(MediaType.APPLICATION_JSON)
    public Citizen givescitizen(@PathParam("citizenId") String citizenId, @QueryParam("access_token") String token) throws ClassNotFoundException, SQLException {
       if(token.equals("adminAccountU902Gas84S51f9t7SMHBVqTNzcFqZL5h")){
        DbConnection db = new DbConnection();
        AdminDAO admin = new AdminDAOImpl();
        Citizen c = admin.getByCitizenId(citizenId);
        return c;
       } else 
           return null;
    }

    @GET
    @Path(value = "getallcitizens")
    @Produces(MediaType.APPLICATION_JSON)
    public ArrayList<Citizen> giveallcitizen() throws ClassNotFoundException, SQLException {
        ArrayList<Citizen> citizenList = new ArrayList<>();
        AdminDAO admin = new AdminDAOImpl();
        citizenList = admin.getAllCitizen();
        return citizenList;

    }
}
