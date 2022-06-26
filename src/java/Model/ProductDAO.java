/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;


import Entity.CategoryDTO;
import Entity.ProductDTO;
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
        String sql = "SELECT p.product_id, p.product_name, p.description, p.sale_price, p.import_price,"
                + " p.quantity, p.status, p.import_date, p.category_id, p.product_image, ct.type_category"
                + " FROM tblProduct p"
                + " INNER JOIN tblCategory ct"
                + " ON p.category_id = ct.category_id"
                + " WHERE"
                + " p.quantity >= 0 and p.product_name LIKE ?";
        if (categoryID > 0) {
            sql += " and ct.category_id = " + categoryID;
        }
        sql += " and p.status = '"+Boolean.TRUE+"' Order by p.import_date DESC";
        try {
            conn = DBUitils.implementConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + productName + "%");
            rs = preStm.executeQuery();
            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setDescription(rs.getString("description"));
                product.setSalePrice(rs.getFloat("sale_price"));
                product.setImportPrice(rs.getFloat("import_price"));
                product.setQuantity(rs.getInt("quantity"));
                product.setStatus(rs.getBoolean("status"));
                product.setImportDate(rs.getDate("import_date").toString());
                product.setProductImage(rs.getString("product_image"));

                CategoryDTO categorys = new CategoryDTO();
                categorys.setCategoryId(rs.getInt("category_id"));
                categorys.setTypeCategory(rs.getString("type_category"));
                product.setCategory(categorys);

                listProduct.add(product);
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return listProduct;
    }

    public Boolean insertProduct(ProductDTO product) throws Exception {
        boolean isSuccess = false;
        String sql = "INSERT INTO tblProduct"
                + " (product_name, description, sale_price, import_price, quantity,"
                + " status, import_date, category_id, product_image)"
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
        String sql = "SELECT p.product_id, p.product_name, p.description, p.sale_price, p.import_price, p.quantity,"
                + " p.status, p.import_date, p.product_image, p.category_id, ct.type_category"
                + " FROM tblProduct p"
                + " INNER JOIN tblCategory ct ON p.category_id = ct.category_id"
                + " WHERE p.product_id = ?";
        try {
            conn = DBUitils.implementConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, productID);
            rs = preStm.executeQuery();
            if (rs.next()) {
                product.setProductId(rs.getInt("product_id"));
                product.setProductName(rs.getString("product_name"));
                product.setDescription(rs.getString("description"));
                product.setSalePrice(rs.getFloat("sale_price"));
                product.setImportPrice(rs.getFloat("import_price"));
                product.setQuantity(rs.getInt("quantity"));
                product.setStatus(rs.getBoolean("status"));
                product.setImportDate(rs.getDate("import_date").toString());
                product.setProductImage(rs.getString("product_image"));

                category.setCategoryId(rs.getInt("category_id"));
                category.setTypeCategory(rs.getString("type_category"));
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
        String sql = "UPDATE tblProduct set product_name = ?, description = ?, sale_price = ?, import_price = ?,"
                + " Quantity = ?, import_date = ?, product_image = ?, category_id = ?"
                + " WHERE product_id = ?";
        try {
            conn = DBUitils.implementConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, product.getProductName());
            preStm.setString(2, product.getDescription());
            preStm.setFloat(3, product.getSalePrice());
            preStm.setFloat(4, product.getImportPrice());
            preStm.setInt(5, product.getQuantity());
            preStm.setString(6, product.getImportDate());
            preStm.setString(7, product.getProductImage());
            preStm.setInt(8, product.getCategoryId());
            preStm.setInt(9, product.getProductId());

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
        String sql = "UPDATE tblProduct set status = ? WHERE product_id = ?";
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
    
    
    public int getQuantity(int productID) throws Exception {
        int quantity = 0;
        String sql = "SELECT quantity FROM tblProduct WHERE product_id = ?";
        try {
            conn = DBUitils.implementConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, productID);
            rs = preStm.executeQuery();
            while (rs.next()) {
                quantity = rs.getInt("quantity");
            }
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
        return quantity;
    }
    
    public void subQuantity(int productId, int subQuantity) throws Exception {
        String sql = "UPDATE tblProduct SET quantity = quantity - ? where product_id = ?";
        try {
            conn = DBUitils.implementConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, subQuantity);
            preStm.setInt(2, productId);
            preStm.executeUpdate();
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
    }
}
