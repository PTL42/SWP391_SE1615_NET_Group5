/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Define.DateUitils;
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
    PreparedStatement state = null;
    ResultSet rs = null;
  public List<Invoice> getAllInvoice() {
        try {
            String query = "select * from Invoice";
            conn = getConnection();
            state = conn.prepareStatement(query);
          
            rs = state.executeQuery();
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
    public List<Invoice> getAllInvoicetop3() {
        try {
            String query = "select top(3) * from Invoice order by invoiceID desc";
            conn = getConnection();
            state = conn.prepareStatement(query);
          
            rs = state.executeQuery();
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
             conn = getConnection();
            state = conn.prepareStatement(query);
          
            rs = state.executeQuery();

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
        public Integer insertOrder(int idcus) {
        DateUitils dateUtils = new DateUitils();
        int idOrder = 0;
        String sql = "INSERT INTO [dbo].[Invoice]\n" +
"           ([createdDate]\n" +
"           ,[employeeID]\n" +
"           ,[customerID])"
                + " OUTPUT inserted.invoiceID values(?,?,?)";
        try {
            conn = getConnection();
            state = conn.prepareStatement(sql);
           
            state.setTimestamp(1, java.sql.Timestamp.valueOf(dateUtils.getCurrentDate()));
            
            state.setInt(2, 1);
            state.setInt(3, idcus);
            rs = state.executeQuery();
            if (rs.next()) {
                idOrder = rs.getInt("invoiceID");
            }
        } catch (Exception e) {
        } finally {
                  closePrepareStatement(state);
            closeConnection(conn);
        }
        return idOrder;
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
          conn = getConnection();
            state = conn.prepareStatement(sql);
//            set value for?
//            ?index start 1
//            pre.setDataType(index,value);
//            dataType of dataType of fied 

                  state.setDate(1,i.getCreatedDate());
                  state.setInt(2,i.getEmployeeID());
                  state.setInt(3, i.getCustomerID());
                
                  n=state.executeUpdate();
                  ResultSet rs1=state.getGeneratedKeys();
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
        List<Invoice> list = dao.getAllInvoice();
        for (Invoice c : list) {
            System.out.println(c);
        }
//          LocalDate date= java.time.LocalDate.now();
//        String date1=date.toString();
//                            java.sql.Date date2=java.sql.
//                                    Date.valueOf(date1);
//                            
////            int n=dao.addInvoice(new Invoice(date2, 4, 3));
//            System.out.println(date2);

    }
    

}
