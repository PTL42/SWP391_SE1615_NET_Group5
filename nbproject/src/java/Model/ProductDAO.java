/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SmileMint
 */
public class ProductDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getAllProduct() {
        try {
            String query = "select * from Product";
            conn = new ConnectDB().conn;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product a = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3),
                                          rs.getFloat(4),rs.getFloat(5),rs.getString(6),rs.getString(7),rs.getInt(8),rs.getString(9));
                list.add(a);                  
            }
            return list;
        } catch (Exception e) {
        }
        return null; 
    }
    public Product getProductbyID(int id) {
        Product a=null;
        try {
            String query = "select * from Product where [productID]="+id;
            conn = new ConnectDB().conn;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
//            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                 a = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3),
                                          rs.getFloat(4),rs.getFloat(5),rs.getString(6),rs.getString(7),rs.getInt(8),rs.getString(9));
//                list.add(a);                  
            }
            return a;
        } catch (Exception e) {
        }
        return a; 
    }
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        List<Product> list = dao.getAllProduct();
        for (Product customer : list) {
            System.out.println(customer);
            
        }
    }
}
