/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;

/**
 *
 * @author duong
 */
public class OrderDetailsDTO implements Serializable{
    private int orderDetailsId;
    private int orderId;
    private int productId;
    private int quantity;
    private float unitPrice;
    private boolean status;
    private String productName;
    private String productImage;
    private String typeCategory;
    private String typeShipping;
    private String fullName;
    private String address;
    private String phoneNumber;
    private String orderDate;
    

    public OrderDetailsDTO() {
    }

    public OrderDetailsDTO(int orderDetailsId, int orderId, int productId, int quantity, float unitPrice, boolean status, String productName, String productImage, String typeCategory, String typeShipping, String fullName, String address, String phoneNumber) {
        this.orderDetailsId = orderDetailsId;
        this.orderId = orderId;
        this.productId = productId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.status = status;
        this.productName = productName;
        this.productImage = productImage;
        this.typeCategory = typeCategory;
        this.typeShipping = typeShipping;
        this.fullName = fullName;
        this.address = address;
        this.phoneNumber = phoneNumber;
    }

    public OrderDetailsDTO(int orderDetailsId, int orderId, int productId, int quantity, float unitPrice, boolean status, String productName, String productImage, String typeCategory, String typeShipping, String fullName, String address, String phoneNumber, String orderDate) {
        this.orderDetailsId = orderDetailsId;
        this.orderId = orderId;
        this.productId = productId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.status = status;
        this.productName = productName;
        this.productImage = productImage;
        this.typeCategory = typeCategory;
        this.typeShipping = typeShipping;
        this.fullName = fullName;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.orderDate = orderDate;
    }
    

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }
    

    public int getOrderDetailsId() {
        return orderDetailsId;
    }

    public void setOrderDetailsId(int orderDetailsId) {
        this.orderDetailsId = orderDetailsId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
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

    public float getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(float unitPrice) {
        this.unitPrice = unitPrice;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public String getTypeCategory() {
        return typeCategory;
    }

    public void setTypeCategory(String typeCategory) {
        this.typeCategory = typeCategory;
    }

    public String getTypeShipping() {
        return typeShipping;
    }

    public void setTypeShipping(String typeShipping) {
        this.typeShipping = typeShipping;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }
    
}
