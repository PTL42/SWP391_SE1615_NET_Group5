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
public class ContactUs {
    int id;
    String name;
    String email;
    String phone;
    String message;
    int status;

    public ContactUs() {
    }
    
    

    public ContactUs(String name, String email, String phone, String message, int status) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.message = message;
        this.status = status;
    }

    public ContactUs(int id, String name, String email, String phone, String message, int status) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.message = message;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ContactUs{" + "id=" + id + ", name=" + name + ", email=" + email + ", phone=" + phone + ", message=" + message + ", status=" + status + '}';
    }


    

   
}
