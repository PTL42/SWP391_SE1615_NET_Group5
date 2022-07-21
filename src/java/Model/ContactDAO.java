/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.ContactUs;
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
public class ContactDAO extends ConnectDB{
        Connection conn = null;
    PreparedStatement state = null;
    ResultSet rs = null;

    public List<ContactUs> getAllContact() {
        String sql = "SELECT [ContactID] "
                + ",[Name]\n" +
"      ,[Email]\n" +
"      ,[Phone]\n" +
"      ,[Message]\n" +
"      ,[status]\n" +
"  FROM [ShopManagement3].[dbo].[ContactUs]";
         List<ContactUs> vector = new ArrayList<ContactUs>();
        try {

           conn = getConnection();
            state = conn.prepareStatement(sql);
          
            rs = state.executeQuery();
//            ResultSet rs=getData(sql);
            while (rs.next()) {
                  int id= rs.getInt(1);
                String name = rs.getString(2);
                String email = rs.getString(3);
                String phone = rs.getString(4);
                String mess = rs.getString(5);
                int status=rs.getInt(6);
               
              ContactUs  a = new ContactUs(id,name,email, phone, mess,status);
              vector.add(a);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closePrepareStatement(state);
            closeConnection(conn);
        }
        return vector;
    }
      public ContactUs getContactbyid(int id) {
        String sql = "SELECT [ContactID] "
                + ",[Name]\n" +
"      ,[Email]\n" +
"      ,[Phone]\n" +
"      ,[Message]\n" +
"      ,[status]\n" +
"  FROM [ShopManagement3].[dbo].[ContactUs] where ContactID= "+id;
         ContactUs  a =null;
        try {

           conn = getConnection();
            state = conn.prepareStatement(sql);
          
            rs = state.executeQuery();
//            ResultSet rs=getData(sql);
            while (rs.next()) {
                 int id2= rs.getInt(1);
                String name = rs.getString(2);
                String email = rs.getString(3);
                String phone = rs.getString(4);
                String mess = rs.getString(5);
                int status=rs.getInt(6);
               
             a = new ContactUs(id2,name,email, phone, mess,status);
        
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closePrepareStatement(state);
            closeConnection(conn);
        }
        return a;
    }
      public int UpdatestatusContact(int status,int id) {
        int n = 0;
        String sql = "UPDATE [dbo].[ContactUs]\n"
                + "   SET [status]= ? "
                + " WHERE ContactID=?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setInt(1, status);
            state.setInt(2, id);
      

            n = state.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
public int insertContactUs(ContactUs u){
        int n = 0;
        String sql = "INSERT INTO [dbo].[ContactUs]\n" +
"           ([Name]\n" +
"           ,[Email]\n" +
"           ,[Phone]\n" +
"           ,[Message]\n" +
"           ,[status])\n" +
"     VALUES\n" +
"           (?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?)";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, u.getName());
            state.setString(2, u.getEmail());
            state.setString(3, u.getPhone());
            state.setString(4, u.getMessage());
            state.setInt(5, 0);
            n =state.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
    public static void main(String[] args) {
        ContactDAO c=new ContactDAO();
        System.out.println(c.insertContactUs(new ContactUs("3", "2", "1", "ludz", 0)));
    }
}
