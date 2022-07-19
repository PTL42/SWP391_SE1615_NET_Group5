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
public class SalaryDetail {
    int employeeID;
    Date day;

    public SalaryDetail() {
    }

    public SalaryDetail(int employeeID, Date day) {
        this.employeeID = employeeID;
        this.day = day;
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

    @Override
    public String toString() {
        return "SalaryDetail{" + "employeeID=" + employeeID + ", day=" + day + '}';
    }
    
}
