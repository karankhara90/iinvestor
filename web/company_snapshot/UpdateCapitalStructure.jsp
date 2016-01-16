<%@page import="beans.companysnapshot.*,datalayer.companysnapshot.*,java.util.ArrayList"%>
<html>
    <head>
        <title>Update Company Capital Structure</title>
        <script>
            function toYearComp(frmYear)
            {
                var toyear=parseInt(frmYear)+1;
                alert(toyear);
                document.getElementById("txtToYear").value=toyear;

            }
            function validate()
            {
                strfromyear=document.getElementById("ddlFromYear").value;
                var d=new Date();
                var year=d.getFullYear();
                if(strfromyeaR>year)
                    {
                        alert("you can not update the data of future");
                        return false;
                    }
                    
                    return true;
            }
        </script>

    </head>
    <%
        int id = Integer.parseInt(request.getParameter("cid"));
        String name = request.getParameter("cname");
        CompanyListingServices cls = new CompanyListingServices();
        UpdateCapitalStructureBean objBean=new UpdateCapitalStructureBean();

    %>
    <body>
        <form name="frmUpdateCapStruct" action="UpdateCapitalStructure_Controller.jsp?cid=<%=id%>" method="post" onsubmit="return validate()">
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
                                    <td colspan="2" align="center" width="100%"><h5>Update Company Capital Structure</h5></td>
                                </tr>

                                <tr>
                                    <td>
                                        <table align="left" border="1" rules="none">
                                            <tbody><tr>
                                                    <td align="center"><%=name%><hr></td>
                                                </tr>
                                                <tr>
                                                    <td>

                                                        <table>
                                                            <tbody>

                                                                <tr>
                                                                    <td>From Year</td>
                                                                    <td>
                                                                        <div id="divFromYear"><select name="ddlFromYear" id="ddlFromYear" onchange="toYearComp(this.value)"><option value="select" selected="selected">Select</option><option value="2007">2007</option><option value="2008">2008</option><option value="2009">2009</option><option value="2010">2010</option><option value="2011">2011</option><option value="2012">2012</option><option value="2013">2013</option><option value="2014">2014</option><option value="2015">2015</option></select></div>
                                                                    </td>

                                                                </tr>

                                                                <tr>
                                                                    <td>To Year</td>

                                                                    <td><input name="txtToYear" id="txtToYear" readonly="readonly" type="text" ></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Class Of Share</td>

                                                                    <td><input id="txtClassOfShare" name="txtClassOfShare" type="text" value=""></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Authorised Capital(Cr.)</td>

                                                                    <td><input name="txtAuthorisedCapital" id="txtAuthorisedCapital" type="text" value=""></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Issued Capital(Cr.)</td>

                                                                    <td><input name="txtIssuedCapital" id="txtIssuedCapital" type="text" value=""></td>
                                                                </tr>


                                                                <tr>
                                                                    <td>Paid Up Shares</td>

                                                                    <td><input name="txtPaidUpShares" id="txtPaidUpShares" type="text" value=""></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Face Value</td>

                                                                    <td><input name="txtFaceValue" id="txtFaceValue" type="text" value=""></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Paid Up Capital(Cr.)</td>

                                                                    <td><input name="txtPaidUpCapital" id="txtPaidUpCapital" type="text" value=""></td>
                                                                </tr>
                                                                <tr><td height="10"></td></tr>
                                                                <tr>
                                                                    <td colspan="2" align="center">
                                                                        <input id="sbtnUpdateCapStruct" name="sbtnUpdateCapStruct" value="Update" type="submit">

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
