package com.leapfrog.citizenIMS.api;

import com.leapfrog.citizenIMS.dao.AdminDAO;
import com.leapfrog.citizenIMS.dao.impl.AdminDAOImpl;
import com.leapfrog.citizenIMS.dbutil.DbConnection;
import com.leapfrog.citizenIMS.entity.Admin;
import com.leapfrog.citizenIMS.entity.Citizen;
import java.sql.Date;
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
        if (token.equals("adminAccountU902Gas84S51f9t7SMHBVqTNzcFqZL5h") || token.equals("officialviewerU902Gas84S51f9t7SMHBVqTNzcFqZL5h")) {
            //DbConnection db = new DbConnection();
            AdminDAO admin = new AdminDAOImpl();
            Citizen c = admin.getByCitizenId(citizenId);
            return c;
        } else {
            return null;
        }
    }

    @GET
    @Path(value = "getallcitizens")
    @Produces(MediaType.APPLICATION_JSON)
    public ArrayList<Citizen> giveallcitizen(@QueryParam("access_token") String token) throws ClassNotFoundException, SQLException {
        if (token.equals("adminAccountU902Gas84S51f9t7SMHBVqTNzcFqZL5h") || token.equals("officialviewerU902Gas84S51f9t7SMHBVqTNzcFqZL5h")) {
        ArrayList<Citizen> citizenList = new ArrayList<>();
        AdminDAO admin = new AdminDAOImpl();
        citizenList = admin.getAllCitizen();
        return citizenList;
        }
        return null;
    }

    @POST
    @Path(value = "insertcitizen")
    @Produces(value = "text/plain")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public String insertCitizen(@FormParam("firstName") String firstName, @FormParam("middleName") String middleName, @FormParam("lastName") String lastName, @FormParam("citizenId") String citizenId, @FormParam("DOB") Date DOB, @FormParam("fathersName") String fathersName, @FormParam("mothersName") String mothersName, @FormParam("fathersId") String fathersId, @FormParam("mothersId") String mothersId, @FormParam("bloodGroup") String bloodGroup, @FormParam("dnaDetails") String dnaDetails, @FormParam("permanentAddress") String permanentAddress, @FormParam("contactNo") String contactNo, @FormParam("workDetails") String workDetails, @FormParam("healthDetails") String healthDetails, @FormParam("educationDetails") String educationDetails, @FormParam("criminalDetails") String criminalDetails, @FormParam("userName") String userName, @FormParam("password") String password, @FormParam("viewPassword") String viewPassword) throws ClassNotFoundException, SQLException {
        AdminDAO adminDAO = new AdminDAOImpl();
        Citizen c = new Citizen();
        c.setBloodGroup(bloodGroup);
        c.setCitizenId(citizenId);
        c.setContactNo(contactNo);
        c.setCriminalDetails(criminalDetails);
        c.setDOB(DOB);
        c.setDnaDetails(dnaDetails);
        c.setEducationDetails(educationDetails);
        c.setFathersId(fathersId);
        c.setFathersName(fathersName);
        c.setFirstName(firstName);
        c.setHealthDetails(healthDetails);
        c.setLastName(lastName);
        c.setMiddleName(middleName);
        c.setMothersId(mothersId);
        c.setMothersName(mothersName);
        c.setPassword(password);
        c.setPermanentAddress(permanentAddress);
        c.setUserName(userName);
        c.setViewPassword(viewPassword);
        c.setWorkDetails(workDetails);
        if((adminDAO.addCitizen(c)) > 0) {
            return "Inserted";
        } 
            
       return "Not successful";
        
    }

    
    @POST
    @Path(value = "updatecitizen")
    @Produces(value = "text/plain")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public String updateCitizen(@FormParam("firstName") String firstName, @FormParam("middleName") String middleName, @FormParam("lastName") String lastName, @FormParam("citizenId") String citizenId, @FormParam("DOB") Date DOB, @FormParam("fathersName") String fathersName, @FormParam("mothersName") String mothersName, @FormParam("fathersId") String fathersId, @FormParam("mothersId") String mothersId, @FormParam("bloodGroup") String bloodGroup, @FormParam("dnaDetails") String dnaDetails, @FormParam("permanentAddress") String permanentAddress, @FormParam("contactNo") String contactNo, @FormParam("workDetails") String workDetails, @FormParam("healthDetails") String healthDetails, @FormParam("educationDetails") String educationDetails, @FormParam("criminalDetails") String criminalDetails, @FormParam("userName") String userName, @FormParam("password") String password, @FormParam("viewPassword") String viewPassword) throws ClassNotFoundException, SQLException {
        AdminDAO adminDAO = new AdminDAOImpl();
        Citizen c = new Citizen();
        c.setBloodGroup(bloodGroup);
        c.setCitizenId(citizenId);
        c.setContactNo(contactNo);
        c.setCriminalDetails(criminalDetails);
        c.setDOB(DOB);
        c.setDnaDetails(dnaDetails);
        c.setEducationDetails(educationDetails);
        c.setFathersId(fathersId);
        c.setFathersName(fathersName);
        c.setFirstName(firstName);
        c.setHealthDetails(healthDetails);
        c.setLastName(lastName);
        c.setMiddleName(middleName);
        c.setMothersId(mothersId);
        c.setMothersName(mothersName);
        c.setPassword(password);
        c.setPermanentAddress(permanentAddress);
        c.setUserName(userName);
        c.setViewPassword(viewPassword);
        c.setWorkDetails(workDetails);
        if((adminDAO.editCitizen(c)) > 0) {
            return "Updated";
        } 
            
       return "Not successful";
        
    }
    
    @GET
    @Path(value = "searchbyany")
    @Produces(MediaType.APPLICATION_JSON)
    public ArrayList<Citizen> givesCitizenByAny(@QueryParam("keyword") String keyword, @QueryParam("access_token") String token) throws ClassNotFoundException, SQLException {
        if (token.equals("adminAccountU902Gas84S51f9t7SMHBVqTNzcFqZL5h") || token.equals("officialviewerU902Gas84S51f9t7SMHBVqTNzcFqZL5h")) {
            ArrayList<Citizen> searchMatches= new ArrayList<>();
            AdminDAO adminDAO = new AdminDAOImpl();
            if(keyword.equals("")) {
                searchMatches = adminDAO.getAllCitizen();
                return searchMatches;
            }
            for(Citizen c : adminDAO.getAllCitizen()) {
            String toStr = c.toString().toLowerCase();
            String key = keyword.toLowerCase();
            if( toStr.contains(key) || c.getCitizenId().equalsIgnoreCase(keyword) || c.getPermanentAddress().equalsIgnoreCase(keyword) || c.getUserName().equalsIgnoreCase(keyword) || c.getLastName().equalsIgnoreCase(keyword) || c.getContactNo().equalsIgnoreCase(keyword) || c.getFirstName().equalsIgnoreCase(keyword) || (c.getFirstName()+" "+c.getLastName()).equalsIgnoreCase(keyword)){
                searchMatches.add(c);
            }
           }
            return searchMatches;
          }
            return null;
        }
    
    @GET
    @Produces(value = "text/plain")
    @Path(value="deletecitizen")
    public String deleteCitizen(@QueryParam("keyword") String keyword, @QueryParam("citizenId")String citizenId) throws ClassNotFoundException, SQLException {
        AdminDAO adminDAO = new AdminDAOImpl();
        if(adminDAO.deleteCitizen(citizenId)>0){
            return "Citizen Removed from Database";
        }
        return "Removal unsuccessful";
         
    }
    
    
    @GET
    @Path(value = "getalladmin")
    @Produces(MediaType.APPLICATION_JSON)
    public ArrayList<Admin> givealladmin(@QueryParam("access_token") String token) throws ClassNotFoundException, SQLException {
        if (token.equals("adminAccountU902Gas84S51f9t7SMHBVqTNzcFqZL5h") ) {
        ArrayList<Admin> adminList = new ArrayList<>();
        AdminDAO admin = new AdminDAOImpl();
       adminList = admin.getAllAdmins();
        return adminList;
        }
        return null;
    }
    
    
    
}
