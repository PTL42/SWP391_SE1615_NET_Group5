/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Account;
import Entity.Employees;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class EmployeeDAO extends ConnectDB{
    public String getEmail(String user) {
        String sql = "select Email from Employees where username="+"'"+user+"'";
    String email="";
        try {

            ResultSet rs = getData(sql);
//            ResultSet rs=getData(sql);
            while (rs.next()) {
                email=rs.getString(1);
                
            }
             } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return email;
    }
    public Employees getEmpployeesbyUsername(String user) {
        String sql = "select * from Employees where username="+"'"+user+"'";
        Employees e=null;
   
        try {

            ResultSet rs = getData(sql);
//            ResultSet rs=getData(sql);
            while (rs.next()) {
                int id=rs.getInt(1);
                String name=rs.getString(2);
                int gender=rs.getInt(3);
                String phone=rs.getString(4);
                Date date=rs.getDate(5);
                String img=rs.getString(6);
                String username=rs.getString(7);
                String email=rs.getString(8);
                e=new Employees(id, username, gender, phone, date, img, username, email);
            }
             } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return e;
    }
     public static void main(String[] args) {
       EmployeeDAO dao=new EmployeeDAO();
        Employees a=dao.getEmpployeesbyUsername("lunguyen");
        System.out.println(a);
    }
}
