
package Entity;


public class Customer {
    private int customerID;
     private String email;
    private String customerName;
    private String phone;

   

    public Customer() {
    }

    public Customer(int customerID, String email, String customerName, String phone) {
        this.customerID = customerID;
        this.email = email;
        this.customerName = customerName;
        this.phone = phone;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Customer{" + "customerID=" + customerID + ", email=" + email + ", customerName=" + customerName + ", phone=" + phone + '}';
    }

    
}
