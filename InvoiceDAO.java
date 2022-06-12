/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Invoice;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SmileMint
 */
public class InvoiceDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Invoice> getAllInvoice() {
        try {
            String query = "select * from Invoice";
            conn = new ConnectDB().conn;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            List<Invoice> list = new ArrayList<>();
            while (rs.next()) {
                Invoice a = new Invoice(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4));
                list.add(a);

            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<Invoice> getInvoicebyInvoiceID(String txtSearch) {
        try {
            String query = "select * from Invoice \n"
                    + "where invoiceID = ?";
            conn = new ConnectDB().conn;
            ps = conn.prepareStatement(query);
            ps.setString(1, txtSearch);
            rs = ps.executeQuery();
            List<Invoice> list = new ArrayList<>();
            while (rs.next()) {
                Invoice a = new Invoice(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4));
                list.add(a);

            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
//    public static void main(String[] args) {
//        InvoiceDAO dao = new InvoiceDAO();
//        List<Invoice> list = dao.getAllInvoice();
//        for (Invoice c : list) {
//            System.out.println(c);
//        }
//    }
    

}
