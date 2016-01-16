<%@page import="beans.companysnapshot.*,datalayer.companysnapshot.*,java.util.ArrayList"%>
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
            <td colspan="2" align="center" width="100%"><h4>View Company Capital Structure</h4></td>
        </tr>
        <tr>
         <td>
         <table border="1">
           <tbody><tr>
              

          </tr>
           <%
              int id=Integer.parseInt(request.getParameter("cid"));
              String name=request.getParameter("cname");
              CompanyListingServices cls=new CompanyListingServices();
              ArrayList al=cls.getCapitalStructure(id,name);
              ViewCapitalStructureBean objBean=new  ViewCapitalStructureBean();
              %>
          <tr>
        <th colspan="8" align="center"><b><%=name%></b></th>
      </tr>

              <tr>
                <th>From Year</th>
                <th>To Year</th>

                <th>Class Of Share</th>
                <th>Authorised Capital(Cr.)</th>
                <th>Issued Capital(Cr.)</th>
                <th>Paid Up Shares</th>
                <th>Face Value</th>
                <th>Paid Up Capital(Cr.)</th>

              </tr>
              <%
                  for(int i=0;i<al.size();i++)
                  {
                     objBean=(ViewCapitalStructureBean)al.get(i);
                  %>

              <tr>
                <td><%=objBean.getFromYear()%></td>
                <td><%=objBean.getToYear()%></td>
                <td><%=objBean.getClassOfShare()%></td>
                <td><%=objBean.getAuthorisedCapital()%></td>
                <td><%=objBean.getIssuedCapital()%></td>

                <td><%=objBean.getPaidUpShares()%></td>
                <td><%=objBean.getFaceValue()%></td>
                <td><%=objBean.getPaidUpCapital()%></td>
              </tr>

             <%
             }
              %>

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
