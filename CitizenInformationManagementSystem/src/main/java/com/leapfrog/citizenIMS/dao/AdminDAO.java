package com.leapfrog.citizenIMS.dao;

import com.leapfrog.citizenIMS.entity.Admin;
import com.leapfrog.citizenIMS.entity.Citizen;
import com.leapfrog.citizenIMS.entity.OfficialViewer;
import java.sql.SQLException;
import java.util.ArrayList;

public interface AdminDAO {

    ArrayList<Admin> getAllAdmins() throws ClassNotFoundException, SQLException;
    
    ArrayList<Citizen> getAllCitizen() throws ClassNotFoundException, SQLException;
    
    ArrayList<OfficialViewer> getAllOfficialViewer() throws ClassNotFoundException, SQLException;

    Citizen getByCitizenId(String citizenId) throws ClassNotFoundException, SQLException;
    
    int addCitizen(Citizen citizen) throws ClassNotFoundException, SQLException; 
    
    int deleteCitizen(String citizenId) throws ClassNotFoundException, SQLException; 
    
    int editCitizen(Citizen citizen) throws ClassNotFoundException, SQLException; 
}
