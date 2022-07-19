<%-- 
    Document   : function
    Created on : Jun 8, 2022, 5:22:32 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="nk-sidebar" >         
    
            <div class="nk-nav-scroll">
                <ul class="metismenu" id="menu">
                    <li class="nav-label">Sale Manager System</li>
                    <li  ${ROLE != 'ADMIN' ? 'style="display: none"':''}>
<!--                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-speedometer menu-icon"></i><span class="nav-text">Profit Manager</span>
                        </a>-->
                        <a href="dashboardController" aria-expanded="false">
                            <i class="icon-speedometer menu-icon"></i><span class="nav-text">Profit Manager</span>
                        </a>
                        
                    </li>
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-globe-alt menu-icon"></i><span class="nav-text">Product Manager</span>
                        </a>
                        <ul aria-expanded="false">
                         <ul aria-expanded="false">
                                <form action="MainController" method="POST">
                                    <%--<c:if test="${ not empty ROLE}">--%>
                                        <li class="d-grid gap-2">
                                            <div class="row">
                                                <div class="col-2"></div>
                                                <div class="col-10 text-start">
                                                    <button class="btn btn-light border border-light">
                                                        <input type="hidden" name="btnAction" value="Search Product">
                                                        <span>Product Manager</span>
                                                    </button>
                                                </div>
                                            </div>
                                        <li/>
                                    <%--</c:if>--%>
                                </form>
                                <form action="MainController" method="POST">
                                    <c:if test="${ROLE != 'ADMIN' && not empty ROLE}">
                                        <li class="d-grid gap-2">
                                            <div class="row">
                                                <div class="col-2"></div>
                                                <div class="col-10 text-start">
                                                    <button class="btn btn-light border border-light col-11 text-start">
                                                        <input type="hidden" name="btnAction" value="Search History Product">
                                                        <span>History Order</span>
                                                    </button>
                                                </div>
                                            </div>
                                        <li/>
                                    </c:if>
                                </form>
                                <form action="MainController" method="POST">
                                    <c:if test="${ROLE == 'ADMIN' && not empty ROLE }">
                                        <li class="d-grid gap-2">
                                            <div class="row">
                                                <div class="col-2"></div>
                                                <div class="col-10 text-start">
                                                    <button class="btn btn-light border border-light">
                                                        <input type="hidden" name="btnAction" value="Category">
                                                        <span>Category</span>
                                                    </button>
                                                </div>
                                            </div>
                                        <li/>
                                    </c:if>
                                </form>
                                <form action="MainController" method="POST">
                                    <c:if test="${ROLE != 'ADMIN' && not empty ROLE }">
                                        <li class="d-grid gap-2">
                                            <div class="row">
                                                <div class="col-2"></div>
                                                <div class="col-10 text-start">
                                                    <button class="btn btn-light border border-light">
                                                        <input type="hidden" name="btnAction" value="Shopping Cart">
                                                        <span>Shopping Cart</span>
                                                    </button>
                                                </div>
                                            </div>
                                        <li/>
                                    </c:if>
                                </form>
                            </ul>
                            
                            
                        </ul>
                    </li>
                 
                    <!--<li class="nav-label">Apps</li>
                   
                    
                    
                    
                    
                    -->
                  <li ${ROLE != 'ADMIN' ? 'style="display: none"':''}>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-envelope menu-icon"></i> <span class="nav-text">Customer Manager </span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="ListCustomer">List Customer</a></li>
                            <li><a href="AddCustomer.jsp">Add Customer</a></li>
                         
                        </ul>
                    </li>
                    <li ${ROLE != 'ADMIN' ? 'style="display: none"':''}>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-disc menu-icon"></i> <span class="nav-text">Employee Manager </span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="ListEmployees">List Employee</a></li>
                            <li><a href="AddEmployee.jsp">Add Employee</a></li>
                         
                        </ul>
                    </li>
                    <li ${ROLE != 'ADMIN' ? 'style="display: none"':''}>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-envelope menu-icon"></i> <span class="nav-text">Shippers Manager </span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="HomeController?do=ListShippers">List Shippers</a></li>
                            <li><a href="HomeController?do=addShippers">Add Shippers</a></li>
                         
                        </ul>
                    </li>
                    <li ${ROLE != 'ADMIN' ? 'style="display: none"':''} >
<!--                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">Invoice Manager</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./app-profile.html">Profile</a></li>
                            <li><a href="./app-calender.html">Calender</a></li>
                        </ul>-->
                           <a href="HomeController?do=ListInvoice" aria-expanded="false">
                            <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">Invoice Manager</span>
                        </a>
                    </li>
                    <li ${ROLE != 'ADMIN' ? 'style="display: none"':''}>
<!--                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">Invoice Manager</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./app-profile.html">Profile</a></li>
                            <li><a href="./app-calender.html">Calender</a></li>
                        </ul>-->
                           <a href="salary" aria-expanded="false">
                            <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">Salary Manager</span>
                           </a>
                             <ul aria-expanded="false">
                            <li><a href="salary">Check Attended</a></li>
                            <li><a href="salarytotal">Employees Salary</a></li>
                         
                        </ul>
                            
                        </a>
                    </li>
                    
                   
            </div>
        </div>
