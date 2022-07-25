/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Account;
import Entity.Invoice;
import Entity.ProductSaleToday;
import Model.CustomerDAO;
import Model.DeliveryaddressDAO;
import Model.EmployeeDAO;
import Model.InvoiceDAO;
import Model.ProductDAO;
import Model.ProductInvoice2DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
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
@WebServlet(name = "dashboardController", urlPatterns = {"/dashboardController"})
public class dashboardController extends HttpServlet {

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
        try {
            /* TODO output your page here. You may use following sample code. */
                        HttpSession session = request.getSession();
            
            String service = request.getParameter("do");
            Object a = session.getAttribute("account");
                  Account account = (Account) a;
            if (a != null &&account.getRole()==1) {
            ProductDAO dao = new ProductDAO();
                EmployeeDAO daoEM = new EmployeeDAO();
            InvoiceDAO dao2 = new InvoiceDAO();
            DeliveryaddressDAO daode=new DeliveryaddressDAO();
            ProductInvoice2DAO dao3= new ProductInvoice2DAO();
            CustomerDAO daocus=new CustomerDAO();
            List<Invoice> listi=dao2.getAllInvoicetop3();
            LocalDate date = java.time.LocalDate.now();
            String date1 = date.toString();
            Date date2 = Date.valueOf(date1);
            SimpleDateFormat dt = new SimpleDateFormat("w");
            SimpleDateFormat dt2 = new SimpleDateFormat("E");
            SimpleDateFormat dt3 = new SimpleDateFormat("dd-MM-yyyy");
            SimpleDateFormat dtyear = new SimpleDateFormat("yyyy");
            String year=dtyear.format(date2);
            int yearint=Integer.parseInt(year);
            System.out.println(yearint);
            String d="2022-06-20";
            Date date3 =Date.valueOf(d);
           List<ProductSaleToday> productsaletoday = dao.getAllProductSaleToday(date2);
            String dateweek = dt.format(date2);
              int n=Integer.parseInt(dateweek);
              String dateweek2=String.valueOf(n);
                 if(dt2.format(date2).equals("Sun")){
                   dateweek2=String.valueOf(n);
              }else{
                     dateweek2=String.valueOf(n+1);
              }
            
              if(dt2.format(date2).equals("Sun")){
                  dateweek=String.valueOf(n-1);
              }else{
                   dateweek=String.valueOf(n);
              }
              
            List<Invoice> listin = dao2.getAllInvoice();
//            List<Invoice> listin2 = new ArrayList<>();
//            List<Integer> productsaleTHU2 = new ArrayList<>();
//            List<Integer> productsaleTHU3 = new ArrayList<>();
//            List<Integer> productsaleTHU4 = new ArrayList<>();
//            List<Integer> productsaleTHU5 = new ArrayList<>();
//            List<Integer> productsaleTHU6 = new ArrayList<>();
//            List<Integer> productsaleTHU7 = new ArrayList<>();
//            List<Integer> productsaleCN = new ArrayList<>();
            int productsaleTHU2 = 0;
            int productsaleTHU3 = 0;
            int productsaleTHU4 = 0;
            int productsaleTHU5 = 0;
            int productsaleTHU6 = 0;
            int productsaleTHU7 = 0;
            int productsaleCN = 0;
            double totalweek=0;
            Calendar cal = Calendar.getInstance();
            cal.setTime(date2);
            int nweek = cal.WEEK_OF_YEAR;
            String nweek2 = String.valueOf(nweek);
            for (Invoice invoice : listin) {
                
                if (dt.format(invoice.getCreatedDate()).equals(dateweek)) {
//                    productsale.add(dao.countProductSale(invoice.getCreatedDate()));
                    if (dt2.format(invoice.getCreatedDate()).equals("Mon")) {
                        productsaleTHU2 = dao.SumProductSale(invoice.getCreatedDate());
                        totalweek +=dao3.gettotalweek2(invoice.getInvoiceID());
                        
                    }
                    if (dt2.format(invoice.getCreatedDate()).equals("Tue")) {
                        productsaleTHU3 = dao.SumProductSale(invoice.getCreatedDate());
                        totalweek +=dao3.gettotalweek2(invoice.getInvoiceID());
                    }
                    if (dt2.format(invoice.getCreatedDate()).equals("Wed")) {
                        productsaleTHU4 = dao.SumProductSale(invoice.getCreatedDate());
                        totalweek +=dao3.gettotalweek2(invoice.getInvoiceID());
                    }
                    if (dt2.format(invoice.getCreatedDate()).equals("Thu")) {
                        productsaleTHU5 = dao.SumProductSale(invoice.getCreatedDate());
                        totalweek +=dao3.gettotalweek2(invoice.getInvoiceID());
                    }
                    if (dt2.format(invoice.getCreatedDate()).equals("Fri")) {
                        productsaleTHU6 = dao.SumProductSale(invoice.getCreatedDate());
                        totalweek +=dao3.gettotalweek2(invoice.getInvoiceID());
                    }
                    if (dt2.format(invoice.getCreatedDate()).equals("Sat")) {
                        productsaleTHU7 = dao.SumProductSale(invoice.getCreatedDate());
                        totalweek +=dao3.gettotalweek2(invoice.getInvoiceID());
                    }
//                    if (dt2.format(invoice.getCreatedDate()).equals("Sun")) {
//                        productsaleCN = dao.SumProductSale(invoice.getCreatedDate());
//                    }
                 
                
                }
                if (dt.format(invoice.getCreatedDate()).equals(dateweek2)) {
//                  
                    if (dt2.format(invoice.getCreatedDate()).equals("Sun")) {
                        productsaleCN = dao.SumProductSale(invoice.getCreatedDate());
                        totalweek +=dao3.gettotalweek2(invoice.getInvoiceID());
                    }
                }
            }
                System.out.println(totalweek);
               int productsaleTHANG1 = dao.SumProductSaleMoth(1,yearint);
               int productsaleTHANG2 = dao.SumProductSaleMoth(2,yearint);
               int productsaleTHANG3 = dao.SumProductSaleMoth(3,yearint);
               int productsaleTHANG4 = dao.SumProductSaleMoth(4,yearint);
               int productsaleTHANG5 = dao.SumProductSaleMoth(5,yearint);
               int productsaleTHANG6 = dao.SumProductSaleMoth(6,yearint);
               int productsaleTHANG7 = dao.SumProductSaleMoth(7,yearint);
               int productsaleTHANG8 = dao.SumProductSaleMoth(8,yearint);
               int productsaleTHANG9 = dao.SumProductSaleMoth(9,yearint);
               int productsaleTHANG10 = dao.SumProductSaleMoth(10,yearint);
               int productsaleTHANG11 = dao.SumProductSaleMoth(11,yearint);
               int productsaleTHANG12 = dao.SumProductSaleMoth(12,yearint);
               System.out.println(productsaleTHANG5);
               double totalmoth=dao3.gettotalmoth(yearint);
              
            int ProductSold=dao.SumProductSale(date2);
            request.setAttribute("thu2", productsaleTHU2);
            request.setAttribute("thu3", productsaleTHU3);
            request.setAttribute("thu4", productsaleTHU4);
            request.setAttribute("thu5", productsaleTHU5);
            request.setAttribute("thu6", productsaleTHU6);
            request.setAttribute("thu7", productsaleTHU7);
            request.setAttribute("cn", productsaleCN);
            request.setAttribute("thang1", productsaleTHANG1);
            request.setAttribute("thang2", productsaleTHANG2);
            request.setAttribute("thang3", productsaleTHANG3);
            request.setAttribute("thang4", productsaleTHANG4);
            request.setAttribute("thang5", productsaleTHANG5);
            request.setAttribute("thang6", productsaleTHANG6);
            request.setAttribute("thang7", productsaleTHANG7);
            request.setAttribute("thang8", productsaleTHANG8);
            request.setAttribute("thang9", productsaleTHANG9);
            request.setAttribute("thang10", productsaleTHANG10);
            request.setAttribute("thang11", productsaleTHANG11);
            request.setAttribute("thang12", productsaleTHANG12);
            request.setAttribute("listI",listi);
            request.setAttribute("countem",daoEM.countemployees());
            request.setAttribute("countcus",daocus.countCustomer());
            request.setAttribute("coutoffonl",dao2.countinvoice());
            request.setAttribute("countoff",daode.countDelivery());
            request.setAttribute("listtoday", productsaletoday);
            request.setAttribute("productsold", ProductSold);
            request.setAttribute("date", dt3.format(date2));
            request.setAttribute("totalweek",totalweek);
            request.setAttribute("totalmoth",totalmoth);
            
            request.getRequestDispatcher("profit_1.jsp").forward(request, response);
            }else {
                response.sendRedirect("login.jsp");
//            response.sendRedirect("ControllerProduct");
            }
        }catch (Exception e) {
       
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
