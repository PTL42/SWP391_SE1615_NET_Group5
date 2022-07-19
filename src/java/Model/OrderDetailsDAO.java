/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.OrderDetailsDTO;
import Uitilis.DBUitils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author duong
 */
public class OrderDetailsDAO extends ConnectDB implements Serializable {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    public void closeConnection() throws SQLException {
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

    public boolean insertOrderDetail(OrderDetailsDTO orderDetailDTO) throws SQLException {
        boolean isSuccess = false;
        String sql = "INSERT INTO tblOrderDetails "
                + "(order_id, product_id, quantity, unit_price, status, full_name, phone_number, address, type_shipping)"
                + " VALUES(?,?,?,?,?,?,?,?,?)";
        try {
            conn = getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, orderDetailDTO.getOrderId());
            preStm.setInt(2, orderDetailDTO.getProductId());
            preStm.setInt(3, orderDetailDTO.getQuantity());
            preStm.setFloat(4, orderDetailDTO.getUnitPrice());
            preStm.setBoolean(5, Boolean.TRUE);
            preStm.setString(6, orderDetailDTO.getFullName());
            preStm.setString(7, orderDetailDTO.getPhoneNumber());
            preStm.setString(8, orderDetailDTO.getAddress());
            preStm.setString(9, orderDetailDTO.getTypeShipping());
            if (preStm.executeUpdate() > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return isSuccess;
    }

    public OrderDetailsDTO getOrderDetailsByID(int orderDetailId) throws SQLException {
        OrderDetailsDTO orderDetails = new OrderDetailsDTO();
        String sql = "SELECT od.full_name, od.address, od.phone_number, od.type_shipping, od.quantity,"
                + " o.total_price, ct.type_category, p.product_image, o.order_date FROM tblOrderDetails od"
                + " INNER JOIN tblOrder o ON o.order_id = od.order_id"
                + " INNER JOIN tblProduct p ON od.product_id = p.product_id"
                + " INNER JOIN tblCategory ct ON ct.category_id = p.category_id"
                + " INNER JOIN tblUser u ON u.user_id = o.user_id"
                + " WHERE order_details_id = ?";
        try {
            conn = getConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, orderDetailId);
            rs = preStm.executeQuery();
            if (rs.next()) {
                orderDetails.setFullName(rs.getString("full_name"));
                orderDetails.setAddress(rs.getString("address"));
                orderDetails.setPhoneNumber(rs.getString("phone_number"));
                orderDetails.setTypeShipping(rs.getString("type_shipping"));
                orderDetails.setQuantity(rs.getInt("quantity"));
                orderDetails.setUnitPrice(rs.getFloat("total_price"));
                orderDetails.setTypeCategory(rs.getString("type_category"));
                orderDetails.setProductImage(rs.getString("product_image"));
                orderDetails.setOrderDate(rs.getDate("order_date").toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return orderDetails;
    }
}
