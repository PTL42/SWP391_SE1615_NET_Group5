/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class EmployeesSalary {
    int employeeID;
    Date day;
  String employeeName; 
	int gender;
	String phone;
	Date dob; 
	String img;
	String username;
        String email;

    public EmployeesSalary() {
    }

    public EmployeesSalary(int employeeID, Date day, String employeeName, int gender, String phone, Date dob, String img, String username, String email) {
        this.employeeID = employeeID;
        this.day = day;
        this.employeeName = employeeName;
        this.gender = gender;
        this.phone = phone;
        this.dob = dob;
        this.img = img;
        this.username = username;
        this.email = email;
    }

    public int getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
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
        return "EmployeesSalary{" + "employeeID=" + employeeID + ", day=" + day + ", employeeName=" + employeeName + ", gender=" + gender + ", phone=" + phone + ", dob=" + dob + ", img=" + img + ", username=" + username + ", email=" + email + '}';
    }
        
}
