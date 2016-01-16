<%@page import="beans.companysnapshot.*,datalayer.companysnapshot.*"%>
<jsp:useBean id="objBean" class="beans.companysnapshot.UpdateFundamentalsBean">
    <jsp:setProperty name="objBean" property="*"></jsp:setProperty>
</jsp:useBean>
<%

        if (request.getParameter("sbtnUpdateFundamentals") != null) {
            int cid = Integer.parseInt(request.getParameter("cid"));
            CompanyListingServices cls = new CompanyListingServices();
            String result = cls.updateCompFundamentals(objBean, cid);
            if (result.equals(("updated"))) {
                session.setAttribute("msg", "Company Fundamentals are Updated");
            } else {
                session.setAttribute("msg", "Company Fundamentals not Updated");
            }

            response.sendRedirect("masterpage_CompanyListing.jsp");
        }
%>