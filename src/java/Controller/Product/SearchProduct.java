/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Product;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import DAO.Define;
import Model.CategoryDTO;
import Model.ProductDTO;
import Model.ProductDTO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class SearchProduct extends HttpServlet {

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
        String url = Define.INDEX_PAGE;
        HttpSession session = request.getSession();
        try {
            String action = request.getParameter("btnAction");
            ArrayList<ProductDTO> listCake = new ArrayList<>();
            ProductDAO productDAO = new ProductDAO();

            if (action != null && !action.equals("")) {
                if (!action.equalsIgnoreCase("Search Product")) {
                    String productName = (String) session.getAttribute("searchedProductByName");
                    int categoryID = (int) session.getAttribute("searchedCategoryID");

                    listCake = productDAO.getProductByParam(productName, categoryID);
                    request.setAttribute("LIST_PRODUCT", listCake);
                } else {
                    String txtProductName = new String(request.getParameter("txtProductName").getBytes("iso-8859-1"), "UTF-8");
                    int categoryId = Integer.parseInt(request.getParameter("selectCategory"));

                    session.setAttribute("searchedProductByName", txtProductName);
                    session.setAttribute("searchedCategoryID", categoryId);
                   
                    listCake = productDAO.getProductByParam(txtProductName, categoryId);
                    request.setAttribute("LIST_PRODUCT", listCake);
                }
            }
            CategoryDAO categoryDAO = new CategoryDAO();
            ArrayList<CategoryDTO> listCategory = categoryDAO.getAllCategory();
            request.setAttribute("LIST_CATEGORY", listCategory);
        } catch (Exception e) {
            log("Error At Search Cake Controller " + e.getLocalizedMessage());
            request.setAttribute("Error ", e.getLocalizedMessage());
            url = Define.ERROR_PAGE;
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
