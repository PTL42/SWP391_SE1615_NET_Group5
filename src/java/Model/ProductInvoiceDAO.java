 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Cart;
import Entity.Product;
import Entity.ProductInvoice;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author SmileMint
 */
public class ProductInvoiceDAO extends ConnectDB{

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
                ProductInvoice a = new ProductInvoice(rs.getInt(1), rs.getInt(2), rs.getInt(3),rs.getDouble(4));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public int CountProductSale() {
        int n=0;
        try {
            String query = "SELECT	Count (DISTINCT\n"
                    + "      [productID])\n"
                    + "  FROM [Product_Invoice]";
            conn = new ConnectDB().conn;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
         
            while (rs.next()) {
              n=rs.getInt(1);
            }
            return n;
        } catch (Exception e) {
        }
        return n;
    }
    public int insertProducttoInvoice(int orderid, Map<Integer, Cart> cart) {
        int n=0;
       
            String sql = "INSERT INTO [dbo].[Product_Invoice]\n" +
"           ([quantity]\n" +
"           ,[invoiceID]\n" +
"           ,[productID]\n" +
"           ,[price])\n" +
"     VALUES\n" +
"           (?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?)";
         try {
            
             
             PreparedStatement pre =conn.prepareStatement(sql);
                pre.setInt(2, orderid);
             for (Map.Entry<Integer, Cart> entry : cart.entrySet()) {
                 Integer id = entry.getKey();
                 Cart cart1 = entry.getValue();
                 pre.setInt(1, cart1.getQuantity());
                 pre.setInt(3, cart1.getProduct().getProductID());
                 pre.setDouble(4, cart1.getProduct().getPrice());
               n=pre.executeUpdate();
             }
           
            
      
           
        } catch (SQLException ex) {
        ex.printStackTrace();
        }
        return n;
    }
    
    public static void main(String[] args) {
        ProductInvoiceDAO dao = new ProductInvoiceDAO();
//        List<ProductInvoice> list = dao.getAllProductInvoice();
//        for (ProductInvoice customer : list) {
//            System.out.println(customer);
//            
//        }
//         int n=dao.insertProducttoInvoice(2, cart)

    }

}
