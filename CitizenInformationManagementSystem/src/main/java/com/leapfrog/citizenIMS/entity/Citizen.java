
package com.leapfrog.citizenIMS.entity;

import java.sql.Date;


public class Citizen {
    String firstName, middleName, lastName, citizenId, fathersName, mothersName, fathersId, mothersId, bloodGroup, dnaDetails, permanentAddress, contactNo, workDetails, healthDetails, educationDetails, criminalDetails, userName, password, viewPassword   ;
    Date DOB;

    public Citizen() {
    }

    public Citizen(String firstName, String middleName, String lastName, String citizenId, String fathersName, String mothersName, String fathersId, String mothersId, String bloodGroup, String dnaDetails, String permanentAddress, String contactNo, String workDetails, String healthDetails, String educationDetails, String criminalDetails, String userName, String password, String viewPassword, Date DOB) {
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.citizenId = citizenId;
        this.fathersName = fathersName;
        this.mothersName = mothersName;
        this.fathersId = fathersId;
        this.mothersId = mothersId;
        this.bloodGroup = bloodGroup;
        this.dnaDetails = dnaDetails;
        this.permanentAddress = permanentAddress;
        this.contactNo = contactNo;
        this.workDetails = workDetails;
        this.healthDetails = healthDetails;
        this.educationDetails = educationDetails;
        this.criminalDetails = criminalDetails;
        this.userName = userName;
        this.password = password;
        this.viewPassword = viewPassword;
        this.DOB = DOB;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getCitizenId() {
        return citizenId;
    }

    public void setCitizenId(String citizenId) {
        this.citizenId = citizenId;
    }

    public String getFathersName() {
        return fathersName;
    }

    public void setFathersName(String fathersName) {
        this.fathersName = fathersName;
    }

    public String getMothersName() {
        return mothersName;
    }

    public void setMothersName(String mothersName) {
        this.mothersName = mothersName;
    }

    public String getFathersId() {
        return fathersId;
    }

    public void setFathersId(String fathersId) {
        this.fathersId = fathersId;
    }

    public String getMothersId() {
        return mothersId;
    }

    public void setMothersId(String mothersId) {
        this.mothersId = mothersId;
    }

    public String getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    public String getDnaDetails() {
        return dnaDetails;
    }

    public void setDnaDetails(String dnaDetails) {
        this.dnaDetails = dnaDetails;
    }

    public String getPermanentAddress() {
        return permanentAddress;
    }

    public void setPermanentAddress(String permanentAddress) {
        this.permanentAddress = permanentAddress;
    }

    public String getContactNo() {
        return contactNo;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public String getWorkDetails() {
        return workDetails;
    }

    public void setWorkDetails(String workDetails) {
        this.workDetails = workDetails;
    }

    public String getHealthDetails() {
        return healthDetails;
    }

    public void setHealthDetails(String healthDetails) {
        this.healthDetails = healthDetails;
    }

    public String getEducationDetails() {
        return educationDetails;
    }

    public void setEducationDetails(String educationDetails) {
        this.educationDetails = educationDetails;
    }

    public String getCriminalDetails() {
        return criminalDetails;
    }

    public void setCriminalDetails(String criminalDetails) {
        this.criminalDetails = criminalDetails;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getViewPassword() {
        return viewPassword;
    }

    public void setViewPassword(String viewPassword) {
        this.viewPassword = viewPassword;
    }

    public Date getDOB() {
        return DOB;
    }

    public void setDOB(Date DOB) {
        this.DOB = DOB;
    }

    @Override
    public String toString() {
        return firstName+middleName+lastName+citizenId+fathersName+ mothersName+fathersId+mothersId+bloodGroup+dnaDetails+permanentAddress+contactNo+ workDetails+healthDetails+educationDetails+criminalDetails+userName+password+viewPassword+DOB;
    }

    
    
    
    
}
