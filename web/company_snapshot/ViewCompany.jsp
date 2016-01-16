<%@page import="beans.companysnapshot.*,datalayer.companysnapshot.*"%>
<html>
<head>
  <title></title>
</head>
<%
int cid=Integer.parseInt(request.getParameter("company_id"));
CompanyListingServices cls=new CompanyListingServices();
UpdateCompanySnapshotBean objBean=cls.getViewSnapshot(cid);
%>
<body>
    <table>
    <tr>
        <td><jsp:include page="ViewLeftLinks.jsp"/></td>
    <td>

      <table>
          <tbody><tr>
            <td colspan="2" align="center" width="100%"><h5>View Company Snapshot </h5></td>
      </tr>
        <tr>
         <td>
         <table align="center" border="1">
          <tbody><tr>
        <th align="center"><%=objBean.getCompanyname()%></th>

    </tr>
    <tr>
      <td align="left">
        <table>
           <tbody>
          <tr>
            <td><b>Registered Office</b></td>

            <td><%=objBean.getTaRegisteredOffice()%></td>
          </tr>

          <tr>
            <td><b>Telephone</b></td>
            <td><%=objBean.getTxtPhoneNumber()%></td>
          </tr>

          <tr>
            <td><b>Fax</b></td>
            <td><%=objBean.getTxtFax()%></td>
          </tr>

          <tr>
            <td><b>Website</b></td>
            <td><%=objBean.getTxtWebsite()%></td>

          </tr>

          <tr>
            <td><b>Chief Executive Name</b></td>
            <td><%=objBean.getTxtChiefExecutiveName()%></td>
          </tr>

          <tr>
            <td><b>Secretary Name</b></td>

            <td><%=objBean.getTxtSecretaryName()%></td>
          </tr>

          <tr>
            <td><b>Face Value</b></td>

            <td><%=objBean.getTxtFaceValue()%></td>

          </tr>

          <tr>
            <td><b>Market Lot</b></td>

            <td><%=objBean.getTxtMarketLot()%></td>

          </tr>

          <tr>
            <td><b>Business Group Name</b></td>
            <td><%=objBean.getTxtBusinessGroupName()%></td>

          </tr>

          <tr>
            <td><b>Incorporation Date</b></td>
            <td><%=objBean.getTxtIncorporationDate()%></td>
          </tr>
          <tr>
            <td><b>Industry Name</b></td>

            <td><%=objBean.getIndustryname()%></td>
          </tr>

          <tr>
            <td><b>Registrar Of Company</b></td>
            <td><%=objBean.getTaRegistrarOfCompany()%></td>
          </tr>

          <tr>
            <td><b>Listed On</b></td>
            <td><%=objBean.getTxtListedOn()%></td>
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

