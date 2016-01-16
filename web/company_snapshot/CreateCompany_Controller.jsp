<%@page import="beans.companysnapshot.*,datalayer.companysnapshot.*"%>
<jsp:useBean id="objBean" class="beans.companysnapshot.CreateCompanyBean">
    <jsp:setProperty name="objBean" property="*"></jsp:setProperty>
</jsp:useBean>
<%
        if (request.getParameter("btnSave") != null) {
            int flag = 0;
            CompanyListingServices cls = new CompanyListingServices();
            String result = cls.addCompany(objBean);
            if (result.equals("inserted")) {
                int ln = Integer.parseInt(request.getParameter("hdnCount"));
                String result1 = "";
                for (int i = 0; i < ln; i++) {

                    int seccode0 = Integer.parseInt(request.getParameter("txtSecurityCode" + i));
                    String exabbr0 = request.getParameter("txtSecurityAbbr" + i);
                    result1 = cls.add(seccode0, exabbr0);
                    System.out.println("record is inserted");
                }
                if (result1.equalsIgnoreCase("inserted")) {
                    session.setAttribute("msg", "record inserted");
                    flag = 1;
                }
            }
            if (flag == 0) {
                session.setAttribute("msg", "record not inserted");
            }

            response.sendRedirect("masterpage_CompanyListing.jsp");
        }
%>