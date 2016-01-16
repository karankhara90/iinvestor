<%@page import="beans.companysnapshot.*,datalayer.companysnapshot.*"%>
<html>
    <head>
        <title></title>
        <script language="javascript" type="text/javascript">
            function validate()
            {
                strRegisteredOffice=document.getElementById("taRegisteredOffice").value
                strPhone=document.getElementById("txtPhoneNumber").value

                strFax=document.getElementById("txtFax").value
                strWebsite=document.getElementById("txtWebsite").value
                strChiefExecName=document.getElementById("txtChiefExecutiveName").value
                strSecName=document.getElementById("txtSecretaryName").value
                strFaceValue=document.getElementById("txtFaceValue").value
                strMarketLot=document.getElementById("txtMarketLot").value
                strBusinessGpName=document.getElementById("txtBusinessGroupName").value
                strIncorporationDate=document.getElementById("txtIncorporationDate").value
                strRegistrarOfComp=document.getElementById("taRegistrarOfCompany").value
                strListedOn=document.getElementById("txtListedOn").value
                if(isEmpty(strRegisteredOffice))
                {
                    alert("Registered Office is required")
                    document.getElementById("taRegisteredOffice").focus()
                    return false
                }
                if(isEmpty(strPhone))
                {
                    alert("Phone no is required")
                    document.getElementById("txtPhoneNumber").focus()
                    return false
                }
                if(isEmpty(strFax))
                {
                    alert("Fax no is required")
                    document.getElementById("txtFax").focus()
                    return false
                }
                if(isEmpty(strWebsite))
                {
                    alert("Website is required")
                    document.getElementById("txtWebsite").focus()
                    return false

                }
                if(isEmpty(strChiefExecName))
                {
                    alert("Chief Executive name is required")
                    document.getElementById("txtChiefExecutiveName").focus()
                    return false
                }
                if(isEmpty(strSecName))
                {
                    alert("Secretary name is required")
                    document.getElementById("").focus()
                    return false
                }

                if(!(isNumeric(strPhone)))
                {
                    alert("Phone no should be numeric")
                    document.getElementById("txtPhoneNumber").focus()
                    return false
                }
                if(isInRange(1,10,strPhone))
                {
                    alert("Phone no should be of 10 characters")
                    document.getElementById("txtPhoneNumber").focus()
                    return false

                }

                if(isFutureDate(strIncorporationDate))
                {
                    alert("Date specified is not valid.")
                    document.getElementById("txtIncorporationDate").focus()
                    return false
                }

                return true
            }
        </script>
        <script language="JavaScript">
            $(function() {

                $("#txtIncorporationDate").datepicker();
                $('#txtIncorporationDate').datepicker('option',
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
        int compid = Integer.parseInt(request.getParameter("cid"));
        CompanyListingServices cls = new CompanyListingServices();
        UpdateCompanySnapshotBean objBean = cls.getViewSnapshot(compid);
    %>
    <body>
        <form name="frmUpdateSnapshot" action="UpdateCompanySnapShot_Controller.jsp?cid=<%=compid%>" method="post" onsubmit="return validate()">
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
                                    <td colspan="2" align="center" width="100%"><h4>Update Company SnapShot</h4></td>
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
                                                                    <td>Registered Office</td>

                                                                    <td><textarea name="taRegisteredOffice" id="taRegisteredOffice" rows="3"><%=objBean.getTaRegisteredOffice()%></textarea></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Phone Number</td>

                                                                    <td><input name="txtPhoneNumber" id="txtPhoneNumber" value="<%=objBean.getTxtPhoneNumber()%>" type="text"></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Fax</td>

                                                                    <td><input name="txtFax" id="txtFax" value="<%=objBean.getTxtFax()%>" type="text"></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Website</td>
                                                                    <td><input name="txtWebsite" id="txtWebsite" value="<%=objBean.getTxtWebsite()%>" type="text"></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Chief Executive Name</td>

                                                                    <td><input name="txtChiefExecutiveName" id="txtChiefExecutiveName" value="<%=objBean.getTxtChiefExecutiveName()%>" type="text"></td>

                                                                </tr>

                                                                <tr>
                                                                    <td>Secretary Name</td>

                                                                    <td><input name="txtSecretaryName" id="txtSecretaryName" value="<%=objBean.getTxtSecretaryName()%>" type="text"></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Face Value</td>


                                                                    <td><input name="txtFaceValue" id="txtFaceValue" value="<%=objBean.getTxtFaceValue()%>" type="text"></td>

                                                                </tr>

                                                                <tr>
                                                                    <td>Market Lot</td>

                                                                    <td><input name="txtMarketLot" id="txtMarketLot" value="<%=objBean.getTxtMarketLot()%>" type="text"></td>

                                                                </tr>

                                                                <tr>

                                                                    <td>Business Group Name</td>

                                                                    <td><input name="txtBusinessGroupName" id="txtBusinessGroupName" value="<%=objBean.getTxtBusinessGroupName()%> " type="text"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Incorporation Date</td>

                                                                    <td><input name="txtIncorporationDate" id="txtIncorporationDate" value="<%=objBean.getTxtIncorporationDate()%>" readonly="readonly" type="text">
                                                                    </td>

                                                                </tr>
                                                                <tr>
                                                                    <td>Registrar Of Company</td>

                                                                    <td><textarea name="taRegistrarOfCompany" id="taRegistrarOfCompany" rows="3"><%=objBean.getTaRegistrarOfCompany()%></textarea></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>Listed On</td>

                                                                    <td><input name="txtListedOn" id="txtListedOn" value="<%=objBean.getTxtListedOn()%>" type="text"></td>
                                                                </tr>
                                                                <tr><td height="10"></td></tr>
                                                                <tr>
                                                                    <td colspan="2" align="center">
                                                                    <input id="sbtnUpdateSnapshot" name="sbtnUpdateSnapshot" value="Update" type="submit"></td>
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
