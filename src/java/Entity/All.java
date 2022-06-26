/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author Admin
 */
public class All {
    String date;
    String nameproduct;
    int quantity;

    public All() {
    }

    public All(String date, String nameproduct, int quantity) {
        this.date = date;
        this.nameproduct = nameproduct;
        this.quantity = quantity;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getNameproduct() {
        return nameproduct;
    }

    public void setNameproduct(String nameproduct) {
        this.nameproduct = nameproduct;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "All{" + "date=" + date + ", nameproduct=" + nameproduct + ", quantity=" + quantity + '}';
    }
    
}
