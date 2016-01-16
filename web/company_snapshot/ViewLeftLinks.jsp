<%@page import="beans.companysnapshot.*,datalayer.companysnapshot.*"%>
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
            <td><a href="masterpage_ViewCompanySnapShot.jsp?cid=<%=id%>&cname=<%=name%>&code=<%=code%>">View Company Snapshot</a></td>
          </tr>

          <tr>
            <td><a href="masterpage_ViewSharePrice.jsp?cid=<%=id%>&cname=<%=name%>&code=<%=code%>">View Share Price</a></td>
          </tr>

          <tr>
            <td><a href="masterpage_ViewCapitalStructure.jsp?cid=<%=id%>&cname=<%=name%>&code=<%=code%>">View Capital Structure</a></td>
          </tr>

          <tr>
            <td><a href="masterpage_ViewFundamentals.jsp?cid=<%=id%>&cname=<%=name%>&code=<%=code%>">View Fundamentals</a></td>
          </tr>
          <tr>
            <td><a href="masterpage_ViewQuarterlyResult.jsp?cid=<%=id%>&cname=<%=name%>&code=<%=code%>">View Quarterly Result</a></td>
          </tr>

          <tr>
            <td><a href="masterpage_CompanyListing.jsp">Back</a></td>
          </tr>
        </table>

</body>

</html>
