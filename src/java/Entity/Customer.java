
package Entity;


public class Customer {
    private int customerID;
    private String customerName;
    private String adress;
    private String phone;

    public Customer() {
    }

    public Customer(int customerID, String customerName, String adress, String phone) {
        this.customerID = customerID;
        this.customerName = customerName;
        this.adress = adress;
        this.phone = phone;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Customer{" + "customerID=" + customerID + ", customerName=" + customerName + ", adress=" + adress + ", phone=" + phone + '}';
    }
    
}
