/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Category;
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
public class categoryDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Category> getAllCategory() {
        try {
            String query = "select * from Category";
            conn = new ConnectDB().conn;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            List<Category> list = new ArrayList<>();
            while (rs.next()) {
                Category a = new Category(rs.getInt(1), rs.getString(2));
                list.add(a);

            }
            return list;
        } catch (Exception e) {
        }
        return null; 
    }
//    public static void main(String[] args) {
//        categoryDAO dao = new categoryDAO();
//        List<Category> list = dao.getAllCategory();
//        for (Category c : list) {
//            System.out.println(c);
//        }
//    }
}
