/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Entity.Account;
import Entity.Employees;
import Entity.EmployeesSalary;
import Entity.SalaryDetail;
import Model.EmployeeDAO;
import Model.SalaryDAO;
import Model.SalaryDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Array;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
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
 * @author Admin
 */
@WebServlet(name = "SalaryController", urlPatterns = {"/salary"})
public class SalaryController extends HttpServlet {

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
//            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            Object a = session.getAttribute("account");
            if (a != null) {
                Account account = (Account) a;

                SimpleDateFormat dt3 = new SimpleDateFormat("dd-MM-yyyy");
                LocalDate date = java.time.LocalDate.now();
                String date1 = date.toString();
                Date date2 = Date.valueOf(date1);
                String date3 = dt3.format(date2);
                EmployeeDAO daoem = new EmployeeDAO();
                List<EmployeesSalary> listem = daoem.ListAllEmployeesandSalary(date2);
                String submit = request.getParameter("submit");

                if (submit == null) {
                    request.setAttribute("listem", listem);
                    request.setAttribute("date3", date3);
                    request.getRequestDispatcher("checkdd.jsp").forward(request, response);
                } else {
//                String name = request.getParameter("check1");
                    List<String> list2 = new ArrayList<>();
                    List<String> listattend = new ArrayList<>();
                    List<String> listabsent = new ArrayList<>();
                    List<Integer> listint = new ArrayList<>();
                    List<Integer> listintabsent = new ArrayList<>();
                    for (EmployeesSalary employees : listem) {
                        list2.add(request.getParameter("check" + employees.getEmployeeID()));
                    }
                    for (String string : list2) {
                        if (string.contains("attended")) {
                            listattend.add(string);

                        }
                        if (string.contains("absent")) {
                            listabsent.add(string);
                        }
                    }
                    for (String string : listattend) {
                        listint.add(Integer.parseInt(string.substring(8, string.length())));
                    }
                    for (String string : listabsent) {
                        listintabsent.add(Integer.parseInt(string.substring(6, string.length())));
                    }
                    boolean k = false;
//                out.println(name);
                    SalaryDetailDAO sd = new SalaryDetailDAO();
                    SalaryDAO sd2= new SalaryDAO();
                    List<SalaryDetail> listD = sd.listAllSalaryDetail();
                    for (Integer integer : listint) {
                        SalaryDetail salaryd = new SalaryDetail(integer, date2);
                        for (SalaryDetail salaryDetail : listD) {
                            if (salaryd.getEmployeeID() == salaryDetail.getEmployeeID() && salaryd.getDay().equals(salaryDetail.getDay()) == true ) {
                                k = true;
                            }
                        }
                        if (k == false) {
                            sd.addSalaryDetail(salaryd);
                            sd2.updateSalary2(salaryd.getEmployeeID());
                            
                        }
                    }
                    for (Integer integer : listintabsent) {
                        sd.removeSalaryDetail(integer, date2);
                             sd2.updateSalary2(integer);
                    }
                    listem = daoem.ListAllEmployeesandSalary(date2);
                    request.setAttribute("listem", listem);
                    request.setAttribute("date3", date3);
                    request.setAttribute("ha", 1);
                    request.getRequestDispatcher("checkdd.jsp").forward(request, response);
//                for (SalaryDetail salaryDetail : listD) {
//                    out.print(salaryDetail);
//                }
//                 SalaryDetail salaryd=new SalaryDetail(0, date2)
//            int n=sd.addSalaryDetail(s)
                }
            } else {
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
