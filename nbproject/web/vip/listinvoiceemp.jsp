<%-- 
    Document   : listinvoice
    Created on : Jun 8, 2022, 5:14:56 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <form action="HomePageEmployeeController" class="sign-in-form" method="POST">
                <input type="hidden" name="do" value="ListInvoice">
              

                <div class="row page-titles mx-0">
                    <div class="col p-md-0">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">List Invoice</a></li>
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
                                    <h4 class="card-title">ListInvoice</h4>
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered zero-configuration">
                                            <thead>
                                                <tr>
                                                    <th>InvoiceID</th>
                                                    <th>CreatedDate</th>
                                                    <th>EmployeeID</th>
                                                    <th>CustomerID</th>  
                                                    <th>Detail</th>  
                                                      
                                                </tr>
                                            </thead>                                       
                                            <c:forEach items="${listI}" var="o">
                                                <tr>
                                                    <td>${o.invoiceID}</td>
                                                    <td>${o.createdDate}</td>
                                                    <td><a href="DetailEmployee?sid=${o.employeeID}" >${o.employeeID}</a></td>
                                                    <td><a href="DetailCustomer?sid=${o.customerID}" >${o.customerID}</a></td>
                                                    <td><a href="Bill?sid=${o.invoiceID}" >Details</a> </td>
                                                    
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