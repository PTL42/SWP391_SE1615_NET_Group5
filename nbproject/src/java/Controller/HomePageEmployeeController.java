/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Account;
import Entity.Carts;
import Entity.Employees;
import Entity.Invoice;
import Entity.Item;
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

                List<Product> list = dao3.getAllProduct();
                Carts cart = null;
                double total = 0;
                int sl = 0;
                Object o = session.getAttribute("cart");
                if (o != null) {
                    cart = (Carts) o;
                } else {
                    cart = new Carts();
                }
                String tid = request.getParameter("id");
                int id;
                int num = 1;
                try {
                    id = Integer.parseInt(tid);
                    ProductDAO pdb = new ProductDAO();
                    Product P = pdb.getProductbyID(id);
                    Product p = pdb.getProductbyID(id);
                    double price = p.getPrice();
                    Item t = new Item(p, 1, price);
//            int m=cart.setquatityP(t, p);
//            pdb.changeQuantity(id, m);
                    System.out.println();
                    System.out.println(t);
                    cart.addItem(t);
                } catch (NumberFormatException e1) {
                    num = 1;
                }
                 list3 = cart.getItems();
//             double total=0;
                for (Item item : list3) {
                    total += item.getPrice() * item.getQuantity();
                }
                for (Item item : list3) {
                    sl += item.getQuantity();
                }
                System.out.println(list3);
                System.out.println("123" + list.size());
                session.setAttribute("n", n);
                session.setAttribute("total1", total);
                session.setAttribute("cart", cart);
                session.setAttribute("list33", list3);
                session.setAttribute("size2", sl);
               
                session.setAttribute("n", n);
                request.setAttribute("list2", list);
                session.setAttribute("emp", e);

//                response.sendRedirect("index.jsp");
                request.getRequestDispatcher("ok.jsp").forward(request, response);
//                

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
