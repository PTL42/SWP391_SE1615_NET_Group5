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
                            <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">Invoice Manager</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./app-profile.html">Profile</a></li>
                            <li><a href="./app-calender.html">Calender</a></li>
                        </ul>-->
                           <a href="HomePageEmployeeController" aria-expanded="false">
                            <i class="icon-screen-tablet menu-icon"></i><span class="nav-text"> Add Invoice </span>
                        </a>
                    </li>
                    
                    <!--<li class="nav-label">Apps</li>-->
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-envelope menu-icon"></i> <span class="nav-text">Customer Manager </span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="HomeController">List Customer</a></li>
                            <li><a href="HomeController">Add Customer</a></li>
                         
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
                           <a href="HomePageEmployeeController?do=ListInvoice" aria-expanded="false">
                            <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">Invoice Manager</span>
                        </a>
                    </li>
                    
                   
            </div>
        </div>
