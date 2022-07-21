<!DOCTYPE html>
<html lang="en">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Quixlab - Bootstrap Admin Dashboard Template by Themefisher.com</title>
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
        <!-- Pignose Calender -->
        <link href="./plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
        <!-- Chartist -->
        <link rel="stylesheet" href="./plugins/chartist/css/chartist.min.css">
        <link rel="stylesheet" href="./plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
        <!-- Custom Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

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

        <!-- edit -->


        <!-- end edit-->
        
        
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div style="padding: 0 20%; margin-top: 10px ">
                <c:if test="${k11==1}">
                    <div class="alert alert-primary alert-dismissible fade show" role="alert">
                        <strong>Note:</strong> <span font-weight-semi-bold text-capitalize style="color: black">Add Success</span>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
            </div>
            <div style="padding: 0 20%; margin-top: 10px ">
                <c:if test="${ k11==2}">
                    <div class="alert alert-primary alert-dismissible fade show" role="alert">
                        <strong>Note:</strong> <span font-weight-semi-bold text-capitalize style="color: black">Update Success</span>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
            </div>
            <div style="padding: 0 20%; margin-top: 10px ">
                <c:if test="${k11==3}">
                    <div class="alert alert-primary alert-dismissible fade show" role="alert">
                        <strong>Note:</strong> <span font-weight-semi-bold text-capitalize style="color: black">Delete Success</span>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
            </div>

            <div class="container-fluid mt-3">
                <c:if test="${sessionScope.n==1}">  <%@include file="vip/listinvoice.jsp" %></c:if>
                <c:if test="${sessionScope.n==2}">    <%@include file="vip/listproduct.jsp"%></c:if>
                <c:if test="${sessionScope.n==3}">    <%@include file="vip/listproduct.jsp"%></c:if>
                <c:if test="${sessionScope.n==5}">    <%@include file="vip/updateshippers.jsp"%></c:if>
                <c:if test="${sessionScope.n==6}">    <%@include file="vip/addshippers_1.jsp"%></c:if>
                <c:if test="${sessionScope.n==4}"> 
                    <td><a href="shippers?do=AddShippers"><span style="/* float: left; */height: 50px;width: 100px;font-size: 20px;margin-left: 1294px;" class="badge badge-primary px-2">Add Shippers</span></a>
                        <div class="container-fluid">

                            <div class="row">

                                <div class="col-lg-12">
                                    <form action="shippers" class="sign-in-form" method="POST">
                                        <input type="hidden" name="do" value="ListSearchShippers">
                                        <div class="row"> 
                                            <div class="col-5">
                                                <div class="form-group">
                                                    <input type="text" name="searchnshippers" class="form-control input-rounded" placeholder="Search Shippers" value="${searchnshippers}">
                                                </div>
                                            </div>
                                            <!--                                        <div class="col-5">
                                                                                        <div class="form-group" class="form-control input-rounded">
                                                                                            <select name="cate"  class="form-control input-rounded" class="form-control form-control-lg">
                                                                                                <option value="all" >Select Category</option>
                                            <c:forEach items="${listcate}" var="c">
                                                <option value="${c.categoryID}" ${c.categoryID== cate ? 'selected="selected"' : ''}>${c.categoryName}</option>

                                            </c:forEach>

                                        </select>
                                    </div>
                                </div>-->
                                            <div class="col-lg-2">
                                                <input  class="form-control input-rounded" type="submit" value="Search">
                                            </div>
                                        </div>
                                    </form>
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="card-title">
                                                <h4>Table Shippers</h4>
                                            </div>
                                            <div class="table-responsive">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th>ID</th>

                                                            <th>Company Name</th>
                                                            <th>Address</th>
                                                            <th>Phone</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${listS}" var="s">
                                                            <tr>

                                                                <th>${s.shipperID}</th>
                                                                <th>${s.companyName}</th>
                                                                <td>${s.address}</td>
                                                                <td>${s.phone}
                                                                </td>

                                                                <td>     <a href="shippers?do=updateShippers&ids=${s.shipperID}"><span class="badge badge-success px-2">Update</span></a>
                                                                    <a  onclick="return confirm('Are you sure you want to delete ?')" style="" xpath="1" href="shippers?do=DeleteShippers&ids=${s.shipperID}"><span class="badge badge-danger px-2">Delete</span></a>

                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </c:if>





                    <!--**********************************
                        Content body end
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

            <script src="./plugins/tables/js/jquery.dataTables.min.js"></script>
            <script src="./plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
            <script src="./plugins/tables/js/datatable-init/datatable-basic.min.js"></script>

            <script src="./js/dashboard/dashboard-1.js"></script>

    </body>

</html>