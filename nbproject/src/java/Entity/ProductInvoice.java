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

    public ProductInvoice() {
    }

    public ProductInvoice(int quantity, int invoiceID, int productID) {
        this.quantity = quantity;
        this.invoiceID = invoiceID;
        this.productID = productID;
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

    @Override
    public String toString() {
        return "Product_Invoice{" + "quantity=" + quantity + ", invoiceID=" + invoiceID + ", productID=" + productID + '}';
    }
    
}
