/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import Model.DiscountDTO;
import Model.CategoryDTO;
import java.io.Serializable;

/**
 *
 * @author ADMIN
 */
public class ProductDTO implements Serializable{
    private int productId;
    private int quantity;
    private int categoryId;
    private int discountId;
    private String productName;
    private String description;
    private String productImage;
    private String importDate;
    private float salePrice;
    private float importPrice;
    private Boolean status;

    private CategoryDTO category;
    private DiscountDTO discount;
    
    public ProductDTO() {
    }

    public ProductDTO(int productId, int quantity, int categoryId, int discountId, String productName, String description, String productImage, String importDate, float salePrice, float importPrice, Boolean status, CategoryDTO category, DiscountDTO discount) {
        this.productId = productId;
        this.quantity = quantity;
        this.categoryId = categoryId;
        this.discountId = discountId;
        this.productName = productName;
        this.description = description;
        this.productImage = productImage;
        this.importDate = importDate;
        this.salePrice = salePrice;
        this.importPrice = importPrice;
        this.status = status;
        this.category = category;
        this.discount = discount;
    }

    public ProductDTO(int productId, int quantity, int categoryId, int discountId, String productName, String description, String productImage, String importDate, float salePrice, float importPrice, Boolean status) {
        this.productId = productId;
        this.quantity = quantity;
        this.categoryId = categoryId;
        this.discountId = discountId;
        this.productName = productName;
        this.description = description;
        this.productImage = productImage;
        this.importDate = importDate;
        this.salePrice = salePrice;
        this.importPrice = importPrice;
        this.status = status;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getDiscountId() {
        return discountId;
    }

    public void setDiscountId(int discountId) {
        this.discountId = discountId;
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

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public String getImportDate() {
        return importDate;
    }

    public void setImportDate(String importDate) {
        this.importDate = importDate;
    }

    public float getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(float salePrice) {
        this.salePrice = salePrice;
    }

    public float getImportPrice() {
        return importPrice;
    }

    public void setImportPrice(float importPrice) {
        this.importPrice = importPrice;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public CategoryDTO getCategory() {
        return category;
    }

    public void setCategory(CategoryDTO category) {
        this.category = category;
    }

    public DiscountDTO getDiscount() {
        return discount;
    }

    public void setDiscount(DiscountDTO discount) {
        this.discount = discount;
    }
    
    
}
