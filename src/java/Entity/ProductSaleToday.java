/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class ProductSaleToday {
    String productname;
    double price;
    int quantity;
    int invoiceId;
    Date createDate;

    public ProductSaleToday() {
    }

    public ProductSaleToday(String productname, double price, int quantity, int invoiceId, Date createDate) {
        this.productname = productname;
        this.price = price;
        this.quantity = quantity;
        this.invoiceId = invoiceId;
        this.createDate = createDate;
    }

    public ProductSaleToday(String productname, int quantity, Date createDate) {
        this.productname = productname;
        this.quantity = quantity;
        this.createDate = createDate;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "ProductSaleToday{" + "productname=" + productname + ", price=" + price + ", quantity=" + quantity + ", invoiceId=" + invoiceId + ", createDate=" + createDate + '}';
    }
    
    
}
