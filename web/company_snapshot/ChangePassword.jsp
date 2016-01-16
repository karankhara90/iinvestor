<%-- 
    Document   : ChangePassword
    Created on : May 4, 2011, 2:50:59 PM
    Author     : heena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" language="javascript">
            function validate()
            {
                strUserName=document.getElementById("txtUsername").value;
                strOldPassword=document.getElementById("txtPassword").value;
                strNewPassword=document.getElementById("txtNewPassword").value;
                strConfirmPassword=document.getElementById("txtConfirmPassword").value;
                if(isEmpty(strOldPassword))
                    {
                        alert("old Password is required");
                        document.getElementById("txtPassword").value;
                        return false;
                    }
                     if(isEmpty(strNewPassword))
                    {
                        alert("New Password is required");
                        document.getElementById("txtNewPassword").value;
                        return false;
                    }
                     if(isEmpty(strConfirmPassword))
                    {
                        alert("Confirm Password is required");
                        document.getElementById("txtConfirmPassword").value;
                        return false;
                    }
                    if(strNewPassword!==strConfirmPassword)
                    {
                        alert("Reenter the Password");
                        document.getElementById("txtConfirmPassword").focus();
                        return false;
                    }
                    return true;
            }
        </script>
    </head>
    <body>
        <%

       String msg="";
       if(session.getAttribute("msg")!=null)
           {
           msg=session.getAttribute("msg").toString();
           }
        %>
        <form name="frmChangePassword" method="post" action="ChangePwdController.jsp" onsubmit="return validate()">
        <table>
            <tr>
                <th colspan="2" align="center">Change Password</th>
            </tr>
            <tr>
                <td colspan="2"><%=msg%></td>
            </tr>
            <%
            session.removeAttribute("msg");
            %>
            <tr>
                <td>Username</td>
                <td><input type="text" name="txtUsername" id="txtUsername"value="<%=session.getAttribute("username")%>" readonly></td>
            </tr>
            <tr>
                <td>Old Password</td>
                <td><input type="password" name="txtPassword" id="txtPassword"/></td>
            </tr>
            <tr>
                <td>New Password</td>
                <td><input type="password" name="txtnewPassword" id="txtNewPassword"/></td>
            </tr>
            <tr>
                <td>Confirm password</td>
                <td><input type="password" name="txtConfirmPassword" id="txtConfirmPassword"/></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" name="sbtnSave" id="sbtnSave" value="save">
                <input type="reset" name="rbtnReset" id="rbtnReset" value="Reset"></td>
            </tr>
        </table>
        </form>
    </body>
</html>
