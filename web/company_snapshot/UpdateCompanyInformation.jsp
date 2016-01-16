<%@page import="beans.companysnapshot.*,datalayer.companysnapshot.*,java.util.ArrayList" %>
<html>
    <head>
        <title></title>
    </head>
    <script language="javascript" src="validations.js" type="text/javascript">
    </script>
    <script lanaguage="javascript" type="text/javascript">
        function removeItem(item)
        {

            var count=document.getElementById("txtCount").value;
            var forLoopLength=document.getElementById("hdnRemove").value;
            document.getElementById("label1").innerHTML=""+item+" Security Code"
            document.getElementById("data1").innerHTML="<input type=text name=txtSecurityCode"+count+"><br><input  value=BSE type=hidden name=txtSecurityAbbr"+count+">"
            var ddl=document.getElementById("ddlExchangeType");
            for(var i=0; i < forLoopLength; i++)
            {
                var txt=ddl.options[i].text;
                if(txt==item)
                {
                    ddl.remove(i);
                    break;
                }

            }
            document.getElementById("txtCount").value=parseInt(count)+1
        }
        function validateForm()
        {
            var strCompanyName=document.getElementById("txtCompanyName").value;
            if (isEmpty(strCompanyName)==true)
            {
                alert("Company Name can't be empty");
                document.getElementById("txtCompanyName").focus();
                return false;
            }


            if (isNumeric(strCompanyName)==true)
            {
                alert("Company Name should be alphabetic");
                document.getElementById("txtCompanyName").focus();
                return false;
            }
            var strCompanyCode=document.getElementById("txtCompanyCode").value;
            if (isEmpty(strCompanyCode)==true)
            {
                alert("Company Code can't be empty");
                document.getElementById("txtCompanyCode").focus();
                return false;
            }


            var strIndustryName=document.getElementById("txtIndustryName").value;
            if (isEmpty(strIndustryName)==true)
            {
                alert("Industry Name can't be empty");
                document.getElementById("txtIndustryName").focus();
                return false;
            }

            if (isNumeric(strIndustryName)==true)
            {
                alert("Industry Name should be alphabetic");
                document.getElementById("txtIndustryName").focus();
                return false;
            }

            return true;
        }
    </script>

    <body>
        <% int companyid = Integer.parseInt(request.getParameter("cid"));
        CompanyListingServices objCMS = new CompanyListingServices();
        UpdateCompanyInformationBean objBean = objCMS.getViewCompany(companyid);
        %>
        <form action="UpdateCompanyInformation_Controller.jsp?cid=<%=companyid%>" method="post" onsubmit="return validateForm()">
            <table>
                <tr>
                    <td><input type="hidden" name="txtcompanyid" value="<%=companyid%>">
                </tr>
                <tr>
                    <td colspan="2">
                        <%
        String str = "";
        if (session.getAttribute("updateMsg") != null) {
            str = session.getAttribute("updateMsg").toString();
        }

                        %>
                        <%=str%>

                        <%
        session.removeAttribute("updateMsg");

                        %>


                    </td>
                </tr>
                <tr>


                    <td>
                        <jsp:include page="UpdateLeftLinks.jsp" />
                    </td>

                    <td>
                        <table>

                            <tbody><tr>

                                </tr>
                                <tr>
                                    <td colspan="3" height="10"></td>
                                </tr>
                                <tr>
                                    <td colspan="3" align="center" width="100%"><h4>Update Company Information</h4></td>
                                </tr>

                                <tr>
                                    <td>

                                        <table border="1">
                                            <tbody><tr>
                                                    <td>

                                                        <table>
                                                            <tbody><tr>
                                                                    <td colspan="3" height="10"></td>
                                                                </tr>
                                                                <tr>

                                                                    <td>Company Name</td>
                                                                    <td><input id="txtCompanyName" name="txtCompanyName" value="<%=objBean.getTxtCompanyName()%>" type="text"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Company Code</td>
                                                                    <td><input id="txtCompanyCode" name="txtCompanyCode" value="<%=objBean.getTxtCompanyCode()%>" type="text"></td>
                                                                </tr>
                                                                <tr>

                                                                    <td>Industry Name</td>
                                                                    <td><input id="txtIndustryName" name="txtIndustryName" value="<%=objBean.getTxtIndustryName()%>" type="text"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>


                                                                        <input type="hidden" name="hdnRemove" id="hdnRemove" value="2">
                                                                        <input type="hidden" name="hdnCount" id="hdnCount" value="0">

                                                                    </td>
                                                                </tr>


                                                                <tr>
                                                                    <td>Exchange Type</td>

                                                                    <td>
                                                                        <select id="ddlExchangeType" name="ddlExchangeType" multiple="multiple" ondblclick="removeItem(this.value)">
                                                                            <%
        ArrayList al = objCMS.getCompanyExchange(companyid);
        String arr[] = {"NSE", "BSE"};


        // for (int i = 0; i < arr.length; i++) {
        int flag = 0;
        //   String str1 = arr[i];
        boolean str1 = true;
        boolean str2 = true;
        for (int j = 0; j < al.size(); j++) {
            CompanyExchangeBean objBean1 = (CompanyExchangeBean) al.get(j);
            String abbr = objBean1.getExchangeabbr();
            if (abbr.equalsIgnoreCase("NSE")) {
                str1 = false;

            } else if (abbr.equalsIgnoreCase("BSE")) {
                str2 = false;

            }
        }

        if (str1) {

                                                                            %>
                                                                            <option value="NSE">NSE
                                                                            <%        }
        if (str2) {

                                                                            %>
                                                                            <option value="BSE">BSE
                                                                            <%        }
                                                                            %>




                                                                        </select>
                                                                        <input type="hidden" id="txtCount" name="txtCount" value="<%=al.size()%>">
                                                                    </td>
                                                                </tr>
                                                                <%


        for (int k = 0; k < al.size(); k++) {
            CompanyExchangeBean objCcb = (CompanyExchangeBean) al.get(k);

                                                                %>
                                                                <tr>
                                                                    <td><input type="hidden" value="<%=objCcb.getCompanyexchangeid()%>" name="txtExchangeid<%=k%>">
                                                                        <%=objCcb.getExchangeabbr() + " Security Code"%>
                                                                    </td>
                                                                    <td>
                                                                        <table>
                                                                            <tr>
                                                                                <td><input type="text"   name="txtSecurityCode<%=k%>" readonly="readonly" value="<%=objCcb.getExchangesecuritycode()%>"></td>
                                                                                <td><select name="ddlStatus<%=k%>">
                                                                                        <option value="1"/>Active
                                                                                        <option value="0"/>InActive
                                                                                    </select>
                                                                                </td>

                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>

                                                                <%
        }
                                                                %>


                                                                <tr>
                                                                    <td>
                                                                        <table><tbody><tr><td><div id="label1"></div></td></tr></tbody></table>
                                                                    </td>
                                                                    <td>
                                                                        <table><tbody><tr><td><div id="data1"></div></td></tr></tbody></table>
                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td>
                                                                        <table><tbody><tr><td><div id="label"></div></td></tr></tbody></table>
                                                                    </td>
                                                                    <td>
                                                                        <table><tbody><tr><td><div id="data"></div></td></tr></tbody></table>
                                                                    </td>
                                                                </tr>
                                                                <tr>

                                                                    <td height="10"></td>
                                                                </tr>
                                                                <tr>
                                                                </tr><tr><td height="10"></td></tr>
                                                                <tr>
                                                                    <td colspan="4" align="center">
                                                                        <input id="sbtnUpdate" name="sbtnUpdate" value="Update" type="submit">
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
        </form>
    </body>

</html>
