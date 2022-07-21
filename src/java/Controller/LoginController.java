/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Define.Define;
import Entity.Account;
import Entity.Category;
import Entity.CategoryDTO;
import Entity.Employees;
import Entity.ProductDTO;
import Entity.UserDTO;
import Model.AccountDAO;
import Model.EmployeeDAO;
import Model.ProductDAO;
import Model.UserDAO;
import Model.categoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

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
        HttpSession session = request.getSession();
        String url = Define.LOGIN_PAGE;
        try {

            /* TODO output your page here. You may use following sample code. */
            String u = request.getParameter("username").trim().toLowerCase();
            String p = request.getParameter("password").trim();
            boolean remember = request.getParameter("remember") != null;
            AccountDAO dao = new AccountDAO();
            Account a = dao.getAccount(u, p);
          
//            out.println(cus);
            String service = request.getParameter("do");
//            out.print(service);
//            out.print("ok");

            if (service == null) {
                service = "logincus1";
//                out.print("ok");
            }
            if (service.equals("logincus1")) {

                if (a == null) {
                    String error = "Your username or password is incorrect";
                    request.setAttribute("error", error);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {

//                    UserDAO userDAO = new UserDAO();
                    UserDTO userDTO = new UserDTO();
                    userDTO.setEmail(u);
                    userDTO.setPassword(p);
//                             url= "index.jsp";

//                    UserDTO role = userDAO.getRole(userDTO);
                    if (remember) {
                        Cookie usernamecookie = new Cookie("username", u);
                        Cookie passcookie = new Cookie("password", p);
                        usernamecookie.setMaxAge(60 * 60 * 24);
                        passcookie.setMaxAge(60 * 60 * 24);
                        response.addCookie(usernamecookie);
                        response.addCookie(passcookie);
                    }
                    if (a.getRole() == 0) {
                            EmployeeDAO daoem = new EmployeeDAO();
                int n=0;
                Employees e = daoem.getEmpployeesbyUsername(a.getUsername());
                        session.setAttribute("account", a);
                        session.setAttribute("nameacc", a.getUsername());
                            session.setAttribute("emp", e);
//               
                     response.sendRedirect("HomePageEmployeeController");
                    } else if (a.getRole() == 1) {
                            EmployeeDAO daoem = new EmployeeDAO();
                int n=0;
                Employees e = daoem.getEmpployeesbyUsername(a.getUsername());
                        // update login with role admin and customer
                        session.setAttribute("USER", a.getUsername());
                        session.setAttribute("EMAIL", a.getEmail());
                        session.setAttribute("ROLE","ADMIN");
                               session.setAttribute("account", a);
                        session.setAttribute("nameacc", a.getUsername());
                        url = Define.INDEX_PAGE;

                        //get all list product
                        ArrayList<ProductDTO> listProduct = new ArrayList<>();
                        ProductDAO productDAO = new ProductDAO();
                        listProduct = productDAO.getProductByParam(Define.IS_EMPTY_DEFAUL, Define.NUMBER_DEFAUL);
                        request.setAttribute("LIST_PRODUCT", listProduct);
                        //get all Caterory
                        categoryDAO categoryDAO = new categoryDAO();
                        List<Category> listCategory = categoryDAO.getAllCategory();
                        request.setAttribute("LIST_CATEGORY", listCategory);
                            session.setAttribute("emp", e);
                          request.getRequestDispatcher(url).forward(request, response);
                          
                    }  else if (a.getRole() == 3) {
                        // update login with role admin and customer
                        session.setAttribute("USER", a.getUsername());
                        session.setAttribute("EMAIL", a.getEmail());
                        session.setAttribute("ROLE","CUSTOMER");
                               session.setAttribute("account", a);
                        session.setAttribute("nameacc", a.getUsername());
                        url = Define.INDEX_PAGE;

                        //get all list product
                        ArrayList<ProductDTO> listProduct = new ArrayList<>();
                        ProductDAO productDAO = new ProductDAO();
                        listProduct = productDAO.getProductByParam(Define.IS_EMPTY_DEFAUL, Define.NUMBER_DEFAUL);
                        request.setAttribute("LIST_PRODUCT", listProduct);
                        //get all Caterory
                        categoryDAO categoryDAO = new categoryDAO();
                        List<Category> listCategory = categoryDAO.getAllCategory();
                        request.setAttribute("LIST_CATEGORY", listCategory);
//                        session.setAttribute("emp", e);
                          request.getRequestDispatcher(url).forward(request, response);
                          
                    }
                }
            }
        } catch (Exception e) {
            session.setAttribute("ex", e);
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
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
