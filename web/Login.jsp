<html>
	<head>
		<title>Login</title>
	</head>
	<body>
         <%
       String msg="";
       if(session.getAttribute("msg")!=null)
           {
           msg=session.getAttribute("msg").toString();
           }
        %>
		<form action="AuthenticateServlet" method="post">
			<table>
                <tr>
                    <td colspan="3"><%=msg%></td>
                </tr>
                <%
                session.removeAttribute("msg");
                %>
				<tr>
					<td>Username<td>
					<td><input type="text" name="txtUsername" id="txtUsername" ><td>
				</tr>
              
				<tr>
					<td>Password<td>
                    <td><input type="password" name="txtPassword" id="txtPassword"><td>
				</tr>
                
				<tr>
					<td><td>
					<td><input type="submit" name="sbtnLogin" value="Login">
                    <input type="reset"  value="Reset" name="rbtnReset"><td>
				</tr>
                <tr>
                   <td> <a href="masterpage_ForgotPassword.jsp">Forgot Password</a></td>
                </tr>
			</table>
           
		</form>

	</body>
</html>