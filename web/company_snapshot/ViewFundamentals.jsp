<%@page import="beans.companysnapshot.*,datalayer.companysnapshot.*"%>
<html>
<head>
  <title></title>
</head>
<%
    int compid=Integer.parseInt(request.getParameter("cid"));
    CompanyListingServices cls=new CompanyListingServices();
    UpdateFundamentalsBean objBean=cls.getCompanyFundamentals(compid);
%>
<body>
      <table>
    <tr>
        <td><jsp:include page="ViewLeftLinks.jsp"/></td>
    <td>
  <table>
    <tbody><tr>
            <td colspan="2" align="center" width="100%"><h5>View Company Fundamentals</h5></td>
        </tr>
        <tr>
         <td>
  <table border="1">
    <tbody><tr>
        <th align="center"><%=objBean.getCompanyname()%></th>

    </tr>
    <tr>
      <td>
        <table>
           <tbody>
          <tr>

            <td><b>Market Capitalization(Rs Cr.)</b></td>
            <td><%=objBean.getTxtMarketCapitalization()%></td>
          </tr>

          <tr>
            <td><b>Book Value</b></td>
            <td><%=objBean.getTxtBookValue()%></td>

          </tr>

          <tr>
            <td><b>Debt/Equity</b></td>
            <td><%=objBean.getTxtDebtEquity()%></td>
          </tr>

          <tr>
            <td><b>P/E</b></td>

            <td><%=objBean.getTxtPE()%></td>
          </tr>

          <tr>
            <td><b>Dividend Yield(%)</b></td>
            <td><%=objBean.getTxtDividendYield()%></td>
          </tr>

          <tr>
            <td><b>EPS</b></td>
            <td><%=objBean.getTxtEPS()%></td>
          </tr>

          <tr>
            <td><b>Return On Net Worth</b></td>
            <td><%=objBean.getTxtReturn()%></td>

          </tr>

          <tr>
            <td><b>Current Ratio</b></td>
            <td><%=objBean.getTxtCurrentRatio()%></td>
          </tr>

          <tr>
            <td><b>Quick Ratio</b></td>

            <td><%=objBean.getTxtQuickRatio()%></td>
          </tr>

          <tr>
            <td><b>Interest Cover</b></td>
            <td><%=objBean.getTxtInterestCover()%></td>
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
