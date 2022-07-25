<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
        ********************-->
                      
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
                            <h3>Welcome - ${USER}</h3>
                        </c:if>
                    </div>

                    <!--Alter message-->
                    <div style="padding: 0 20%; margin-top: 10px ">
                        <c:if test="${not empty CHECK_OUT_MSG}">
                            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                <strong>Note:</strong> <span font-weight-semi-bold text-capitalize style="color: black">${CHECK_OUT_MSG}</span>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>
                        <c:if test="${not empty CHECK_OUT_ERROR_MSG}">
                            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                <strong>Note:</strong> <span font-weight-semi-bold text-capitalize style="color: black">${CHECK_OUT_ERROR_MSG}</span>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>
                        <c:if test="${not empty REMOVE_PRODUCT_TO_CART}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <strong>Note:</strong> <span font-weight-semi-bold text-capitalize style="color: black">${REMOVE_PRODUCT_TO_CART}</span>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>
                    </div>

                    <!--Shopping cart -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="row">
                                <div class="col-12">
                                    <!--Your cart-->
                                    <div class=" container mt-2 shadow-lg mb-5 p-3 bg-body rounded">
                                        <div class="text-center">
                                            <h3>Your Cart</h3>
                                        </div>
                                        <div class="row">
                                            <div class="wrapper-header">
                                                <div class="wrapper-content">
                                                    <c:choose>
                                                        <c:when test="${empty CART}">
                                                            <h3 class="text-center mt-2">Your cart is empty <i class="fa-solid fa-face-frown-open"></i></h3>
                                                            </c:when>
                                                            <c:when test="${not empty CART}">
                                                                <c:set var="context" value="${pageContext.request.contextPath}" />
                                                            <table class="table text-center">
                                                                <thead>
                                                                    <tr>
                                                                        <th>No.</th>
                                                                        <th>Product Name</th>
                                                                        <th>Image</th>
                                                                        <th>Unit price</th>
                                                                        <th>Quantity</th>
                                                                        <th>Price</th>
                                                                        <th>Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <c:forEach items="${CART}" var="product" varStatus="count">
                                                                        <tr>
                                                                            <td>${count.count}</td>
                                                                            <td>${product.productName}</td>
                                                                            <td><img src="${product.img}" style="width: 150px;"></td>
                                                                            <td>$
                                                                                <fmt:setLocale value = "vi_VN"/>
                                                                                <fmt:formatNumber value = "${product.price}" type = "currency"/>
                                                                            </td>

                                                                            <td>
                                                                                <form action="MainController" method="POST">
                                                                                    <div class="row w-75">
                                                                                        <div class="col-8">
                                                                                            <input class="form-control" value="${product.productQuantity}" 
                                                                                                   type="number" min="1" maxlength="4" max="1024"
                                                                                                   oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                                                                   placeholder="quantity" name="txtQuantity" required="">
                                                                                        </div>
                                                                                        <div class="col-4">
                                                                                            <input type="hidden" name="txtProductID" value="${product.productID}">
                                                                                            <button type="submit" name="btnAction" value="Update Your Cart" class="btn btn-outline-success">Update</button>
                                                                                        </div>
                                                                                    </div>
                                                                                </form>
                                                                            </td>
                                                                            <td>
                                                                                <fmt:setLocale value = "vi_VN"/>
                                                                                <fmt:formatNumber value = "${product.price*product.productQuantity}" type = "currency"/>
                                                                            </td>
                                                                            <c:set var="totalPrice" value="${totalPrice+(product.price*product.productQuantity)}"/>
                                                                            <td>
                                                                                <button onclick="setIdForDeleteModal(${product.productID})" class="btn btn-outline-warning w-100" type="button" data-bs-toggle="modal" data-bs-target="#deleteModal">Remove</button>
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                        <c:if test="${not empty CART}">
                                            <div class="row">
                                                <div class="col">
                                                    <div>
                                                        <form action="MainController" method="POST">
                                                            <input type="hidden" name="txtTotalPrice" value="${totalPrice}"/>
                                                            <button class="btn w-75 btn-lg btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#confirmModal" type="button">Confirm Checkout</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

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
                            <h5 class="modal-title" id="exampleModalLabel">Remove product in your cart</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Are you want to remove this product?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">Close</button>
                            <form action="MainController" method="POST">
                                <input type="hidden" id="deleteProductID" name="txtProductID">
                                <button type="submit" name="btnAction" value="Delete Your Cart" class="btn btn-outline-danger">Delete</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!--information of user-->
            <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Input your information</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <c:if test="${not empty TYPE_SHIPPING}">
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    <strong>Note:</strong> <span font-weight-semi-bold text-capitalize style="color: black">${TYPE_SHIPPING}</span>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                            </c:if>
                            <form action="MainController" method="POST">
                                <div class="form-group">
                                    <label>Full Name</label>
                                    <input type="text" placeholder="FullName ex:(Nguyễn Văn a)" value="${USER}" name="txtFullName" required="" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Phone number</label>
                                    <input type="tel" placeholder="Phone number ex:(0832434244)" 
                                           type="number" min="1" maxlength="10"
                                           oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                           pattern="[0]{1}[0-9]{9}" name="txtPhoneNumber" required class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <input type="text" placeholder="Address Ex: (234 Phạn Văn Hớn)"
                                           type="number" min="1" maxlength="30"
                                           oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                           name="txtAddress" required class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Select Type</label>
                                    <select id="inputName" class="form-select" name="selectType" required aria-label="Disabled select example">
                                        <c:forEach items="${LIST_SHIPPER}" var="shipper">
                                        <option value="${shipper.shipperID}" selected>${shipper.companyName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="modal-footer">
                                    <input type="hidden" name="txtTotalPrice" value="${totalPrice}"/>
                                    <button type="submit" name="btnAction" type="submit" value="Check Out Your Cart" class="btn btn-dark">Confirm</button>
                                </div>
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
                                                                                    //   set id of product
                                                                                    function setIdForDeleteModal(productID) {
                                                                                        document.getElementById("deleteProductID").value = productID;
                                                                                    }
                                                                                    ;
        </script>
        <!--libraries of table-->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
        <!--libraries of bootstrap-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

    </body>

</html>