/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Account;
import Model.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "ChangePass", urlPatterns = {"/ChangePass"})
public class ChangePass extends HttpServlet {

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
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            Object a = session.getAttribute("account");
            if (a != null) {
                Account account = (Account) a;
                String pass = request.getParameter("confirm");
                String passo = request.getParameter("passwordoder");
                
                AccountDAO dao = new AccountDAO();
                if (passo != null) {
                    Account b = dao.getAccount(account.getUsername(), passo.trim());
                    if (b == null) {
                        String mess = ("PasswordOld is wrong");
                        request.setAttribute("mess", mess);
                        request.setAttribute("n", 0);
                        request.getRequestDispatcher("changepass.jsp").forward(request, response);
                    } else {
                        int n = dao.ChangePassword(account.getUsername(), pass.trim());
                        if (n > 0) {
                            String mess = ("Change password successfully");
                            request.setAttribute("mess", mess);
                            request.setAttribute("n", 1);
                            session.removeAttribute("account");
                            request.getRequestDispatcher("changepass.jsp").forward(request, response);
                        }
                    }
                }else{
                    request.getRequestDispatcher("changepass.jsp").forward(request, response);
                }

            } else {
                response.sendRedirect("login.jsp");
            }
        }catch (Exception e) {
            session.setAttribute("ex", e);
            RequestDispatcher dispatcher2 = request.getRequestDispatcher("/page-error-500.html");
            dispatcher2.forward(request, response);
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
