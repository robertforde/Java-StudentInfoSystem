/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sis.util;

import java.sql.DriverManager;

/**
 *
 * @author Robert Forde
 */
public class ConnectDatabase {

            
    public static java.sql.Connection findConnection() {
        java.sql.Connection c = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            c = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","mysql");
        }
        catch(Exception e){
            System.out.println("Exception " + e);
        }
        return c;
    }

    public static void closeConnection(java.sql.Connection c) {
        try {
            if(c!=null)
                c.close();
        }
        catch(Exception e) {
            System.out.println("Exception " + e);
        }
    }

}
