<html>
	<head>
		<title></title>
        <script type="text/javascript" language="javascript">
            function validate()
            {
                strUserName=document.getElementById("txtUsername").value
                if(isEmpty(strUserName))
                    {
                        alert("UserName is required")
                        document.getElementById("txtUsername").focus()
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
        <form name="frmForgotPassword" method="post" action="RecoverPwdController.jsp" onsubmit="return validate()">
			<table>
                
                <tr>

                    <td colspan="3"><%=msg%></td>
                </tr>
                <%
                session.removeAttribute("msg");
                %>
				<tr>
					<td>Username<td>
					<td><input type="text" name="txtUsername" id="txtUsername"><td>
				</tr>
				<tr>
					<td><td>
					<td><input type="submit" name="sbtnNext" value="Next"> <input type="button"  value="Back" name="btnBack" onclick="history.go(-1)"><td>
				</tr>
			</table>
		</form>
	</body>
</html>