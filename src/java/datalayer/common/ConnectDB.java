/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package datalayer.common;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author students
 */
public class ConnectDB {
    public static Connection con=null;
    public static Connection connect()
    {
        try
        {
        // STEP1: register the driver class
        // forName() method of Class class is used to register the driver class. 
        //This method is used to dynamically load the driver class.
        Class.forName("com.mysql.jdbc.Driver"); // "oracle.jdbc.driver.OracleDriver" for oracle db

        //STEP 2: Create the connection object
        //getConnection() method of DriverManager class is used to establish connection with the db.
        con=DriverManager.getConnection("jdbc:mysql:///iinvestor","root","root");
        }
        catch(Exception e)
        {
            System.out.println("in ConnectDB"+e);
        }
        return con;

    }

}
