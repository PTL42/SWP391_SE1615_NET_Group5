/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Employee;

import DAO.DepartmentDAO;
import DAO.EmployeeDAO;
import Model.Department;
import Model.Employee;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Long Thanh Pham
 */
public class UpdateController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */


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
        String id = request.getParameter("id");
        EmployeeDAO eDB = new EmployeeDAO();
        Employee employee = eDB.getEmployee(id);
        request.setAttribute("employee", employee);
        
        DepartmentDAO dDB = new DepartmentDAO();
        ArrayList<Department> depts = dDB.getDepartments();
        request.setAttribute("depts", depts);
        
        request.getRequestDispatcher("../view/employee/update.jsp").forward(request, response);
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
        Employee e = new Employee();
        e.setId(request.getParameter("id"));
        e.setName(request.getParameter("name"));
        e.setGender(request.getParameter("gender").equals("male"));
        e.setDob(Date.valueOf(request.getParameter("dob")));
        e.setPhone(request.getParameter("phone"));
        e.setSalary(Integer.parseInt(request.getParameter("salary")));
        Department d = new Department();
        d.setId(request.getParameter("did"));
        e.setDept(d);
        EmployeeDAO eDB = new EmployeeDAO();
        eDB.update(e);
        response.sendRedirect("list");
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
