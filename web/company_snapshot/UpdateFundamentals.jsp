<%@page import="beans.companysnapshot.*,datalayer.companysnapshot.*"%>
<html>
    <head>
        <title></title>
        <script language="javascript" type="text/javascript">
            function validate()
            {
                strMarketCap=document.getElementById("txtMarketCapitalization").value
                strBookValue=document.getElementById("txtBookValue").value
                strDebtEquity=document.getElementById("txtDebtEquity").value
                strPE=document.getElementById("txtPE").value
                strDividendYield=document.getElementById("txtDividendYield").value
                strEPS=document.getElementById("txtEPS").value
                strReturn=document.getElementById("txtReturn").value
                strCurrentRatio=document.getElementById("txtCurrentRatio").value
                strQuickRatio=document.getElementById("txtQuickRatio").value
                strInterestCover=document.getElementById("txtInterestCover").value
                if(isEmpty(strBookValue))
                {
                    alert("Book Value is required")
                    document.getElementById("txtBookValue").focus()
                    return false
                }
                if(!isNumeric(strMarketCap))
                {
                    alert("Market Capitalization should be numeric")
                    document.getElementById("txtMarketCapitalization").focus()
                    return false
                }
                if(!isNumeric(strReturn))
                {
                    alert("Return on net worth should be numeric")
                    document.getElementById("txtReturn").focus()
                    return false
                }
                if(!isNumeric(strCurrentRatio))
                {
                    alert("Current ratio should be numeric")
                    document.getElementById("txtCurrentRatio").focus()
                    return false
                }
                if(!isNumeric(strQuickRatio))
                {
                    alert("Quick ratio should be numeric")
                    document.getElementById("txtQuickRatio").focus()
                    return false
                }
                if(!isNumeric(strInterestCover))
                {
                    alert("Interest Cover should be numeric")
                    document.getElementById("txtInterestCover").focus()
                    return false
                }

                return true
            }

        </script>
    </head>
    <%
        int compid = Integer.parseInt(request.getParameter("cid"));
        CompanyListingServices cls = new CompanyListingServices();
        UpdateFundamentalsBean objBean = cls.getCompanyFundamentals(compid);
    %>
    <body>
        <form name="frmCompFundamentals" action="UpdateFundamentals_Controller.jsp?cid=<%=compid%>" method="post" onsubmit="return validate()">
            <table>
                <tr>
                    <td><jsp:include page="UpdateLeftLinks.jsp"/></td>
                    <td>
                        <table>
                            <tbody><tr>

                                </tr>
                                <tr>
                                    <td colspan="2" height="10"></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center" width="100%"><h4>Update Company Fundamentals</h4></td>
                                </tr>

                                <tr>
                                    <td>
                                        <table border="1">
                                            <tbody><tr>
                                                    <td align="center"><b><%=objBean.getCompanyname()%></b></td>
                                                </tr>
                                                <tr>
                                                    <td>

                                                        <table>
                                                            <tbody>
                                                                <tr>
                                                                    <td>Market Capitalization(Rs Cr.)</td>

                                                                    <td><input id="txtMarketCapitalization" name="txtMarketCapitalization" value="<%=objBean.getTxtMarketCapitalization()%>" type="text"></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Book Value</td>

                                                                    <td><input id="txtBookValue" name="txtBookValue" value="<%=objBean.getTxtBookValue()%>" type="text"></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Debt/Equity</td>

                                                                    <td><input id="txtDebtEquity" name="txtDebtEquity" value="<%=objBean.getTxtDebtEquity()%>" type="text"></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>P/E</td>

                                                                    <td><input id="txtPE" name="txtPE" value="<%=objBean.getTxtPE()%>" type="text"></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Dividend Yield(%)</td>

                                                                    <td><input id="txtDividendYield" name="txtDividendYield" value="<%=objBean.getTxtDividendYield()%>" type="text"></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>EPS</td>

                                                                    <td><input id="txtEPS" name="txtEPS" value="<%=objBean.getTxtEPS()%>" type="text"></td>
                                                                </tr>

                                                                <tr>

                                                                    <td>Return On Net Worth</td>

                                                                    <td><input id="txtReturn" name="txtReturn" value="<%=objBean.getTxtReturn()%>" type="text"></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Current Ratio</td>

                                                                    <td><input id="txtCurrentRatio" name="txtCurrentRatio" value="<%=objBean.getTxtCurrentRatio()%>" type="text"></td>

                                                                </tr>

                                                                <tr>
                                                                    <td>Quick Ratio</td>

                                                                    <td><input id="txtQuickRatio" name="txtQuickRatio" value="<%=objBean.getTxtQuickRatio()%>" type="text"></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Interest Cover</td>

                                                                    <td><input id="txtInterestCover" name="txtInterestCover" value="<%=objBean.getTxtInterestCover()%>" type="text"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td height="10"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" align="center">
                                                                    <input id="sbtnUpdateFundamentals" name="sbtnUpdateFundamentals" value="Update" type="submit"></td>

                                                                </tr>
                                                        </tbody></table>
                                                    </td>
                                                </tr>
                                        </tbody></table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
