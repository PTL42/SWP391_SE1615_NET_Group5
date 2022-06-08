/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.CategoryDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import DAO.DBUitils;

/**
 *
 * @author ADMIN
 */
public class CategoryDAO implements Serializable{
    
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
    
    public ArrayList<CategoryDTO> getAllCategory() throws SQLException, Exception {
        ArrayList<CategoryDTO> listCategory = new ArrayList<>();
        String sql = "SELECT CategoryId, TypeCategory FROM Category";
        try {
            conn = DBUitils.implementConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                CategoryDTO cate = new CategoryDTO();
                cate.setCategoryId(rs.getInt("CategoryId"));
                cate.setTypeCategory(rs.getString("TypeCategory"));
                listCategory.add(cate);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return listCategory;
    }
}
