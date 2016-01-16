<%-- 
    Document   : LogoutCheck
    Created on : May 6, 2011, 3:17:58 PM
    Author     : heena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        response.setHeader("cache-control","no-cache");
        response.setHeader("cache-control","no-store");
        response.setDateHeader("expires", 0);
        response.setHeader("pragma","no-cache");
        if(session.getAttribute("username")==null)
            {
            %>
            <jsp:forward page="../LogoutCheckForward.jsp"></jsp:forward>
            <%
            }
        %>
    </body>
</html>
