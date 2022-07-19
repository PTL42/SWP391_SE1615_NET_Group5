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
                                <strong>Note:</strong> <span font-weight-semi-bold text-capitalize style="color: black">CheckAttended Success</span>
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
                                        <h4>Table Check Attend</h4>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <h2>Date:${date3}</h2>
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>IMG</th>
                                                    <th>Name</th>
                                                    <th>Status</th>


                                                </tr>
                                            </thead>



                                            <form action="salary" method="post">  
                                                <c:forEach items="${listem}" var="e">
                                                    <tr>
                                                        <th>${e.employeeID}</th>
                                                        <td><img width="50" height="50" src="${e.img}"></td>
                                                        <td>${e.employeeName}</td>
                                                        <td>
                                                              <input type="radio"  name="check${e.employeeID}"  ${e.day != null ? 'checked' : ''} value="attended${e.employeeID}">
                                                              <label  class="badge badge-primary px-2" for="attended">Attended</label><br>
                                                              <input type="radio" name="check${e.employeeID}"   ${e.day == null ? 'checked' : ''} value="absent${e.employeeID}">
                                                              <label class="badge badge-danger px-2" for="absent">Absent</label><br>
                                                        </td>
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