/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.ResultSet;
import Entity.Account;
import Entity.All;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Date;
import java.util.Scanner;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class AccountDAO extends ConnectDB {

    public Account getAccount(String user, String pass) {
        String sql = "select * from Account where username=" + "'" + user + "'" + " and password=" + "'" + pass + "'";
        Account a = null;
        try {

            ResultSet rs = getData(sql);
//            ResultSet rs=getData(sql);
            while (rs.next()) {
                String use2 = rs.getString(1);
                String pass2 = rs.getString(2);
                int role = rs.getInt(3);
                a = new Account(user, pass2, role);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return a;
    }

    public Vector listAll() {
        String sql = "SELECT [Date]\n"
                + "      ,[NameProduct]\n"
                + "      ,[Quantity]\n"
                + "  FROM [ShopManagement].[dbo].[All]";
        Vector<All> vector = new Vector<All>();
        try {
            Statement state = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
//            ResultSet rs=getData(sql);
            while (rs.next()) {
                // rs.getDataType(fieldName|index=1);

                String date = rs.getString(1);
                String name = rs.getString(2);
                int qua = rs.getInt(3);

                All a = new All(date, name, qua);
                vector.add(a);
            }

//        ResultSet.TYPE_FORWARD_ONLY: default
//        TYPE_SCROLL_INSENSITIVE: no Thread safe
//        TYPE_SCROLL_SENSITIVE: Thread safe
//       ResultSet.CONCUR_READ_ONLY: default
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vector;
    }

    public int ChangePassword(String usename, String pass) {
        String sql = "UPDATE Account\n"
                + "SET password = ?\n"
                + "WHERE username = ?";
        int n = 0;

        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, pass);
            pre.setString(2, usename);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }
//      public static void checktime(String r,String e) {
//     Date date=new Date();
//     
//         SimpleDateFormat sdf2 = new SimpleDateFormat("ss");
//         String q=sdf2.format(date);
//      
//       int x1 = Integer.parseInt(q);
//       System.out.println(q);
//       
//       while(true){
//             Date date2=new Date();
//         SimpleDateFormat sdf = new SimpleDateFormat("ss");
//       String a=sdf.format(date2);
////  
//        int x = Integer.parseInt(a);
//              Scanner sc=new Scanner(System.in);
//         e=sc.nextLine();
//        if(x1<30){
//            int b=x1+30;
//            if(x==b){
//                System.out.println("da xoa random");
//                r="00000000000000000000000000000000000";
//                break;
//            }
//            if(r.equals(e)){
//                break;
//            }
//        }else{
//            int c=x1-30;
//            if(x==c){
//                
//                System.out.println("da xoa random");
//              r="00000000000000000000000000000000000";
//                break;
//            }
//            if(r.equals(e)){
//                break;
//            }
//        }
//}
//    }

    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
//        Vector<All>a=dao.listAll();
//        for (All all : a) {
//            System.out.println(all);
//        }
        Account a = dao.getAccount("lunguyen", "123456Qa");
        System.out.println(a);
//        String dob = "2022/2/2";
//        try {
//            Date date1 = new SimpleDateFormat("dd/MM/yyyy").parse(dob);
//            String pattern = "yyyy-MM-dd";
//
////         e=sc.nextLine();
////            checktime("2","3");
//            System.out.println(date1);
//        } catch (ParseException ex) {
//            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }

    }
}
