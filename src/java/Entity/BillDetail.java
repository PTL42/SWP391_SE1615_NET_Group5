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
public class BillDetail {
    String nameproduct;
    int amount;
    float price;
    float cost;
    

    public BillDetail() {
    }

    public BillDetail(String nameproduct, int amount, float price, float cost) {
        this.nameproduct = nameproduct;
        this.amount = amount;
        this.price = price;
        this.cost = cost;
    }

    public String getNameproduct() {
        return nameproduct;
    }

    public void setNameproduct(String nameproduct) {
        this.nameproduct = nameproduct;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    @Override
    public String toString() {
        return "BillDetail{" + "nameproduct=" + nameproduct + ", amount=" + amount + ", price=" + price + ", cost=" + cost + '}';
    }

   
   
}
