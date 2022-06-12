/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Account;
import Entity.Employees;
import Entity.Invoice;
import Entity.Product;
import Model.EmployeeDAO;
import Model.InvoiceDAO;
import Model.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "HomeController", urlPatterns = {"/HomeController"})
public class HomeController extends HttpServlet {

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
            if (a != null) {
                Account account = (Account) a;
                EmployeeDAO dao = new EmployeeDAO();
                int n=0;
                Employees e = dao.getEmpployeesbyUsername(account.getUsername());
                if (service == null) {
                    service = "ListInvoice";
                    n=1;
                }
                if (service.equals("ListInvoice")) {
                    InvoiceDAO dao2 = new InvoiceDAO();
                    n=1;
                    List<Invoice> list = dao2.getAllInvoice();
                    request.setAttribute("listI", list);
                    session.setAttribute("emp", e);
                    session.setAttribute("n", n);
//                response.sendRedirect("index.jsp");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                if (service.equals("updateProduct")) {
                    
                }
                if (service.equals("ListProduct")) {
                    ProductDAO dao3 = new ProductDAO();
                    n=2;
                    List<Product> list = dao3.getAllProduct();
                    request.setAttribute("listP", list);
                    session.setAttribute("emp", e);
                    session.setAttribute("n", n);
                    
//                response.sendRedirect("index.jsp");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                if (service.equals("ListEmployees")) {
                    ProductDAO dao3 = new ProductDAO();
                    n=3;
                    List<Product> list = dao3.getAllProduct();
                    request.setAttribute("listP", list);
                    session.setAttribute("emp", e);
                    session.setAttribute("n", n);
                    
//                response.sendRedirect("index.jsp");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            } else {
                response.sendRedirect("login.jsp");
//            response.sendRedirect("ControllerProduct");
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
