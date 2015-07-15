/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sis.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;

/**
 *
 * @author Robert Forde
 */
public class DateMethods {
    
    public static Date stringToSqlDate(String strDate) {
        //Take a String and return a java.sql.date
            
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date=null;
        Date sqlDate = null;
        try {
            date = sdf1.parse(strDate);
            sqlDate = new java.sql.Date(date.getTime());
        }catch(ParseException e) {
            System.out.println(e);
        }
        return sqlDate;
    }
}
