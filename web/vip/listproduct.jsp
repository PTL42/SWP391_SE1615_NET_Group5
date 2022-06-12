<%-- 
    Document   : listproduct
    Created on : Jun 8, 2022, 7:06:51 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <form action="HomeController" class="sign-in-form" method="POST">
                <input type="hidden" name="do" value="ListProduct">
              

                <div class="row page-titles mx-0">
                    <div class="col p-md-0">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">List Product</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                        </ol>
                    </div>
                </div>
                <!-- row -->
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">ListProduct</h4>
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered zero-configuration">
                                            <thead>
                                                <tr>
                                                    <th>ProductID</th>
                                                    <th>Image</th>
                                                    <th>ProductName</th>
                                                    <th>Quantity</th>
                                                    <th>Cost</th>                                               
                                                    <th>Price</th>                                               
                                                    <th>SupplierID</th>                                               
                                                    <th>CategoryID</th>                                               
                                                    <th>Description</th>                                               
                                                </tr>
                                            </thead>                                       
                                            <c:forEach items="${list2}" var="o">
                                                <tr>
                                                    <td>${o.productID}</td>
                                                    <td>
                                                    <img src="${o.img}" height="60" width="60" alt=""></td>
                                                    <td>${o.productName}</td>
                                                    <td>${o.productQuantity}</td>
                                                    <td>${o.cost}</td>
                                                    <td>${o.price}</td>
                                                    <td>${o.supplierID}</td>
                                                    <td>${o.category}</td>
                                                    <td>${o.description}</td>
                                                </tr>
                                            </c:forEach>                                      
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #/ container -->
            
    </form>
