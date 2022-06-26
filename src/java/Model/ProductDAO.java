/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Product;
import Entity.ProductSaleToday;
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
public class ProductDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getAllProduct() {
        try {
            String query = "select * from Product";
            conn = new ConnectDB().conn;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product a = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3),
                        rs.getFloat(4), rs.getFloat(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getString(9));
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
                    + " and i.createdDate='"+d+"'  GROUP BY p1.productName;";
            conn = new ConnectDB().conn;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            List<ProductSaleToday> list = new ArrayList<>();
            while (rs.next()) {
                ProductSaleToday a = new ProductSaleToday(rs.getString(1),rs.getInt(2),
                    d);
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
            conn = new ConnectDB().conn;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            List<ProductSaleToday> list = new ArrayList<>();
            while (rs.next()) {
                ProductSaleToday a = new ProductSaleToday(rs.getString(1), rs.getFloat(2), rs.getInt(3),
                        rs.getInt(4), rs.getDate(5));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public Product getProductbyID(int id) {
        Product a = null;
        try {
            String query = "select * from Product where [productID]=" + id;
            conn = new ConnectDB().conn;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
//            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                a = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3),
                        rs.getFloat(4), rs.getFloat(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getString(9));
//                list.add(a);                  
            }
            return a;
        } catch (Exception e) {
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
            conn = new ConnectDB().conn;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
//            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                a = rs.getDate(1);
//                list.add(a);                  
            }
            return a;
        } catch (Exception e) {
        }
        return a;
    }

    public int countProductSale(Date b) {
        int a = 0;
        try {
            String query = "SELECT COUNT(DISTINCT p.productID )\n"
                    + "  FROM [Invoice] i ,Product_Invoice p where i.invoiceID=p.invoiceID and i.createdDate='" + b + "'";
            conn = new ConnectDB().conn;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
//            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                a = rs.getInt(1);
//                list.add(a);                  
            }
            return a;
        } catch (Exception e) {
        }
        return a;
    }

    public int SumProductSale(Date b) {
        int a = 0;
        try {
            String query = "SELECT sum(quantity )\n"
                    + "  FROM [Invoice] i ,Product_Invoice p where i.invoiceID=p.invoiceID and i.createdDate='" + b + "'";
            conn = new ConnectDB().conn;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
//            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                a = rs.getInt(1);
//                list.add(a);                  
            }
            return a;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return a;
    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
//        List<Product> list = dao.getAllProduct();
//        for (Product customer : list) {
//            System.out.println(customer);
//
//        }
        String b = "2022-6-26";
        Date b1 = Date.valueOf(b);
        int a = dao.countProductSale(b1);
        System.out.println(a);
        List<ProductSaleToday> ls=dao.getAllProductSaleToday(b1);
        for (ProductSaleToday l : ls) {
            System.out.println(l);
        }
    }
}
