/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Salary;
import Entity.SalaryTotal;
import Entity.Shippers;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class SalaryDAO extends ConnectDB {

    Connection conn = null;
    PreparedStatement state = null;
    ResultSet rs = null;

    public int addSalary(Salary s) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Salary]\n"
                + "           ([employeeID]\n"
                + "           ,[state]\n"
                + "           ,[salary]\n"
                + "           ,[from]\n"
                + "           ,[to]\n"
                + "           ,[to]\n"
                + "           ,[Totalworking]\n"
                + "               ,[salaryTotal])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setInt(1, s.getEmployeeID());
            state.setInt(2, s.getState());
            state.setDouble(3, s.getSalary());
            state.setDate(4, s.getFrom());
            state.setDate(5, s.getTo());
            state.setInt(6, s.getTotalwork());
            state.setDouble(7, s.getSalarytotal());
            n = state.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int updateSalary(Salary s) {
        int n = 0;
        String sql = "update Salary set Salary=? ,state=? where employeeID=?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setInt(3, s.getEmployeeID());
            state.setInt(2, s.getState());
            state.setDouble(1, s.getSalary());
            n = state.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public int updateSalary2(int id) {
        int n = 0;
        String sql = "UPDATE [dbo].[Salary] \n"
                + "   set\n"
                + "      [Totalworking] = (SELECT count([employeeID])\n"
                + "  FROM [ShopManagement3].[dbo].[SalaryDetail] where employeeID=" + id + ")\n"
                + " WHERE employeeID=" + id;
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            n = state.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public List<Salary> listAllSalary() {

        String sql = "select * from Salary";
        List<Salary> vector = new ArrayList<Salary>();
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
            while (rs.next()) {
                int oID = rs.getInt("employeeID");
                int state = rs.getInt(2);
                double salary = rs.getDouble(3);
                Date from = rs.getDate(4);
                Date to = rs.getDate(5);
                int total = rs.getInt(6);
                double stotal = rs.getDouble(7);

                Salary o = new Salary(oID, state, salary, from, to, total, stotal);
                vector.add(o);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vector;
    }

    public List<SalaryTotal> listAllSalaryTotal() {

        String sql = "SELECT e.[employeeID]\n"
                + "      ,e.[employeeName]\n"
                + "	  ,[img]\n"
                + "      ,[state]\n"
                + "      ,[salarytoday]\n"
                + "      ,[from]\n"
                + "      ,[to]\n"
                + "      ,[Totalworking]\n"
                + "      ,[salaryTotal]\n"
                + "  FROM [Salary] s ,Employees e where s.employeeID=e.employeeID";
        List<SalaryTotal> vector = new ArrayList<SalaryTotal>();
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
            while (rs.next()) {
                int oID = rs.getInt("employeeID");
                String name = rs.getString(2);
                String namimge = rs.getString(3);
                int state = rs.getInt(4);
                double salary = rs.getDouble(5);
                Date from = rs.getDate(6);
                Date to = rs.getDate(7);
                int total = rs.getInt(8);
                double stotal = rs.getDouble(9);

                SalaryTotal o = new SalaryTotal(oID, name, namimge, state, salary, from, to, total, stotal);
                vector.add(o);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vector;
    }

    public Salary SalarygetbyId(int id) {
        Salary o = null;
        String sql = "select * from Salary where employeeID=" + id;

        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
            while (rs.next()) {
                int oID = rs.getInt("employeeID");
                int state = rs.getInt(2);
                double salary = rs.getDouble(3);
                Date from = rs.getDate(4);
                Date to = rs.getDate(5);
                int total = rs.getInt(6);
                double stotal = rs.getDouble(7);

                o = new Salary(oID, state, salary, from, to, total, stotal);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return o;
    }

    public static void main(String[] args) {
        SalaryDAO dao = new SalaryDAO();
        List<Salary> vector = dao.listAllSalary();
        for (Salary salary : vector) {
            System.out.println(salary);
        }
    }
}
