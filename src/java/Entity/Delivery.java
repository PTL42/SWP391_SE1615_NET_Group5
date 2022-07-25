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
public class Delivery {
    int id;
    int invoiceId;
    String name;
String phone;
String address;
int shipperId;
String status;

    public Delivery() {
    }

    public Delivery(int id, int invoiceId, String name, String phone, String address, int shipperId, String status) {
        this.id = id;
        this.invoiceId = invoiceId;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.shipperId = shipperId;
        this.status = status;
    }

    public Delivery(int invoiceId, String name, String phone, String address, int shipperId, String status) {
        this.invoiceId = invoiceId;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.shipperId = shipperId;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getShipperId() {
        return shipperId;
    }

    public void setShipperId(int shipperId) {
        this.shipperId = shipperId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Deliveryaddress{" + "id=" + id + ", invoiceId=" + invoiceId + ", name=" + name + ", phone=" + phone + ", address=" + address + ", shipperId=" + shipperId + ", status=" + status + '}';
    }
	
}
