/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Account;
import Entity.Employees;
import Entity.Invoice;
import Entity.Item;
import Entity.Product;
import Model.CustomerDAO;
import Model.EmployeeDAO;
import Model.InvoiceDAO;
import Model.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "HomePageEmployeeController", urlPatterns = {"/HomePageEmployeeController"})
public class HomePageEmployeeController extends HttpServlet {

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
//            String service = request.getParameter("do");

            Object a = session.getAttribute("account");
            if (a != null) {
                Account account = (Account) a;
                  List<Item> list3=null;
                EmployeeDAO dao = new EmployeeDAO();
                int n = 0;
                Employees e = dao.getEmpployeesbyUsername(account.getUsername());
                ProductDAO dao3 = new ProductDAO();
                CustomerDAO daocus=new  CustomerDAO();
                List<Product> list = dao3.getAllProduct();
                List<String> listcus =daocus.getAllNameCustomer();
               String namecus=request.getParameter("myCountry");
                session.setAttribute("n", n);
                session.setAttribute("list2", list);
                session.setAttribute("listcus", listcus);
                
                
           if(namecus!=null){
               int id2=daocus.getCustomerbyid(namecus);
               
               session.setAttribute("idcus", id2);
               session.setAttribute("namecus", namecus);
           }

//                response.sendRedirect("index.jsp");
                request.getRequestDispatcher("addinvoice.jsp").forward(request, response);
//                

            } else {
                response.sendRedirect("login.jsp");
//            response.sendRedirect("ControllerProduct");
            }
        }
        catch (Exception e) {
       
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
