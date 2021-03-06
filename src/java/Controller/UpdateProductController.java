/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Define.DateUitils;
import Define.Define;
import Entity.Category;
import Entity.CategoryDTO;
import Entity.ProductDTO;
import Model.ProductDAO;
import Model.categoryDAO;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author duong
 */
@WebServlet(name = "UpdateProductController", urlPatterns = {"/UpdateProductController"})
@javax.servlet.annotation.MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5
)
public class UpdateProductController extends HttpServlet {

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
        String url = Define.UPDATE_PRODUCT_PAGE;
        try {
            String action = request.getParameter("btnAction");
            int txtProductID = Integer.parseInt(request.getParameter("txtProductID"));
            ProductDAO productDAO = new ProductDAO();
            ProductDTO product = productDAO.getProductByID(txtProductID);
            if (action.equalsIgnoreCase("Go To Update Page")) {
                request.setAttribute("PRODUCT_DETAIL", product);
            } else {
                String txtProductName = new String(request.getParameter("txtProductName").getBytes("iso-8859-1"), "UTF-8").trim();
                String txtDescription = new String(request.getParameter("txtDescription").getBytes("iso-8859-1"), "UTF-8").trim();
                Float txtSalePrice = Float.parseFloat(request.getParameter("txtSalePrice"));
                Float txtImportPrice = Float.parseFloat(request.getParameter("txtImportPrice"));
                int categoryID = Integer.parseInt(request.getParameter("selectCategory"));
                int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
//                String txtImportDate = request.getParameter("txtImportDate").trim();
                DateUitils dateUtils = new DateUitils();

                ProductDTO updatedProduct = new ProductDTO();
                updatedProduct.setProductID(txtProductID);
                updatedProduct.setProductName(txtProductName);
                updatedProduct.setDescription(txtDescription);
                updatedProduct.setPrice(txtSalePrice);
                updatedProduct.setCost(txtImportPrice);
                updatedProduct.setCategoryID(categoryID);
                updatedProduct.setProductQuantity(quantity);
//                updatedProduct.setImportDate(dateUtils.convertExpiDate(txtImportDate));
             
                // get file image
                Part image = request.getPart("inputImage");
                if (!getFileName(image).equals("")) {
                    String directoryPath = this.getServletContext().getRealPath("") + "/assets";
                    File directory = new File(directoryPath);
                    if (!directory.exists()) {
                        boolean directoryCreated = directory.mkdirs();
                        if (!directoryCreated) {
                            throw new IllegalStateException("Cannot create directory to save file");
                        }
                    }
                    //get path file
//                    String filePath = directoryPath + "/" + this.getFileName(image);
                    //save file
//                    image.write(filePath);
                    updatedProduct.setImg("assets/" + this.getFileName(image));

                } else {
                    updatedProduct.setImg(product.getImg());
                }

                boolean isSuccess = productDAO.updateProduct(updatedProduct);

                if (isSuccess) {
                    url = Define.SEARCH_PRODUCT_CONTROLLER;
                    request.setAttribute("UPDATE_PRODUCT_MSG_SUCCESS", "Update Product (" + updatedProduct.getProductName() + ") Success ");
                    request.setAttribute("PRODUCT_DETAIL", updatedProduct);
                } else {
                    url = Define.UPDATE_PRODUCT_PAGE;
                    request.setAttribute("UPDATE_PRODUCT_MSG_FAILED", "Update Product(" + updatedProduct.getProductName() + ") Failed ");
                    request.setAttribute("PRODUCT_DETAIL", product);
                }
            }

            if (url.equals(Define.UPDATE_PRODUCT_PAGE)) {
                categoryDAO categoryDAO = new categoryDAO();
                List<Category> listCategory = categoryDAO.getAllCategory();
                request.setAttribute("LIST_CATEGORY", listCategory);
            }
        } catch (Exception e) {
            log("Error At Update Product Controller" + e.getLocalizedMessage());
            request.setAttribute("error", e.getLocalizedMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return UUID.randomUUID().toString() + ".png";
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
