/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Invoice;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Invoice2DAO extends ConnectDB {
    
Connection conn = null;
    PreparedStatement state = null;
    ResultSet rs = null;
      public int addInvoice(Invoice i) {
        int n = 0;
        String sql = "INSERT INTO [dbo].[Invoice]\n"
                + "           ([createdDate]\n"
                + "           ,[employeeID]\n"
                + "           ,[customerID])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
//            set value for?
//            ?index start 1
//            pre.setDataType(index,value);
//            dataType of dataType of fied 

            state.setDate(1, i.getCreatedDate());
            state.setInt(2, i.getEmployeeID());
            state.setInt(3, i.getCustomerID());

            n = state.executeUpdate();
            ResultSet rs1 = state.getGeneratedKeys();
            if (rs1.next()) {
       
                return rs1.getInt(1);
            }
            System.out.println(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }


     public int invoiceidnew() {
         int n=0;
        String sql = "SELECT top 1 [invoiceID]\n" +
"    \n" +
"  FROM [ShopManagement3].[dbo].[Invoice] order by invoiceID desc";
        
        try {
              conn = getConnection();
            state = conn.prepareStatement(sql);
          
            rs = state.executeQuery();
//            ResultSet rs=getData(sql);
            while (rs.next()) {
                // rs.getDataType(fieldName|index=1);

             n=rs.getInt(1);

             
            }

//        ResultSet.TYPE_FORWARD_ONLY: default
//        TYPE_SCROLL_INSENSITIVE: no Thread safe
//        TYPE_SCROLL_SENSITIVE: Thread safe
//       ResultSet.CONCUR_READ_ONLY: default
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
    public static void main(String[] args) {
        Invoice2DAO dao = new Invoice2DAO();
//        List<Invoice> list = dao.getAllInvoice();
//        for (Invoice c : list) {
//            System.out.println(c);
//        }
        LocalDate date = java.time.LocalDate.now();
        String date1 = "2022-06-25";
        String date11 = "2022-06-26";
        LocalDate result = date.plus(1, ChronoUnit.WEEKS);
        String result1 = result.toString();
        Date date2
                = Date.valueOf(date1);
        Date date3
                = Date.valueOf(date11);
        SimpleDateFormat dt = new SimpleDateFormat("w");
        List<Date> listdate = new ArrayList<>();
        for (int i = 0; i < 7; i++) {

        }
//            int n=dao.addInvoice(new Invoice(date2, 4, 3));
        System.out.println(dt.format(date2));
        System.out.println(dt.format(date3));

        Calendar cal = Calendar.getInstance();
        cal.setTime(date2);
        int nweek = cal.WEEK_OF_YEAR;
        int year = cal.YEAR;
        System.out.println(nweek);

    }

}
