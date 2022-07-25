/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Account;
import Model.DeliveryaddressDAO;
import Entity.Delivery;
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
 * @author SmileMint
 */
@WebServlet(name = "ListDelivery", urlPatterns = {"/ListDelivery"})
public class ListDelivery extends HttpServlet {

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

            HttpSession session = request.getSession();
            Object a = session.getAttribute("account");
            Account account = (Account) a;
            if (a != null && account.getRole() == 1) {
                DeliveryaddressDAO dao = new DeliveryaddressDAO();
                List<Delivery> list = new ArrayList<>();
                list = dao.getAllDelivery();
                String oid = request.getParameter("oid");
                String status = request.getParameter("stateid");
                
                int statusselect=0;
                 if(status==null){
                status="";
            }
            if(status.equals("Shipped")){
                statusselect=1;
            }
            if(status.equals("Delivered")){

            }
            
                if (oid != null) {
                    int id = Integer.parseInt(oid);

                    int k = dao.updateDeliverystates(status, id);
                    list = dao.getAllDelivery();
                    request.setAttribute("ha", k);

                    request.setAttribute("mess", "Update successful for SHIPPING CODE with ID:" + id);
                    request.setAttribute("List", list);

                    request.getRequestDispatcher("ListDelivery.jsp").forward(request, response);
                }
                request.setAttribute("List", list);
                 request.setAttribute("statusselect", statusselect);
                request.getRequestDispatcher("ListDelivery.jsp").forward(request, response);
            }else{
              response.sendRedirect("login.jsp");
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
