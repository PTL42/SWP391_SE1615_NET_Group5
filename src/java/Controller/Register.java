/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Customer;
import Model.AccountDAO;
import Model.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "Register", urlPatterns = {"/register"})
public class Register extends HttpServlet {

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
            String submit = request.getParameter("submit");
            if (submit == null) {
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {
                String txtname = request.getParameter("name");
                String address = request.getParameter("address");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String user = request.getParameter("user");
                String pass = request.getParameter("pass");
       String regrex = 
            "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$";
                if(!pass.matches(regrex)){
                     request.setAttribute("NOTE", "Password eight characters, at least one uppercase letter, one lowercase letter and a number");
                        request.getRequestDispatcher("register.jsp").forward(request, response);
                }
                    
                
                CustomerDAO dao = new CustomerDAO();
                AccountDAO daoacc=new AccountDAO();
                Customer u1 = dao.getCustomerbyid2(user);
                if (u1 != null) {
                    request.setAttribute("NOTE", "This account has already existed");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                } else {
                    Customer u = new Customer(txtname, address, phone, user, email);
                    int k = dao.insertCustomer2(txtname, address, phone, user, email);
                    int k1=daoacc.insertacc(user, pass);
                    if (k > 0&&k1>0) {
                        request.setAttribute("NOTE", "Create Account Success");
                        request.getRequestDispatcher("register.jsp").forward(request, response);
                    } else {
                        request.setAttribute("NOTE", "Create Account Failed");
                        request.getRequestDispatcher("register.jsp").forward(request, response);
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
