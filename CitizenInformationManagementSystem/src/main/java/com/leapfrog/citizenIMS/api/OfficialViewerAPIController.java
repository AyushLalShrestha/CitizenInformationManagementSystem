package com.leapfrog.citizenIMS.api;

import com.leapfrog.citizenIMS.dao.AdminDAO;
import com.leapfrog.citizenIMS.dao.impl.AdminDAOImpl;
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
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

@Path(value = "officialviewer")
public class OfficialViewerAPIController {

    @GET
    @Path(value = "index")
    @Produces(value = "text/html")
    public String test() {
        String str = "tokenblahblah1123123";
        return str;
    }

    @POST
    @Path(value = "loginofficialviewer")
    @Produces(value = "text/plain")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public String login(@FormParam("userName") String userName, @FormParam("password") String password) throws Exception {
        ArrayList<OfficialViewer> ovList;
        AdminDAO admin = new AdminDAOImpl();
        ovList = admin.getAllOfficialViewer();

        for (OfficialViewer ov : ovList) {
            if (ov.getUserName().equalsIgnoreCase(userName) && ov.getPassword().equals(password)) {
                return "officialviewerU902Gas84S51f9t7SMHBVqTNzcFqZL5h";
            }
        }
        return "null";
    }
    
    
    @GET
    @Path(value = "getallofficialviewer")
    @Produces(MediaType.APPLICATION_JSON)
    public ArrayList<OfficialViewer> giveallofficialviewer(@QueryParam("access_token") String token) throws ClassNotFoundException, SQLException {
        if (token.equals("adminAccountU902Gas84S51f9t7SMHBVqTNzcFqZL5h")) {
        ArrayList<OfficialViewer> ovList = new ArrayList<>();
        AdminDAO admin = new AdminDAOImpl();
        ovList = admin.getAllOfficialViewer();
        return ovList;
        }
        return null;
    }
}
