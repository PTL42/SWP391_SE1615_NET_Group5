/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Define.Define;
import Entity.CategoryDTO;
import Entity.Product;
import Entity.ProductDTO;
import Entity.ProductSaleToday;
import Uitilis.DBUitils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SmileMint
 */
public class ProductDAO extends ConnectDB{

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

    public List<Product> getAllProduct() {
        try {
            String query = "select * from Product";
          conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product a = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3),
                        rs.getFloat(4), rs.getFloat(5), rs.getString(6), rs.getString(7), rs.getInt(8));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
    public List<Product> getAllProductbycateidandname(int cate,String name) {
        try {
            String query = "SELECT *\n" +
"  FROM [ShopManagement3].[dbo].[Product] where categoryID="+cate+" and [productName] Like '%"+name+"%'";
            conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product a = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3),
                        rs.getFloat(4), rs.getFloat(5), rs.getString(6), rs.getString(7), rs.getInt(8));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
    public List<Product> getAllProductbycateidandname2(int cate ) {
        try {
            String query = "SELECT *\n" +
"  FROM [ShopManagement3].[dbo].[Product] where categoryID="+cate;
            conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product a = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3),
                        rs.getFloat(4), rs.getFloat(5), rs.getString(6), rs.getString(7), rs.getInt(8));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
    public List<Product> getAllProductbycateidandname(String name) {
        try {
            String query = "SELECT *\n" +
"  FROM [ShopManagement3].[dbo].[Product] where [productName] Like '%"+name+"%'";
           conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product a = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3),
                        rs.getFloat(4), rs.getFloat(5), rs.getString(6), rs.getString(7), rs.getInt(8));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<ProductSaleToday> getAllProductSaleToday(Date d) {
        try {
            String query = "  SELECT  p1.productName,\n"
                    + "SUM(p.quantity) FROM [Product_Invoice] p , Invoice i , Product p1 where p.invoiceID=i.invoiceID\n"
                    + " and p1.productID=p.productID \n"
                    + " and i.createdDate='" + d + "'  GROUP BY p1.productName;";
           conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
            List<ProductSaleToday> list = new ArrayList<>();
            while (rs.next()) {
                ProductSaleToday a = new ProductSaleToday(rs.getString(1), rs.getInt(2),
                        d);
                list.add(a);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<ProductSaleToday> getAllProductSaleSearchall() {
        try {
            String query = " SELECT  p1.productName,\n" +
"                    SUM(p.quantity) FROM [Product_Invoice] p , Invoice i , Product p1 where p.invoiceID=i.invoiceID\n" +
"                   and p1.productID=p.productID \n" +
"                      GROUP BY p1.productName";
           conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
            List<ProductSaleToday> list = new ArrayList<>();
            while (rs.next()) {
                ProductSaleToday a = new ProductSaleToday(rs.getString(1), rs.getInt(2)
                        );
                list.add(a);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    
    public List<ProductSaleToday> getAllProductSaleSearch(String before,String after) {
        try {
            String query = " SELECT  p1.productName,\n" +
"                    SUM(p.quantity) FROM [Product_Invoice] p , Invoice i , Product p1 where p.invoiceID=i.invoiceID\n" +
"                   and p1.productID=p.productID \n" +
"                     and i.createdDate BETWEEN CAST('"+before+"' AS DATE) AND CAST('"+after+"' AS DATE)   GROUP BY p1.productName";
           conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
            List<ProductSaleToday> list = new ArrayList<>();
            while (rs.next()) {
                ProductSaleToday a = new ProductSaleToday(rs.getString(1), rs.getInt(2)
                        );
                list.add(a);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<ProductSaleToday> getAllProductSaleToday2(Date d) {
        try {
            String query = " SELECT  \n"
                    + "SUM(p.quantity)\n"
                    + " FROM [Product_Invoice] p JOIN Invoice i ON p.invoiceID=i.invoiceID  and i.createdDate='2022-06-26' and p.productID=5";
           conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
            List<ProductSaleToday> list = new ArrayList<>();
            while (rs.next()) {
                ProductSaleToday a = new ProductSaleToday(rs.getString(1), rs.getFloat(2), rs.getInt(3),
                        rs.getInt(4), rs.getDate(5));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closeResultSet(rs);
            closePrepareStatement(state);
            closeConnection(conn);
        }
        return null;
    }

    public Product getProductbyID(int id) {
        Product a = null;
        try {
            String query = "select * from Product where [productID]=" + id;
           conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
//            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                a = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3),
                        rs.getFloat(4), rs.getFloat(5), rs.getString(6), rs.getString(7), rs.getInt(8));
//                list.add(a);                  
            }
            return a;
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closeResultSet(rs);
            closePrepareStatement(state);
            closeConnection(conn);
        }
        return a;
    }
 
    public Date creatdatenew() {
        Date a = null;
        try {
            String query = "SELECT TOP 1\n"
                    + "      [createdDate]\n"
                    + "    \n"
                    + "  FROM [ShopManagement3].[dbo].[Invoice] order by [invoiceID] desc";
            conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
//            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                a = rs.getDate(1);
//                list.add(a);                  
            }
            return a;
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closeResultSet(rs);
            closePrepareStatement(state);
            closeConnection(conn);
        }
        return a;
    }

    public int countProductSale(Date b) {
        int a = 0;
        try {
            String query = "SELECT COUNT(DISTINCT p.productID )\n"
                    + "  FROM [Invoice] i ,Product_Invoice p where i.invoiceID=p.invoiceID and i.createdDate='" + b + "'";
            conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
//            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                a = rs.getInt(1);
//                list.add(a);                  
            }
            return a;
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closeResultSet(rs);
            closePrepareStatement(state);
            closeConnection(conn);
        }
        return a;
    }

    public int SumProductSale(Date b) {
        int a = 0;
        try {
            String query = "SELECT sum(quantity )\n"
                    + "  FROM [Invoice] i ,Product_Invoice p where i.invoiceID=p.invoiceID and i.createdDate='" + b + "'";
            conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
//            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                a = rs.getInt(1);
//                list.add(a);                  
            }
            return a;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeResultSet(rs);
            closePrepareStatement(state);
            closeConnection(conn);
        }
        return a;
    }
    public int SumProductSaleMoth(int b,int year) {
        int a = 0;
        try {
            String query = "  SELECT sum(quantity )\n" +
" FROM [Invoice] i ,Product_Invoice p where i.invoiceID=p.invoiceID and MONTH(createdDate)= "+b+" and YEAR(createdDate)= "+year;
            conn = getConnection();
            state = conn.prepareStatement(query);
            rs = state.executeQuery();
//            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                a = rs.getInt(1);
//                list.add(a);                  
            }
            return a;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeResultSet(rs);
            closePrepareStatement(state);
            closeConnection(conn);
        }
        return a;
    }

    public int updateaddtocart(int quantity,int id) {
        int n = 0;
        String sqlPre = "UPDATE [dbo].[Product]\n"
                + "   SET [productQuantity] = ?\n"
                + "      WHERE [productID]=?";

        try {
            //System.out.println(sql);
//        create statement: execute sql
              conn = getConnection();
            state = conn.prepareStatement(sqlPre);

            state.setInt(1, quantity);
            state.setInt(2, id);
         

            //run
            n = state.executeUpdate();
//            System.out.println(sqlPre);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closePrepareStatement(state);
            closeConnection(conn);
        }

        return n;
    }

    
    
    public ArrayList<ProductDTO> getProductByParam(String productName, Integer categoryID) {
        ArrayList<ProductDTO> listProduct = new ArrayList<>();
        String sql = "  SELECT p.[productID], p.productName, p.[description], p.price, p.cost,\n" +
"                 p.productQuantity,p.categoryID,p.img\n" +
"                 FROM [Product] p\n" +
"                 INNER JOIN Category ct\n" +
"                 ON p.categoryID = ct.categoryID\n" +
"                WHERE\n" +
"                p.productQuantity >= 0 and p.productName LIKE ?";
        if (categoryID > 0) {
            sql += " and ct.categoryID = " + categoryID;
        }
//        sql += " and p.status = '"+Boolean.TRUE+"' Order by p.import_date DESC";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, "%" + productName + "%");
            rs = state.executeQuery();
            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setProductID(rs.getInt(1));
                product.setProductName(rs.getString(2));
                product.setDescription(rs.getString(3));
                product.setPrice(rs.getFloat(4));
                product.setCost(rs.getFloat(5));
                product.setProductQuantity(rs.getInt(6));
                product.setCategoryID(rs.getInt(7));
            
                product.setImg(rs.getString(8));

//                CategoryDTO categorys = new CategoryDTO();
//                categorys.setCategoryId(rs.getInt("category_id"));
//                categorys.setTypeCategory(rs.getString("type_category"));
//                product.setCategory(categorys);

                listProduct.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closePrepareStatement(state);
            closeConnection(conn);
        }
        return listProduct;
    }

//    public Boolean insertProduct(ProductDTO product) throws Exception {
//        boolean isSuccess = false;
//        String sql = "INSERT INTO tblProduct"
//                + " (product_name, description, sale_price, import_price, quantity,"
//                + " status, import_date, category_id, product_image)"
//                + " VALUES (?,?,?,?,?,?,?,?,?)";
//        try {
//            conn = getConnection();
//            state = conn.prepareStatement(sql);
//            state.setString(1, product.getProductName());
//            state.setString(2, product.getDescription());
//            state.setFloat(3, product.getSalePrice());
//            state.setFloat(4, product.getImportPrice());
//            state.setInt(5, product.getQuantity());
//            state.setBoolean(6, Boolean.TRUE);
//            state.setTimestamp(7, java.sql.Timestamp.valueOf(product.getImportDate()));
//            state.setInt(8, product.getCategoryId());
//            state.setString(9, product.getProductImage());
//            state.executeUpdate();
//            isSuccess = true;
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            closeConnection();
//        }
//        return isSuccess;
//
//    }
//
    public ProductDTO getProductByID(int productID){
        ProductDTO product = new ProductDTO();
        CategoryDTO category = new CategoryDTO();
        String sql = "SELECT p.[productID], p.productName, p.[description], p.price, p.cost,\n" +
"                 p.productQuantity,p.categoryID,p.img\n" +
"                 FROM [Product] p\n" +
"                 INNER JOIN Category ct\n" +
"                 ON p.categoryID = ct.categoryID\n" 
        
                + " WHERE p.productID = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setInt(1, productID);
            rs = state.executeQuery();
            if (rs.next()) {
                 product.setProductID(rs.getInt(1));
                product.setProductName(rs.getString(2));
                product.setDescription(rs.getString(3));
                product.setPrice(rs.getFloat(4));
                product.setCost(rs.getFloat(5));
                product.setProductQuantity(rs.getInt(6));
                product.setCategoryID(rs.getInt(7));
            
                product.setImg(rs.getString(8));
            }
        } catch (Exception e) {
        } finally {
           closePrepareStatement(state);
            closeConnection(conn);
        }
        return product;
    }
//
    public Boolean updateProduct(ProductDTO product)  {
        Boolean isSuccess = false;
        String sql = "UPDATE Product set productName = ?, [description] = ?, price = ?, cost = ?,"
                + " productQuantity = ?, img = ?, categoryID = ?"
                + " WHERE productID = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setString(1, product.getProductName());
            state.setString(2, product.getDescription());
            state.setFloat(3, product.getPrice());
            state.setFloat(4, product.getCost());
            state.setInt(5, product.getProductQuantity());
            state.setString(6, product.getImg());
            state.setInt(7, product.getCategoryID());
            state.setInt(8, product.getProductID());

            if (state.executeUpdate() > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
        } finally {
              closePrepareStatement(state);
            closeConnection(conn);
        }
        return isSuccess;
    }

    public Boolean deleteProduct(int productId) throws Exception {
        Boolean isSuccess = false;
        String sql = "UPDATE Product set status = ? WHERE  = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setBoolean(1, Boolean.FALSE);
            state.setInt(2, productId);

            if (state.executeUpdate() > 0) {
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
        String sql = "SELECT productQuantity FROM Product WHERE productID = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setInt(1, productID);
            rs = state.executeQuery();
            while (rs.next()) {
                quantity = rs.getInt("productQuantity");
            }
        } catch (Exception e) {
        } finally {
               closePrepareStatement(state);
            closeConnection(conn);
        }
        return quantity;
    }
    
    public void subQuantity(int productId, int subQuantity) throws Exception {
        String sql = "UPDATE tblProduct SET quantity = quantity - ? where product_id = ?";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setInt(1, subQuantity);
            state.setInt(2, productId);
            state.executeUpdate();
        } catch (Exception e) {
        } finally {
            closeConnection();
        }
    }

    
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
        List<ProductSaleToday> list = dao.getAllProductSaleSearchall();
        for (ProductSaleToday customer : list) {
            System.out.println(customer);

        }
//           ProductDTO p=dao.getProductByID(13);
//           System.out.println(p);


//        String b = "2022-6-26";
//        Date b1 = Date.valueOf(b);
//        int a = dao.countProductSale(b1);
//        System.out.println(a);
//        List<ProductSaleToday> ls = dao.getAllProductSaleToday(b1);
//        for (ProductSaleToday l : ls) {
//            System.out.println(l);
//        }
//        System.out.println(dao.SumProductSaleMoth(5, 2022));
//        ArrayList<ProductDTO> getProductByParam=dao.getProductByParam("",0);
//        for (ProductDTO productDTO : getProductByParam) {
//            System.out.println(productDTO);
//        }
    }
}
