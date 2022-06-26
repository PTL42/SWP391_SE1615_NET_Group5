/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Account;
import Entity.Employees;
import Model.AccountDAO;
import Model.EmployeeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "EditProfile", urlPatterns = {"/EditProfile"})
public class EditProfile extends HttpServlet {

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
            Object a = session.getAttribute("account");
            if (a != null) {
                Account account = (Account) a;
                    
                
                
                
                String submit = request.getParameter("submit");
                if (submit == null) {
                EmployeeDAO dao = new EmployeeDAO();
                Employees e = dao.getEmpployeesbyUsername(account.getUsername());
                request.setAttribute("profile", e);
                request.getRequestDispatcher("ok_1.jsp").forward(request, response);
                }
                else{
                          
                    String name = request.getParameter("name");
                String email = request.getParameter("val-email");
                String gender = request.getParameter("val-skill");
                String phone = request.getParameter("val-phoneus");
                String dob = request.getParameter("dob");
                String img = request.getParameter("files");
                int gender2=Integer.parseInt(gender);
                Date date=Date.valueOf(dob);
                 EmployeeDAO dao = new EmployeeDAO();
                   Employees e1=new Employees(name, gender2, phone, date, img, account.getUsername(), email);
                   int n=dao.UpdateEmployees(e1);
            
                request.setAttribute("profile", e1);
                   request.setAttribute("n", n);
                 request.getRequestDispatcher("ok_1.jsp").forward(request, response);
                 
                }
            } else {
                response.sendRedirect("login.jsp");
            }
        } catch (Exception ex) {
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
