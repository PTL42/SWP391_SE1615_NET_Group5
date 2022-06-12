/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;


import Entity.ProductInvoice;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SmileMint
 */
public class ProductInvoiceDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<ProductInvoice> getAllProductInvoice() {
        try {
            String query = "select * from Product_Invoice";
            conn = new ConnectDB().conn;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            List<ProductInvoice> list = new ArrayList<>();
            while (rs.next()) {
                ProductInvoice a = new ProductInvoice(rs.getInt(1),rs.getInt(2),rs.getInt(3));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null; 
    }
//    public static void main(String[] args) {
//        ProductInvoiceDAO dao = new ProductInvoiceDAO();
//        List<ProductInvoice> list = dao.getAllProductInvoice();
//        for (ProductInvoice customer : list) {
//            System.out.println(customer);
//            
//        }
//    }
    
}
