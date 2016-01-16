<%@page import="beans.companysnapshot.*,datalayer.companysnapshot.*,java.util.ArrayList"%>
<html>
    <head>
        <title>Create Company</title>
        <script language="javascript" type="text/javascript">
            function removeItem(item)
            {
                var forLoopLength=document.getElementById("hdnRemove").value
                var count=document.getElementById("hdnCount").value;

                if(item=="NSE")
                {
                    document.getElementById("label").innerHTML=""+item+" Security Code"
                    document.getElementById("data").innerHTML="<input type=text id=txtSecurityCode0 name=txtSecurityCode0><br><input value=NSE type=hidden  name=txtSecurityAbbr0>"

                }
                if(item=="BSE")
                {
                    document.getElementById("label1").innerHTML=""+item+"Security Code"
                    document.getElementById("data1").innerHTML="<input type=text id=txtSecurityCode1 name=txtSecurityCode1><br><input value=BSE type=hidden name=txtSecurityAbbr1>"
                }
                var ddl=document.getElementById("ddlExchangeType")
                for(var i=0;i<forLoopLength;i++)
                {
                    var txt=ddl.options[i].text;
                    if(txt==item)
                    {
                        ddl.remove(i);
                        break;
                    }
                }
                document.getElementById("hdnCount").value=parseInt(count)+1;
            }
            function validate()
            {
                strCompName=document.getElementById("txtCompanyName").value
                strCompCode=document.getElementById("txtCompanyCode").value
                strIndustryName=document.getElementById("txtIndustryName").value

               if(document.getElementById("txtSecurityCode0")!=null)
                  {
                      strSecurityCode0=document.getElementById("txtSecurityCode0").value

                    if(isEmpty(strSecurityCode0))
                    {
                        alert("Security Code is required");
                        document.getElementById("txtSecurityCode0").focus();
                        return false;

                    }

                }
                 if(document.getElementById("txtSecurityCode1")!=null)
                  {
                      strSecurityCode1=document.getElementById("txtSecurityCode1").value
                    if(isEmpty(strSecurityCode1))
                    {
                        alert("Security Code is required")
                        document.getElementById("txtSecurityCode1").focus()
                        return false

                    }

                }

                if(isEmpty(strCompName))
                {
                    alert("Company Name is required");
                    document.getElementById("txtCompanyName").focus();
                    return false;
                }
                if(isEmpty(strCompCode))
                {
                    alert("Company Code is required");
                    document.getElementById("txtCompanyCode").focus();
                    return false
                }
                if(isEmpty(strIndustryName))
                {
                    alert("Industry Name is required");
                    document.getElementById("txtIndustryName").focus();
                    return false;
                }
                return true;
            }
        </script>
    </head>

    <body>

        <form name="frmCreateComp" action="CreateCompany_Controller.jsp" method="post" onsubmit="return validate()">
            <table>
                <tbody><tr>

                    </tr>
                    <tr>
                        <td colspan="2" height="10"></td>
                    </tr>
                    <tr>
                        <td align="center">
                            <b>Create Company</b>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table align="center" border="1">
                                <tbody><tr>
                                        <td>

                                            <table>

                                                <tbody><tr>
                                                        <td>
                                                        Company Name</td>
                                                        <td><input name="txtCompanyName" id="txtCompanyName" type="text"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        Company Code</td>

                                                        <td><input name="txtCompanyCode" id="txtCompanyCode" type="text"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                        Industry Name</td>
                                                        <td><input id="txtIndustryName" name="txtIndustryName" type="text"></td>
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
                                                            <select id="ddlExchangeType" name="ddlExchangeType" multiple="multiple"  ondblclick="removeItem(this.value)">

                                                                <option value="NSE">NSE</option>

                                                                <option value="BSE">BSE</option>




                                                            </select>
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
                                                        <td>
                                                            <table><tbody><tr><td><div id="label1"></div></td></tr></tbody></table>
                                                        </td>
                                                        <td>
                                                            <table><tbody><tr><td><div id="data1"></div></td></tr></tbody></table>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td height="10"></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="center">
                                                            <input id="btnSave" name="btnSave" value="Save" type="submit">
                                                            <input id="btnCancel" name="btnCancel" value="Cancel" type="button" onclick="history.go(-1)">
                                                            <input id="rbtnReset" name="rbtnReset" value="Reset" type="reset">
                                                        </td>
                                                    </tr>
                                                    <tr><td height="10"></td></tr>
                                            </tbody></table>
                                        </td>
                                    </tr>

                            </tbody></table>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>

</html>
