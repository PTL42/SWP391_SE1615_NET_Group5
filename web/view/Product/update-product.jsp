<%-- 
    Document   : update-product
    Created on : Jun 6, 2022, 1:54:48 PM
    Author     : ADMIN
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet">
        <!--cdn of bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/9d281e3188.js" crossorigin="anonymous"></script>

        <title>Update Product</title>
        <style>
            *{
                font-family: cursive;
                margin: 0%;
                padding: 0%;
            }
            body{
                background-color:rgb(85, 200, 228);
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
            .navTop{
                top: 0;
                width: 100%;
                position: fixed;
                z-index: 99;
            }
            .editContent{
                margin: 120px 0 40px 0;

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
                            <a class="nav-link" href="AddProductController">
                                <i class="fa-solid fa-circle-plus"></i>
                                New Product
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div style="padding: 0 20%">
            <c:if test="${UPDATE_CAKE_MSG_FAILED!=null}">
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                    <strong>Note:</strong> ${UPDATE_CAKE_MSG_FAILED}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
        </div>
        <div class="editContent">
            <div class="d-flex justify-content-center shadow-lg p-3 bg-body rounded container w-50">
                <div class="wrapper w-75 mt-auto">
                    <div class="wrapper-header text-center">
                        <div class="d-flex flex-col justify-content-center">
                            <p>
                                <i class="fa-solid fa-cookie"></i>
                                UPDATE PRODUCT (ID = ${PRODUCT_DETAIL.productId})
                            </p>
                        </div>
                    </div>
                    <div class="wrapper-content">
                        <form method="POST" action="MainController" enctype="multipart/form-data">
                            <input type="hidden" name="txtProductID" value="${PRODUCT_DETAIL.productId}">
                            <div class="form-group mt-3">
                                <label>Product Name</label>
                                <input type="text" placeholder="Product Name" value="${PRODUCT_DETAIL.productName}" name="txtProductName" required="" class="form-control">
                            </div>

                            <div class="form-group mt-3">
                                <label>Description</label>
                                <input type="text" value="${PRODUCT_DETAIL.description}" placeholder="Description" name="txtDescription" class="form-control">
                            </div>

                            <div class="form-group mt-3">
                                <label>Sale Price</label>
                                <input type="number" min="1000" step="1000" value="${PRODUCT_DETAIL.salePrice}" name="txtSalePrice" placeholder="Price" required="" class="form-control">
                            </div>

                            <div class="form-group mt-3">
                                <label>Import Price</label>
                                <input type="number" min="1000" step="1000" value="${PRODUCT_DETAIL.importPrice}" name="txtImportPrice" placeholder="Price" required="" class="form-control">
                            </div>

                            <div class="form-group mt-3">
                                <label>Category</label>
                                <select name="selectCategory" class="form-control">
                                    <option value="0">SELECT CATEGORY</option>
                                    <c:forEach items="${LIST_CATEGORY}" var="category">
                                        <option value="${category.categoryId}" ${category.getCategoryId() == PRODUCT_DETAIL.category.categoryId ? 'selected' : ''}>${category.typeCategory}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group mt-3">
                                <label>Quantity</label>
                                <input type="number" value="${PRODUCT_DETAIL.quantity}" placeholder="Quantity" min="0" step="1" required="" name="txtQuantity" class="form-control">
                            </div>

                            <div class="form-group mt-3">
                                <label>Status</label>
                                <div id="main">
                                    <select class="form-control" name="txtStatus">
                                        <c:if test="${PRODUCT_DETAIL.status == true}">
                                            <option value="true">visible</option>
                                            <option value="false">invisible</option>
                                        </c:if>
                                        <c:if test="${PRODUCT_DETAIL.status != true}">
                                            <option value="false">invisible</option>
                                            <option value="true">visible</option>
                                        </c:if>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group mt-3">
                                <label>Import Date</label>
                                <input type="date" value="${PRODUCT_DETAIL.importDate}" required="" placeholder="Import Date" name="txtImportDate" class="form-control" max="<%=LocalDate.now()%>">
                            </div>

                            <c:set var="context" value="${pageContext.request.contextPath}" />
                            <div class="form-group mt-3 img-thumbnail">
                                <img class="rounded mx-auto d-block" id="uploadPreview" src="${context}/${PRODUCT_DETAIL.productImage}" style="width: 50%; height: 35%;" />
                                <input id="uploadImage" type="file" name="inputImage" value="${image}" onchange="PreviewImage();" />
                            </div>
                            <div class="mt-5 btn d-flex justify-content-center">
                                <input class="btn w-75 btn-lg btn-outline-dark" type="submit" name="btnAction" value="Update Product">
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    </body>
</html>