/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Cart;
import Entity.Product;
import Model.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;
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
@WebServlet(name = "addtocart3", urlPatterns = {"/addtocart3"})
public class addtocart2 extends HttpServlet {

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
            Integer n = (Integer) session.getAttribute("n");

            Object a = session.getAttribute("account");
            if (a != null) {

                ProductDAO daopro = new ProductDAO();
                String tid = request.getParameter("id");
                int proid = Integer.parseInt(tid);
                Product k = daopro.getProductbyID(proid);
                if (k == null) {
                    session.setAttribute("n1", 5);
                    response.sendRedirect((String) session.getAttribute("url"));
                } else {
                    Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
                    if (cart == null) {
                        cart = new LinkedHashMap<>();
                    }
                    if (cart.containsKey(proid)) {
                        int oldQuantity = cart.get(proid).getQuantity();
                        cart.get(proid).setQuantity(oldQuantity + 1);
                    } else {
                        Product pro = new ProductDAO().getProductbyID(proid);
                        cart.put(proid, Cart.builder().product(pro).quantity(1).build());
                        System.out.println(cart);

                    }
                    double total = 0;
                    for (Map.Entry<Integer, Cart> entry : cart.entrySet()) {
                        Integer key = entry.getKey();
                        Cart carts = entry.getValue();
                        total += carts.getQuantity() * carts.getProduct().getPrice();

                    }

                    System.out.println(cart.size());
                    session.setAttribute("cart", cart);
                             session.setAttribute("n1", 0);
                    session.setAttribute("n", n);
                    session.setAttribute("total", total);
                    response.sendRedirect((String) session.getAttribute("url"));
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
