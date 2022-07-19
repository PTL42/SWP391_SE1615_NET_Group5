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
        float    price;
        float    cost;
        String   img;
        String    description;
        int   categoryid;

    public Product() {
    }

    public Product(int productID, String productName, int productQuantity, float price, float cost, String img, String description, int categoryid) {
        this.productID = productID;
        this.productName = productName;
        this.productQuantity = productQuantity;
        this.price = price;
        this.cost = cost;
        this.img = img;
        this.description = description;
        this.categoryid = categoryid;
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

    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", productName=" + productName + ", productQuantity=" + productQuantity + ", price=" + price + ", cost=" + cost + ", img=" + img + ", description=" + description + ", categoryid=" + categoryid + '}';
    }

  

   
        
}
