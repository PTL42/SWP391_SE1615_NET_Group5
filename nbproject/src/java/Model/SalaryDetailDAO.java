/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Salary;
import Entity.SalaryDetail;
import Entity.Shippers;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class SalaryDetailDAO extends ConnectDB{
         Connection conn = null;
    PreparedStatement state = null;
    ResultSet rs = null;
    public int addSalaryDetail(SalaryDetail s){
        int n = 0;
        String sql = "INSERT INTO [dbo].[SalaryDetail]\n" +
"           ([employeeID]\n" +
"           ,[day])\n" +
"     VALUES\n" +
"           (?\n" +
"           ,?)";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
            state.setInt(1, s.getEmployeeID());
            state.setDate(2, s.getDay());
           
            n =state.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
       public SalaryDetail SalarydetailgetbyId(int id ) {
   SalaryDetail o=null;
        String sql = "select * from SalaryDetail where employeeID="+id;
    
        try {
               conn = getConnection();
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
            while (rs.next()) {
                int oID = rs.getInt("employeeID");
              
                Date day = rs.getDate(4);
               
                

               o=new SalaryDetail(oID, day);
         
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
         return o;
    }
       public List<SalaryDetail> listAllSalaryDetail( ) {
 
        String sql = "select * from SalaryDetail";
        List<SalaryDetail> vector =new ArrayList<SalaryDetail>();
        try {
               conn = getConnection();
            state = conn.prepareStatement(sql);
            rs = state.executeQuery();
            while (rs.next()) {
                int oID = rs.getInt("employeeID");
              
                Date day = rs.getDate(2);
               
                

            SalaryDetail o=new SalaryDetail(oID, day);
             vector.add(o);
         
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
         return vector;
    }
        public int removeSalaryDetail(int id ,Date date) {
        int n = 0;
        String sql = "delete from SalaryDetail where employeeID=" + id + "and [day]='"+date +"'";
        // check foreign key constrain (if table is 1)
//        String check = "select * from Products"
//                + "where " + id + " in(select distinct " + id + " from [Order Details])";
        try {
              conn = getConnection();
            state = conn.prepareStatement(sql);
            n = state.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
        public static void main(String[] args) {
        SalaryDetailDAO dao =new SalaryDetailDAO();
        SimpleDateFormat dt3 = new SimpleDateFormat("dd-MM-yyyy");
            LocalDate date = java.time.LocalDate.now();
            String date1 = date.toString();
            Date date2 = Date.valueOf(date1);
            String date3 = dt3.format(date2);
            System.out.println(dao.removeSalaryDetail(2, date2));
    }
}
