/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Account;
import Entity.EmployeesSalary;
import Entity.SalaryTotal;
import Model.EmployeeDAO;
import Model.SalaryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;
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
@WebServlet(name = "SalarytotalController", urlPatterns = {"/salarytotal"})
public class SalarytotalController extends HttpServlet {

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
          Account account = (Account) a;
            if (a != null &&account.getRole()==1) {
              

  
                SimpleDateFormat dt3 = new SimpleDateFormat("dd-MM-yyyy");
                SimpleDateFormat moth = new SimpleDateFormat("MM");
                SimpleDateFormat year = new SimpleDateFormat("yyyy");
                LocalDate date = java.time.LocalDate.now();
                String date1 = date.toString();
                    

                Date date2 = Date.valueOf(date1);
                String date3 = dt3.format(date2);
                  int mothint=Integer.parseInt(moth.format(date2));
                 int yearint=Integer.parseInt(year.format(date2));
                SalaryDAO daos= new SalaryDAO();
                EmployeeDAO daoem = new EmployeeDAO();
                List<SalaryTotal> listem = daos.listAllSalaryTotal(mothint,yearint);
                String oid = request.getParameter("oid");
                String sid = request.getParameter("stateid");
       
                 if(oid!=null){
                        int id=Integer.parseInt(oid);
                        int ids=Integer.parseInt(sid);
                        int k=daos.updateSalarystatus(ids, id);
                        listem = daos.listAllSalaryTotal(mothint,yearint);
                        request.setAttribute("ha",k );
                        request.setAttribute("mess","Successfully updated employee salary:"+daoem.getEmpployeesbyID(oid).getEmployeeName() );
                        
                 }
               
                  request.setAttribute("listem", listem);
                    request.setAttribute("date3", date3);
                    request.getRequestDispatcher("checkdd_1.jsp").forward(request, response);
              
               
               
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
