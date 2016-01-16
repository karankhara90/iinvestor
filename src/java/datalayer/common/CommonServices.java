/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package datalayer.common;

import beans.common.LoginBean;
import java.sql.*;

/**
 *
 * @author student
 */
public class CommonServices {

    public LoginBean checkUser(String username, String password) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        LoginBean objBean = new LoginBean();
        objBean.setCheck("invalid");
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            String q = "select * from logindetail where username='" + username + "'";
            rs = stmt.executeQuery(q);
            while (rs.next()) {
                if (rs.getString("password").equals(password)) {
                    objBean.setUserid(rs.getInt("user_id"));
                    objBean.setUsername(rs.getString("username"));
                    objBean.setUsertype(rs.getInt("user_type"));
                    objBean.setUserstatus(rs.getInt("user_status"));
                    objBean.setCheck("valid");
                }
            }
        } catch (Exception e) {
            System.out.println("in checkUser" + e);
            return objBean;
        } finally {
            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("in finally" + e);
                return objBean;
            }
        }
        return objBean;
    }

    public String getSecurityQuestion(String username) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        String result = "failed";
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            String q = "select security_question from logindetail where username='" + username + "'";
            rs = stmt.executeQuery(q);
            while (rs.next()) {
                result = rs.getString(1);

            }
        } catch (Exception e) {
            System.out.println("In getSecurityQuestion" + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println("In finally" + e);
            }
        }
        return result;
    }

    public LoginBean getPassword(String username, String securityquestion, String securityanswer) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
      
        LoginBean objBean = new LoginBean();
        objBean.setCheck("Invalid");
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            String q = "select password,email_id,security_answer from logindetail l,personalinformation p where username='" + username + "' and l.user_code=p.user_code";
            rs = stmt.executeQuery(q);
            while (rs.next()) {
               if(rs.getString("security_answer").equals(securityanswer))
               {
                objBean.setCheck("valid");
                objBean.setPassword(rs.getString(1));
                objBean.setEmailid(rs.getString(2));
               }
            }
        }
           catch(Exception e)
           {
               System.out.println("In getPassword"+e);
           }
           finally
           {
               try
               {
                   rs.close();
                   stmt.close();
                   con.close();
               }
               catch(Exception e)
               {
                   System.out.println("in finally"+e);
               }

            }
         
          return objBean;
    }
    public String changePassword(String username,String oldpwd,String newpwd)
    {
        Connection con=null;
        Statement stmt=null;
        ResultSet rs=null;
        String result="failed";
        try
        {
            con=ConnectDB.connect();
            stmt=con.createStatement();
            String q="select password from logindetail where username='"+username+"'";
            rs=stmt.executeQuery(q);
            while(rs.next())
            {
                if(rs.getString("password").equals(oldpwd))
                {
                    String q1="update logindetail set password='"+newpwd+"'";
                    int i=stmt.executeUpdate(q1);
                    if(i>0)
                    {
                        result="updated";
                    }

                }
            }
        }
        catch(Exception e)
        {
            System.out.println("In changePassword"+e);
        }
        finally
        {
            try
            {
                rs.close();

                stmt.close();
                con.close();
            }
            catch(Exception e)
            {
                System.out.println("in finally"+e);
            }
        }
        return result;

    }
}
