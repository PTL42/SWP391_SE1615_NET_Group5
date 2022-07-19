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
public class Shippers {
    private int shipperID;
    private String companyName;
    private String address;
    private String phone;

    public Shippers() {
    }

    public Shippers(int shipperID, String companyName, String address, String phone) {
        this.shipperID = shipperID;
        this.companyName = companyName;
        this.address = address;
        this.phone = phone;
    }

    public Shippers(String companyName, String address, String phone) {
        this.companyName = companyName;
        this.address = address;
        this.phone = phone;
    }

    public int getShipperID() {
        return shipperID;
    }

    public void setShipperID(int shipperID) {
        this.shipperID = shipperID;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
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

    @Override
    public String toString() {
        return "Shippers{" + "shipperID=" + shipperID + ", companyName=" + companyName + ", address=" + address + ", phone=" + phone + '}';
    }
    
}

