<%@page import="beans.companysnapshot.*,datalayer.companysnapshot.*,java.util.ArrayList"%>
<html>
    <head>
        <title></title>
        <script lanaguage="javascript" type="text/javascript">
            function validateForm()
            {
                var strDate=document.getElementById("txtDate").value;
                if (isFutureDate(strDate)==true)
                {
                    alert("Incorrect date");
                    document.getElementById("txtDate").value="";
                    document.getElementById("txtDate").focus();
                    return false;
                }
                if (isEmpty(strDate)==true)
                {
                    alert("Date field can't be empty");
                    document.getElementById("txtDate").focus();
                    return false;
                }

                var strOpenPrice0=document.getElementById("txtOpenPrice0").value;

                if (isEmpty(strOpenPrice0)==true)
                {
                    alert("Open Price can't be empty");
                    document.getElementById("txtOpenPrice0").focus();
                    return false;
                }

                if (hasSpace(strOpenPrice0)==true)
                {
                    alert("Open Price should not have spaces");
                    document.getElementById("txtOpenPrice0").value="";
                    document.getElementById("txtOpenPrice0").focus();
                    return false;
                }
                if (isNumeric(strOpenPrice0)==false)
                {
                    alert("Open Price should be numeric");
                    document.getElementById("txtOpenPrice0").value="";
                    document.getElementById("txtOpenPrice0").focus();
                    return false;
                }
                var strOpenPrice1=document.getElementById("txtOpenPrice1").value;

                if (isEmpty(strOpenPrice1)==true)
                {
                    alert("Open Price can't be empty");
                    document.getElementById("txtOpenPrice1").focus();
                    return false;
                }

                if (hasSpace(strOpenPrice1)==true)
                {
                    alert("Open Price should not have spaces");
                    document.getElementById("txtOpenPrice1").value="";
                    document.getElementById("txtOpenPrice1").focus();
                    return false;
                }
                if (isNumeric(strOpenPrice1)==false)
                {
                    alert("Open Price should be numeric");
                    document.getElementById("txtOpenPrice1").value="";
                    document.getElementById("txtOpenPrice1").focus();
                    return false;
                }
                var strHighPrice0=document.getElementById("txtHighPrice0").value;
                if (isEmpty(strHighPrice0)==true)
                {
                    alert("High Price can't be empty");
                    document.getElementById("txtHighPrice0").focus();
                    return false;
                }

                if (hasSpace(strHighPrice0)==true)
                {
                    alert("High Price should not have spaces");
                    document.getElementById("txtHighPrice0").value="";
                    document.getElementById("txtHighPrice0").focus();
                    return false;
                }
                if (isNumeric(strHighPrice0)==false)
                {
                    alert("High Price should be numeric");
                    document.getElementById("txtHighPrice0").value="";
                    document.getElementById("txtHighPrice0").focus();
                    return false;
                }
                var strHighPrice1=document.getElementById("txtHighPrice1").value;
                if (isEmpty(strHighPrice1)==true)
                {
                    alert("High Price can't be empty");
                    document.getElementById("txtHighPrice1").focus();
                    return false;
                }

                if (hasSpace(strHighPrice1)==true)
                {
                    alert("High Price should not have spaces");
                    document.getElementById("txtHighPrice1").value="";
                    document.getElementById("txtHighPrice1").focus();
                    return false;
                }
                if (isNumeric(strHighPrice1)==false)
                {
                    alert("High Price should be numeric");
                    document.getElementById("txtHighPrice1").value="";
                    document.getElementById("txtHighPrice1").focus();
                    return false;
                }
                var strLowPrice0=document.getElementById("txtLowPrice0").value;
                if (isEmpty(strLowPrice0)==true)
                {
                    alert("Low Price can't be empty");
                    document.getElementById("txtLowPrice0").focus();
                    return false;
                }

                if (hasSpace(strLowPrice0)==true)
                {
                    alert("Low Price should not have spaces");
                    document.getElementById("txtLowPrice0").value="";
                    document.getElementById("txtLowPrice0").focus();
                    return false;
                }
                if (isNumeric(strLowPrice0)==false)
                {
                    alert("Low Price should be numeric");
                    document.getElementById("txtLowPrice0").value="";
                    document.getElementById("txtLowPrice0").focus();
                    return false;
                }
                var strLowPrice1=document.getElementById("txtLowPrice1").value;
                if (isEmpty(strLowPrice1)==true)
                {
                    alert("Low Price can't be empty");
                    document.getElementById("txtLowPrice1").focus();
                    return false;
                }

                if (hasSpace(strLowPrice1)==true)
                {
                    alert("Low Price should not have spaces");
                    document.getElementById("txtLowPrice1").value="";
                    document.getElementById("txtLowPrice1").focus();
                    return false;
                }
                if (isNumeric(strLowPrice1)==false)
                {
                    alert("Low Price should be numeric");
                    document.getElementById("txtLowPrice1").value="";
                    document.getElementById("txtLowPrice1").focus();
                    return false;
                }
                var strClosePrice0=document.getElementById("txtClosePrice0").value;
                if (isEmpty(strClosePrice0)==true)
                {
                    alert("Close Price can't be empty");
                    document.getElementById("txtClosePrice0").focus();
                    return false;
                }

                if (hasSpace(strClosePrice0)==true)
                {
                    alert("Close Price should not have spaces");
                    document.getElementById("txtClosePrice0").value="";
                    document.getElementById("txtClosePrice0").focus();
                    return false;
                }
                if (isNumeric(strClosePrice0)==false)
                {
                    alert("Close Price should be numeric");
                    document.getElementById("txtClosePrice0").value="";
                    document.getElementById("txtClosePrice0").focus();
                    return false;
                }
                var strClosePrice1=document.getElementById("txtClosePrice1").value;
                if (isEmpty(strClosePrice1)==true)
                {
                    alert("Close Price can't be empty");
                    document.getElementById("txtClosePrice1").focus();
                    return false;
                }

                if (hasSpace(strClosePrice1)==true)
                {
                    alert("Close Price should not have spaces");
                    document.getElementById("txtClosePrice1").value="";
                    document.getElementById("txtClosePrice1").focus();
                    return false;
                }
                if (isNumeric(strClosePrice1)==false)
                {
                    alert("Close Price should be numeric");
                    document.getElementById("txtClosePrice1").value="";
                    document.getElementById("txtClosePrice1").focus();
                    return false;
                }
                var strTrades0=document.getElementById("txtTrades0").value;
                if (isEmpty(strTrades0)==true)
                {
                    alert("Trades can't be empty");
                    document.getElementById("txtTrades0").focus();
                    return false;
                }

                if (hasSpace(strTrades0)==true)
                {
                    alert("Trades should not have spaces");
                    document.getElementById("txtTrades0").value="";
                    document.getElementById("txtTrades0").focus();
                    return false;
                }
                if (isNumeric(strTrades0)==false)
                {
                    alert("Trades should be numeric");
                    document.getElementById("txtTrades0").value="";
                    document.getElementById("txtTrades0").focus();
                    return false;
                }
                var strTrades1=document.getElementById("txtTrades1").value;
                if (isEmpty(strTrades1)==true)
                {
                    alert("Trades can't be empty");
                    document.getElementById("txtTrades1").focus();
                    return false;
                }

                if (hasSpace(strTrades1)==true)
                {
                    alert("Trades should not have spaces");
                    document.getElementById("txtTrades1").value="";
                    document.getElementById("txtTrades1").focus();
                    return false;
                }
                if (isNumeric(strTrades1)==false)
                {
                    alert("Trades should be numeric");
                    document.getElementById("txtTrades1").value="";
                    document.getElementById("txtTrades1").focus();
                    return false;
                }
                var strTradedQuantity0=document.getElementById("txtTradedQuantity0").value;
                if (isEmpty(strTradedQuantity0)==true)
                {
                    alert("Traded Quantity can't be empty");
                    document.getElementById("txtTradedQuantity0").focus();
                    return false;
                }

                if (hasSpace(strTradedQuantity0)==true)
                {
                    alert("Traded Quantity should not have spaces");
                    document.getElementById("txtTradedQuantity0").value="";
                    document.getElementById("txtTradedQuantity0").focus();
                    return false;
                }
                if (isNumeric(strTradedQuantity0)==false)
                {
                    alert("Traded Quantity should be numeric");
                    document.getElementById("txtTradedQuantity0").value="";
                    document.getElementById("txtTradedQuantity0").focus();
                    return false;
                }
                var strTradedQuantity1=document.getElementById("txtTradedQuantity1").value;
                if (isEmpty(strTradedQuantity1)==true)
                {
                    alert("Traded Quantity can't be empty");
                    document.getElementById("txtTradedQuantity1").focus();
                    return false;
                }

                if (hasSpace(strTradedQuantity1)==true)
                {
                    alert("Traded Quantity should not have spaces");
                    document.getElementById("txtTradedQuantity1").value="";
                    document.getElementById("txtTradedQuantity1").focus();
                    return false;
                }
                if (isNumeric(strTradedQuantity1)==false)
                {
                    alert("Traded Quantity should be numeric");
                    document.getElementById("txtTradedQuantity1").value="";
                    document.getElementById("txtTradedQuantity1").focus();
                    return false;
                }
                var strTradedValue0=document.getElementById("txtTradedValue0").value;
                if (isEmpty(strTradedValue0)==true)
                {
                    alert("Traded Value can't be empty");
                    document.getElementById("txtTradedValue0").focus();
                    return false;
                }

                if (hasSpace(strTradedValue0)==true)
                {
                    alert("Traded Value should not have spaces");
                    document.getElementById("txtTradedValue0").value="";
                    document.getElementById("txtTradedValue0").focus();
                    return false;
                }
                if (isNumeric(strTradedValue0)==false)
                {
                    alert("Traded Value should be numeric");
                    document.getElementById("txtTradedValue0").value="";
                    document.getElementById("txtTradedValue0").focus();
                    return false;
                }
                var strTradedValue1=document.getElementById("txtTradedValue1").value;
                if (isEmpty(strTradedValue1)==true)
                {
                    alert("Traded Value can't be empty");
                    document.getElementById("txtTradedValue1").focus();
                    return false;
                }

                if (hasSpace(strTradedValue1)==true)
                {
                    alert("Traded Value should not have spaces");
                    document.getElementById("txtTradedValue1").value="";
                    document.getElementById("txtTradedValue1").focus();
                    return false;
                }
                if (isNumeric(strTradedValue1)==false)
                {
                    alert("Traded Value should be numeric");
                    document.getElementById("txtTradedValue1").value="";
                    document.getElementById("txtTradedValue1").focus();
                    return false;
                }
                var str52WeekHigh0=document.getElementById("txt52WeekHigh0").value;
                if (isEmpty(str52WeekHigh0)==true)
                {
                    alert("52 Week High can't be empty");
                    document.getElementById("txt52WeekHigh0").focus();
                    return false;
                }

                if (hasSpace(str52WeekHigh0)==true)
                {
                    alert("52 Week High should not have spaces");
                    document.getElementById("txt52WeekHigh0").value="";
                    document.getElementById("txt52WeekHigh0").focus();
                    return false;
                }
                if (isNumeric(str52WeekHigh0)==false)
                {
                    alert("52 Week High should be numeric");
                    document.getElementById("txt52WeekHigh0").value="";
                    document.getElementById("txt52WeekHigh0").focus();
                    return false;
                }
                var str52WeekHigh1=document.getElementById("txt52WeekHigh1").value;
                if (isEmpty(str52WeekHigh1)==true)
                {
                    alert("52 Week High can't be empty");
                    document.getElementById("txt52WeekHigh1").focus();
                    return false;
                }

                if (hasSpace(str52WeekHigh1)==true)
                {
                    alert("52 Week High should not have spaces");
                    document.getElementById("txt52WeekHigh1").value="";
                    document.getElementById("txt52WeekHigh1").focus();
                    return false;
                }
                if (isNumeric(str52WeekHigh1)==false)
                {
                    alert("52 Week High should be numeric");
                    document.getElementById("txt52WeekHigh1").value="";
                    document.getElementById("txt52WeekHigh1").focus();
                    return false;
                }
                var str52WeekLow0=document.getElementById("txt52WeekLow0").value;
                if (isEmpty(str52WeekLow0)==true)
                {
                    alert("52 Week Low can't be empty");
                    document.getElementById("txt52WeekLow0").focus();
                    return false;
                }

                if (hasSpace(str52WeekLow0)==true)
                {
                    alert("52 Week Low should not have spaces");
                    document.getElementById("txt52WeekLow0").value="";
                    document.getElementById("txt52WeekLow0").focus();
                    return false;
                }
                if (isNumeric(str52WeekLow0)==false)
                {
                    alert("52 Week Low should be numeric");
                    document.getElementById("txt52WeekLow0").value="";
                    document.getElementById("txt52WeekLow0").focus();
                    return false;
                }
                var str52WeekLow1=document.getElementById("txt52WeekLow1").value;
                if (isEmpty(str52WeekLow1)==true)
                {
                    alert("52 Week Low can't be empty");
                    document.getElementById("txt52WeekLow1").focus();
                    return false;
                }

                if (hasSpace(str52WeekLow1)==true)
                {
                    alert("52 Week Low should not have spaces");
                    document.getElementById("txt52WeekLow1").value="";
                    document.getElementById("txt52WeekLow1").focus();
                    return false;
                }
                if (isNumeric(str52WeekLow1)==false)
                {
                    alert("52 Week Low should be numeric");
                    document.getElementById("txt52WeekLow1").value="";
                    document.getElementById("txt52WeekLow1").focus();
                    return false;
                }

                return true;
            }
        </script>
        <script language="JavaScript">
            $(function() {

                $("#txtDate").datepicker();
                $('#txtDate').datepicker('option',
                {
                    dateFormat : 'yy-mm-dd' ,
                    // maxDate:0,
                    // minDate:-100,
                    changeMonth:true,
                    changeYear:true
                }
            );

                $("#txtDOJ").datepicker();
                $('#txtDOJ').datepicker('option',
                {
                    dateFormat : 'dd-mm-yy' ,
                    maxDate:0,  //this attribute to be commented if future date is to be allowed

                    changeMonth:true,
                    changeYear:true
                }
            );
            });
        </script>

    </head>
    <%

        int companyid = Integer.parseInt(request.getParameter("cid"));
        String name = request.getParameter("cname");
        String code = request.getParameter("code");
        CompanyListingServices objCls = new CompanyListingServices();
        ArrayList al = objCls.getCompanyExchange(companyid);


    %>

    <body>
        <form name="frmUpdateSharePrice" action="UpdateSharePrice_Controller.jsp?cid=<%=companyid%>" method="POST">

            <table>



                <tr>
                    <td>
                        <jsp:include page="UpdateLeftLinks.jsp" ></jsp:include>


                    </td>

                    <td>


                        <table>
                            <tbody><tr>

                                </tr>
                                <tr>
                                    <td colspan="2" height="10"></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center" width="100%"><h4>Update Company Share Price</h4></td>
                                </tr>

                                <tr>
                                    <td>
                                        <table align="left" border="1" rules="none">
                                            <tbody><tr>
                                                    <td align="left">
                                                        <table>
                                                            <tbody><tr>
                                                                    <td><%=name%></td>

                                                                </tr>
                                                                <tr>
                                                                    <td>Share Symbol:<%=code%></td>
                                                </tr></tbody></table></td></tr>

                                                <tr>

                                                    <td>
                                                        <table>
                                                            <tbody><tr>
                                                                    <td colspan="3"><hr></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <%

        if (al.size() > 0) {
            for (int i = 0; i < al.size(); i++) {
                CompanyExchangeBean objBean = (CompanyExchangeBean) al.get(i);




                                                                    %>

                                                                    <input type="hidden" name="txtCompanyExchangeId<%=i%>" id="txtCompanyExchangeId<%=i%>" value="<%=objBean.getCompanyexchangeid()%>">
                                                                    <td align="center"><%=objBean.getExchangeabbr()%></td>

                                                                    <%        }
        }
                                                                    %>


                                                                </tr>
                                                                <tr>
                                                                    <td></td>


                                                                </tr>
                                                                <tr>
                                                                    <td colspan="3"><hr></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Date</td>
                                                                    <td colspan="2"><input name="txtDate" id="txtDate" readonly type="text">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Open Price</td>

                                                                    <%
        for (int i = 0; i < al.size(); i++) {
            System.out.println("asa " + al.size());
                                                                    %>
                                                                    <td><input name="txtOpenPrice<%=i%>" id="txtOpenPrice<%=i%>" type="text"></td>
                                                                    <%
        }
                                                                    %>

                                                                </tr>
                                                                <%
        System.out.println("above high price");
                                                                %>
                                                                <tr>
                                                                    <td>High Price</td>
                                                                    <%
        for (int i = 0; i < al.size(); i++) {
            System.out.println("High " + al.size());
                                                                    %>

                                                                    <td><input name="txtHighPrice<%=i%>" id="txtHighPrice<%=i%>" type="text"></td>

                                                                    <%
        }
                                                                    %>

                                                                </tr>

                                                                <tr>
                                                                    <td>Low Price</td>
                                                                    <%
        for (int i = 0; i < al.size(); i++) {
                                                                    %>

                                                                    <td><input name="txtLowPrice<%=i%>" id="txtLowPrice<%=i%>" type="text"></td>

                                                                    <%
        }
                                                                    %>

                                                                </tr>
                                                                <tr>
                                                                    <td>Close Price</td>
                                                                    <%
        for (int i = 0; i < al.size(); i++) {
                                                                    %>

                                                                    <td><input name="txtClosePrice<%=i%>" id="txtClosePrice<%=i%>" type="text"></td>

                                                                    <%
        }
                                                                    %>


                                                                </tr>
                                                                <tr>
                                                                    <td>Number Of Trades</td>
                                                                    <%
        for (int i = 0; i < al.size(); i++) {
                                                                    %>

                                                                    <td><input name="txtTrades<%=i%>" id="txtTrades<%=i%>" type="text"></td>
                                                                    <%
        }
                                                                    %>


                                                                </tr>
                                                                <tr>

                                                                    <td>Traded Quantity</td>
                                                                    <%
        for (int i = 0; i < al.size(); i++) {
                                                                    %>

                                                                    <td><input name="txtTradedQuantity<%=i%>" id="txtTradedQuantity<%=i%>" type="text"></td>

                                                                    <%
        }
                                                                    %>

                                                                </tr>
                                                                <tr>
                                                                    <td>Traded Value</td>
                                                                    <%
        for (int i = 0; i < al.size(); i++) {
                                                                    %>

                                                                    <td><input name="txtTradedValue<%=i%>" id="txtTradedValue<%=i%>" type="text"></td>


                                                                    <%
        }
                                                                    %>

                                                                </tr>
                                                                <tr>
                                                                    <td>52 Week High</td>
                                                                    <%



        System.out.println("al sx " + al.size());
        for (int k = 0; k < al.size(); k++) {

            CompanyExchangeBean objCEB = (CompanyExchangeBean) al.get(k);
            int exid = Integer.parseInt(objCEB.getCompanyexchangeid());
            ArrayList al52 = objCls.get52Weekdetail(exid);




            for (int i = 0; i < al52.size(); i++) {
                UpdateCompanyBean objUCB5 = (UpdateCompanyBean) al52.get(i);

                                                                    %>

                                                                    <td><input name="txt52WeekHigh<%=i%>" id="txt52WeekHigh<%=i%>"  value="<%=objUCB5.getTxt52WeekHigh0()%>" type="text"  readonly="readonly"></td>

                                                                    <%
            }
        }
                                                                    %>

                                                                </tr>
                                                                <tr>
                                                                    <td>52 Week Low</td>
                                                                    <%

        for (int k = 0; k < al.size(); k++) {

            CompanyExchangeBean objCEB = (CompanyExchangeBean) al.get(k);
            int exid = Integer.parseInt(objCEB.getCompanyexchangeid());
            ArrayList al52 = objCls.get52Weekdetail(exid);
            for (int i = 0; i < al52.size(); i++) {
                UpdateCompanyBean objUCB5 = (UpdateCompanyBean) al52.get(i);
                                                                    %>

                                                                    <td><input name="txt52WeekLow<%=i%>" id="txt52WeekLow<%=i%>"  value="<%=objUCB5.getTxt52WeekLow0()%>" type="text" readonly="readonly" ></td>

                                                                    <%
            }
        }
                                                                    %>

                                                                </tr>
                                                                <tr><td height="10"></td></tr>
                                                                <tr>
                                                                    <td colspan="3" align="center">
                                                                    <input id="btnUpdateShare" name="btnUpdateShare" value="Update" type="submit"></td>
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
