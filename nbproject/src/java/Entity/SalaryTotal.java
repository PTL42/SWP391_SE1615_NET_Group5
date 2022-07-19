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
public class SalaryTotal {
     int employeeID;
  String employeeName;
  String img;
      int state;
      double salary;
      Date from;
      Date to;
      int totalwork;
      double salarytotal;

    public SalaryTotal() {
    }

    public SalaryTotal(int employeeID, String employeeName, String img, int state, double salary, Date from, Date to, int totalwork, double salarytotal) {
        this.employeeID = employeeID;
        this.employeeName = employeeName;
        this.img = img;
        this.state = state;
        this.salary = salary;
        this.from = from;
        this.to = to;
        this.totalwork = totalwork;
        this.salarytotal = salarytotal;
    }

    public int getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public Date getFrom() {
        return from;
    }

    public void setFrom(Date from) {
        this.from = from;
    }

    public Date getTo() {
        return to;
    }

    public void setTo(Date to) {
        this.to = to;
    }

    public int getTotalwork() {
        return totalwork;
    }

    public void setTotalwork(int totalwork) {
        this.totalwork = totalwork;
    }

    public double getSalarytotal() {
        return salarytotal;
    }

    public void setSalarytotal(double salarytotal) {
        this.salarytotal = salarytotal;
    }

    @Override
    public String toString() {
        return "SalaryTotal{" + "employeeID=" + employeeID + ", employeeName=" + employeeName + ", img=" + img + ", state=" + state + ", salary=" + salary + ", from=" + from + ", to=" + to + ", totalwork=" + totalwork + ", salarytotal=" + salarytotal + '}';
    }

 
   
}
