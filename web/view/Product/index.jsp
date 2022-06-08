<%-- 
    Document   : index
    Created on : Jun 6, 2022, 10:49:18 AM
    Author     : ADMIN
--%>


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>

        <!--use library of jquery-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
        <link rel="stylesheet" href="jquery.back-to-top.css">

        <!--cdn of bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/9d281e3188.js" crossorigin="anonymous"></script>
        <style>
            *{
                font-family: cursive;
                margin: 0%;
                padding: 0%;
                font-size: 14px;
            }

            body{
                background-color: rgb(85, 200, 228);
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }

            .navTop{
                top:0px;
                width: 100%;
                position: fixed;
                z-index: 99;
            }

        </style>
    </head>
    <body>
        <!--Navbar-->
        <nav class="navTop navbar navbar-expand-lg navbar-light bg-light mb-5">
            <div class="container">
                <div class="col-5">
                    <ul class="navbar-nav my-lg-0" style="max-height: 100px;">
                        <li class="nav-item col">
                            <a href="#" class="navbar-brand">
                                <img src="assets/logo_low.png" alt="" style="border-radius: 50%" width="50" height="50"> Manager Product
                            </a>
                        </li>
                        <li class="nav-item col">
                            <a class="nav-link navbar" href="MainController">
                                <div class="nav-item col">
                                    <i class="fa-solid fa-house"></i>&nbsp;Home
                                </div>
                            </a>
                        </li>
                        <li class="nav-item col">
                            <a class="nav-link" href="AddProductController">
                                <i class="fa-solid fa-circle-plus"></i>
                                New Product
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <!--Alter message-->
        <div style="padding: 0 20%; margin-top: 120px ">
            <c:if test="${UPDATE_CAKE_MSG_SUCCESS != null}">
                <div class="alert alert-primary alert-dismissible fade show" role="alert">
                    <strong>Note:</strong> <span style="color: black">${UPDATE_CAKE_MSG_SUCCESS}</span>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            <c:if test="${not empty CREATE_PRODUCT_MSG_SUCCESS}">
                <div class="alert alert-primary alert-dismissible fade show" role="alert">
                    <strong>Note:</strong> ${CREATE_PRODUCT_MSG_SUCCESS}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            <c:if test="${not empty DELETE_PRODUCT}">
                <div class="alert alert-primary alert-dismissible fade show" role="alert">
                    <strong>Note:</strong> ${DELETE_PRODUCT}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
        </div>

        <!--Search data-->
        <div class="editTableSearch">
            <div class=" container mt-5 shadow-lg mb-5 p-3 bg-body rounded">
                <div class="text-center">
                    <h3>Welcome to Manager Product </h3>
                </div>
                <div class="wrapper mt-2">
                    <div class="wrapper-header">
                        <p>SEARCH PRODUCT</p>
                    </div>
                    <div class="wrapper-content">
                        <form action="MainController" method="POST">
                            <div class="row">
                                <div class="col-6">
                                    <div class="form-group">
                                        <label>Name</label>
                                        <input class="form-control" type="text" name="txtProductName" value="${searchedProductByName}" placeholder="Search product by name">
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="form-group">
                                        <label>Category</label>
                                        <select name="selectCategory" class="form-control">
                                            <option value="0">SELECT CATEGORY</option>
                                            <c:forEach items="${LIST_CATEGORY}" var="category">
                                                <option class="dropdown-item" 
                                                        value="${category.categoryId}" ${category.getCategoryId() == searchedCategoryID ? 'selected' : ''}>${category.typeCategory}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-3 ">
                                    <div class="form-group">
                                        <label></label>
                                        <div class="w-100">
                                            <button class="btn w-100 btn btn-outline-dark" name="btnAction" value="Search Product">Search</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
                                    
        <!--Show data in table-->
        <c:if test="${LIST_PRODUCT != null}">
            <c:if test="${not empty LIST_PRODUCT}">
                <c:set var="context" value="${pageContext.request.contextPath}" />
                <div class="mt-5 mb-5 shadow-lg p-3 bg-body rounded container">
                    <table id="table_product" class="table table-hover">
                        <!--column title of table-->
                        <thead>
                            <tr class="col text-center">
                                <th style="width: 10px">Product</th>
                                <th class="col-2">Product Image</th>
                                <th class="col-2">Description</th>
                                <th>Brand</th>
                                <th>Sale Price</th>
                                <th>Import Price</th>
                                <th>Import Date</th>
                                <th>Quantity</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${LIST_PRODUCT}" var="product">
                                <tr class="tableCake text-center">
                                    <td>${product.productName}</td>
                                    <td><img src="${context}/${product.productImage}" style="width: 150px;"></td>
                                    <td>${product.description}</td>
                                    <td>${product.category.typeCategory}</td>
                                    <td>
                                        <fmt:setLocale value = "vi_VN"/>
                                        <fmt:formatNumber value = "${product.salePrice}"/>
                                    </td>
                                    <td>
                                        <fmt:setLocale value = "vi_VN"/>
                                        <fmt:formatNumber value = "${product.importPrice}"/>
                                    </td>
                                    <td>${product.importDate}</td>
                                    <td>${product.quantity}</td>
                                    <td>
                                        <c:if test="${product.status == true}">
                                            <p>visible</p>
                                        </c:if>
                                        <c:if test="${product.status != true}">
                                            <p>invisible</p>
                                        </c:if>
                                    </td>
                                    <td style="width: 50px!important">
                                        <div class="d-flex justify-content-between">
                                            <div class="d-grid gap-2 d-md-flex" role="group" aria-label="Button group with nested dropdown">
                                                <form action="MainController" method="POST">
                                                    <input name="txtProductID" type="hidden" value="${product.productId}">
                                                    <button type="submit" name="btnAction" value="Go To Update Page" style="font-size: 12px; font-weight: bold" class="btn w-100 mb-1 btn-lg btn-outline-success">Update</button>
                                                </form>
                                                <form action="MainController" method="POST">
                                                    <button onclick="setIdForDeleteModal(${product.productId})" style="font-size: 12px; font-weight: bold" class="btn w-100 mb-1 btn-lg btn-outline-danger" type="button" data-bs-toggle="modal" data-bs-target="#deleteModal">Remove</button>
                                                </form>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
            <c:if test="${empty LIST_PRODUCT}">
                <h3 class="text-center mt-5" style="color: white">Not found product <i class="fa-solid fa-face-frown-open"></i></h3>
                </c:if>
            </c:if>

        <!--Confirm to remove-->
        <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Deleting Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Are you want to delete ?
                    </div>
                    <div class="modal-footer">
                        <form action="MainController" method="POST">
                            <input type="hidden" id="deleteProductID" name="txtProductID">
                            <button type="submit" name="btnAction" value="Delete Product" class="btn btn-danger">Delete</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
//            use jquery to check paging
            $(document).ready(function () {
                $('#table_product').DataTable({
                    "pageLength": 5,
                    "searching": false,
                    "bLengthChange": false
                });
            });

            function setIdForDeleteModal(productID) {
                document.getElementById("deleteProductID").value = productID;
            }
//            lock user back page
            window.history.forward();
            function noBack() {
                window.history.forward();
            }
        </script>
        <!--libraries of table-->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
        <!--libraries of bootstrap-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    </body>
</html>
