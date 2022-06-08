<%-- 
    Document   : new-product
    Created on : Jun 6, 2022, 1:27:06 PM
    Author     : ADMIN
--%>

<%@page import="java.time.LocalDate"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Product Page</title>
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
            }

            body{
                background-color: rgb(85, 200, 228);
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }

            .editTableSearch{
                margin-top: 20px;
                margin-bottom: 40px;
            }
        </style>
    </head>
    <body>

        <!--Navbar-->
        <nav class="navTop navbar navbar-expand-lg navbar-light bg-light mb-5">
            <div class="container">
                <div class="col-5">
                    <ul class="navbar-nav my-lg-0 navbar-nav-scroll" style="max-height: 100px;">
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
                            <a class="nav-link" href="CreateCakeController">
                                <i class="fa-solid fa-circle-plus"></i>
                                New Product
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="editTableSearch">
            <div class="text-center">
                <h2>${CREATE_PRODUCT_MSG_FAILED}</h2>
            </div>
            <div class="d-flex justify-content-center shadow-lg p-3 bg-body rounded container w-50">
                <div class="wrapper  w-75 mt-auto">
                    <div class="wrapper-header text-center">
                        <div class="d-flex flex-col justify-content-center">
                            <p>
                                <i class="fa-solid fa-cookie"></i>
                                New Product
                            </p>
                        </div>
                    </div>
                    <div class="wrapper-content">
                        <form method="POST" action="MainController" enctype="multipart/form-data">
                            <div class="form-group mt-3">
                                <label>Product Name</label>
                                <input type="text" placeholder="Cake name ex: Giày thể thao" value="${txtCakeName}" pattern="[^!@#$%^&*()_+]{0,}" name="txtProductName" required="" class="form-control">
                            </div>
                            <div class="form-group mt-3">
                                <label>Description</label>
                                <input type="text" placeholder="Description ex: Luôn tạo cho bạn một sự thoải mái nhất mỗi khi đi trên chân." value="${txtDescription}" pattern="[^!@#$%^&*()_+]{0,}" name="txtDescription" class="form-control">
                            </div>
                            <div class="form-group mt-3">
                                <label>Category</label>
                                <select name="selectCategory" class="form-control">
                                    <option value="0">SELECT CATEGORY</option>
                                    <c:forEach items="${LIST_CATEGORY}" var="category">
                                        <option value="${category.categoryId}" ${category.getCategoryId() == searchedCategoryID ? 'selected' : ''}>${category.typeCategory}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group mt-3">
                                <label>Sale Price</label>
                                <input type="number" min="1000" step="1000" value="${txtSalePrice}" name="txtSalePrice" placeholder="Price" required="" class="form-control">
                            </div>
                            <div class="form-group mt-3">
                                <label>Import Price</label>
                                <input type="number" min="1000" step="1000" value="${txtImportPrice}" name="txtImportPrice" placeholder="Price" required="" class="form-control">
                            </div>

                            <div class="form-group mt-3">
                                <label>Import Date</label>
                                <input type="date" placeholder="Import Date" value="${txtImportDate}" name="txtImportDate"
                                       required=""  min="<%=LocalDate.now()%>" class="form-control">
                            </div>

                            <div class="form-group mt-3">
                                <label>Quantity</label>
                                <input type="number" placeholder="Quantity" value="${txtQuantity}" min="1" step="1" required="" name="txtQuantity" class="form-control">
                            </div>

                            <div class=" form-group mt-3 img-thumbnail">
                                <img class="rounded mx-auto d-block" id="uploadPreview" style="width: 50%; height: 35%;" />
                                <input id="uploadImage" type="file" name="inputImage" value="${image}" onchange="PreviewImage();" />
                            </div>
                            <div class="mt-5 btn d-flex justify-content-center">
                                <input class="btn w-75 btn-lg btn-outline-dark" type="submit" name="btnAction" value="New Product">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">

            function PreviewImage() {
                var oFReader = new FileReader();
                oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);

                oFReader.onload = function (oFREvent) {
                    document.getElementById("uploadPreview").src = oFREvent.target.result;
                };
            }
            ;
        </script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

    </body>
</html>
