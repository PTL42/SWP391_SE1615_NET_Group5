/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Invoice;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author SmileMint
 */
public class InvoiceDAO  extends ConnectDB{

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Invoice> getAllInvoice() {
        try {
            String query = "select * from Invoice";
            conn = new ConnectDB().conn;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            List<Invoice> list = new ArrayList<>();
            while (rs.next()) {
                Invoice a = new Invoice(rs.getInt(1), rs.getDate(2), rs.getInt(3), rs.getInt(4));
                list.add(a);

            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<Invoice> getInvoicebyInvoiceID(String txtSearch) {
        try {
            String query = "select * from Invoice \n"
                    + "where invoiceID = ?";
            conn = new ConnectDB().conn;
            ps = conn.prepareStatement(query);
            ps.setString(1, txtSearch);
            rs = ps.executeQuery();
            List<Invoice> list = new ArrayList<>();
            while (rs.next()) {
                Invoice a = new Invoice(rs.getInt(1), rs.getDate(2), rs.getInt(3), rs.getInt(4));
                list.add(a);

            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
     public int addInvoice(Invoice i){
        int n=0;
        String sql="INSERT INTO [dbo].[Invoice]\n" +
"           ([createdDate]\n" +
"           ,[employeeID]\n" +
"           ,[customerID])\n" +
"     VALUES\n" +
"           (?\n" +
"           ,?\n" +
"           ,?)";
        try {
            PreparedStatement pre =conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
//            set value for?
//            ?index start 1
//            pre.setDataType(index,value);
//            dataType of dataType of fied 

                  pre.setDate(1,i.getCreatedDate());
                  pre.setInt(2,i.getEmployeeID());
                  pre.setInt(3, i.getCustomerID());
                
                  n=pre.executeUpdate();
                  ResultSet rs1=pre.getGeneratedKeys();
                  if(rs1.next()){
                      return rs1.getInt(1);
                  }
                  System.out.println(sql);
        } catch (SQLException ex) {
          ex.printStackTrace();
        }
        return n;
    }
     
    public static void main(String[] args) {
        InvoiceDAO dao = new InvoiceDAO();
//        List<Invoice> list = dao.getAllInvoice();
//        for (Invoice c : list) {
//            System.out.println(c);
//        }
          LocalDate date= java.time.LocalDate.now();
        String date1=date.toString();
                            java.sql.Date date2=java.sql.
                                    Date.valueOf(date1);
                            
//            int n=dao.addInvoice(new Invoice(date2, 4, 3));
            System.out.println(date2);

    }
    

}
