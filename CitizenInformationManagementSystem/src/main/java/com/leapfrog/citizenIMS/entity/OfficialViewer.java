
package com.leapfrog.citizenIMS.entity;

public class OfficialViewer {
    
    String viewerName, userName, password, viewerType;

    public OfficialViewer() {
    }

    public OfficialViewer(String viewerName, String userName, String password, String viewerType) {
        this.viewerName = viewerName;
        this.userName = userName;
        this.password = password;
        this.viewerType = viewerType;
    }

    public String getViewerName() {
        return viewerName;
    }

    public void setViewerName(String viewerName) {
        this.viewerName = viewerName;
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

    public String getViewerType() {
        return viewerType;
    }

    public void setViewerType(String viewerType) {
        this.viewerType = viewerType;
    }
    
    
    
}
