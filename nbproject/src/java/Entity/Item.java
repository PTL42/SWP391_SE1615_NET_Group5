/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author Administrator
 */
public class Item {
     private Product p;
     private int quantity;
     private double price;

    public Item(Product p, int quantity, double price) {
        this.p = p;
        this.quantity = quantity;
        this.price = price;
    }

    public Item() {
    }

    public Product getP() {
        return p;
    }

    public void setP(Product p) {
        this.p = p;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Item{" + "p=" + p + ", quantity=" + quantity + ", price=" + price + '}';
    }
     

  
     
}
