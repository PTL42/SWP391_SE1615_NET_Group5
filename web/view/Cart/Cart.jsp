<%-- 
    Document   : Cart
    Created on : Jun 11, 2022, 6:10:44 PM
    Author     : The wizard and a cat
--%>

<%@page import="Model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Cart> list = null;
    if(session.getAttribute("cartID") != null){
        list = (ArrayList)request.getAttribute("listCart");
    }else{
        list = new ArrayList<Cart>();
    }
    
%>
<div class="container">
    <div class="paging">
        <ul class="breadcrumb">
            <li><a href="HomePage.jsp">Home</a></li>
            <li>Giỏ hàng</li>
        </ul>
    </div>
    <div class="cart-info">
        <h3>Thông tin giỏ hàng</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên sản phẩm</th>
                    <th>Đơn giá</th>
                    <th>Số lượng</th>
                    <th>Thành tiền</th>
                    <th>Xóa</th>
                </tr>
            </thead>
            <form action="Update" method="POST">
                <tbody>
                    <%                    
                        double totalPrice = 0;
                        double total = 0;
                        for (Cart c : list) {
                            out.println("<tr>");
                            out.println("<td>" + c.getProductID()+ "</td>");
                            out.println("<td>" + c.getProductName()+ "</td>");
                            out.println("<td>" + c.getPrice() + " $</td>");
                            out.println("<td><input type=\"text\" name=\"quantity\" value=\"" + c.getQuantity() + "\"></td>");
                            totalPrice += c.getPrice() * c.getQuantity();
                            total += totalPrice;
                            out.println("<td>" + (double) Math.round(totalPrice * 100) / 100 + " $</td>");
                            out.println("<td><a href=\"Remove?id=" + c.getProductID()+ "\"><i class=\"far fa-trash-alt\"></i></a></td>");
                            out.println("</tr>");
                        }
                    %>
                    <tr>
                        <td colspan="6">
                            <div class="row">
                                <div class="col-md-6 update-cart">
                                    <button type="submit" class="btn btn-warning">Cập nhật đơn hàng</button>
                                </div>
                                
                            </div>

                        </td>
                    </tr>
                </tbody>
            </form>
            
        </table>
        <h4>Tổng tiền: <%=(double)Math.round(total*100)/100%> $</h4>
        <a href="CheckoutCart" class="btn btn-warning"  onclick="alert('Thanh toán thành công!!!')" >Thanh toán</a>
    </div>
</div>
