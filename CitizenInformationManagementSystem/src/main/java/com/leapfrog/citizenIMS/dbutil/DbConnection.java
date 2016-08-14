
package com.leapfrog.citizenIMS.dbutil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class DbConnection {
    Connection conn = null;
    PreparedStatement stmt = null;

    public void open() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/citizenims", "root", "");
    }

    public PreparedStatement initStatement(String sql) throws ClassNotFoundException, SQLException {
        stmt = conn.prepareStatement(sql);
        return stmt;
    }

    public ResultSet executeQuery() throws ClassNotFoundException, SQLException {
        return stmt.executeQuery();
    }

    public int executeUpdate() throws ClassNotFoundException, SQLException {
        return stmt.executeUpdate();
    }

    public void close() throws SQLException {
        if (conn != null && !conn.isClosed()) {
            conn.close();
            conn = null;
        }
    }
    
    
}
