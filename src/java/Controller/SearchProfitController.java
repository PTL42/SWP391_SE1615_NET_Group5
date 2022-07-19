/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Account;
import Entity.Invoice;
import Entity.ProductSaleToday;
import Model.EmployeeDAO;
import Model.InvoiceDAO;
import Model.ProductDAO;
import Model.ProductInvoice2DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.List;
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
@WebServlet(name = "SearchProfitController", urlPatterns = {"/searchprofit"})
public class SearchProfitController extends HttpServlet {

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
        try  {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();

            String service = request.getParameter("do");
            Object a = session.getAttribute("account");
            Account account = (Account) a;
            if (a != null && account.getRole() == 1) {
                ProductDAO dao = new ProductDAO();
                EmployeeDAO daoEM = new EmployeeDAO();
                InvoiceDAO dao2 = new InvoiceDAO();
                ProductInvoice2DAO dao3 = new ProductInvoice2DAO();

  
                LocalDate date = java.time.LocalDate.now();
                String date1 = date.toString();
                Date date2 = Date.valueOf(date1);
                SimpleDateFormat dt = new SimpleDateFormat("w");
                SimpleDateFormat dt2 = new SimpleDateFormat("E");
                SimpleDateFormat dt3 = new SimpleDateFormat("dd-MM-yyyy");
                SimpleDateFormat dtyear = new SimpleDateFormat("yyyy");
                String year = dtyear.format(date2);
                int yearint = Integer.parseInt(year);
                System.out.println(yearint);
                String d = "2022-06-20";
                Date date3 = Date.valueOf(d);
                 String submit = request.getParameter("submit");
 List<ProductSaleToday> productsaletoday = dao.getAllProductSaleSearchall();
                if (submit == null) {
             
                request.setAttribute("listsearch", productsaletoday);
                request.getRequestDispatcher("searchprofit.jsp").forward(request, response);
                }else{
                    String before =request.getParameter("start");
                    String after =request.getParameter("end");
                    
//                     Date datebefore = Date.valueOf(before);
//                     Date dateafter = Date.valueOf(after);
              productsaletoday = dao.getAllProductSaleSearch(before, after);
                       request.setAttribute("listsearch", productsaletoday);
                       request.setAttribute("start", before);
                       request.setAttribute("end", after);
                        request.getRequestDispatcher("searchprofit.jsp").forward(request, response);
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
