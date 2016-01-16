<html>
	<head>
		<title></title>
        <script type="text/javascript" language="javascript">
            function validate()
            {
                strUserName=document.getElementById("txtUsername").value
                strSecurityQuestion=document.getElementById("txtSecurityQuestion").value
               strSecurityAnswer=document.getElementById("txtSecurityAnswer").value
                 if(isEmpty(strSecurityAnswer))
                {
                    alert("Securityanswer is required")
                    document.getElementById("txtSecurityAnswer").focus()
                    return false
                }
                
                 return true
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
		<form action="RecoverPwdController.jsp" method="post" onsubmit="return validate()">
			<table>
                <tr>
                    <td colspan="3"><%=msg%></td>
                </tr>
                <%
                session.removeAttribute("msg");
                %>
				<tr>
					<td>Username</td>
                    <td><input type="text" name="txtUsername" id="txtUsername" value="<%=session.getAttribute("username")%>" readonly></td>
				</tr>
				<tr>
					<td>Security Question</td>
                    <td><input type="text" name="txtSecurityQuestion" id="txtSecurityQuestion" value="<%=session.getAttribute("securityquestion")%>" readonly></td>
				</tr>
				<tr>
					<td>Security Answer</td>
					<td><input type="text" name="txtSecurityAnswer" id="txtSecurityAnswer"></td>
				</tr>
				<tr>

					<td colspan="2" align="right"><input type="submit" name="sbtnGetPassword" value="Get Password"> <input type="button" name="btnBack" value="Back" onclick="history.go(-1)"></td>
				</tr>
			</table>
		</form>
	</body>
</html>