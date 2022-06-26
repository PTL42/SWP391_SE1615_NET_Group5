package Entity;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author SmileMint
 */
public class Supplier {
    private int supplierID;
    private String     supplierName;
    private String address;
    private String phone;
    private String img;

    public Supplier() {
    }

    public Supplier(int supplierID, String supplierName, String address, String phone, String img) {
        this.supplierID = supplierID;
        this.supplierName = supplierName;
        this.address = address;
        this.phone = phone;
        this.img = img;
    }

    public int getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(int supplierID) {
        this.supplierID = supplierID;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Supplier{" + "supplierID=" + supplierID + ", supplierName=" + supplierName + ", address=" + address + ", phone=" + phone + ", img=" + img + '}';
    }
    
}
