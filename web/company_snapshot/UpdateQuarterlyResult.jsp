<%@page import="beans.companysnapshot.*,datalayer.companysnapshot.*"%>
<html>
    <head>
        <title></title>
        <script type="text/javascript">
            function validate()
            {
                strSalesIncome=document.getElementById("txtSalesIncome").value
                strExtenditure=document.getElementById("txtExpenditure").value
                strInterest=document.getElementById("txtInterest").value
                strGrossProfit=document.getElementById("txtGrossProfit").value
                strDepriciation=document.getElementById("txtDepriciation").value
                strTax=document.getElementById("txtTax").value
                strPat=document.getElementById("txtPat").value
                strEquity=document.getElementById("txtEquity").value
                strOPM=document.getElementById("txtOPM").value
                strGPM=document.getElementById("txtGPM").value
                strNPM=document.getElementById("txtNPM").value
                if(isEmpty(strSalesIncome))
                {
                    alert("sales income is required")
                    document.getElementById("txtSalesIncome").focus()
                    return false
                }
                if(!isNumeric(strExpenditure))
                {
                    alert("expenditure should be numeric")
                    document.getElementById("txtExpenditure").focus()
                    return false
                }
                if(!isNumeric(strInterest))
                {
                    alert("interest should be numeric")
                    document.getElementById("txtInterest").focus()
                    return false
                }
                if(!isNumeric(strGrossProfit))
                {
                    alert("Gross Profit should be numeric")
                    document.getElementById("txtGrossProfit").focus()
                    return false
                }
                if(!isNumeric(strDepriciation))
                {
                    alert("Depriciation should be numeric")
                    document.getElementById("txtDepriciation").focus()
                    return false
                }
                if(!isNumeric(strTax))
                {
                    alert("tax should be numeric")
                    document.getElementById("txtTax").focus()
                    return false
                }
                if(!isNumeric(strPat))
                {
                    alert("pat should be numeric")
                    document.getElementById("txtPat").focus()
                    return false
                }
                if(!isNumeric( strEquity))
                {
                    alert("Equity should be numeric")
                    document.getElementById("txtEquity").focus()
                    return false
                }
                if(!isNumeric(strOPM))
                {
                    alert("OPM should be numeric")
                    document.getElementById("txtOPM").focus()
                    return false
                }
                if(!isNumeric(strGPM))
                {
                    alert("GPM should be numeric")
                    document.getElementById("txtGPM").focus()
                    return false
                }
                if(!isNumeric(strNPM))
                {
                    alert("NPM should be numeric")
                    document.getElementById("txtNPM").focus()
                    return false
                }
                return true
            }
        </script>
    </head>
    <%
        int id = Integer.parseInt(request.getParameter("cid"));
        String name = request.getParameter("cname");

    %>
    <form name="frmQuaterlyResult" method="post" action="UpdateQuarterlyResult_Controller.jsp?cid=<%=id%>" onsubmit="return validate()">
        <body>
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
                                <td colspan="2" align="center" width="100%"><h4>Update Company Quarterly Results</h4></td>
                            </tr>

                            <tr>
                                <td>
                                    <table align="left" border="1" rules="none">
                                        <tbody><tr>
                                                <td colspan="4" align="center"><b><%=name%></b><hr></td>

                                            </tr>

                                            <tr>
                                                <td>Year</td>
                                                <td>

                                                    <div id="divYear"><select name="ddlYear" id="ddlYear"><option value="select" selected="selected">Select</option><option value="2007">2007</option><option value="2008">2008</option><option value="2009">2009</option><option value="2010">2010</option><option value="2011">2011</option><option value="2012">2012</option></select></div>
                                                </td>
                                                <td>Month</td>
                                                <td>
                                                    <select name="ddlMonth" id="ddlMonth">
                                                        <option value="03">March</option>
                                                        <option value="04">April</option>
                                                        <option value="05">May</option>
                                                        <option value="06">June</option>
                                                        <option value="09">September</option>
                                                        <option value="12">December</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>

                                                <td>Sales Income</td>
                                                <td><input id="txtSalesIncome" name="txtSalesIncome" type="text" value=""></td>
                                            </tr>

                                            <tr>
                                                <td>Expenditure</td>

                                                <td><input id="txtExpenditure" name="txtExpenditure" type="text" value=""></td>
                                            </tr>

                                            <tr>
                                                <td>Interest</td>

                                                <td><input id="txtInterest" name="txtInterest" type="text" value=""></td>
                                            </tr>

                                            <tr>
                                                <td>Gross Profit</td>

                                                <td><input id="txtGrossProfit" name="txtGrossProfit" type="text" value=""></td>
                                            </tr>

                                            <tr>
                                                <td>Depreciation</td>

                                                <td><input id="txtDepriciation" name="txtDepriciation" type="text" value=""></td>
                                            </tr>

                                            <tr>
                                                <td>Tax</td>

                                                <td><input id="txtTax" name="txtTax" type="text" value=""></td>
                                            </tr>

                                            <tr>
                                                <td>Pat</td>

                                                <td><input id="txtPat" name="txtPat" type="text" value=""></td>
                                            </tr>

                                            <tr>
                                                <td>Equity</td>

                                                <td><input id="txtEquity" name="txtEquity" type="text" value=""></td>
                                            </tr>

                                            <tr>

                                                <td>OPM(%)</td>

                                                <td><input id="txtOPM" name="txtOPM" type="text" value=""></td>
                                            </tr>

                                            <tr>
                                                <td>GPM(%)</td>

                                                <td><input id="txtGPM" name="txtGPM" type="text" value=""></td>

                                            </tr>

                                            <tr>
                                                <td>NPM(%)</td>

                                                <td><input id="txtNPM" name="txtNPM" type="text" value=""></td>
                                            </tr>
                                            <tr><td height="10"></td></tr>
                                            <tr>

                                                <td colspan="4" align="center">
                                                <input id="sbtnUpdateQuaterly" name="sbtnUpdateQuaterly" value="Update" type="submit"></td>
                                            </tr>
                                    </tbody></table>
                                </td>
                            </tr>
                    </tbody></table>
                </td>
            </tr>
        </table>
    </form>
    </body>
</html>

