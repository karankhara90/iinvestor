<%@page import="beans.companysnapshot.*,datalayer.companysnapshot.*,java.util.ArrayList" %>


<jsp:useBean id="objBean4" class="beans.companysnapshot.UpdateCompanyInformationBean">
    <jsp:setProperty name="objBean4" property="*"></jsp:setProperty>
</jsp:useBean>
<jsp:useBean id="objBean5" class="beans.companysnapshot.UpdateCompanyInformationBean">
    <jsp:setProperty name="objBean5" property="*"></jsp:setProperty>
</jsp:useBean>

<%if (request.getParameter("sbtnUpdate") != null) {
            int cid = Integer.parseInt(request.getParameter("cid"));
            int flag = 0;
            CompanyListingServices cls = new CompanyListingServices();
            String result = cls.updateCompany(objBean4, cid);
//addExchange

            if (result.equalsIgnoreCase("updated")) {
                String result1 = cls.updateCompInfo(objBean5, cid);

                System.out.println(result1);
                if (result1.equalsIgnoreCase("updated")) {
                    session.setAttribute("msg", "Record Updated");
                    flag = 1;
                }
                System.out.println("record is inser  " + request.getParameter("hdnCount"));

                int ln = Integer.parseInt(request.getParameter("hdnCount"));
                //String result1 = "";
                //  for (int i = 0; i < ln; i++) {
                System.out.println("record is inserted11");
                if (request.getParameter("txtSecurityAbbr0") != null) {
                    int seccode0 = Integer.parseInt(request.getParameter("txtSecurityCode0"));
                    String exabbr0 = request.getParameter("txtSecurityAbbr0");
                    result1 = cls.addExchange(seccode0, exabbr0, cid);
                    System.out.println("record is inserted 0");
                }
                if (request.getParameter("txtSecurityAbbr1") != null) {
                    int seccode0 = Integer.parseInt(request.getParameter("txtSecurityCode1"));
                    String exabbr0 = request.getParameter("txtSecurityAbbr1");
                    result1 = cls.addExchange(seccode0, exabbr0, cid);
                    System.out.println("record is inserted 1");
                }
// }
            }
            if (flag == 0) {
                session.setAttribute("msg", "Record not updated");
            }

            response.sendRedirect("masterpage_CompanyListing.jsp");

        }
%>