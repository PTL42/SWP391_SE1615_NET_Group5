/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author SmileMint
 */
public class ProductInvoice {
       private int    quantity;
       private int    invoiceID;
       private int    productID;
      private  double price;
    public ProductInvoice() {
    }

    public ProductInvoice(int quantity, int invoiceID, int productID, double price) {
        this.quantity = quantity;
        this.invoiceID = invoiceID;
        this.productID = productID;
        this.price = price;
    }

    public ProductInvoice(int quantity, double price) {
        this.quantity = quantity;
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getInvoiceID() {
        return invoiceID;
    }

    public void setInvoiceID(int invoiceID) {
        this.invoiceID = invoiceID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "ProductInvoice{" + "quantity=" + quantity + ", invoiceID=" + invoiceID + ", productID=" + productID + ", price=" + price + '}';
    }

    
    
}
