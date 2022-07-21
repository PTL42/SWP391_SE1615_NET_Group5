<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Search page</title>
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
        <!-- Pignose Calender -->
        <link href="./plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
        <!-- Chartist -->
        <link rel="stylesheet" href="./plugins/chartist/css/chartist.min.css">
        <link rel="stylesheet" href="./plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
        <!-- Custom Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

        <!--use library of jquery-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
        <link rel="stylesheet" href="jquery.back-to-top.css">

        <!--cdn of bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/9d281e3188.js" crossorigin="anonymous"></script>
    </head>

    <body>

        <!--*******************
            Preloader start
                
        <%@include file="vip/Panner.jsp" %>
            
            <!--**********************************
                Header end ti-comment-alt
            ***********************************-->

            <!--**********************************
                Sidebar start
            ***********************************-->
            
            <%@include file="vip/function.jsp" %>
           
            <!--**********************************
                Sidebar end
            ***********************************-->

            <!--**********************************
                Content body start
            ***********************************-->
            <div class="content-body">
                <div class="container-fluid">
                    <div class="text-center">
                        <c:if test="${not empty USER}">
                            <h3>Welcome1 - ${USER}</h3>
                        </c:if>
                    </div>

                    <!--Alter message-->
                    <div style="padding: 0 20%; margin-top: 10px ">
                        <c:if test="${not empty UPDATE_PRODUCT_MSG_SUCCESS}">
                            <div class="alert alert-primary alert-dismissible fade show" role="alert">
                                <strong>Note:</strong> <span font-weight-semi-bold text-capitalize style="color: black">${UPDATE_PRODUCT_MSG_SUCCESS}</span>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>
                        <c:if test="${not empty CREATE_PRODUCT_MSG_SUCCESS}">
                            <div class="alert alert-primary alert-dismissible fade show" role="alert">
                                <strong>Note:</strong> <span class="font-weight-semi-bold text-capitalize"> ${CREATE_PRODUCT_MSG_SUCCESS} </span>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>
                        <c:if test="${not empty DELETE_PRODUCT_MSG}">
                            <div class="alert alert-primary alert-dismissible fade show" role="alert">
                                <strong>Note:</strong> <span class="font-weight-semi-bold text-capitalize">${DELETE_PRODUCT_MSG} </span>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>
                        <c:if test="${not empty DELETE_PRODUCT}">
                            <div class="alert alert-primary alert-dismissible fade show" role="alert">
                                <strong>Note:</strong> <span class="font-weight-semi-bold text-capitalize">${DELETE_PRODUCT} </span>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>
                        <c:if test="${not empty ADD_TO_CART_MSG}">
                            <div class="alert alert-primary alert-dismissible fade show" role="alert">
                                <strong>Note:</strong> <span class="font-weight-semi-bold text-capitalize">${ADD_TO_CART_MSG} </span>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>
                        <c:if test="${not empty CHECK_OUT_CART_MSG}">
                            <div class="alert alert-primary alert-dismissible fade show" role="alert">
                                <strong>Note:</strong> <span class="font-weight-semi-bold text-capitalize">${CHECK_OUT_CART_MSG} </span>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>
                    </div>

                    <!--Search Product by parameter-->
                    <c:if test="${ROLE == 'ADMIN'}">
                        <div class="row">
                            <div class="col-lg-12">
                                <form id="newProductForm" action="MainController" method="POST">
                                    <button class="btn btn-light border border-light">
                                        <input type="hidden" name="btnAction" value="New Product">
                                        <i class="fa-solid fa-file-circle-plus"></i>
                                    </button>
                                </form>
                            </div>
                            <div class="col-lg-12">
                                <div class="row">
                                    <div class="col-12">
                                        <!--Search data-->
                                        <div class=" container mt-2 shadow-lg mb-5 p-3 bg-body rounded">
                                            <div class="text-center">
                                                <h3>Search Product Shopping Online </h3>
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
                                                                    <input class="form-control" type="text" name="txtProductName" maxlength="150" value="${searchedProductByName}" placeholder="Search product by name">
                                                                </div>
                                                            </div>
                                                            <div class="col-3">
                                                                <div class="form-group">
                                                                    <label>Category</label>
                                                                    <select name="selectCategory" class="form-control">
                                                                        <option value="0">SELECT CATEGORY</option>
                                                                        <c:forEach items="${LIST_CATEGORY}" var="category">
                                                                            <option class="dropdown-item" 
                                                                                    value="${category.categoryID}" ${category.categoryID == searchedCategoryID ? 'selected' : ''}>${category.categoryName}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-3 mt-2">
                                                                <div class="form-group">
                                                                    <label></label>
                                                                    <div class="w-100">
                                                                        <button style="padding: 9px" class="btn w-100 btn btn-outline-dark" name="btnAction" value="Search Product">Search</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--Display data in table-->
                        <c:if test="${LIST_PRODUCT != null}">
                            <c:if test="${not empty LIST_PRODUCT}">
                                <c:set var="context" value="${pageContext.request.contextPath}" />
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="active-member">
                                            <div class="table-responsive shadow-lg p-3 bg-body rounded text-center">
                                                <table id="table_product" class="table table-hover mb-0">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 10px">Product</th>
                                                            <th class="col-2">Product Image</th>
                                                            <th class="col-2">Description</th>
                                                          
                                                            <th>Sale Price</th>
                                                       
                                                            <th>Quantity</th>
                                                            <th>Cost</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${LIST_PRODUCT}" var="product">
                                                            <tr class="text-center">
                                                                <td>${product.productName}</td>
                                                                <td><img src="${product.img}" style="width: 150px;"></td>
                                                                <td>${product.description}</td>
   
                                                                <td>
                                                                    <fmt:setLocale value = "vi_VN"/>
                                                                    <fmt:formatNumber value = "${product.price}"/>$
                                                                </td>
                                                                
                                                                <td>${product.productQuantity}</td>
                                                                <td>
                                                                    <fmt:setLocale value = "vi_VN"/>
                                                                    <fmt:formatNumber value = "${product.cost}"/> $
                                                                </td>
                                                                <td>
                                                                    <div class="d-flex justify-content-evenly">
                                                                        <div class="d-grid gap-2 d-md-flex" role="group" aria-label="Button group with nested dropdown">
                                                                            <form action="MainController" method="POST">
                                                                                <button style="border: none;outline: none;background: none; color: #0080ff">
                                                                                    <input type="hidden" name="btnAction" value="Details Product">
                                                                                    <input name="txtProductID" type="hidden" value="${product.productID}">
                                                                                    <i class="fa-solid fa-file-pen"></i>
                                                                                </button>
                                                                            </form>
                                                                            <a title="Delete product" href="javascript:{}" onclick="setIdForDeleteModal(${product.productID})" data-bs-toggle="modal" data-bs-target="#deleteModal">
                                                                                <i class="fa-solid fa-trash-can"></i>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${empty LIST_PRODUCT}">
                                <h3 class="text-center" style="color: black">Not found product <i class="fa-solid fa-face-frown-open"></i></h3>
                                </c:if>
                            </c:if>
                        </c:if>

                    <c:if test="${ROLE == 'CUSTOMER'}">
                        <div class="row">
                            <div class="col-2">
                                <h2>CATEGORY</h2>
                                <div class="row mt-5">
                                    <c:if test="${LIST_CATEGORY != null}">
                                        <c:if test="${not empty LIST_CATEGORY}">
                                             <option value="0">SELECT CATEGORY</option>
                                            <c:forEach items="${LIST_CATEGORY}" var="category">
                                                <form action="SearchProductController" method="POST">
                                                    <ul>
                                                        <li>
                                                            <input name="selectCategory" type="hidden" value="${category.categoryID}">
                                                            <button name="btnAction" value="Category" class="btn btn-outline-secondary w-100">
                                                                ${category.categoryName}
                                                            </button>
                                                        </li>
                                                    </ul>
                                                </form>
                                            </c:forEach>
                                        </c:if>
                                    </c:if>
                                </div>
                            </div>
                            <div class="col-10">
                                <h2 class="text-center">PRODUCT</h2>
                                <div class="row mb-5">
                                    <c:if test="${LIST_PRODUCT != null}">
                                        <c:if test="${not empty LIST_PRODUCT}">
                                            <c:set var="context" value="${pageContext.request.contextPath}" />
                                            <c:forEach items="${LIST_PRODUCT}" var="product">
                                                <div class="col-lg-3 col-md-6 mt-5 mb-4 mb-lg-0">
                                                    <div class="card rounded shadow-sm border-1">
                                                        <form action="MainController" method="POST">
                                                            <button style="border: none;outline: none;background: none; color: #0080ff">
                                                                <input type="hidden" name="btnAction" value="Details Product">
                                                                <input name="txtProductID" type="hidden" value="${product.productID}">
                                                                <img src="${product.img}" alt="" class="img-fluid d-block mx-auto mb-3" width="300px" height="150px">
                                                            </button>
                                                        </form>
                                                        <!--<h6 class="text-center" style="height: 35px;margin-bottom: 20px">${product.description}</h6>-->
                                                        <div class="row pe-3 ps-3">
                                                            <div class="mt-auto" >
                                                                <h7>${product.productName}</h7>
                                                            </div>
                                                            <div class="mt-1">
                                                                <strong>
                                                                    <fmt:setLocale value = "vi_VN"/>
                                                                    <fmt:formatNumber value = "${product.price}"/> $
                                                                </strong>
                                                            </div>
                                                        </div>
                                                        <form action="MainController" method="POST">
                                                            <div class="d-flex justify-content-center mt-3 mb-3">
                                                                <button class="btn btn-outline-dark">
                                                                    <input type="hidden" name="btnAction" value="Add To Cart">
                                                                    <input name="txtProductID" type="hidden" value="${product.productID}">
                                                                    ADD TO CART
                                                                </button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:if>
                                    </c:if>
                                </div> 
                            </div> 
                        </div>
                        <c:if test="${empty LIST_PRODUCT}">
                            <h3 class="text-center" style="color: black">Not found product <i class="fa-solid fa-face-frown-open"></i></h3>
                            </c:if>
                        </c:if>

                </div>
                <!-- #/ container -->
            </div>
            <!--**********************************
                Content body end
            ***********************************-->

            <!--**********************************
                Modal confirm message end
            ***********************************-->

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
                            <button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">Close</button>
                            <form action="MainController" method="POST">
                                <input type="hidden" id="deleteProductID" name="txtProductID">
                                <button type="submit" name="btnAction" value="Delete Product" class="btn btn-outline-danger">Delete</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <!--**********************************
                Modal confirm message end
            ***********************************-->

            <!--**********************************
                Footer start
            ***********************************-->
            <div class="footer">
                <div class="copyright">
                    <p>Copyright &copy; Designed & Developed by <a href="https://themeforest.net/user/quixlab">Quixlab</a> 2018</p>
                </div>
            </div>
            <!--**********************************
                Footer end
            ***********************************-->
        </div>
        <!--**********************************
            Main wrapper end
        ***********************************-->

        <!--**********************************
           Scripts
       ***********************************-->
        <script src="plugins/common/common.min.js"></script>
        <script src="js/custom.min.js"></script>
        <script src="js/settings.js"></script>
        <script src="js/gleek.js"></script>
        <script src="js/styleSwitcher.js"></script>

        <!-- Chartjs -->
        <script src="./plugins/chart.js/Chart.bundle.min.js"></script>
        <!-- Circle progress -->
        <script src="./plugins/circle-progress/circle-progress.min.js"></script>
        <!-- Datamap -->
        <script src="./plugins/d3v3/index.js"></script>
        <script src="./plugins/topojson/topojson.min.js"></script>
        <script src="./plugins/datamaps/datamaps.world.min.js"></script>
        <!-- Morrisjs -->
        <script src="./plugins/raphael/raphael.min.js"></script>
        <script src="./plugins/morris/morris.min.js"></script>
        <!-- Pignose Calender -->
        <script src="./plugins/moment/moment.min.js"></script>
        <script src="./plugins/pg-calendar/js/pignose.calendar.min.js"></script>
        <!-- ChartistJS -->
        <script src="./plugins/chartist/js/chartist.min.js"></script>
        <script src="./plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>
        <script src="./js/dashboard/dashboard-1.js"></script>

        <script type="text/javascript">
                                                                                   //            use jquery to check paging
                                                                                $(document).ready(function () {
                                                                                    $('#table_product').DataTable({
                                                                                        "pageLength": 10,
                                                                                        "searching": false,
                                                                                        "bLengthChange": false
                                                                                    });
                                                                                });
                                                                                //                                                                                        set id of product
                                                                                function setIdForDeleteModal(productID) {
                                                                                    document.getElementById("deleteProductID").value = productID;
                                                                                }
                                                                                //            button new product
                                                                                function newProductAutoSubmit() {
                                                                                    document.getElementById("newProductForm").submit();
                                                                                }
        </script>
        <!--libraries of table-->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
        <!--libraries of bootstrap-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

    </body>

</html>