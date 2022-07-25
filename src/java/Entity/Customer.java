
package Entity;


public class Customer {
    private int customerID;
    private String customerName;
    private String adress;
    private String phone;
    private String img;
    private String username;
    

    private String email;

    public Customer() {
    }

    public Customer(int customerID, String customerName, String adress, String phone, String img, String username, String email) {
        this.customerID = customerID;
        this.customerName = customerName;
        this.adress = adress;
        this.phone = phone;
        this.img = img;
        this.username = username;

        this.email = email;
    }

    public Customer(String customerName, String adress, String phone, String username, String email) {
        this.customerName = customerName;
        this.adress = adress;
        this.phone = phone;
        this.username = username;

        this.email = email;
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

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

   

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Customer{" + "customerID=" + customerID + ", customerName=" + customerName + ", adress=" + adress + ", phone=" + phone + ", img=" + img + ", username=" + username  + ", email=" + email + '}';
    }

   

    
    
}
