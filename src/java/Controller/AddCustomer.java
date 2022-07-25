/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Account;
import Entity.Employees;
import Model.AccountDAO;
import Model.CustomerDAO;
import Model.EmployeeDAO;
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
 * @author SmileMint
 */
@WebServlet(name = "AddCustomer", urlPatterns = {"/AddCustomer"})
public class AddCustomer extends HttpServlet {

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
            HttpSession session = request.getSession();

            String service = request.getParameter("do");

            Object a = session.getAttribute("account");
            Account account = (Account) a;
            if (a != null) {
//                Account account = (Account) a;
                EmployeeDAO dao2 = new EmployeeDAO();
                int n = 0;
                Employees e = dao2.getEmpployeesbyUsername(account.getUsername());
                String submit = request.getParameter("submit");
                    if (submit == null) {
                           request.getRequestDispatcher("AddCustomer.jsp").forward(request, response);
                    }else{
           String prName= request.getParameter("prName");
           String address= request.getParameter("prAddress");
           String phone= request.getParameter("phone");
           String image= request.getParameter("Image");
           String detail= request.getParameter("detail");
           String pass= request.getParameter("pass");
           String email= request.getParameter("email");
            CustomerDAO dao =new CustomerDAO();
                        AccountDAO daoacc =new AccountDAO();
           dao.insertCustomer(prName, address,phone, image, detail, email);
           daoacc.insertaccemp(detail, pass);
           request.setAttribute("add", 1);
         request.getRequestDispatcher("AddCustomer.jsp").forward(request, response);
                    }
        }else{
                response.sendRedirect("login.jsp");
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
