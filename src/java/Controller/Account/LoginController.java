/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Account;

import Model.Account;
import DAO.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String u = request.getParameter("username");
            String p = request.getParameter("password");
            AccountDAO dao = new AccountDAO();
            Account a = dao.getAccount(u, p);
//            out.println(cus);
            String service = request.getParameter("do");
//            out.print(service);
//            out.print("ok");

            if (service == null) {
                service = "logincus1";
//                out.print("ok");
            }
            if (service.equals("logincus1")) {
                out.print("ok1");
                if (a == null) {
                    String error = "username and password dont exsited";
                    request.setAttribute("error", error);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    if (a.getRole() == 1) {
                        HttpSession session = request.getSession();
                        session.setAttribute("account", a);
                        session.setAttribute("nameacc", a.getUsername());
//                        response.sendRedirect("HomeAdmin");
                        response.sendRedirect("index.jsp");
                    } else {
                        HttpSession session = request.getSession();
                        session.setAttribute("account", a);
                        session.setAttribute("nameacc", a.getUsername());
                        //      session.setAttribute("accid", a.getCustomerID());

                        response.sendRedirect("HomeEmployee");

                    }
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}