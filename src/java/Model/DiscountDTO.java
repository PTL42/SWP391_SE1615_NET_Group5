/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;

/**
 *
 * @author ADMIN
 */
public class DiscountDTO implements Serializable{
    private int discountId;
    private float discount;
    private String dateExpired;
    private String dateUnexpired;

    public DiscountDTO() {
    }

    public DiscountDTO(int discountId, float discount, String dateExpired, String dateUnexpired) {
        this.discountId = discountId;
        this.discount = discount;
        this.dateExpired = dateExpired;
        this.dateUnexpired = dateUnexpired;
    }

    public int getDiscountId() {
        return discountId;
    }

    public void setDiscountId(int discountId) {
        this.discountId = discountId;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public String getDateExpired() {
        return dateExpired;
    }

    public void setDateExpired(String dateExpired) {
        this.dateExpired = dateExpired;
    }

    public String getDateUnexpired() {
        return dateUnexpired;
    }

    public void setDateUnexpired(String dateUnexpired) {
        this.dateUnexpired = dateUnexpired;
    }
    
}
