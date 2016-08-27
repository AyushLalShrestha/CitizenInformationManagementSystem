package com.leapfrog.citizenIMS.dao.impl;

import com.leapfrog.citizenIMS.dao.AdminDAO;
import com.leapfrog.citizenIMS.dbutil.DbConnection;
import com.leapfrog.citizenIMS.entity.Admin;
import com.leapfrog.citizenIMS.entity.Citizen;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdminDAOImpl implements AdminDAO {

    DbConnection db = new DbConnection();

    @Override
    public ArrayList<Citizen> getAllCitizen() throws ClassNotFoundException, SQLException {
        ArrayList<Citizen> citizenList = new ArrayList<>();
        db.open();
        String sql = "SELECT * from citizens";
        PreparedStatement stmt = db.initStatement(sql);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Citizen c = new Citizen();
            c.setBloodGroup(rs.getString("bloodGroup"));
            c.setCitizenId(rs.getString("citizenId"));
            c.setContactNo(rs.getString("contactNo"));
            c.setCriminalDetails(rs.getString("criminalDetails"));
            c.setDOB(rs.getDate("DOB"));
            c.setDnaDetails(rs.getString("dnaDetails"));
            c.setEducationDetails(rs.getString("educationDetails"));
            c.setFathersId(rs.getString("fathersId"));
            c.setFathersName(rs.getString("fathersName"));
            c.setFirstName(rs.getString("firstName"));
            c.setHealthDetails(rs.getString("healthDetails"));
            c.setLastName(rs.getString("lastName"));
            c.setMiddleName(rs.getString("middleName"));
            c.setMothersId(rs.getString("mothersId"));
            c.setMothersName(rs.getString("mothersName"));
            c.setPassword(rs.getString("password"));
            c.setPermanentAddress(rs.getString("permanentAddress"));
            c.setUserName(rs.getString("userName"));
            c.setViewPassword(rs.getString("viewPassword"));
            c.setWorkDetails(rs.getString("workDetails"));
            citizenList.add(c);
        }
        db.close();
        return citizenList;
    }

    @Override
    public Citizen getByCitizenId(String citizenId) throws ClassNotFoundException, SQLException {
        db.open();
        Citizen c = new Citizen();
        String sql = "SELECT * from citizens where citizenId = ?";
        PreparedStatement stmt = db.initStatement(sql);
        stmt.setString(1, citizenId);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            c.setBloodGroup(rs.getString("bloodGroup"));
            c.setCitizenId(rs.getString("citizenId"));
            c.setContactNo(rs.getString("contactNo"));
            c.setCriminalDetails(rs.getString("criminalDetails"));
            c.setDOB(rs.getDate("DOB"));
            c.setDnaDetails(rs.getString("dnaDetails"));
            c.setEducationDetails(rs.getString("educationDetails"));
            c.setFathersId(rs.getString("fathersId"));
            c.setFathersName(rs.getString("fathersName"));
            c.setFirstName(rs.getString("firstName"));
            c.setHealthDetails(rs.getString("healthDetails"));
            c.setLastName(rs.getString("lastName"));
            c.setMiddleName(rs.getString("middleName"));
            c.setMothersId(rs.getString("mothersId"));
            c.setMothersName(rs.getString("mothersName"));
            c.setPassword(rs.getString("password"));
            c.setPermanentAddress(rs.getString("permanentAddress"));
            c.setUserName(rs.getString("userName"));
            c.setViewPassword(rs.getString("viewPassword"));
            c.setWorkDetails(rs.getString("workDetails"));

        }
        db.close();
        return c;
    }

    @Override
    public ArrayList<Admin> getAllAdmins() throws ClassNotFoundException, SQLException {
        ArrayList<Admin> adminList = new ArrayList<>();
        db.open();
        String sql = "SELECT * from admins";
        PreparedStatement stmt = db.initStatement(sql);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Admin a = new Admin();
            a.setFullName(rs.getString("fullName"));
            a.setUserName(rs.getString("userName"));
            a.setPassword(rs.getString("password"));
            adminList.add(a);
        }
        db.close();
        return adminList;
    }

    @Override
    public int addCitizen(Citizen citizen) throws ClassNotFoundException, SQLException {
        db.open();
        String sql = "INSERT INTO citizens (firstName,middleName,lastName,citizenId,DOB,fathersName,mothersName,fathersId,mothersId,bloodGroup,dnaDetails,permanentAddress,contactNo,workDetails,healthDetails,educationDetails, criminalDetails,userName, password, viewPassword) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement stmt = db.initStatement(sql);
        stmt.setString(1, citizen.getFirstName());
        stmt.setString(2, citizen.getMiddleName());
        stmt.setString(3, citizen.getLastName());
        stmt.setString(4, citizen.getCitizenId());
        stmt.setDate(5, citizen.getDOB());
        stmt.setString(6, citizen.getFathersName());
        stmt.setString(7, citizen.getMothersName());
        stmt.setString(8, citizen.getFathersId());
        stmt.setString(9, citizen.getMothersId());
        stmt.setString(10, citizen.getBloodGroup());
        stmt.setString(11, citizen.getDnaDetails());
        stmt.setString(12, citizen.getPermanentAddress());
        stmt.setString(13, citizen.getContactNo());
        stmt.setString(14, citizen.getWorkDetails());
        stmt.setString(15, citizen.getHealthDetails());
        stmt.setString(16, citizen.getEducationDetails());
        stmt.setString(17, citizen.getCriminalDetails());
        stmt.setString(18, citizen.getUserName());
        stmt.setString(19, citizen.getPassword());
        stmt.setString(20, citizen.getViewPassword());
        int rs = stmt.executeUpdate();

        db.close();
        return rs;
    }

}
