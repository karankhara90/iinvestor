<%@page import="beans.companysnapshot.*,datalayer.companysnapshot.*,java.util.ArrayList"%>
<html>

<head>
    <title>Company Listing</title>
</head>
<%
        String msg = "";
        if (session.getAttribute("msg") != null) {
            msg = session.getAttribute("msg").toString();
        }
      
        ArrayList al = null;
        CompanyListingServices cls = new CompanyListingServices();
      
        if (request.getParameter("btnSearch") != null) {
          
            String name = request.getParameter("txtSearch");
        
            al = cls.getSearch(name);
        } else if (request.getParameter("sort") != null) {
            String sortorder = request.getParameter("sort");
          
            al = cls.getRecord(sortorder);
        

        } else {
            al = cls.getAllCompanyRecords();
        }
        
%>
<%=msg%>
<%session.removeAttribute("msg");%>
<body>
<form action="masterpage_CompanyListing.jsp" method="post">
<table>
<tbody><tr>

</tr>
<tr>
    <td colspan="2" height="10"></td>
</tr>
<tr>
    <td colspan="2" align="center">
        <b>Alphabetical Listing of Companies</b>

    </td>
</tr>
<tr>
<td colspan="2">
    <table border="1">
    <tbody><tr>
        <td>
        <table align="left">
        <tbody>
            <tr>
                <td colspan="2"><a href="masterpage_CreateCompany.jsp"><input id="btnAdd" name="btnAdd" value="Add Company" type="button"></a> </td>
                <td colspan="2" align="center">
                    <input name="txtSearch" id="txtSearch" type="text">
                    <input name="btnSearch" id="btnSearch" value="Search" type="submit">

                </td>
            </tr>
            <tr>
                <td height="10">
                </td>
            </tr>
            <tr>
                <td colspan="4" align="center">
                    <a href="masterpage_CompanyListing.jsp?sort=a">A</a>

                    <a href="masterpage_CompanyListing.jsp?sort=b">B</a>&nbsp;&nbsp;
                    <a href="masterpage_CompanyListing.jsp?sort=c">C</a>&nbsp;&nbsp;
                    <a href="masterpage_CompanyListing.jsp?sort=d">D</a>&nbsp;&nbsp;
                    <a href="masterpage_CompanyListing.jsp?sort=e">E</a>&nbsp;&nbsp;
                    <a href="masterpage_CompanyListing.jsp?sort=f">F</a>&nbsp;&nbsp;
                    <a href="masterpage_CompanyListing.jsp?sort=g">G</a>&nbsp;&nbsp;

                    <a href="masterpage_CompanyListing.jsp?sort=h">H</a>&nbsp;&nbsp;
                    <a href="masterpage_CompanyListing.jsp?sort=i">I</a>&nbsp;&nbsp;
                    <a href="masterpage_CompanyListing.jsp?sort=j">J</a>&nbsp;&nbsp;
                    <a href="masterpage_CompanyListing.jsp?sort=k">K</a>&nbsp;&nbsp;
                    <a href="masterpage_CompanyListing.jsp?sort=l">L</a>&nbsp;&nbsp;
                    <a href="masterpage_CompanyListing.jsp?sort=m">M</a>&nbsp;&nbsp;

                    <a href="masterpage_CompanyListing.jsp?sort=n">N</a>&nbsp;&nbsp;
                    <a href="masterpage_CompanyListing.jsp?sort=o">O</a>&nbsp;&nbsp;
                    <a href="masterpage_CompanyListing.jsp?sort=p">P</a>&nbsp;&nbsp;
                    <a href="masterpage_CompanyListing.jsp?sort=q">Q</a>&nbsp;&nbsp;
                    <a href="masterpage_CompanyListing.jsp?sort=r">R</a>&nbsp;&nbsp;
                    <a href="masterpage_CompanyListing.jsp?sort=s">S</a>&nbsp;&nbsp;

                    <a href="masterpage_CompanyListing.jsp?sort=t">T</a>&nbsp;&nbsp;
                    <a href="masterpage_CompanyListing.jsp?sort=u">U</a>&nbsp;&nbsp;
                    <a href="masterpage_CompanyListing.jsp?sort=v">V</a>&nbsp;&nbsp;
                    <a href="masterpage_CompanyListing.jsp?sort=w">W</a>&nbsp;&nbsp;
                    <a href="masterpage_CompanyListing.jsp?sort=x">X</a>&nbsp;&nbsp;
                    <a href="masterpage_CompanyListing.jsp?sort=y">Y</a>&nbsp;&nbsp;

                    <a href="masterpage_CompanyListing.jsp?sort=z">Z</a>&nbsp;&nbsp;
                </td>
            </tr>
            <tr><td colspan="4" height="10"></td> </tr>
            <tr><td colspan="4"><hr></td> </tr>
            <tr><td colspan="4"><div id="divCompany" align="left">
            <table>

                <tbody><tr>
                        <td width="20"></td>
                        <td><b>Sr. No.</b> </td>
                        <td width="20"></td>
                        <td><b>Company Name</b></td>
                        <td width="20"></td>
                        <td><b>Company Code</b> </td>

                        <td width="20"></td>
                        <td><b>View Company Details</b></td>
                    </tr>
                    <tr><td colspan="8"><hr></td> </tr>
                    <%

        if (al.size() != 0) {


            for (int i = 0; i < al.size(); i++) {
                CompanyListingBean objBean = (CompanyListingBean) al.get(i);
                    %>
                    <tr>
                        <td width="20"></td>
                        <td><%=i + 1%></td>

                        <td width="20"></td>
                        <td><a href="masterpage_UpdateSharePrice.jsp?cid=<%=objBean.getCompanyid()%>&cname=<%=objBean.getCompanyName()%>&code=<%=objBean.getCompanyCode()%>"><%=objBean.getCompanyName()%></a></td>



                        <td width="20" align="left"></td>
                        <td><%=objBean.getCompanyCode()%></td>

                        <td width="20"></td>

                        <td><a href="masterpage_ViewSharePrice.jsp?cid=<%=objBean.getCompanyid()%>&cname=<%=objBean.getCompanyName()%>&code=<%=objBean.getCompanyCode()%>">View Details</a></td>
                    </tr>

                    <%
                          }
                      } else {
                    %>
            <tr><td colspan="4" align="center"><h3 style="color:red">Sorry, no record found</h3></td></tr>

                    <%        }
                    %>
        </tbody></table></div></td>
    </tr>
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
