<%-- 
    Document   : functioncus
    Created on : Jul 19, 2022, 11:56:47 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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