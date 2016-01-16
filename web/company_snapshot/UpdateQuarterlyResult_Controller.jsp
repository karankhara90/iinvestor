<%@page import="beans.companysnapshot.*,datalayer.companysnapshot.*,java.util.ArrayList" %>
<jsp:useBean id="objBean" class="beans.companysnapshot.UpdateQuarterlyResultBean">
    <jsp:setProperty name="objBean" property="*"></jsp:setProperty>
</jsp:useBean>
<%
        if (request.getParameter("sbtnUpdateQuaterly") != null) {
            int cid = Integer.parseInt(request.getParameter("cid"));
            CompanyListingServices cls = new CompanyListingServices();
            String result = cls.updateQuaterlyResult(objBean, cid);
            if (result.equalsIgnoreCase("Updated")) {
                session.setAttribute("msg", "Company Quaterly Result are updated");
            } else {
                session.setAttribute("msg", "Company Quaterly Result not Updated");
            }

            response.sendRedirect("masterpage_CompanyListing.jsp");
        }
%>