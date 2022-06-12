<%-- 
    Document   : function
    Created on : Jun 8, 2022, 5:22:32 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="nk-sidebar">           
            <div class="nk-nav-scroll">
                <ul class="metismenu" id="menu">
                    <li class="nav-label">Sale Manager System</li>
                    <li>
<!--                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-speedometer menu-icon"></i><span class="nav-text">Profit Manager</span>
                        </a>-->
                        <a href="ProfitController" aria-expanded="false">
                            <i class="icon-speedometer menu-icon"></i><span class="nav-text">Profit Manager</span>
                        </a>
                        
                    </li>
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-globe-alt menu-icon"></i><span class="nav-text">Product Manager</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="HomeController?do=ListProduct">List Product</a></li>
                            <li><a href="HomeController?do=AddProduct">Add Products</a></li>
                            <li><a href="HomeController?do=Inventory">Inventory</a></li>
                            
                        </ul>
                    </li>
                    <!--<li class="nav-label">Apps</li>-->
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-envelope menu-icon"></i> <span class="nav-text">Employee Manager </span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="HomeController">List Employees</a></li>
                            <li><a href="HomeController">Add Employees</a></li>
                         
                        </ul>
                    </li>
                    <li>
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
                    
                   
            </div>
        </div>
