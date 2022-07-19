/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Category;
import Entity.CategoryDTO;
import Entity.Invoice;
import Entity.SizeDTO;
import Uitilis.DBUitils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SmileMint
 */
public class categoryDAO extends ConnectDB{
       
    Connection conn = null;
    PreparedStatement state = null;
    ResultSet rs = null;

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (state != null) {
            state.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
    
    public ArrayList<CategoryDTO> getAllCategorys() throws SQLException, Exception {
        ArrayList<CategoryDTO> listCategory = new ArrayList<>();
        String sql = "SELECT category_id, type_category FROM tblCategory";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
            while (rs.next()) {
                CategoryDTO cate = new CategoryDTO();
                cate.setCategoryId(rs.getInt("category_id"));
                cate.setTypeCategory(rs.getString("type_category"));
                listCategory.add(cate);
            }
        } catch (Exception e) {e.printStackTrace();
        } finally {
            closeConnection();
        }
        return listCategory;
    }
    public ArrayList<SizeDTO> getAllSizeById(int productId) throws SQLException, Exception {
        ArrayList<SizeDTO> listSize = new ArrayList<>();
        String sql = "SELECT size_product, size_id FROM tblProductSize WHERE product_id = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setInt(1, productId);
            rs = state.executeQuery();
            while (rs.next()) {
                SizeDTO size = new SizeDTO();
                size.setSizeProduct(rs.getInt("size_product"));
                size.setSizeId(rs.getInt("size_id"));
                listSize.add(size);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return listSize;
    }
    
    public List<Category> getAllCategory() {
        try {
            String query = "select * from Category";
            conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
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
    public static void main(String[] args) {
        categoryDAO dao = new categoryDAO();
        List<Category> list = dao.getAllCategory();
        for (Category c : list) {
            System.out.println(c);
        }
    }
}
