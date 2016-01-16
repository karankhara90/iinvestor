<%@page import="beans.companysnapshot.*,datalayer.companysnapshot.*"%>
<html>
    <head>
        <title></title>
    </head>
    <%
        int id = Integer.parseInt(request.getParameter("cid"));
        String name = request.getParameter("cname");
        CompanyListingServices cls = new CompanyListingServices();
        ViewQuarterlyResultBean objBean = cls.getQuaterlyResultCur(id);
        System.out.println("");
        ViewQuarterlyResultBean objBean1 = cls.getQuaterlyResultPre(id);
        double salesIncome = 0, expenditure = 0, interest = 0, grossprofit = 0, depriciation = 0, tax = 0, pat = 0, equity = 0, OPM = 0, GPM = 0, NPM = 0;
        if (objBean1.getTxtSalesIncome() != null) {
            salesIncome = Double.parseDouble(objBean1.getTxtSalesIncome());
        }
        if (objBean1.getTxtExpenditure() != null) {
            expenditure = Double.parseDouble(objBean1.getTxtExpenditure());
        }
        if (objBean1.getTxtInterest() != null) {
            interest = Double.parseDouble(objBean1.getTxtInterest());
        }
        if (objBean1.getTxtDepriciation() != null) {
            depriciation = Double.parseDouble(objBean1.getTxtDepriciation());
        }
        if (objBean1.getTxtGrossProfit() != null) {
            grossprofit = Double.parseDouble(objBean1.getTxtGrossProfit());
        }
        if (objBean1.getTxtTax() != null) {
            tax = Double.parseDouble(objBean1.getTxtTax());
        }
        if (objBean1.getTxtPat() != null) {
            pat = Double.parseDouble(objBean1.getTxtPat());
        }
        if (objBean1.getTxtEquity() != null) {
            equity = Double.parseDouble(objBean1.getTxtEquity());
        }
        if (objBean1.getTxtNPM() != null) {
            NPM = Double.parseDouble(objBean1.getTxtNPM());
        }
        if (objBean1.getTxtOPM() != null) {
            OPM = Double.parseDouble(objBean1.getTxtOPM());
        }
        if (objBean1.getTxtGPM() != null) {
            GPM = Double.parseDouble(objBean1.getTxtGPM());
        }
    %>
    <body>
        <table>
            <tr>
                <td><jsp:include page="ViewLeftLinks.jsp"/></td>
                <td>
                    <table>
                        <tbody><tr>
                                <td colspan="2" align="center" width="100%"><h5>View Company Quarterly Result</h5></td>
                            </tr>
                            <tr>
                                <td>
                                    <table border="1">
                                        <tbody><tr>
                                                <th colspan="8" align="center"><b><%=name%></b></th>

                                            </tr>
                                            <tr>
                                                <td>
                                                    <table>
                                                        <tbody><tr>
                                                                <td colspan="4" align="right">Rs Cr.</td>
                                                            </tr>

                                                            <tr>

                                                                <td colspan="4">
                                                                    <hr>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <th></th>

                                                                <th>Current Year</th>

                                                                <th>Previous year</th>

                                                                <th>var %</th>
                                                            </tr>
                                                            <%
        if (objBean != null) {
                                                            %>
                                                            <tr>
                                                                <td colspan="4">
                                                                    <hr>

                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td><b>Sales Income</b></td>

                                                                <td><%=objBean.getTxtSalesIncome()%></td>
                                                                <td><%=salesIncome%></td>
                                                                <%
                                                                double var = Double.parseDouble(objBean.getTxtSalesIncome()) - salesIncome;
                                                                double varper = var / 100;
                                                                %>

                                                                <td><%=varper%></td>



                                                            </tr>

                                                            <tr>
                                                                <td><b>Expenditure</b></td>

                                                                <td><%=objBean.getTxtExpenditure()%></td>
                                                                <td><%=expenditure%></td>
                                                                <%
                                                                double var1 = Double.parseDouble(objBean.getTxtExpenditure()) - expenditure;
                                                                double varper1 = var1 / 100;
                                                                %>
                                                                <td><%=varper1%></td>



                                                            </tr>

                                                            <tr>
                                                                <td><b>Interest</b></td>

                                                                <td><%=objBean.getTxtInterest()%></td>

                                                                <td><%=interest%></td>
                                                                <%
                                                                double var2 = Double.parseDouble(objBean.getTxtInterest()) - interest;
                                                                double varper2 = var2 / 100;
                                                                %>


                                                                <td><%=varper2%></td>

                                                            </tr>

                                                            <tr>
                                                                <td><b>Gross Profit</b></td>

                                                                <td><%=objBean.getTxtGrossProfit()%></td>

                                                                <td><%=grossprofit%></td>
                                                                <%
                                                                double var3 = Double.parseDouble(objBean.getTxtGrossProfit()) - grossprofit;
                                                                double varper3 = var3 / 100;
                                                                %>

                                                                <td><%=varper3%></td>

                                                            </tr>

                                                            <tr>
                                                                <td><b>Depreciation</b></td>

                                                                <td><%=objBean.getTxtDepriciation()%></td>

                                                                <td><%=depriciation%></td>
                                                                <%
                                                                double var4 = Double.parseDouble(objBean.getTxtDepriciation()) - depriciation;
                                                                double varper4 = var4 / 100;
                                                                %>


                                                                <td><%=varper4%></td>

                                                            </tr>

                                                            <tr>
                                                                <td><b>Tax</b></td>

                                                                <td><%=objBean.getTxtTax()%></td>

                                                                <td><%=tax%></td>
                                                                <%
                                                                double var5 = Double.parseDouble(objBean.getTxtTax()) - tax;
                                                                double varper5 = var5 / 100;
                                                                %>

                                                                <td><%=varper5%></td>

                                                            </tr>

                                                            <tr>

                                                                <td><b>PAT</b></td>

                                                                <td><%=objBean.getTxtPat()%></td>

                                                                <td><%=pat%></td>
                                                                <%
                                                                double var6 = Double.parseDouble(objBean.getTxtPat()) - pat;
                                                                double varper6 = var6 / 100;
                                                                %>


                                                                <td><%=varper6%></td>

                                                            </tr>

                                                            <tr>
                                                                <td><b>Equity</b></td>

                                                                <td><%=objBean.getTxtEquity()%></td>

                                                                <td><%=equity%></td>
                                                                <%
                                                                double var7 = Double.parseDouble(objBean.getTxtEquity()) - equity;
                                                                double varper7 = var7 / 100;
                                                                %>


                                                                <td><%=varper7%></td>


                                                            </tr>

                                                            <tr>
                                                                <td><b>OPM(%)</b></td>

                                                                <td><%=objBean.getTxtOPM()%></td>

                                                                <td><%=OPM%></td>
                                                                <%
                                                                double var8 = Double.parseDouble(objBean.getTxtOPM()) - OPM;
                                                                double varper8 = var8 / 100;
                                                                %>


                                                                <td><%=varper8%></td>

                                                            </tr>

                                                            <tr>
                                                                <td><b>GPM(%)</b></td>

                                                                <td><%=objBean.getTxtGPM()%></td>

                                                                <td><%=GPM%></td>
                                                                <%
                                                                double var9 = Double.parseDouble(objBean.getTxtGPM()) - GPM;
                                                                double varper9 = var9 / 100;
                                                                %>

                                                                <td><%=varper9%></td>

                                                            </tr>

                                                            <tr>
                                                                <td><b>NPM(%)</b></td>

                                                                <td><%=objBean.getTxtNPM()%></td>

                                                                <td><%=NPM%></td>
                                                                <%
                                                                double var10 = Double.parseDouble(objBean.getTxtNPM()) - NPM;
                                                                double varper10 = var10 / 100;
                                                                %>


                                                                <td><%=varper10%></td>

                                                            </tr>
                                                            <%
                                                            } else {
                                                            %>
                                                            <tr>
                                                                <td colspan="3">N/A</td>
                                                            </tr>
                                                            <%}
                                                            %>

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
    </body>
</html>
