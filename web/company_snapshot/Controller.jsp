<%-- 
    Document   : AddEditController
    Created on : Apr 24, 2011, 5:18:18 PM
    Author     : heena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@page import="beans.companysnapshot.*,datalayer.companysnapshot.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="objBean" class="beans.companysnapshot.UpdateCompanySnapshotBean">
            <jsp:setProperty name="objBean" property="*"></jsp:setProperty>

        </jsp:useBean>
        <jsp:useBean id="objBean4" class="beans.companysnapshot.UpdateCompanyInformationBean">
            <jsp:setProperty name="objBean4" property="*"></jsp:setProperty>
        </jsp:useBean>
        <jsp:useBean id="objBean5" class="beans.companysnapshot.UpdateCompanyInformationBean">
            <jsp:setProperty name="objBean5" property="*"></jsp:setProperty>
        </jsp:useBean>
        <jsp:useBean id="objBean1" class="beans.companysnapshot.UpdateFundamentalsBean">
            <jsp:setProperty name="objBean1" property="*"></jsp:setProperty>
        </jsp:useBean>
        <jsp:useBean id="objBean2" class="beans.companysnapshot.UpdateCapitalStructureBean">
            <jsp:setProperty name="objBean2" property="*"></jsp:setProperty>
        </jsp:useBean>
        <jsp:useBean id="objBean3" class="beans.companysnapshot.CreateCompanyBean">
            <jsp:setProperty name="objBean3" property="*"></jsp:setProperty>
        </jsp:useBean>
        <jsp:useBean id="objBean6" class="beans.companysnapshot.UpdateSharePriceBean">
            <jsp:setProperty name="objBean6" property="*"></jsp:setProperty>
        </jsp:useBean>
        <jsp:useBean id="objBean7" class="beans.companysnapshot.UpdateQuarterlyResultBean">
            <jsp:setProperty name="objBean7" property="*"></jsp:setProperty>
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
        if (request.getParameter("btnUpdateShare") != null) {

            CompanyListingServices cls = new CompanyListingServices();
            String result = cls.updateCompanySharePrice(objBean6);
            if (result.equalsIgnoreCase("updated")) {
                session.setAttribute("msg", "Record Updated");
            } else {
                session.setAttribute("msg", "Record not updated");
            }
            response.sendRedirect("masterpage_CompanyListing.jsp");
        }



        if (request.getParameter("sbtnUpdateFundamentals") != null) {
            int cid = Integer.parseInt(request.getParameter("cid"));
            CompanyListingServices cls = new CompanyListingServices();
            String result = cls.updateCompFundamentals(objBean1, cid);
            if (result.equals(("updated"))) {
                session.setAttribute("msg", "Company Fundamentals are Updated");
            } else {
                session.setAttribute("msg", "Company Fundamentals not Updated");
            }

            response.sendRedirect("masterpage_CompanyListing.jsp");
        }
        if (request.getParameter("sbtnUpdateQuaterly") != null) {
            int cid = Integer.parseInt(request.getParameter("cid"));
            CompanyListingServices cls = new CompanyListingServices();
            String result = cls.updateQuaterlyResult(objBean7, cid);
            if (result.equalsIgnoreCase("Updated")) {
                session.setAttribute("msg", "Company Quaterly Result are updated");
            } else {
                session.setAttribute("msg", "Company Quaterly Result not Updated");
            }

            response.sendRedirect("masterpage_CompanyListing.jsp");
        }

        if (request.getParameter("sbtnUpdate") != null) {
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
        if (request.getParameter("sbtnUpdateCapStruct") != null) {
            int cid = Integer.parseInt(request.getParameter("cid"));
            CompanyListingServices cls = new CompanyListingServices();
            String result = cls.updateCapStruct(objBean2, cid);
            if (result.equalsIgnoreCase(("updated"))) {
                session.setAttribute("msg", "Record Updated");
            } else {
                session.setAttribute("msg", "Record not Updated");
            }

            response.sendRedirect("masterpage_CompanyListing.jsp");
        }
        if (request.getParameter("btnSave") != null) {
            int flag = 0;
            CompanyListingServices cls = new CompanyListingServices();
            String result = cls.addCompany(objBean3);
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
    </body>
</html>
