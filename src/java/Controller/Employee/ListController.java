/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Employee;

import DAO.EmployeeDAO;
import Model.Employee;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Long Thanh Pham
 */
public class ListController extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ListController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        EmployeeDAO e = new EmployeeDAO();
        ArrayList<Employee> employees = e.getEmployees();
        request.setAttribute("employees", employees);
        
//         int pageSize = 10;
//        
//        String raw_page = request.getParameter("page");
//        if (raw_page == null || raw_page.length() == 0) {
//            raw_page = "1";
//        }
//        int pageIndex = Integer.parseInt(raw_page);
//        
//        DummyDBContext db = new DummyDBContext();
//        ArrayList<Employee> dummies = db.getDummies(pageIndex, pageSize);
//        int totalrecord = db.count(); // tính tổng số rc để => total page
//        int totalpage = (totalrecord % pageSize == 0)?totalrecord / pageSize : totalrecord/pageSize + 1;
//        request.setAttribute("dummies", dummies);
//        request.setAttribute("pageSize", pageSize);
//        request.setAttribute("pageIndex", pageIndex);
//        request.setAttribute("totalrecord", totalrecord);
//        request.setAttribute("totalpage", totalpage);
        request.getRequestDispatcher("../view/employee/list.jsp").forward(request, response);
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
