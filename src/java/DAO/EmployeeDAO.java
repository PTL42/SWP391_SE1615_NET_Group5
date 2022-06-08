/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Account;
import Model.Employee;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class EmployeeDAO extends ConnectDB {

    public String getEmail(String user) {
        String sql = "select Email from Employees where username=" + "'" + user + "'";
        String email = "";
        try {

            ResultSet rs = getData(sql);
//            ResultSet rs=getData(sql);
            while (rs.next()) {
                email = rs.getString(1);

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return email;
    }

     public ArrayList<Employee> getEmployees() {
         ArrayList<Employee> employees = new ArrayList<>();
         try {
             
             String sql = "SELECT e.id, e.name, e.dob, e.gender, e.phone, e.salary, a.username FROM Employee e\n" +
                        "INNER JOIN Account a ON e.username = a.username";
             PreparedStatement stm = conn.prepareStatement(sql);
             ResultSet rs = stm.executeQuery();
             while (rs.next()) {
                 Employee e = new Employee();
                 e.setId(rs.getString("id"));
                 e.setName(rs.getString("name"));
                 e.setGender(rs.getBoolean("gender"));
                 e.setDob(rs.getDate("dob"));
                 e.setPhone(rs.getString("phone"));
                 e.setSalary(rs.getInt("salary"));
                 Account account = new Account();
                 account.setUsername(rs.getString("username"));
                 e.setUsername(account);
                 employees.add(e);
             }
         } catch (SQLException ex) {
             Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
         }
         return employees;
    }
     
     public Employee getEmployee(String id) {
        try {
            String sql = "SELECT e.id, e.name, e.dob, e.gender, e.phone, e.salary, a.username FROM Employee e\n" +
                        "INNER JOIN Account a ON e.username = a.username\n" +
                        "WHERE e.id = ?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()) {
                 Employee e = new Employee();
                 e.setId(id);
                 e.setName(rs.getString("name"));
                 e.setGender(rs.getBoolean("gender"));
                 e.setDob(rs.getDate("dob"));
                 e.setPhone(rs.getString("phone"));
                 e.setSalary(rs.getInt("salary"));
                 Account account = new Account();
                 account.setUsername(rs.getString("username"));
                 e.setUsername(account);
                 return e;
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return null;
     }
     
     public void insert(Employee e) {
         
        try {
            String sql = "INSERT INTO [Employee]\n" +
                        "           ([id]\n" +
                        "           ,[name]\n" +
                        "           ,[dob]\n" +
                        "           ,[gender]\n" +
                        "           ,[phone]\n" +
                        "           ,[salary]\n" +
                        "           ,[username])\n" +
                        "     VALUES\n" +
                        "           (?\n" +
                        "           ,?\n" +
                        "           ,?\n" +
                        "           ,?\n" +
                        "           ,?\n" +
                        "           ,?\n" +
                        "           ,?)";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, e.getId());
            stm.setString(2, e.getName());
            stm.setDate(3, e.getDob());
            stm.setBoolean(4, e.isGender());
            stm.setString(5, e.getPhone());
            stm.setInt(6, e.getSalary());
            stm.setString(7, e.getUsername().getUsername());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
     }
     
     public void update(Employee e) {
        try {
            String sql = "UPDATE [Employee]\n" +
                        "   SET [name] = ?\n" +
                        "      ,[dob] = ?\n" +
                        "      ,[gender] = ?\n" +
                        "      ,[phone] = ?\n" +
                        "      ,[salary] = ?\n" +
                        "      ,[username] = ?\n" +
                        " WHERE [id] = ?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, e.getName());
            stm.setDate(2, e.getDob());
            stm.setBoolean(3, e.isGender());
            stm.setString(4, e.getPhone());
            stm.setInt(5, e.getSalary());
            stm.setString(6, e.getUsername().getUsername());
            stm.setString(7, e.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
     }
     
     public void delete(String id) {
        try {
            String sql = "DELETE FROM [Employee]\n" +
                        "      WHERE [id] = ?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
     }
    public static void main(String[] args) {
        EmployeeDAO dao = new EmployeeDAO();
        String a = dao.getEmail("user1");
        System.out.println(a);
    }

}
