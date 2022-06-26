/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Cart;
import Entity.ProductInvoice;
import Entity.ProductSaleToday;
import com.sun.org.apache.bcel.internal.generic.AALOAD;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class ProductInvoice2DAO extends ConnectDB{
     public int insertProducttoInvoice(int orderid, Map<Integer, Cart> cart) {
        int n=0;
       
            String sql = "INSERT INTO [dbo].[Product_Invoice]\n" +
"           ([invoiceID]\n" +
"           ,[quantity]\n" +
"           ,[productID]\n" +
"           ,[price])\n" +
"     VALUES\n" +
"           (?\n" +
"           ,?\n" +
"           ,?\n" +
"           ,?)";
         try {
            
             
             PreparedStatement pre =conn.prepareStatement(sql);
                pre.setInt(1, orderid);
             for (Map.Entry<Integer, Cart> entry : cart.entrySet()) {
                 Integer id = entry.getKey();
                 Cart cart1 = entry.getValue();
                 pre.setInt(2, cart1.getQuantity());
                 pre.setInt(3, cart1.getProduct().getProductID());
                 pre.setDouble(4, cart1.getProduct().getPrice());
                n=pre.executeUpdate();
             }
          
            
      
           
        } catch (SQLException ex) {
        ex.printStackTrace();
        }
        return n;
    }
 public List<ProductInvoice> gettotalweek(int id) {
        String sql = "SELECT [quantity]\n" +
"      ,[price]\n" +
"  FROM [ShopManagement3].[dbo].[Product_Invoice] p ,Invoice i where i.invoiceID=p.invoiceID and i.invoiceID="+id;
        List<ProductInvoice> list=new ArrayList<ProductInvoice>();
        try {
//            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
//                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = getData(sql);
//            ResultSet rs=getData(sql);
            while (rs.next()) {
                // rs.getDataType(fieldName|index=1);
               int quatity =rs.getInt(1);
               double price=rs.getDouble(2);
                 
	
              ProductInvoice   pro= new ProductInvoice(quatity,price);
//                System.out.println(cus);
              list.add(pro);
            }
            

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }
 public Double gettotalweek2(int id) {
     Double a=0.0;
        String sql = "SELECT sum([quantity]*[price])\n" +
"  FROM [ShopManagement3].[dbo].[Product_Invoice] p ,Invoice i where i.invoiceID=p.invoiceID and i.invoiceID="+id;
        try {
//            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
//                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = getData(sql);
//            ResultSet rs=getData(sql);
            while (rs.next()) {
                // rs.getDataType(fieldName|index=1);
            
              a =rs.getDouble(1);

//                System.out.println(cus);
            }
            

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return a;
    }
     public static void main(String[] args) {
        ProductInvoice2DAO dao2=new ProductInvoice2DAO();
//        Map<Integer,Cart> cart=new Map<Integer, Cart>();
//        cart.put(1, Cart.builder().product(pro).quantity(1).build())
//        int n=dao2.insertProducttoInvoice(23, cart)
    }
}
