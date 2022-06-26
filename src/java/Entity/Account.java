/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class Account {
    String username;
    String password;
    int role;

    public Account() {
    }

    public Account(String username, String password, int role) {
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Account{" + "username=" + username + ", password=" + password + ", role=" + role + '}';
    }
    
    public static void checktime() {
     Date date=new Date();
         SimpleDateFormat sdf2 = new SimpleDateFormat("ss");
         String q=sdf2.format(date);
       int x1 = Integer.parseInt(q);
       System.out.println(q);
       while(true){
             Date date2=new Date();
         SimpleDateFormat sdf = new SimpleDateFormat("ss");
       String a=sdf.format(date2);
// 
        int x = Integer.parseInt(a);
             
        if(x1<30){
            int b=x1+30;
            if(x==b){
                System.out.println("da xoa random");
                
                break;
            }
        }else{
            int c=x1-30;
            if(x==c){
                
                System.out.println("da xoa random");
              
                break;
            }
        }
}
    }
}
