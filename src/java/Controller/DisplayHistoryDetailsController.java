/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Define.Define;
import Entity.CategoryDTO;
import Entity.Delivery;
import Entity.OrderDetailsDTO;
import Entity.ProductDTO;
import Entity.SizeDTO;
import Model.DeliveryaddressDAO;
import Model.OrderDetailsDAO;
import Model.ProductDAO;
import Model.categoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author duong
 */
@WebServlet(name = "DisplayHistoryDetailsController", urlPatterns = {"/DisplayHistoryDetailsController"})
public class DisplayHistoryDetailsController extends HttpServlet {

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
        String url = Define.HISTORY_DETAILS_PAGE;
        Integer txtOrderDetailsId = null;
        try {
            txtOrderDetailsId = Integer.parseInt(request.getParameter("txtOrderDetailsID"));
            
            OrderDetailsDAO productDAO = new OrderDetailsDAO();
            
            DeliveryaddressDAO daodeli=new DeliveryaddressDAO();
//            OrderDetailsDTO orderDetailsId = productDAO.getOrderDetailsByID(txtOrderDetailsId);
            Delivery orderDetailsId=daodeli.getDeliverybyinvoiceId(txtOrderDetailsId);
            request.setAttribute("ORDER_DETAILS", orderDetailsId);
            
            categoryDAO categoryDAO = new categoryDAO();
//            ArrayList<CategoryDTO> listCategory = categoryDAO.getAllCategorys();
//            request.setAttribute("LIST_CATEGORY", listCategory);
        } catch (Exception e) {
            log("Error At Display History Details Controller " + e.getLocalizedMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
