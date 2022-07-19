/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Define.Define;
import Entity.Category;
import Entity.CategoryDTO;
import Entity.ProductDTO;
import Model.ProductDAO;
import Model.categoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author duong
 */
@WebServlet(name = "SearchProductController", urlPatterns = {"/SearchProductController"})
public class SearchProductController extends HttpServlet {

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
        String productName = null;
        Integer categoryID = null;

        try {
            String action = request.getParameter("btnAction");
            ArrayList<ProductDTO> listProduct = new ArrayList<>();
            ProductDAO productDAO = new ProductDAO();

            if (action != null && !action.equals("")) {
                if (action.equals("Category")) {
                    int categoryId = Integer.parseInt(request.getParameter("selectCategory"));
                    listProduct = productDAO.getProductByParam("", categoryId);
                    request.setAttribute("LIST_PRODUCT", listProduct);

                } else if (action.equalsIgnoreCase("Search Product")) {
                    String txtProductName = new String(request.getParameter("txtProductName").getBytes("iso-8859-1"), "UTF-8").trim();
                    int categoryId = Integer.parseInt(request.getParameter("selectCategory"));

                    session.setAttribute("searchedProductByName", txtProductName);
                    session.setAttribute("searchedCategoryID", categoryId);

                    listProduct = productDAO.getProductByParam(txtProductName, categoryId);
                    request.setAttribute("LIST_PRODUCT", listProduct);
                } else {
                    productName = (String) session.getAttribute("searchedProductByName");
                    categoryID = (Integer) session.getAttribute("searchedCategoryID");

                    if (productName == null) {
                        productName = Define.IS_EMPTY_DEFAUL;
                    }
                    if (categoryID == null) {
                        categoryID = Define.NUMBER_DEFAUL;
                    }

                    listProduct = productDAO.getProductByParam(productName, categoryID);
                    request.setAttribute("LIST_PRODUCT", listProduct);
                }
            }
            categoryDAO categoryDAO = new categoryDAO();
            List<Category> listCategory = categoryDAO.getAllCategory();
            request.setAttribute("LIST_CATEGORY", listCategory);
        } catch (Exception e) {
            log("Error At Search Product Controller " + e.getLocalizedMessage());
            request.setAttribute("Error ", e.getLocalizedMessage());
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
