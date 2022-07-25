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
public class History {
  
             int invoiceId;
             String productName;
             double price;
             int quantity;
             Date createDate;
             String img;
             String status;
    public History() {
    }

    public History(int invoiceId, String productName, double price, int quantity, Date createDate, String img, String status) {
        this.invoiceId = invoiceId;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.createDate = createDate;
        this.img = img;
        this.status = status;
    }

    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
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

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "History{" + "invoiceId=" + invoiceId + ", productName=" + productName + ", price=" + price + ", quantity=" + quantity + ", createDate=" + createDate + ", img=" + img + ", status=" + status + '}';
    }

    
             
             
             
}
