<%@page import="beans.companysnapshot.*,datalayer.companysnapshot.*,java.util.ArrayList"%> 
<%
        int cid = Integer.parseInt(request.getParameter("cid"));
        String name=request.getParameter("cname");
        String code=request.getParameter("code");
        CompanyListingServices objCLS = new CompanyListingServices();
        ArrayList alExcahangeId = objCLS.getCompanyExchange(cid);
        System.out.println("al exc id " + alExcahangeId.size());
        ArrayList alSharePrice = new ArrayList();
        ArrayList al52Weeks = new ArrayList();
        for (int i = 0; i < alExcahangeId.size(); i++) {
            CompanyExchangeBean objCEB = (CompanyExchangeBean) alExcahangeId.get(i);
            int exid = Integer.parseInt(objCEB.getCompanyexchangeid());
            UpdateCompanyBean objUCB1 = objCLS.getSharePrice(exid);
            alSharePrice.add(objUCB1);
        }

%>

<html>
    <head>
        <title></title>
    </head>
    <body>

        <table>
            <tr>
                <td><jsp:include page="ViewLeftLinks.jsp"/></td>
                <td>

                    <table>
                        <tbody><tr>
                                <td colspan="2" align="center" width="100%"><h5>View Company Share Price</h5></td>
                            </tr>
                            <tr>
                                <td>
                                    <table border="1">
                                        <tbody><tr>
                                                <td align="left">

                                                    <table>
                                                        <tbody><tr>
                                                                <td><b><%=name%></b></td>
                                                            </tr>
                                                            <tr>
                                                                <td><b>Share Symbol:</b><%=code%></td>
                                                            </tr>

                                                </tbody></table></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table>
                                                        <tbody><tr>
                                                                <td>
                                                                    <table>
                                                                        <tbody><tr>

                                                                                <td>
                                                                                    <table>
                                                                                        <tbody><tr>
                                                                                                <th></th>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td height="15"></td>
                                                                                            </tr>
                                                                                            <tr>

                                                                                                <td><hr></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><b>Date</b></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><b>Open Price</b></td>
                                                                                            </tr>

                                                                                            <tr>
                                                                                                <td><b>High Price</b></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><b>Low Price</b></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><b>Close Price</b></td>

                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><b>Number Of Trades</b></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><b>Traded Quantity</b></td>
                                                                                            </tr>
                                                                                            <tr>

                                                                                                <td><b>Traded Value</b></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><b>52 Week High</b></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><b>52 Week Low</b></td>

                                                                                            </tr>
                                                                                    </tbody></table>
                                                                                </td>
                                                                            </tr>
                                                                    </tbody></table>
                                                                </td><td valign="top">
                                                                    <table>
                                                                        <tbody><tr>
                                                                                <%

                                                                             for (int j = 0; j < alSharePrice.size(); j++) {
                                                                             UpdateCompanyBean objUCB3 = (UpdateCompanyBean) alSharePrice.get(j);
                                                                             CompanyExchangeBean objCEB1 = (CompanyExchangeBean) alExcahangeId.get(j);
                                                                             int id = Integer.parseInt(objCEB1.getCompanyexchangeid());
                                                                                %>


                                                                                <td valign="top">

                                                                                    <table>
                                                                                        <tbody><tr>
                                                                                                <th align="center" valign="top"><%= objCEB1.getExchangeabbr()%></th>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><hr></td>
                                                                                            </tr>

                                                                                            <tr>

                                                                                                <td><%=objUCB3.getTxtDate()%></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><%=objUCB3.getTxtOpenPrice0()%></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><%=objUCB3.getTxtHighPrice0()%></td>

                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><%=objUCB3.getTxtLowPrice0()%></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><%=objUCB3.getTxtClosePrice0()%></td>
                                                                                            </tr>
                                                                                            <tr>

                                                                                                <td><%=objUCB3.getTxtTrades0()%></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><%=objUCB3.getTxtTradedQuantity0()%></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><%=objUCB3.getTxtTradedValue0()%></td>

                                                                                            </tr>
                                                                                            <%
                                                                                            ArrayList al = objCLS.get52Weekdetail(id);
                                                                                            System.out.println("al sx " + al.size());
                                                                                            for (int k = 0; k < al.size(); k++) {
                                                                                                UpdateCompanyBean objUCB5 = (UpdateCompanyBean) al.get(k);

                                                                                            %>
                                                                                            <tr>
                                                                                                <td><%=objUCB5.getTxt52WeekHigh0()%></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><%=objUCB5.getTxt52WeekLow0()%></td>
                                                                                            </tr>
                                                                                            <%                                                                                }%>
                                                                                    </tbody></table>

                                                                                </td>




                                                                                <%
                                                                                }%>
                                                                            </tr>
                                                                    </tbody></table>
                                                                </td>
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
    </body>
</html>
