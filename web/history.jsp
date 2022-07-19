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
            Preloader start
        ********************-->
        <div id="preloader">
            <div class="loader">
                <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
                </svg>
            </div>
        </div>
        <!--*******************
            Preloader end
        ********************-->


        <!--**********************************
            Main wrapper start
        ***********************************-->
        <div id="main-wrapper">

            <!--**********************************
                Nav header start
            ***********************************-->
            <div class="nav-header">
                <div class="brand-logo">
                    <a href="MainController">
                        <b class="logo-abbr"><img src="images/logo.png" alt=""> </b>
                        <span class="logo-compact"><img src="./images/logo-compact.png" alt=""></span>
                        <span class="brand-title">
                            <img src="images/logo-text.png" alt="">
                        </span>
                    </a>
                </div>
            </div>
            <!--**********************************
                Nav header end
            ***********************************-->

            <!--**********************************
                Header start
            ***********************************-->
            <div class="header">    
                <div class="header-content clearfix">

                    <div class="nav-control">
                        <div class="hamburger">
                            <span class="toggle-icon"><i class="icon-menu"></i></span>
                        </div>
                    </div>
                    <div class="header-left">
                        <div class="input-group icons">
                            <div class="input-group-prepend">
                                <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
                            </div>
                            <input type="search" class="form-control" placeholder="Search Dashboard" aria-label="Search Dashboard">
                            <div class="drop-down animated flipInX d-md-none">
                                <form action="#">
                                    <input type="text" class="form-control" placeholder="Search">
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="header-right">
                        <ul class="clearfix">
                            <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                    <i class="mdi mdi-email-outline"></i>
                                    <span class="badge badge-pill gradient-1">3</span>
                                </a>
                                <div class="drop-down animated fadeIn dropdown-menu">
                                    <div class="dropdown-content-heading d-flex justify-content-between">
                                        <span class="">3 New Messages</span>  
                                        <a href="javascript:void()" class="d-inline-block">
                                            <span class="badge badge-pill gradient-1">3</span>
                                        </a>
                                    </div>
                                    <div class="dropdown-content-body">
                                        <ul>
                                            <li class="notification-unread">
                                                <a href="javascript:void()">
                                                    <img class="float-left mr-3 avatar-img" src="images/avatar/1.jpg" alt="">
                                                    <div class="notification-content">
                                                        <div class="notification-heading">Saiful Islam</div>
                                                        <div class="notification-timestamp">08 Hours ago</div>
                                                        <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li class="notification-unread">
                                                <a href="javascript:void()">
                                                    <img class="float-left mr-3 avatar-img" src="images/avatar/2.jpg" alt="">
                                                    <div class="notification-content">
                                                        <div class="notification-heading">Adam Smith</div>
                                                        <div class="notification-timestamp">08 Hours ago</div>
                                                        <div class="notification-text">Can you do me a favour?</div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <img class="float-left mr-3 avatar-img" src="images/avatar/3.jpg" alt="">
                                                    <div class="notification-content">
                                                        <div class="notification-heading">Barak Obama</div>
                                                        <div class="notification-timestamp">08 Hours ago</div>
                                                        <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <img class="float-left mr-3 avatar-img" src="images/avatar/4.jpg" alt="">
                                                    <div class="notification-content">
                                                        <div class="notification-heading">Hilari Clinton</div>
                                                        <div class="notification-timestamp">08 Hours ago</div>
                                                        <div class="notification-text">Hello</div>
                                                    </div>
                                                </a>
                                            </li>
                                        </ul>

                                    </div>
                                </div>
                            </li>
                            <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                    <i class="mdi mdi-bell-outline"></i>
                                    <span class="badge badge-pill gradient-2">3</span>
                                </a>
                                <div class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
                                    <div class="dropdown-content-heading d-flex justify-content-between">
                                        <span class="">2 New Notifications</span>  
                                        <a href="javascript:void()" class="d-inline-block">
                                            <span class="badge badge-pill gradient-2">5</span>
                                        </a>
                                    </div>
                                    <div class="dropdown-content-body">
                                        <ul>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                                    <div class="notification-content">
                                                        <h6 class="notification-heading">Events near you</h6>
                                                        <span class="notification-text">Within next 5 days</span> 
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                                    <div class="notification-content">
                                                        <h6 class="notification-heading">Event Started</h6>
                                                        <span class="notification-text">One hour ago</span> 
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                                    <div class="notification-content">
                                                        <h6 class="notification-heading">Event Ended Successfully</h6>
                                                        <span class="notification-text">One hour ago</span>
                                                    </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                                    <div class="notification-content">
                                                        <h6 class="notification-heading">Events to Join</h6>
                                                        <span class="notification-text">After two days</span> 
                                                    </div>
                                                </a>
                                            </li>
                                        </ul>

                                    </div>
                                </div>
                            </li>
                            <li class="icons dropdown d-none d-md-flex">
                                <a href="javascript:void(0)" class="log-user"  data-toggle="dropdown">
                                    <span>English</span>  <i class="fa fa-angle-down f-s-14" aria-hidden="true"></i>
                                </a>
                                <div class="drop-down dropdown-language animated fadeIn  dropdown-menu">
                                    <div class="dropdown-content-body">
                                        <ul>
                                            <li><a href="javascript:void()">English</a></li>
                                            <li><a href="javascript:void()">Dutch</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                            <li class="icons dropdown">
                                <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                                    <span class="activity active"></span>
                                    <img src="images/user/1.png" height="40" width="40" alt="">
                                </div>
                                <div class="drop-down dropdown-profile animated fadeIn dropdown-menu">
                                    <div class="dropdown-content-body">
                                        <ul>
                                            <li>
                                                <a href="app-profile.html"><i class="icon-user"></i> <span>Profile</span></a>
                                            </li>
                                            <li>
                                                <a href="javascript:void()">
                                                    <i class="icon-envelope-open"></i> <span>Inbox</span> <div class="badge gradient-3 badge-pill gradient-1">3</div>
                                                </a>
                                            </li>

                                            <hr class="my-2">
                                            <li>
                                                <a href="page-lock.html"><i class="icon-lock"></i> <span>Lock Screen</span></a>
                                            </li>
                                            <c:choose>
                                                <c:when test="${empty ROLE}">
                                                    <li><a href="login.jsp"><i class="icon-key"></i> <span>Login</span></a></li>
                                                    </c:when>
                                                    <c:when test="${not empty ROLE}">
                                                    <form action="MainController" method="POST">
                                                        <li class="d-grid gap-2">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <button style="border: none; outline: none; background: none;">
                                                                        <input type="hidden" name="btnAction" value="Logout">
                                                                        <i class="icon-key"></i> <span style="padding-left: 5px;color: #0d6efd">Logout</span>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        <li/>
                                                    </form>
                                                </c:when>
                                            </c:choose> 
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!--**********************************
                Header end ti-comment-alt
            ***********************************-->

            <!--**********************************
                Sidebar start
            ***********************************-->
            <div class="nk-sidebar">           
                <div class="nk-nav-scroll">
                    <ul class="metismenu" id="menu">
                        <li class="nav-label">Dashboard</li>
                        <li>
                            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <i class="icon-speedometer menu-icon"></i><span class="nav-text">Dashboard</span>
                            </a>
                            <ul aria-expanded="false">
                                <form action="MainController" method="POST">
                                    <c:if test="${ not empty ROLE}">
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
                                    </c:if>
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
                        </li>
                    </ul>
                </div>
            </div>
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
                                            <div class="col-3"><h4>Product Name</h4></div>
                                            <div class="col-3"><h4>Product Image</h4></div>
                                            <div class="col-1"><h4>Brand</h4></div>
                                            <div class="col-1"><h4>Quantity</h4></div>
                                            <div class="col-2"><h4>Unit Price</h4></div>
                                        </div>
                                        <div class="row ">
                                            <c:forEach items="${LIST_ORDER}" varStatus="count" var="order" >
                                                STT: ${count.count}
                                                <c:forEach items="${order.orderDetails}" var="orderDetail" varStatus="count">
                                                    <div class="ms-2 rounded-4 shadow p-3 mb-5 bg-body rounded ">
                                                        <div class="row">
                                                            <div class="col-2"><h5>${order.orderDate}</h5></div>
                                                            <div class="col-3"><h6>${orderDetail.productName}</h6></div>
                                                            <div class="col-3 mt-1 mb-1">
                                                                <form action="MainController" method="POST">
                                                                    <button style="border: none;outline: none;background: none; color: #0080ff">
                                                                        <input type="hidden" name="btnAction" value="Display History Details">
                                                                        <input name="txtOrderDetailsID" type="hidden" value="${orderDetail.orderDetailsId}">
                                                                        <img src="${context}/${orderDetail.productImage}" style="width: 200px;">
                                                                    </button>
                                                                </form>
                                                            </div>
                                                            <div class="col-1"><h6>${orderDetail.typeCategory}</h6></div>
                                                            <div class="col-1"><h6>${orderDetail.quantity}</h6></div>
                                                            <div class="col-2">
                                                                <h5>
                                                                    <fmt:setLocale value = "vi_VN"/>
                                                                    <fmt:formatNumber value = "${orderDetail.unitPrice}" type = "currency"/>
                                                                </h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
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