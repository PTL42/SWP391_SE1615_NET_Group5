/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.util.List;
import Entity.Product;

import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class Carts {
    private  List<Item> items;

    public Carts(List<Item> items) {
        this.items = items;
    }

    public Carts() {
        items=new ArrayList<>();
    }
    private Item getItemById(int id){
        for (Item item : items) {
            if(item.getP().getProductID()==id){
                return item;
            }
        }
        return null;
    }
     public Item getItemById1(int id){
        for (Item item : items) {
            if(item.getP().getProductID()==id){
                return item;
            }
        }
        return null;
    }
   
        
     
     
     
    private int getQuatityById(int id){
        return getItemById(id).getQuantity();
    }
    public int getQuatityById1(int id){
        return getItemById(id).getQuantity();
    }
     public int setquatityP(Item t,Product p){
         int k=0;
        if(t.getP().getProductID()==p.getProductID()){
            k=p.getProductID()-t.getQuantity();
           
        }
        return k;
    }
    public void addItem(Item t){
        if(getItemById(t.getP().getProductID())!=null){
            Item i=getItemById(t.getP().getProductID());
            i.setQuantity(i.getQuantity()+t.getQuantity());
        }else{
            items.add(t);
        }
    }
    public void removeItem(int id){
        if(getItemById(id)!=null){
            items.remove(getItemById(id));
        }
    }
    public void removeAllItem(){
        for (Item item : items) {
            items.remove(item.getP().getProductID());
        }
     
    }
    public double getTotalMoney(){
        double t=0;
        for (Item item : items) {
            t+=item.getQuantity()*item.getPrice();
        }
        return t;
    }
  
    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
    private Product getProductById(int id,List<Product> list){
        for (Product product : list) {
            if(product.getProductID()==id){
                return product;
            }
        }
        
        
        return null;
        
    }
    
    
    public Carts (String txt,List<Product> list){
        items=new ArrayList<>();
        try{
        if(txt!=null&& txt.length()!=0){
            String[] s=txt.split(",");
            for (String string : s) {
                String[] n=string.split(":");
                int id=Integer.parseInt(n[0]);
                int quantity=Integer.parseInt(n[1]);
                Product p=getProductById(id, list);
                Item t=new Item(p, quantity, p.getPrice());
                addItem(t);
            }
        }}
        catch(NumberFormatException e){
            
        }
    }
    
    @Override
    public String toString() {
        return "Carts{" + "items=" + items + '}';
    }
    
}
