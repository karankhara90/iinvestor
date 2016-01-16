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
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql:///iinvestor","root","root");
        }
        catch(Exception e)
        {
            System.out.println("in ConnectDB"+e);
        }
        return con;

    }

}
