/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Account;
import Entity.Employees;
import Entity.EmployeesSalary;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class EmployeeDAO extends ConnectDB {

    Connection conn = null;
    PreparedStatement state = null;
    ResultSet rs = null;

    public String getEmail(String email2) {
        String sql = "select Email from Employees where [email]=" + "'" + email2 + "'";
        String email = "";
        try {

            conn = getConnection();
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
//            ResultSet rs=getData(sql);
            while (rs.next()) {
                email = rs.getString(1);

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return email;
    }

    public Employees getEmpployeesbyUsername(String user) {
        String sql = "select * from Employees where username=" + "'" + user + "'";
        Employees e = null;

        try {

            conn = getConnection();
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
//            ResultSet rs=getData(sql);
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int gender = rs.getInt(3);
                String phone = rs.getString(4);
                Date date = rs.getDate(5);
                String img = rs.getString(6);
                String username = rs.getString(7);
                String email = rs.getString(8);
                e = new Employees(id, name, gender, phone, date, img, username, email);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return e;
    }

    public List<Employees> ListAllEmployees() {
        String sql = "select * from Employees ";
        List<Employees> list = new ArrayList<Employees>();

        try {

            conn = getConnection();
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
//            ResultSet rs=getData(sql);
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int gender = rs.getInt(3);
                String phone = rs.getString(4);
                Date date = rs.getDate(5);
                String img = rs.getString(6);
                String username = rs.getString(7);
                String email = rs.getString(8);
                Employees e = new Employees(id, name, gender, phone, date, img, username, email);
                list.add(e);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public List<EmployeesSalary> ListAllEmployeesandSalary(Date date2) {
        String sql
                = "SELECT e.[employeeID]\n"
                + "      ,[day]\n"
                + "	  ,[employeeName]\n"
                + "      ,[gender]\n"
                + "      ,[phone]\n"
                + "      ,[dob]\n"
                + "      ,[img]\n"
                + "      ,[username]\n"
                + "      ,[email]\n"
                + "  FROM [SalaryDetail] s right JOIN Employees e ON s.employeeID=e.employeeID AND [day]='" + date2 + "' ";
        List<EmployeesSalary> list = new ArrayList<EmployeesSalary>();

        try {

            conn = getConnection();
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
//            ResultSet rs=getData(sql);
            while (rs.next()) {
                int id = rs.getInt(1);
                Date day = rs.getDate(2);
                String name = rs.getString(3);
                int gender = rs.getInt(4);
                String phone = rs.getString(5);
                Date date = rs.getDate(6);
                String img = rs.getString(7);
                String username = rs.getString(8);
                String email = rs.getString(9);
                EmployeesSalary e = new EmployeesSalary(id, day, name, gender, phone, date, img, username, email);
                list.add(e);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public int UpdateEmployees(Employees e) {
        int n = 0;
        String sql = "UPDATE [dbo].[Employees]\n"
                + "   SET [employeeName] = ?\n"
                + "      ,[gender] = ?\n"
                + "      ,[phone] =?\n"
                + "      ,[dob] = ?\n"
                + "      ,[img] = ?\n"
                + "      ,[email] = ?\n"
                + " WHERE username=?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, e.getEmployeeName());
            state.setInt(2, e.getGender());

            state.setString(3, e.getPhone());
            state.setDate(4, e.getDob());
            state.setString(5, e.getImg());
            state.setString(6, e.getEmail());
            state.setString(7, e.getUsername());

            n = state.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
     public Employees getEmpployeesbyID(String id) {
        String sql = "select * from Employees where employeeID=" + "'" + id + "'";
        Employees e = null;

        try {

           conn = getConnection();
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
//            ResultSet rs=getData(sql);
            while (rs.next()) {
                int id1 = rs.getInt(1);
                String name = rs.getString(2);
                int gender = rs.getInt(3);
                String phone = rs.getString(4);
                Date date = rs.getDate(5);
                String img = rs.getString(6);
                String username = rs.getString(7);
                String email = rs.getString(8);
                e = new Employees(id1, name, gender, phone, date, img, username, email);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return e;
    }
//     public static void main(String[] args) {
//       EmployeeDAO dao=new EmployeeDAO();
//        Employees a=dao.getEmpployeesbyID("2");
//        System.out.println(a);
//    }

    public List<Employees> getAllEmpployees() {
        String sql = "select * from Employees";
        List<Employees> list = new ArrayList<>();
        Employees e = new Employees();

        try {

             conn = getConnection();
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
//            ResultSet rs=getData(sql);
            while (rs.next()) {
                int id1 = rs.getInt(1);
                String name = rs.getString(2);
                int gender = rs.getInt(3);
                String phone = rs.getString(4);
                Date date = rs.getDate(5);
                String img = rs.getString(6);
                String username = rs.getString(7);
                String email = rs.getString(8);
                e = new Employees(id1, name, gender, phone, date, img, username, email);
                list.add(e);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }
//               public static void main(String[] args) {
//        EmployeeDAO dao=new EmployeeDAO();
//        List<Employees> a=dao.getAllEmpployees();
//                   for (Employees employees : a) {
//                       System.out.println(employees);
//                   }
//    }
 public List<Employees> Search(String name) {
        try {
            String sql = "select * from Employees where employeeName like "+"'%"+ name+"%'";
           conn = getConnection();
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
           
          rs = state.executeQuery();
            List<Employees> list = new ArrayList<>();
            while (rs.next()) {
                int id1 = rs.getInt(1);
                String name1 = rs.getString(2);
                int gender = rs.getInt(3);
                String phone = rs.getString(4);
                Date date = rs.getDate(5);
                String img = rs.getString(6);
                String username = rs.getString(7);
                String email = rs.getString(8);
                Employees a = new Employees(id1, name1, gender, phone, date, img, username, email);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
    public void UpdateEmployee(String id, String name, String gender, String Phone, String birthday, String img) {
        String sql = "update Employees set employeeName=?,\n"
                + "gender=?,\n"
                + "phone=?,\n"
                + "dob=?,\n"
                + "img=?\n"
                + "where employeeID=?";
        try {
           conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(6, id);
            state.setString(1, name);
            state.setString(2, gender);
            state.setString(3, Phone);
            state.setString(4, birthday);
            state.setString(5, img);
            state.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void DeleteEmployee(String id) {
        try {
            String query = "delete Employees where employeeID = ?";
            conn = getConnection();
            state = conn.prepareStatement(query);
            state.setString(1, id);
            state.executeUpdate();
           
        } catch (Exception e) {
        }
        }
//    public static void main(String[] args) {
//        EmployeeDAO dao=new EmployeeDAO();
//        dao.UpdateEmployee("1", "Dao thanh long", "1", "091231823", "2000-03-22", "https://img5.thuthuatphanmem.vn/uploads/2021/07/16/hinh-anh-trai-dep-viet-nam-cool-ngau_085758224.jpg");
//    }
    public void insertEmployee(String name, String gender, String phone, String dob, String img, String username, String email) {
        String query = "insert into Employees values(?,?,?,?,?,?,?)";
        try {
              conn = getConnection();
            state = conn.prepareStatement(query);
  
            state.setString(1, name);
            state.setString(2, gender);
            state.setString(3, phone);
            state.setString(4, dob);
            state.setString(5, img);
            state.setString(6, username);
            state.setString(7, email);
            state.executeUpdate();
        } catch (Exception e) {
        }
    }
    public int countemployees() {
            int n=0;
        String sql = "SELECT COUNT(*) FROM Employees";
        List<Employees> list = new ArrayList<>();
        Employees e = new Employees();

        try {

             conn = getConnection();
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
//            ResultSet rs=getData(sql);
            while (rs.next()) {
                 n = rs.getInt(1);
               
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
            

    public static void main(String[] args) {
        EmployeeDAO dao = new EmployeeDAO();
//        Employees a=dao.getEmpployeesbyUsername("lunguyen");
//        int n=dao.UpdateEmployees(a);
//        System.out.println(a);
        String n = dao.getEmail("lunguyen2k18@gmail.com");
        System.out.println(n);
    }
}
