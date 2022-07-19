/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Shippers;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ShippersDAO extends ConnectDB
{   Connection conn = null;
    PreparedStatement state = null;
    ResultSet rs = null;
      public int addShippers(Shippers ship){
        int n = 0;
        String sql = "insert into [Shippers](CompanyName,Address,Phone)" 
                +"values (?,?,?)";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, ship.getCompanyName());
            state.setString(2, ship.getAddress());
            state.setString(3, ship.getPhone());
            n =state.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
   public int updateShippers(Shippers ship){
        int n = 0;
        String sql = "update [Shippers] set CompanyName=? ,Phone=? where ShipperID=?" ;
        try {
           conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, ship.getCompanyName());
            state.setString(2, ship.getPhone());
            state.setInt(3, ship.getShipperID());
            n =state.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
    public int removeShipper(int id) {
        int n = 0;
        String sql = "delete from [Shippers] where ShipperID=" + id;
        // check foreign key constrain (if table is 1)
//        String check = "select * from Products"
//                + "where " + id + " in(select distinct " + id + " from [Order Details])";
        try {
              conn = getConnection();
            state = conn.prepareStatement(sql);
            n = state.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
    public List<Shippers> listAllShippers( ) {

        String sql = "select * from [Shippers]";
     List<Shippers> vector =new ArrayList<Shippers>();
        try {
               conn = getConnection();
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
            while (rs.next()) {
                int oID = rs.getInt("ShipperID");
                String CompanyName = rs.getString(2);
                String address = rs.getString(3);
                String Phone = rs.getString(4);
                

                Shippers o = new Shippers(oID, CompanyName,address, Phone);
                vector.add(o);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
         return vector;
    }
    public List<Shippers> searchnameShippers(String name ) {

        String sql = "select * from [Shippers] where [CompanyName] like'%"+name+"%'";
     List<Shippers> vector =new ArrayList<Shippers>();
        try {
               conn = getConnection();
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
            while (rs.next()) {
                int oID = rs.getInt("ShipperID");
                String CompanyName = rs.getString(2);
                String address = rs.getString(3);
                String Phone = rs.getString(4);
                

                Shippers o = new Shippers(oID, CompanyName,address, Phone);
                vector.add(o);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
         return vector;
    }
    public Shippers getIdByShippers(int id ) {
Shippers o=null;
        String sql = "select * from [Shippers] where ShipperID="+id;
          
        try {
               conn = getConnection();
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
            while (rs.next()) {
                int oID = rs.getInt("ShipperID");
                String CompanyName = rs.getString(2);
                String address = rs.getString(3);
                String Phone = rs.getString(4);
                

               o = new Shippers(oID, CompanyName,address, Phone);
               
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
         return o;
    }
    public static void main(String[] args) {
        ShippersDAO dao=new ShippersDAO();
//     List<Shippers> l=    dao.listAllShippers();
//        for (Shippers shippers : l) {
//            System.out.println(shippers);
//        }
           System.out.println(dao.removeShipper(6));
    }
    
}
