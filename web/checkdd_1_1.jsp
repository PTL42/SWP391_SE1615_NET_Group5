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

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div style="padding: 0 20%; margin-top: 10px ">
                <c:if test="${ha==1}">
                    <div class="alert alert-primary alert-dismissible fade show" role="alert">
                        <strong>Note:</strong> <span font-weight-semi-bold text-capitalize style="color: black">Update2 Success</span>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
            </div>
            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>Edit Employees Salary</h4>
                                    <a href="">Edit Salary</a>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <h2>Date:${date3}</h2>
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>IMG</th>
                                                <th>Name</th>
                                                <th>SalaryToday</th>
                                                <th>From</th>
                                                <th>To</th>
                                                <th>State</th>
                                                <th>TotalWorking</th>
                                                <th>Total</th>


                                            </tr>
                                        </thead>



                                        <form action="editsalary" method="post">  
                                            <c:forEach items="${listem}" var="e">
                                                <tr>
                                                    <th>${e.employeeID}</th>
                                                    <td><img width="50" height="50" src="${e.img}"></td>
                                                    <td>${e.employeeName}</td>
                                                    <td><input style="width:70px" name="id" type="hidden"  value="${e.employeeID}">
                                                        <input style="width:70px" name="quantity" type="number" step=0.01 value="${e.salary}"></td>
                                                    <td>${e.from}</td>

                                                    <td>
                                                       ${e.to}
                                                    </td>
                                                    <td>
                                                      
                                                
                                                        <i  class="fa fa-circle-o text-warning  mr-2" value="${e.state}" ${e.state== 0 ? '' : 'style="display: none"'}>Pending</i>
                                                        <i class="fa fa-circle-o text-success  mr-2" value="${e.state}" ${e.state== 1 ? '' : 'style="display: none"'}>Paid</i>

                                                   

                                                </td>
                                                    <td>${e.totalwork}</td>
                                                    <td>${e.salarytotal}</td>

                                                </tr>
                                            </c:forEach>

                                    </table>
                                    <div class="form-group row">
                                        <div class="col-lg-8 ml-auto">
                                            <button type="submit" name="submit" class="btn btn-primary" id="toastr-success-top-right">Submit</button>
                                        </div>
                                    </div>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- /# column -->

                <!-- /# column -->


            </div>

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

    </body>

</html>