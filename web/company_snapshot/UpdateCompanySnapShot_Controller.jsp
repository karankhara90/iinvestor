<%@page import="beans.companysnapshot.*,datalayer.companysnapshot.*,java.util.ArrayList" %>
<jsp:useBean id="objBean" class="beans.companysnapshot.UpdateCompanySnapshotBean">
    <jsp:setProperty name="objBean" property="*"></jsp:setProperty>

</jsp:useBean>
<%
        if (request.getParameter("sbtnUpdateSnapshot") != null) {
            int cid = Integer.parseInt(request.getParameter("cid"));
            CompanyListingServices cls = new CompanyListingServices();
            String result = cls.udpateCompSnapshot(objBean, cid);
            if (result.equals(("updated"))) {
                session.setAttribute("msg", "Record Updated");
            } else {
                session.setAttribute("msg", "Record not Updated");
            }

            response.sendRedirect("masterpage_CompanyListing.jsp");
        }
%>