/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SmileMint
 */
public class CustomerDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Customer> getAllCustomer() {
        try {
            String query = "select * from Customer";
            conn = new ConnectDB().conn;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            List<Customer> list = new ArrayList<>();
            while (rs.next()) {
                Customer a = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
                list.add(a);                  
            }
            return list;
        } catch (Exception e) {
        }
        return null; 
    }
    public List<String> getAllNameCustomer() {
        try {
            String query = "select customerName from Customer";
            conn = new ConnectDB().conn;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
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
            conn = new ConnectDB().conn;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            List<String> list = new ArrayList<>();
            while (rs.next()) {
                 a = rs.getInt(1);
                            
            }
            return a;
        } catch (Exception e) {
        }
        return a; 
    }
    public static void main(String[] args) {
        CustomerDAO dao = new CustomerDAO();
        List<String> list = dao.getAllNameCustomer();
        for (String customer : list) {
            System.out.println(customer);
            
        }
   }

}