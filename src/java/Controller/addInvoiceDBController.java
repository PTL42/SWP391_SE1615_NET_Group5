/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Account;
import Entity.Cart;
import Entity.Employees;
import Entity.Invoice;
import Entity.Product;
import Model.EmployeeDAO;
import Model.Invoice2DAO;
import Model.InvoiceDAO;
import Model.ProductDAO;
import Model.ProductInvoice2DAO;
import Model.ProductInvoiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
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
@WebServlet(name = "addInvoiceDBController", urlPatterns = {"/adInvoiceDB"})
public class addInvoiceDBController extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            Object a = session.getAttribute("account");
            Object b = session.getAttribute("idcus");
            if (a != null) {
                Account account = (Account) a;
                EmployeeDAO daoem = new EmployeeDAO();
//                    int idcus=(int) b;
                int idcus = 0;
                if (b == null) {
                    session.setAttribute("n1", 6);
                    response.sendRedirect((String) session.getAttribute("url"));
                } else {
                    idcus = (int) b;
                    Employees e = daoem.getEmpployeesbyUsername(account.getUsername());
                    String submit = request.getParameter("submit");
                    if (submit != null) {
                        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");

                     
                        Invoice2DAO dao = new Invoice2DAO();
                        ProductInvoice2DAO dao2 = new ProductInvoice2DAO();
                        ProductDAO daopro = new ProductDAO();
                        List<Product> listpro = daopro.getAllProduct();
                        LocalDate date = java.time.LocalDate.now();
                        String date1 = date.toString();
                        java.sql.Date date2 = java.sql.Date.valueOf(date1);
                        if (idcus == 0) {
                            session.setAttribute("n1", 6);
                            response.sendRedirect((String) session.getAttribute("url"));
                        } if(cart==null){
                              session.setAttribute("n1", 7);
                            response.sendRedirect((String) session.getAttribute("url"));
                        }
                        
                        else {

                            int n = dao.addInvoice(new Invoice(date2, e.getEmployeeID(), idcus));
//                     RequestDispatcher dispatcher2 = request.getRequestDispatcher("/email-compose.html");
                            System.out.println(n);
//                   dispatcher2.forward(request, response);
                            int v = dao2.insertProducttoInvoice(n, cart);

                            if (v > 0 && n > 0) {
                                for (Map.Entry<Integer, Cart> entry : cart.entrySet()) {
                                    Integer key = entry.getKey();
                                    Cart carts = entry.getValue();
                                    int quantity = carts.getQuantity();
                                    for (Product product : listpro) {
                                        if (cart.containsKey(product.getProductID())) {
                                            daopro.updateaddtocart(product.getProductQuantity() - quantity, product.getProductID());
                                        }
                                    }

                                }
                                session.removeAttribute("cart");
                                session.setAttribute("total2", 0);
                                  session.setAttribute("n1", 8);
                                response.sendRedirect("HomePageEmployeeController");

                            }
                        }
                    }
                }
            } else {
                response.sendRedirect("login.jsp");
//            response.sendRedirect("ControllerProduct");
            }
        } catch (Exception e) {

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
