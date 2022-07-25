/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Account;
import Entity.Customer;
import Entity.Employees;
import Model.AccountDAO;
import Model.CustomerDAO;
import Model.EmployeeDAO;
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
 * @author SmileMint
 */
@WebServlet(name = "ListCustomer", urlPatterns = {"/ListCustomer"})
public class ListCustomer extends HttpServlet {

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

        try {
          
            
            
            
            
                  HttpSession session = request.getSession();

            String service = request.getParameter("do");

            Object a = session.getAttribute("account");
            Account account = (Account) a;
            if (a != null &&(account.getRole() == 1 || account.getRole()==0)) {
//                Account account = (Account) a;
                EmployeeDAO dao = new EmployeeDAO();
                int n = 0;
                            CustomerDAO daocus = new CustomerDAO();
                Employees e = dao.getEmpployeesbyUsername(account.getUsername());
             if (service == null) {
                    service = "ListAll";
                    n=1;
                }
             if(service.equals("ListAll")){
       
            List<Customer> list = daocus.getAllCustomer();
            
            request.setAttribute("List", list);
            request.getRequestDispatcher("ListCustomer.jsp").forward(request, response);
             }
             if(service.equals("Deletecus")){
                  AccountDAO daoacc =new AccountDAO();
                 String id=request.getParameter("sid");
                 int id2=Integer.parseInt(id);
                    daocus.DeleteCustomer(id2);
                    Customer CUS=daocus.getCustomerByID(id);
                    daoacc.deleteacc(CUS.getUsername());
                   request.setAttribute("add", 1);
                      List<Customer> list = daocus.getAllCustomer();
          request.setAttribute("List", list);
           request.getRequestDispatcher("ListCustomer.jsp").forward(request, response);
             }
       
        }else{
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            request.getRequestDispatcher("/page-error-500.html").forward(request, response);
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
