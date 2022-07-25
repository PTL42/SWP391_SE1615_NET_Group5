<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
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
       <%@include file="vip/Panner.jsp" %>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
        <%@include file="vip/function.jsp" %>
        <!--**********************************
            <!--**********************************
                Header end ti-comment-alt
            ***********************************-->

            <!--**********************************
                Sidebar start
        
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
                        <c:if test="${not empty DATE_HISTORY_MSG}">
                            <div class="alert alert-primary alert-dismissible fade show" role="alert">
                                <strong>Note:</strong> <span font-weight-semi-bold text-capitalize style="color: black">${DATE_HISTORY_MSG}</span>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>
                    </div>
                    <div style="padding: 0 20%; margin-top: 10px ">
                        <c:if test="${not empty DATE_SMS}">
                            <div class="alert alert-primary alert-dismissible fade show" role="alert">
                                <strong>Note:</strong> <span font-weight-semi-bold text-capitalize style="color: black">${DATE_SMS}</span>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>
                    </div>
                    <div style="padding: 0 20%; margin-top: 10px ">
                        <c:if test="${LIST_ORDER != null}">
                            <c:if test="${empty LIST_ORDER}">
                                <div class="alert alert-primary alert-dismissible fade show" role="alert">
                                    <strong>Note:</strong> <span font-weight-semi-bold text-capitalize style="color: black">Oops! Not found product history</span>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                            </c:if>
                        </c:if>
                    </div>

                    <!--Search Product by parameter-->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="row">
                                <div class="col-12">
                                    <!--Search data-->
                                    <div class=" container mt-2 shadow-lg mb-5 p-3 bg-body rounded">
                                        <div class="text-center">
                                            <h3>History Order in Shopping Online </h3>
                                        </div>
                                        <div class="wrapper mt-2">
                                            <div class="wrapper-header">
                                                <p>SEARCH BY NAME PRODUCT</p>
                                            </div>
                                            <div class="wrapper-content">
                                                <form action="MainController" method="POST">
                                                    <div class="row">
                                                        <div class="col-9">
                                                            <div class="form-group">
                                                                <label>Name</label>
                                                                <input class="form-control" type="text" name="txtProductName" maxlength="50" value="${searchedProductByName}" placeholder="Search product by name">
                                                            </div>
                                                        </div>
                                                        <div class="col-3 mt-2">
                                                            <div class="form-group">
                                                                <label></label>
                                                                <div class="w-100">
                                                                    <button style="padding: 9px" class="btn w-100 btn btn-outline-dark" name="btnAction" value="Search Fill History Product">Search</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-6">
                                                            <div class="form-group">
                                                                <label>FROM DATE ORDER</label>
                                                                <input class="form-control" type="date" value="${txtFromDate}" name="txtFromDate"
                                                                       min="<%= LocalDate.now().minusYears(2)%>" max="<%= LocalDate.now()%>">
                                                            </div>
                                                        </div>
                                                        <div class="col-6">
                                                            <div class="form-group">
                                                                <label>TO DATE ORDER</label>
                                                                <input class="form-control" type="date" value="${txtToDate}" name="txtToDate"
                                                                       min="<%= LocalDate.now().minusYears(2)%> " max="<%= LocalDate.now()%>">
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

                    <c:if test="${LIST_ORDER != null}">
                        <c:if test="${not empty LIST_ORDER}">
                            <c:set var="context" value="${pageContext.request.contextPath}" />
                            <div class="row">
                                <div class="">
                                    <div class="row">
                                        <div class="row">
                                            <div class="col-2"><h4>Order Date</h4></div>
                                            <div class="col-2"><h4>Product Name</h4></div>
                                            <div class="col-2"><h4>Product Image</h4></div>
<!--                                            <div class="col-1"><h4>Brand</h4></div>-->
                                            <div class="col-1"><h4>Quantity</h4></div>
                                            <div class="col-2"><h4>Unit Price</h4></div>
                                            <div class="col-2"><h4>Status</h4></div>
                                        </div>
                                        <div class="row ">
                                            <c:forEach items="${LIST_ORDER}" varStatus="count" var="order" >
                                                STT: ${count.count}
                                               
                                                    <div class="ms-2 rounded-4 shadow p-3 mb-5 bg-body rounded ">
                                                        <div class="row">
                                                            <div class="col-2"><h5>${order.createDate}</h5></div>
                                                            <div class="col-2"><h6>${order.productName}</h6></div>
                                                            <div class="col-2 mt-1 mb-1">
                                                                <form action="MainController" method="POST">
                                                                    <button style="border: none;outline: none;background: none; color: #0080ff">
                                                                                       <input type="hidden" name="btnAction" value="Display History Details">
                                                                         <input name="txtOrderDetailsID" type="hidden" value="${order.invoiceId}">
                                                                        <img src="${order.img}" style="width: 200px;">
                                                                    </button>
                                                                </form>
                                                            </div>
                                                          
                                                            <div class="col-1"><h6>${order.quantity}</h6></div>
                                                            <div class="col-2">
                                                                <h5>
                                                                    <fmt:setLocale value = "vi_VN"/>
                                                                    <fmt:formatNumber value = "${order.price}" type = "currency"/>
                                                                </h5>
                                                            </div>
                                                               <div class="col-2"><h5>${order.status}</h5></div>
                                                        </div>
                                                    </div>
                                           
                                                <hr/>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                            <form action="MainController" method="POST">
                                <input type="hidden" id="deleteProductID" name="txtProductID">
                                <button type="submit" name="btnAction" value="Delete Product" class="btn btn-danger">Delete</button>
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
            document.getElementById("logoutLink").onclick = function () {
                document.getElementById("logoutForm").submit();
            };
        </script>
        <!--libraries of table-->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
        <!--libraries of bootstrap-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

    </body>

</html>