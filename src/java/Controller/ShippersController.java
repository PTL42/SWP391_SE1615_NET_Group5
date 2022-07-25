/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Account;
import Entity.Employees;
import Entity.Shippers;
import Model.EmployeeDAO;
import Model.ShippersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ShippersController", urlPatterns = {"/shippers"})
public class ShippersController extends HttpServlet {

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

            String service = request.getParameter("do");

            Object a = session.getAttribute("account");
            Account account = (Account) a;
            if (a != null && account.getRole() == 1) {
//                Account account = (Account) a;
                EmployeeDAO dao = new EmployeeDAO();
                int n = 0;
                Employees e = dao.getEmpployeesbyUsername(account.getUsername());
                ShippersDAO daos = new ShippersDAO();
                if (service.equals("ListSearchShippers")) {
                    String name = request.getParameter("searchnshippers").trim();
                  
                  List<Shippers> list=daos.searchnameShippers(name);
                    ShippersDAO daoship = new ShippersDAO();
                      n=4;
                       
                      request.setAttribute("listS", list);
                      session.setAttribute("emp", e);
                     session.setAttribute("n", n);
//                r esponse.sendRedirect("index.jsp");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                if (service.equals("updateShippers")) {
                    String id = request.getParameter("ids");

                    session.setAttribute("n", 5);
                    String submit = request.getParameter("submit");
                    System.out.println(submit);
                    if (submit == null) {
                        int ids2 = Integer.parseInt(id);
                        Shippers s = daos.getIdByShippers(ids2);
                        request.setAttribute("ship", s);
                        request.setAttribute("ids", ids2);
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    } else {
                        String id2 = request.getParameter("ids");
                        int ids22 = Integer.parseInt(id2);
                        String name = request.getParameter("val-name");
                        String address = request.getParameter("address");
                        String phone = request.getParameter("val-phoneus");
                        Shippers s2 = new Shippers(ids22, name, address, phone);
                        int k = daos.updateShippers(s2);

                        request.setAttribute("k11", 1);
                            ShippersDAO daoship = new ShippersDAO();
                      n=4;
                       List<Shippers> list = daoship.listAllShippers();
                      request.setAttribute("listS", list);
                      session.setAttribute("emp", e);
                     session.setAttribute("n", n);
//                r esponse.sendRedirect("index.jsp");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    }
                }
                if (service.equals("AddShippers")) {
                    String submit = request.getParameter("submit");
                    if (submit == null) {
                        session.setAttribute("n", 6);
                         request.setAttribute("k12", null); 
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    } else {
                        String name = request.getParameter("val-name");
                        String address = request.getParameter("address");
                        String phone = request.getParameter("val-phoneus");
                        Shippers snew = new Shippers(name, address, phone);
                        int k2 = daos.addShippers(snew);
                        if (k2 > 0) {
                           request.setAttribute("k12", 2); 
                           ShippersDAO daoship = new ShippersDAO();
                      n=4;
                       List<Shippers> list = daoship.listAllShippers();
                      request.setAttribute("listS", list);
                      session.setAttribute("emp", e);
                     session.setAttribute("n", n);
                     session.setAttribute("k11", 2);
//                r esponse.sendRedirect("index.jsp");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
               
                        }
                    }
                }
                    if (service.equals("DeleteShippers")) {
                        String id = request.getParameter("ids");
                        int ids2 = Integer.parseInt(id);
                        int d = daos.removeShipper(ids2);
//                response.sendRedirect("index.jsp");
                                ShippersDAO daoship = new ShippersDAO();
                      n=4;
                       List<Shippers> list = daoship.listAllShippers();
                      request.setAttribute("listS", list);
                      session.setAttribute("emp", e);
                     session.setAttribute("n", n);
                     request.setAttribute("k11", 3);
//                r esponse.sendRedirect("index.jsp");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
               
                    }
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
