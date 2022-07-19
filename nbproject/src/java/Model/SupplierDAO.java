/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Supplier;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SmileMint
 */
public class SupplierDAO extends ConnectDB{
    Connection conn = null;
    PreparedStatement state = null;
    ResultSet rs = null;

    public List<Supplier> getAllSupplier() {
        try {
            String query = "select * from Supplier";
               conn = getConnection();
            state = conn.prepareStatement(query);
          
            rs = state.executeQuery();
            List<Supplier> list = new ArrayList<>();
            while (rs.next()) {
                Supplier a = new Supplier(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                list.add(a);

            }
            return list;
        } catch (Exception e) {
        }
        return null; 
    }
//        public static void main(String[] args) {
//        SupplierDAO dao = new SupplierDAO();
//        List<Supplier> list = dao.getAllSupplier();
//        for (Supplier c : list) {
//            System.out.println(c);
//        }
//    }
}
