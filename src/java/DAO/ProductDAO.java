/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.CategoryDTO;
import Model.DiscountDTO;
import dtos.ProductDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import uitils.DBUitils;

/**
 *
 * @author ADMIN
 */
public class ProductDAO implements Serializable {

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

    public ArrayList<ProductDTO> getProductByParam(String productName, Integer categoryID) throws Exception {
        ArrayList<ProductDTO> listProduct = new ArrayList<>();
        String sql = "SELECT p.ProductId, p.ProductName, p.Description, p.SalePrice, p.ImportPrice,"
                + " p.Quantity, p.Status, p.ImportDate, p.CategoryId, p.ProductImage, ct.TypeCategory"
                + " FROM Product p"
                + " INNER JOIN Category ct"
                + " ON p.CategoryId = ct.categoryID"
                + " WHERE"
                + " p.Quantity >= 0 and p.ProductName LIKE ?";
        if (categoryID > 0) {
            sql += " and ct.categoryID = " + categoryID;
        }
        sql += " and p.Status = '"+Boolean.TRUE+"' Order by p.ImportDate DESC";
        try {
            conn = DBUitils.implementConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + productName + "%");
            rs = preStm.executeQuery();
            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setProductId(rs.getInt("ProductId"));
                product.setProductName(rs.getString("ProductName"));
                product.setDescription(rs.getString("Description"));
                product.setSalePrice(rs.getFloat("SalePrice"));
                product.setImportPrice(rs.getFloat("ImportPrice"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setStatus(rs.getBoolean("Status"));
                product.setImportDate(rs.getDate("ImportDate").toString());
                product.setProductImage(rs.getString("ProductImage"));

                CategoryDTO categorys = new CategoryDTO();
                categorys.setCategoryId(rs.getInt("CategoryId"));
                categorys.setTypeCategory(rs.getString("TypeCategory"));
                product.setCategory(categorys);

                listProduct.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return listProduct;
    }

    public Boolean insertProduct(ProductDTO product) throws Exception {
        boolean isSuccess = false;
        String sql = "INSERT INTO Product"
                + " (ProductName, Description, SalePrice, ImportPrice, Quantity,"
                + " Status, ImportDate, CategoryId, ProductImage)"
                + " VALUES (?,?,?,?,?,?,?,?,?)";
        try {
            conn = DBUitils.implementConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, product.getProductName());
            preStm.setString(2, product.getDescription());
            preStm.setFloat(3, product.getSalePrice());
            preStm.setFloat(4, product.getImportPrice());
            preStm.setInt(5, product.getQuantity());
            preStm.setBoolean(6, Boolean.TRUE);
            preStm.setTimestamp(7, java.sql.Timestamp.valueOf(product.getImportDate()));
            preStm.setInt(8, product.getCategoryId());
            preStm.setString(9, product.getProductImage());
            preStm.executeUpdate();
            isSuccess = true;
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return isSuccess;

    }

    public ProductDTO getProductByID(int productID) throws Exception {
        ProductDTO product = new ProductDTO();
        CategoryDTO category = new CategoryDTO();
        String sql = "SELECT p.ProductId, p.ProductName, p.Description, p.SalePrice, p.ImportPrice, p.Quantity,"
                + " p.Status, p.ImportDate, p.ProductImage, p.CategoryId, ct.TypeCategory"
                + " FROM Product p"
                + " INNER JOIN Category ct ON p.CategoryId = ct.categoryID"
                + " WHERE p.ProductId = ?";
        try {
            conn = DBUitils.implementConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, productID);
            rs = preStm.executeQuery();
            if (rs.next()) {
                product.setProductId(rs.getInt("ProductId"));
                product.setProductName(rs.getString("ProductName"));
                product.setDescription(rs.getString("Description"));
                product.setSalePrice(rs.getFloat("SalePrice"));
                product.setImportPrice(rs.getFloat("ImportPrice"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setStatus(rs.getBoolean("Status"));
                product.setImportDate(rs.getDate("ImportDate").toString());
                product.setProductImage(rs.getString("ProductImage"));

                category.setCategoryId(rs.getInt("CategoryId"));
                category.setTypeCategory(rs.getString("TypeCategory"));
                product.setCategory(category);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return product;
    }

    public Boolean updateProduct(ProductDTO product) throws Exception {
        Boolean isSuccess = false;
        String sql = "UPDATE Product set ProductName = ?, Description = ?, SalePrice = ?, ImportPrice = ?,"
                + " Quantity = ?, Status = ?, ImportDate = ?, ProductImage = ?, CategoryId = ?"
                + " WHERE productId = ?";
        try {
            conn = DBUitils.implementConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, product.getProductName());
            preStm.setString(2, product.getDescription());
            preStm.setFloat(3, product.getSalePrice());
            preStm.setFloat(4, product.getImportPrice());
            preStm.setInt(5, product.getQuantity());
            preStm.setBoolean(6, product.getStatus());
            preStm.setString(7, product.getImportDate());
            preStm.setString(8, product.getProductImage());
            preStm.setInt(9, product.getCategoryId());
            preStm.setInt(10, product.getProductId());

            if (preStm.executeUpdate() > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return isSuccess;
    }

    public Boolean deleteProduct(int productId) throws Exception {
        Boolean isSuccess = false;
        String sql = "UPDATE Product set Status = ? WHERE productId = ?";
        try {
            conn = DBUitils.implementConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setBoolean(1, Boolean.FALSE);
            preStm.setInt(2, productId);

            if (preStm.executeUpdate() > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return isSuccess;
    }
}
