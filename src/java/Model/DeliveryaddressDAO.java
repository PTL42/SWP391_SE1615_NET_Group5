/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.ContactUs;
import Entity.Customer;
import Entity.Delivery;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class DeliveryaddressDAO extends ConnectDB{
       Connection conn = null;
    PreparedStatement state = null;
    ResultSet rs = null;


    public List<Delivery> getAllDelivery() {
        try {
            String query = "select * from Delivery ";
            conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
            List<Delivery> list = new ArrayList<>();
            while (rs.next()) {
               Delivery a = new Delivery(rs.getInt(1), rs.getInt(2), rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getString(7));
                list.add(a);                  
            }
            return list;
        } catch (Exception e) {
        }
        return null; 
    }
    
    
    public Delivery getDeliverybyinvoiceId(int id) {
        Delivery a =null;
        try {
            String query = "select * from Delivery where [invoiceId]="+id;
            conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
            List<Delivery> list = new ArrayList<>();
            while (rs.next()) {
                a = new Delivery(rs.getInt(1), rs.getInt(2), rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getString(7));
                             
            }
            return a;
        } catch (Exception e) {
        }
        return a; 
    }
    public int countDelivery() {
        int a =0;
        try {
            String query = "select COUNT(*) from Delivery";
            conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
            List<Delivery> list = new ArrayList<>();
            while (rs.next()) {
                a = rs.getInt(1);
                             
            }
            return a;
        } catch (Exception e) {
        }
        return a; 
    }
      public int insertDelivery(Delivery u, int invoiceId) {

        int n = 0;
        String sql = "INSERT INTO [dbo].[Delivery]\n" +
"           ([invoiceId]\n" +
"           ,[name]\n" +
"           ,[phone]\n" +
"           ,[address]\n" +
"           ,[shippid]\n" +
"           ,[status])\n" +
"     VALUES\n" +
"           (?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?)";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setInt(1,invoiceId);
            state.setString(2, u.getName());
            state.setString(3, u.getPhone());
            state.setString(4, u.getAddress());
            
            state.setInt(5, u.getShipperId());
            state.setString(6, u.getStatus());
            n =state.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
       public List<Delivery> Search(String name) {
        try {
            String query = "select * from Delivery where name like   "+"'%"+ name+"%'";
           conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
//            state.setString(1,"'%"+ name+"%'");
               rs = state.executeQuery();
            List<Delivery> list = new ArrayList<>();
            while (rs.next()) {
                Delivery a = new Delivery(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4),rs.getString(5),rs.getInt(6),rs.getString(7));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
      
      public int updateDeliverystates(String states, int id) {

        int n = 0;
        String sql = "UPDATE [dbo].[Delivery]\n" +
"   SET "+
"      [status] =?\n" +
" WHERE [deleveryId]=?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            
            state.setString(1, states);
             state.setInt(2,id);
            n =state.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
}
