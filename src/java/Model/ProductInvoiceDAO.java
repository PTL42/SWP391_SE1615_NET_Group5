/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Cart;
import Entity.History;
import Entity.OrderDTO;
import Entity.OrderDetailsDTO;
import Entity.Product;
import Entity.ProductInvoice;
import java.sql.Connection;
import java.sql.Date;
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
public class ProductInvoiceDAO extends ConnectDB {

    Connection conn = null;
    PreparedStatement state = null;
    ResultSet rs = null;

    public List<ProductInvoice> getAllProductInvoice() {
        try {
            String query = "select * from Product_Invoice";
            conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
            List<ProductInvoice> list = new ArrayList<>();
            while (rs.next()) {
                ProductInvoice a = new ProductInvoice(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDouble(4));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public int CountProductSale() {
        int n = 0;
        try {
            String query = "SELECT	Count (DISTINCT\n"
                    + "      [productID])\n"
                    + "  FROM [Product_Invoice]";
            conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();

            while (rs.next()) {
                n = rs.getInt(1);
            }
            return n;
        } catch (Exception e) {
        }
        return n;
    }

    public ArrayList<History> getOrderHistory(int cusid, String fromDate, String toDate, String productName) {
        ArrayList<History> listOrder = new ArrayList<>();
        String sql = "select p.invoiceID,pro.productName,pr.price,pr.quantity,p.createdDate,pro.img ,d.[status] from  Invoice p \n"
                + "INNER JOIN Product_Invoice pr  on pr.invoiceID=p.invoiceID\n"
                + "INNER JOIN Delivery d on  d.invoiceId=p.invoiceID\n"
                + "INNER JOIN Product pro on  pro.productID=pr.productID\n"
                + " where \n"
                + " d.invoiceId=p.invoiceID and "
                +  " p.customerID="+cusid;

        if (fromDate != null && !fromDate.equals("")) {
            sql += " and p.createdDate>='" + fromDate + "'";
        }
        if (toDate != null && !toDate.equals("")) {
            sql += " and p.createdDate<= '" + toDate + "'";
        }
        if (productName != null && !productName.equals("")) {
            sql += " and pro.productName like  '%" + productName + "%'";
        }
        sql += " ORDER BY p.invoiceID DESC";
        System.out.println(sql);
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();

            while (rs.next()) {
              int id=rs.getInt(1);
              String name=rs.getString(2);
              double price=rs.getDouble(3);
              int quantity=rs.getInt(4);
              Date d=rs.getDate(5);
              String img=rs.getString(6);
              String status=rs.getString(7);
              History h=new History(id, name, price, quantity, d,img,status);
              listOrder.add(h);
            }
        } catch (Exception e) {
        } finally {
            closePrepareStatement(state);
            closeConnection(conn);
        }
        return listOrder;
    }

    public int insertProducttoInvoice(int orderid, Map<Integer, Cart> cart) {
        int n = 0;

        String sql = "INSERT INTO [dbo].[Product_Invoice]\n"
                + "           ([quantity]\n"
                + "           ,[invoiceID]\n"
                + "           ,[productID]\n"
                + "           ,[price])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {

            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setInt(2, orderid);
            for (Map.Entry<Integer, Cart> entry : cart.entrySet()) {
                Integer id = entry.getKey();
                Cart cart1 = entry.getValue();
//                 state.setInt(1, cart1.getQuantity());
//                 state.setInt(3, cart1.getProduct().getProductID());
//                 state.setDouble(4, cart1.getProduct().getPrice());
                n = state.executeUpdate();
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
    ArrayList<History> listOrder = new ArrayList<>();

                    listOrder = dao.getOrderHistory(2, "", "", "");
        for (History history : listOrder) {
            System.out.println(history);
        }
    }

}
