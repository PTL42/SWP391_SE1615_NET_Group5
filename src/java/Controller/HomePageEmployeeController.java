/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Account;
import Entity.Cart;
import Entity.Category;
import Entity.Employees;
import Entity.Invoice;
import Entity.Item;
import Entity.Product;
import Model.CustomerDAO;
import Model.EmployeeDAO;
import Model.Invoice2DAO;
import Model.InvoiceDAO;
import Model.ProductDAO;
import Model.categoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
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
@WebServlet(name = "HomePageEmployeeController", urlPatterns = {"/HomePageEmployeeController"})
public class HomePageEmployeeController extends HttpServlet {

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
//            String service = request.getParameter("do");

            String service = request.getParameter("do");

            Object a = session.getAttribute("account");
            if (a != null) {
                Account account = (Account) a;
                List<Item> list3 = null;
                EmployeeDAO dao = new EmployeeDAO();

                Employees e = dao.getEmpployeesbyUsername(account.getUsername());
                ProductDAO dao3 = new ProductDAO();
                Invoice2DAO daoin = new Invoice2DAO();
                CustomerDAO daocus = new CustomerDAO();
                categoryDAO daocate = new categoryDAO();
                List<Category> listcate = daocate.getAllCategory();
                Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
                if (cart == null) {
                    cart = new LinkedHashMap<>();
                }
                double total = 0;
                for (Map.Entry<Integer, Cart> entry : cart.entrySet()) {
                    Integer key = entry.getKey();
                    Cart carts = entry.getValue();
                    total += carts.getQuantity() * carts.getProduct().getPrice();

                }
                List<Product> list = dao3.getAllProduct();
                List<String> listcus = daocus.getAllNameCustomer();
                String namecus = request.getParameter("myCountry");
                int idinvoicenew = daoin.invoiceidnew();
                
                if (service == null) {
                    service = "ListallProduct";
                    n = 1;
                }
                if (service.equals("ListallProduct")) {
                   
                    request.setAttribute("listcate", listcate);
                    session.setAttribute("n", n);
                    session.setAttribute("total2", total);
                    session.setAttribute("url", "HomePageEmployeeController?do=ListallProduct");
                    session.setAttribute("emp", e);
                    session.setAttribute("list2", list);
                    session.setAttribute("listcus", listcus);
                    session.setAttribute("idinvoicenew", idinvoicenew + 1);

                    if (namecus != null) {
                        int id2 = daocus.getCustomerbyid(namecus);
                        if (id2 == 0) {
                            session.setAttribute("n1", 6);
                            session.setAttribute("idcus", id2);
                            session.setAttribute("namecus", namecus);
                        } else {
                            session.setAttribute("n1", 0);
                            session.setAttribute("idcus", id2);
                            session.setAttribute("namecus", namecus);
                        }
                    }

//                response.sendRedirect("index.jsp");
                    request.getRequestDispatcher("addinvoice.jsp").forward(request, response);
//                }
                }
                if (service.equals("ListInvoice")) {

                    InvoiceDAO dao2 = new InvoiceDAO();
                    n = 10;
                    List<Invoice> listin = dao2.getAllInvoice();
                    request.setAttribute("listI", listin);
                    session.setAttribute("emp", e);
                    session.setAttribute("n", 10);
//                response.sendRedirect("index.jsp");
                    request.getRequestDispatcher("index_2.jsp").forward(request, response);
                }

                if (service.equals("ListSearchProduct")) {
                    n = 2;
                    String searchname = request.getParameter("searchname").trim();
                    String cate = request.getParameter("cate").trim();
                    if (searchname.equals("") && cate.equals("all")) {
                        list = dao3.getAllProduct();
                              session.setAttribute("searchname2", searchname);
                    session.setAttribute("cate2", cate);

                    request.setAttribute("listcate", listcate);
                    session.setAttribute("n", n);
                    session.setAttribute("total2", total);
                    session.setAttribute("emp", e);
                    session.setAttribute("list2", list);
                    session.setAttribute("listcus", listcus);
                    session.setAttribute("idinvoicenew", idinvoicenew + 1);
request.getRequestDispatcher("addinvoice.jsp").forward(request, response);
                    }
                    if (searchname.equals("") != true && cate.equals("all")!= false) {
                        list = dao3.getAllProductbycateidandname(searchname);
                        
                        request.setAttribute("searchname", searchname);
                        request.setAttribute("cate", cate);

                        session.setAttribute("url", "HomePageEmployeeController?do=ListSearchProduct&searchname=" + searchname+"&cate=" + "all");
                    } 
                    if (searchname.equals("") == true && cate.equals("all") != false) {
                         int catecon = Integer.parseInt(cate);
                        list = dao3.getAllProductbycateidandname2(catecon);
                        
                        request.setAttribute("searchname", searchname);
                        request.setAttribute("cate", cate);

                        session.setAttribute("url", "HomePageEmployeeController?do=ListSearchProduct&cate=" + cate);
                    }if (searchname.equals("") != true && cate.equals("all") != true) {
                        int catecon = Integer.parseInt(cate);
                        list = dao3.getAllProductbycateidandname(catecon, searchname);
                        request.setAttribute("searchname", searchname);
                        request.setAttribute("cate", cate);
                        session.setAttribute("url", "HomePageEmployeeController?do=ListSearchProduct&searchname=" + searchname + "&cate=" + cate);

                    }
//                   
                    session.setAttribute("searchname2", searchname);
                    session.setAttribute("cate2", cate);

                    request.setAttribute("listcate", listcate);
                    session.setAttribute("n", n);
                    session.setAttribute("total2", total);
                    session.setAttribute("emp", e);
                    session.setAttribute("list2", list);
                    session.setAttribute("listcus", listcus);
                    session.setAttribute("idinvoicenew", idinvoicenew + 1);

                    if (namecus != null) {
                        int id2 = daocus.getCustomerbyid(namecus);
                        if (id2 == 0) {
                            session.setAttribute("n1", 6);
                            session.setAttribute("idcus", id2);
                            session.setAttribute("namecus", namecus);
                        } else {
                            session.setAttribute("n1", 0);
                            session.setAttribute("idcus", id2);
                            session.setAttribute("namecus", namecus);
                        }
                    }

//                response.sendRedirect("index.jsp");
                    request.getRequestDispatcher("addinvoice.jsp").forward(request, response);
//                
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
