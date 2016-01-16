<%@page import="beans.companysnapshot.*,datalayer.companysnapshot.*,java.util.ArrayList" %>
<jsp:useBean id="objBean" class="beans.companysnapshot.UpdateSharePriceBean">
    <jsp:setProperty name="objBean" property="*"></jsp:setProperty>
</jsp:useBean>
<%
        if (request.getParameter("btnUpdateShare") != null) {

            CompanyListingServices cls = new CompanyListingServices();
            String result = cls.updateCompanySharePrice(objBean);
            if (result.equalsIgnoreCase("updated")) {
                session.setAttribute("msg", "Record Updated");
            } else {
                session.setAttribute("msg", "Record not updated");
            }
            response.sendRedirect("masterpage_CompanyListing.jsp");
        }

%>