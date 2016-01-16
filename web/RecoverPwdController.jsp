<%-- 
    Document   : RecoverPwdController
    Created on : May 3, 2011, 2:21:03 PM
    Author     : heena
--%>
<%@page import="beans.common.*,datalayer.common.*,email.*;"%>
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
        if (request.getParameter("sbtnSubmit") != null) {
            String username = request.getParameter("txtUE");

            CommonServices objCLS = new CommonServices();
            String result = objCLS.getSecurityQuestion(username);
            if (result.equals("failed")) {
                response.sendRedirect("ForgotPassword_mp.jsp");
                session.setAttribute("msg","Invalid username");
            } else {
                session.setAttribute("securityquestion", result);
                session.setAttribute("username", username);
                response.sendRedirect("SecurityQuestion_mp.jsp");
            }
        }
        if (request.getParameter("sbtnGetPassword") != null) {

            String username = request.getParameter("txtUsername");
            String SecQuestion = request.getParameter("txtSecurityQuestion");
            String SecAnswer = request.getParameter("txtSecurityAnswer");
            CommonServices objCS = new CommonServices();
            LoginBean objBean = objCS.getPassword(username, SecQuestion, SecAnswer);

            if (objBean.getCheck().equalsIgnoreCase("valid")) {

                String password = objBean.getPassword();
                String emailid = objBean.getEmailid();
                String text="Your recovered password is ";

String result=SendSMTP.sendMail(emailid, text, password);
          
if(result.equalsIgnoreCase("sent"))
{
    
    session.setAttribute("msg", "Your password has been send to your email id");
}
else
{
    session.setAttribute("msg", "Error in sending password to your email id");
    
}
     response.sendRedirect("index.jsp");
            } else {
                response.sendRedirect("masterpage_SecurityQuestion.jsp");
                session.setAttribute("msg","Invalid Security Answer");
            }
        }
        %>
    </body>
</html>
