/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Define.DateUitils;
import Entity.OrderDTO;
import Entity.OrderDetailsDTO;
import Uitilis.DBUitils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author duong
 */
public class OrderDAO extends ConnectDB implements Serializable {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (preStm != null) {
            preStm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public ArrayList<OrderDTO> getOrderHistory(String user, String fromDate, String toDate, String productName) throws Exception {
        ArrayList<OrderDTO> listOrder = new ArrayList<>();
        String sql = "SELECT o.order_id, o.user_id, o.total_price, o.order_date, p.product_name,"
                + " p.product_image, ct.type_category,"
                + " od.order_details_id, od.product_id, od.quantity, od.unit_price, od.status, p.product_id"
                + " FROM tblOrder o"
                + " INNER JOIN tblOrderDetails od on o.order_id = od.order_id"
                + " INNER JOIN tblProduct p on od.product_id = p.product_id"
                + " INNER JOIN tblCategory ct on ct.category_id = p.category_id"
                + " INNER JOIN tblUser u on u.user_id = o.user_id"
                + " WHERE u.email = ?"
                + " AND od.status = ?";

        if (fromDate != null && !fromDate.equals("")) {
            sql += " AND o.order_date >= '" + fromDate + "'";
        }
        if (toDate != null && !toDate.equals("")) {
            sql += " AND o.order_date <= '" + toDate + "'";
        }
        if (productName != null || !productName.equals("")) {
            sql += " AND p.product_name LIKE '%" + productName + "%'";
        }
        sql += " ORDER BY o.order_id DESC";
        try {
            conn = getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, user);
            preStm.setBoolean(2, true);
            rs = preStm.executeQuery();

            int currentBookingID = 0;
            int currentIndex = -1;
            ArrayList<OrderDetailsDTO> listOrderDetail = new ArrayList<>();
            while (rs.next()) {

                int orderId = rs.getInt("order_id");
                float totalPrice = rs.getFloat("total_price");
                String orderDate = rs.getDate("order_date").toString();
                int userId = rs.getInt("user_id");

                OrderDetailsDTO orderDetail = new OrderDetailsDTO();
                orderDetail.setOrderDetailsId(rs.getInt("order_details_id"));
                orderDetail.setOrderId(orderId);
                orderDetail.setProductId(rs.getInt("product_id"));
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetail.setStatus(rs.getBoolean("status"));
                orderDetail.setUnitPrice(rs.getFloat("unit_price"));
                orderDetail.setProductName(rs.getString("product_name"));
                orderDetail.setTypeCategory(rs.getString("type_category"));
                orderDetail.setProductImage(rs.getString("product_image"));
                
                if (currentBookingID == 0 || currentBookingID != orderId) {
                    currentBookingID = orderId;

                    OrderDTO order = new OrderDTO();
                    order.setOrderId(orderId);
                    order.setUserId(userId);
                    order.setTotalPrice(totalPrice);
                    order.setOrderDate(orderDate);

                    listOrderDetail = new ArrayList<>();
                    listOrderDetail.add(orderDetail);

                    order.setOrderDetails(listOrderDetail);

                    listOrder.add(order);
                    currentIndex += 1;
                } else if (currentBookingID != 0 && currentBookingID == orderId) {
                    listOrderDetail.add(orderDetail);
                    listOrder.get(currentIndex).setOrderDetails(listOrderDetail);
                }
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return listOrder;
    }

    public Integer insertOrder(int idcus) {
        DateUitils dateUtils = new DateUitils();
        int idOrder = 0;
        String sql = "INSERT INTO [dbo].[Invoice]\n" +
"           ([createdDate]\n" +
"           ,[employeeID]\n" +
"           ,[customerID])"
                + " OUTPUT inserted.invoiceID values(?,?,?)";
        try {
            conn = getConnection();
            preStm = conn.prepareStatement(sql);
           
            preStm.setTimestamp(1, java.sql.Timestamp.valueOf(dateUtils.getCurrentDate()));
            
            preStm.setInt(1, 1);
            preStm.setInt(1, idcus);
            rs = preStm.executeQuery();
            if (rs.next()) {
                idOrder = rs.getInt("invoiceID");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return idOrder;
    }
//    
//    public String getMinDateHistory(String email) throws Exception {
//        String date = "";
//        String sql = "SELECT Min(order_date) FROM tblOrder o"
//                + " INNER JOIN tblUser u ON u.user_id = o.user_id WHERE u.email = ?";
//        try {
//            conn = getConnection();
//            preStm = conn.prepareStatement(sql);
//            preStm.setString(1, email);
//            rs = preStm.executeQuery();
//            if (rs.next()) {
//                date = rs.getDate("order_date").toString();
//            }
//        } catch (Exception e) {
//        } finally {
//            closeConnection();
//        }
//        return date;
//    }
//    
//    public String getMaxDateHistory(String email) throws Exception {
//        String date = "";
//        String sql = "SELECT Max(order_date) FROM tblOrder o"
//                + " INNER JOIN tblUser u ON u.user_id = o.user_id WHERE u.email = ?";
//        try {
//            conn = getConnection();
//            preStm = conn.prepareStatement(sql);
//            preStm.setString(1, email);
//            rs = preStm.executeQuery();
//            if (rs.next()) {
//                date = rs.getDate("order_date").toString();
//            }
//        } catch (Exception e) {
//        } finally {
//            closeConnection();
//        }
//        return date;
//    }
}
