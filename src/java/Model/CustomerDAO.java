/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Customer;
import Entity.Employees;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SmileMint
 */
public class CustomerDAO  extends ConnectDB{
     Connection conn = null;
    PreparedStatement state = null;
    ResultSet rs = null;


    public List<Customer> getAllCustomer() {
        try {
            String query = "select * from Customer";
            conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
            List<Customer> list = new ArrayList<>();
            while (rs.next()) {
               Customer a = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
                list.add(a);                  
            }
            return list;
        } catch (Exception e) {
        }
        return null; 
    }
    public void UpdateCustomer(String id, String pdname, String pdAdress, String Phone, String img, String username, String Gmail) {
        String query = "update Customer set customerName = ?,\n"
                + "address = ?,\n"
                + "phone = ?,\n"
                + "img = ?,\n"
                + "username = ?,\n"
                + "email = ?\n"
                + "where customerID = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(query);
            state.setString(7, id);
            state.setString(1, pdname);
            state.setString(2, pdAdress);
            state.setString(3, Phone);
            state.setString(4, img);
            state.setString(5, username);
            state.setString(6, Gmail);          
            state.executeUpdate();
        } catch (Exception e) {
        }
    }
    
     public Customer getCustomerByID(String b) {
        try {
            String query = "select * from Customer where customerID =?";
            conn = getConnection();
            state = conn.prepareStatement(query);
            state.setString(1, b);
            rs = state.executeQuery();

            while (rs.next()) {
               Customer a = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
                return a;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    
        public int countCustomer() {
            int n=0;
        String sql = "SELECT COUNT(*) FROM Customer";
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
    public List<String> getAllNameCustomer() {
        try {
            String query = "select customerName from Customer";
            conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
            List<String> list = new ArrayList<>();
            while (rs.next()) {
                String a = rs.getString(1).trim();
                list.add(a);                  
            }
            return list;
        } catch (Exception e) {
        }
        return null; 
    }
    public int getCustomerbyid(String name) {
        int a=0;
        try {
            String query = "select [customerID] from Customer where [customerName]='"+name+"'";
             conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
            List<String> list = new ArrayList<>();
            while (rs.next()) {
                 a = rs.getInt(1);
                            
            }
            return a;
        } catch (Exception e) {
        }
        return a; 
    }
      public Customer getCustomerbyid2(String username) {
        Customer a=null;
        try {
            String query = "select * from Customer where [username]='"+username+"'";
             conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
            List<String> list = new ArrayList<>();
            while (rs.next()) {
                 a = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
                            
            }
            return a;
        } catch (Exception e) {
        }
        return a; 
    }
       public int  insertCustomer(String pdname, String pdAdress, String Phone,String img, String username, String Gmail) {
           int n=0;
        String query = "insert into Customer  ( [customerName]\n" +
"      ,[address]\n" +
"      ,[phone]\n" +
"      ,[img]\n" +
"      ,[username]\n" +
"      ,[email] )  values(?,?,?,?,?,?)";
        try {
          conn = getConnection();
            state = conn.prepareStatement(query);
  
             state.setString(1, pdname);
            state.setString(2, pdAdress);
            state.setString(3, Phone);
            state.setString(4, img);
            state.setString(5, username);
            state.setString(6, Gmail);   
            n=state.executeUpdate();
        } catch (Exception e) {
        }
        
        return n;
    }
       public int  insertCustomer2(String pdname, String pdAdress, String Phone, String username, String Gmail) {
           int n=0;
        String query = "insert into Customer  ( [customerName]\n" +
"      ,[address]\n" +
"      ,[phone]\n" +
"      ,[username]\n" +
"      ,[email] )  values(?,?,?,?,?)";
        try {
          conn = getConnection();
            state = conn.prepareStatement(query);
  
             state.setString(1, pdname);
            state.setString(2, pdAdress);
            state.setString(3, Phone);
            state.setString(4, username);
        
            state.setString(5, Gmail);   
            n=state.executeUpdate();
        } catch (Exception e) {
        }
        
        return n;
    }
        public void UpdateCustomer(String id, String pdname, String pdAdress, String Phone, String img, String username,String pass, String Gmail) {
        String query = "update Customer set customerName = ?,\n"
                + "address = ?,\n"
                + "phone = ?,\n"
                + "img = ?,\n"
                + "details = ?,\n"
                + "email = ?\n"
                + "where customerID = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(query);
            state.setString(7, id);
            state.setString(1, pdname);
            state.setString(2, pdAdress);
            state.setString(3, Phone);
            state.setString(4, img);
            state.setString(5, username);
            state.setString(6, pass);
            state.setString(7, Gmail);          
            state.executeUpdate();
        } catch (Exception e) {
        }
    }
//    public static void main(String[] args) {
//        CustomerDAO dao=new CustomerDAO();
//        dao.UpdateCustomer("4","Bui Tien Cuong", "Ha Phuong, Thang Thuy, Vinh Bao, Hai Phong", "0382011918", "https://toanthaydinh.com/wp-content/uploads/2020/04/anh-hoc-sinh-cap-3-dep-29-1.jpg","nguoi o dau dau","dsdjf@gmail.com");
//    }
        public int DeleteCustomer(int id) {
            int n=0;
        try {
            String query = "delete from Customer where customerID = ?";
          conn = getConnection();
            state = conn.prepareStatement(query);
            state.setInt(1, id);
            n=state.executeUpdate();
           
        } catch (Exception e) {
        }
         return n;
        }
         public List<Customer> Search(String name) {
        try {
            String query = "select * from Customer where customerName like   "+"'%"+ name+"%'";
           conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
//            state.setString(1,"'%"+ name+"%'");
               rs = state.executeQuery();
            List<Customer> list = new ArrayList<>();
            while (rs.next()) {
                 Customer a = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
    public static void main(String[] args) {
        CustomerDAO dao = new CustomerDAO();
//        List<Customer> list = dao.Search("a");
//        for (Customer customer : list) {
//            System.out.println(customer);
//            
//        }
//System.out.println(dao.insertCustomer("ok", "ok", "0965443454", "ok323", "ok32332", "ok32332"));
System.out.println(dao.DeleteCustomer(30));
   }

}