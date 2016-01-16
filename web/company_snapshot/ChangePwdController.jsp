<%-- 
    Document   : ChangePwdController
    Created on : May 4, 2011, 10:16:45 PM
    Author     : heena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   <%@page import="beans.common.*,datalayer.common.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        if(request.getParameter("sbtnSave")!=null)
            {
            CommonServices objCS=new CommonServices();
            String username=request.getParameter("txtUsername");
            String oldpwd=request.getParameter("txtPassword");
            String newpwd=request.getParameter("txtnewPassword");
            String result= objCS.changePassword(username,oldpwd,newpwd);
           if(result.equals("updated"))
               {
                String msg="Your password has been changed";
                session.setAttribute("msg",msg);
                response.sendRedirect("masterpage_ChangePassword.jsp");
               }
           }
            %>
    </body>
</html>
