/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Define.Define;
import Entity.Account;
import Entity.CategoryDTO;
import Entity.Customer;
import Entity.Delivery;
import Entity.Invoice;
import Entity.OrderDTO;
import Entity.OrderDetailsDTO;
import Entity.ProductDTO;
import Entity.ProductInvoice;
import Model.CustomerDAO;
import Model.DeliveryaddressDAO;
import Model.Invoice2DAO;
import Model.InvoiceDAO;
import Model.OrderDAO;
import Model.OrderDetailsDAO;
import Model.ProductDAO;
import Model.ProductInvoice2DAO;
import Model.UserDAO;
import Model.categoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "CheckOutCartController", urlPatterns = {"/CheckOutCartController"})
public class CheckOutCartController extends HttpServlet {

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
          
            Object a = session.getAttribute("account");
          Account account = (Account) a;;
            if (a != null && account.getRole()==3) {
                CustomerDAO daocus=new CustomerDAO();
                Customer cus=daocus.getCustomerbyid2(account.getUsername());
            ArrayList<ProductDTO> cart = (ArrayList<ProductDTO>) session.getAttribute("CART");
            ProductDAO productDAO = new ProductDAO();

            float totalPrice = Float.parseFloat(request.getParameter("txtTotalPrice"));
            String address = new String(request.getParameter("txtAddress").getBytes("iso-8859-1"), "UTF-8").trim();
            String phoneNumber = new String(request.getParameter("txtPhoneNumber").getBytes("iso-8859-1"), "UTF-8").trim();
            String fullName = new String(request.getParameter("txtFullName").getBytes("iso-8859-1"), "UTF-8").trim();
            String typeShipping = request.getParameter("selectType");
            int idship = Integer.parseInt(typeShipping);

            UserDAO userDAO = new UserDAO();
            String email = (String) session.getAttribute("EMAIL");
            int userId = userDAO.getUserId(email);
              InvoiceDAO dao = new InvoiceDAO();
            OrderDAO orderDAO = new OrderDAO();
            OrderDTO orderDTO = new OrderDTO();

            orderDTO.setUserId(userId);
            orderDTO.setTotalPrice(totalPrice);
  
            int insertedOrderID = dao.insertOrder(cus.getCustomerID());
            if (insertedOrderID != 0) {
             ProductInvoice2DAO dao2 = new ProductInvoice2DAO();
             DeliveryaddressDAO daode = new DeliveryaddressDAO();
                for (ProductDTO f : cart) {
                   ProductInvoice detailDTO = new ProductInvoice();
                    detailDTO.setInvoiceID(insertedOrderID);
                    detailDTO.setProductID(f.getProductID());
                    detailDTO.setQuantity(f.getProductQuantity());
                    detailDTO.setPrice(f.getPrice());
//                    detailDTO.setFullName(fullName);
//                    detailDTO.setAddress(address);
//                    detailDTO.setTypeShipping(typeShipping);
//                    detailDTO.setPhoneNumber(phoneNumber);

                    dao2.insertOrderDetail(detailDTO);

                    // minus quantity of product when 
                    productDAO.subQuantity(f.getProductID(), f.getProductQuantity());
                }
                Delivery u=new Delivery(insertedOrderID,cus.getCustomerName(),phoneNumber, address, idship, "Not Shipped");
                daode.insertDelivery(u, insertedOrderID);
                
                session.removeAttribute("CART");
                request.setAttribute("CHECK_OUT_CART_MSG", "Your order has been accepted");
            }

            //get all list product
            ArrayList<ProductDTO> listProduct
                    = productDAO.getProductByParam(Define.IS_EMPTY_DEFAUL, Define.NUMBER_DEFAUL);
            request.setAttribute("LIST_PRODUCT", listProduct);

            //get all type category
            categoryDAO categoryDAO = new categoryDAO();
            ArrayList<CategoryDTO> listCategory = categoryDAO.getAllCategorys();
            request.setAttribute("LIST_CATEGORY", listCategory);}
            else{
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            log("Error At Check Out Controller " + e.getLocalizedMessage());
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
