<html>
<head>
  <title></title>
</head>
<%
String id=request.getParameter("cid");
String name=request.getParameter("cname");
String code=request.getParameter("code");
%>
<body>

        <table>
          <tr>
            <td><a href="masterpage_UpdateCompanyInformation.jsp?cid=<%=id%>&cname=<%=name%>&code=<%=code%>">Update Company Information</a></td>
          </tr>

          <tr>
            <td><a href="masterpage_UpdateCompanySnapShot.jsp?cid=<%=id%>&cname=<%=name%>&code=<%=code%>">Update Company Snapshot</a></td>
          </tr>

          <tr>
            <td><a href="masterpage_UpdateSharePrice.jsp?cid=<%=id%>&cname=<%=name%>&code=<%=code%>">Update Share Price</a></td>
          </tr>

          <tr>
            <td><a href="masterpage_UpdateCapitalStructure.jsp?cid=<%=id%>&cname=<%=name%>&code=<%=code%>">Update Capital Structure</a></td>
          </tr>

          <tr>
            <td><a href="masterpage_UpdateFundamentals.jsp?cid=<%=id%>&cname=<%=name%>&code=<%=code%>">Update Fundamentals</a></td>
          </tr>

          <tr>
            <td><a href="masterpage_UpdateQuarterlyResult.jsp?cid=<%=id%>&cname=<%=name%>&code=<%=code%>">Update Quarterly Result</a></td>
          </tr>



          <tr>
            <td><a href="masterpage_CompanyListing.jsp">Back</a></td>
          </tr>
        </table>
     
</body>

</html>
