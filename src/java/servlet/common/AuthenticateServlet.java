/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet.common;

import beans.common.LoginBean;
import datalayer.common.CommonServices;
import java.io.IOException;
import java.io.PrintWriter;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author student
 */
public class AuthenticateServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            HttpSession hs=request.getSession();
            String username=request.getParameter("txtUsername");
            String password=request.getParameter("txtPassword");
           
            CommonServices objcs=new CommonServices();
            LoginBean objBean=objcs.checkUser(username,password);
            if(objBean.getCheck().equalsIgnoreCase("valid"))
            {
                 hs.setAttribute("username",username);
                response.sendRedirect("company_snapshot/masterpage.jsp");
                 //RequestDispatcher rd = request.getRequestDispatcher("company_snapshot/masterpage.jsp");
                 //rd.forward(request, response);
            }
            else
            {
                hs.setAttribute("msg","invalid username or password");
                response.sendRedirect("masterpage_Login.jsp");
            }
        }
        catch(Exception e)
        {
            System.out.println("in Authenticateservlet"+e);
        }finally {
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
