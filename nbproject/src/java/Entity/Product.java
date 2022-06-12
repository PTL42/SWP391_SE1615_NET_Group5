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
public class Product {
        int    productID;
        String    productName;
        int   productQuantity;
        float    cost;
        float    price;
        String   img;
        String    description;
        int   supplierID;
        String   category;

    public Product() {
    }

    public Product(int productID, String productName, int productQuantity, float cost, float price, String img, String description, int supplierID, String category) {
        this.productID = productID;
        this.productName = productName;
        this.productQuantity = productQuantity;
        this.cost = cost;
        this.price = price;
        this.img = img;
        this.description = description;
        this.supplierID = supplierID;
        this.category = category;
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

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(int supplierID) {
        this.supplierID = supplierID;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", productName=" + productName + ", productQuantity=" + productQuantity + ", cost=" + cost + ", price=" + price + ", img=" + img + ", description=" + description + ", supplierID=" + supplierID + ", category=" + category + '}';
    }
        
}
