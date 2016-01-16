<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1" />
    <title>Intelligent Investor</title>
        <!-- stylesheet -->
        <jsp:include page="stylesheet.jsp" />
</head>
<body >
    <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0">
        <tr valign="top" align="center">
            <td>
                <table width="1000" cellpadding="0" cellspacing="0">
                      <!-- header -->
                        <jsp:include page="header.jsp" />
                          <!-- TopPanel -->
                    <tr>
                        <td height="22" align="center">
                             <jsp:include page="topmenu.jsp" />
                        </td>
                    </tr>
                    <tr valign="top" align="center">
                        <td style="border-top: 1px solid rgb(255, 255, 255);" height="363">
                            <table height="100%" width="100%" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0">
                                <tr valign="top">
                                    <td rowspan="2" style="background-position: center top; background-repeat: no-repeat;"
                                        width="40" background="images/body_left.jpg">
                                    </td>
                                    <td style="background-repeat: repeat-x; background-position: center top;" height="43"
                                        width="920" background="images/body_top.jpg">
                                    </td>
                                    <td rowspan="2" style="background-position: center top; background-repeat: no-repeat;"
                                        width="40" background="images/body_right.jpg">
                                    </td>
                                </tr>
                                <tr valign="top">
                                    <td height="275" align="center">
                                        <!-- Contents Starts-->
                                         <jsp:include page="ForgotPassword.jsp" />
                                        <!-- Contents Ends-->
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <!-- footer starts-->
                   	<jsp:include page="footer.jsp" />
		    <!-- footer ends-->
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
