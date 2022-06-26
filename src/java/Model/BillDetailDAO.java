/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.BillDetail;
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
public class BillDetailDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<BillDetail> getBillDetail(String id) {
        try {
            String query = "select pt.productName,p.quantity,pt.price,p.quantity*pt.price from Product_Invoice p\n"
                    + "inner join Product pt ON p.productID=pt.productID\n"
                    + "where p.invoiceID=?";
            conn = new ConnectDB().conn;
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            List<BillDetail> list = new ArrayList<>();
            while (rs.next()) {
                BillDetail a = new BillDetail(rs.getString(1), rs.getInt(2), rs.getFloat(3),rs.getFloat(4));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
    public static void main(String[] args) {
        BillDetailDAO dao=new BillDetailDAO();
        List<BillDetail> list = new ArrayList<>();
        list = dao.getBillDetail("37");
        for (BillDetail o : list) {
            System.out.println(o);
        }
    }
}
