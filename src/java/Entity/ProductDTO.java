/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author duong
 */
public class ProductDTO implements Serializable{
    private int productID;
    private String productName;
    private String description;
    private float price;
    private float cost;
    private int productQuantity;
    private int categoryID;
    private String img;

    public ProductDTO() {
    }

    public ProductDTO(int productID, String productName, String description, float price, float cost, int productQuantity, int categoryID, String img) {
        this.productID = productID;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.cost = cost;
        this.productQuantity = productQuantity;
        this.categoryID = categoryID;
        this.img = img;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "productID=" + productID + ", productName=" + productName + ", description=" + description + ", price=" + price + ", cost=" + cost + ", productQuantity=" + productQuantity + ", categoryID=" + categoryID + ", img=" + img + '}';
    }
    
    
    

}
