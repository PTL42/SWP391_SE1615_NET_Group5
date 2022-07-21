<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
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

       <%@include file="vip/Panner.jsp" %>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
        <%@include file="vip/function.jsp" %>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->

        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="HomeController">Home</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

           <div class="container-fluid">
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="form-validation">
                                    <h4>List Employee</h4>
                                </div>
                                    <form class="form-valide" action="SearchEmployee" method="post">
                                <div class="form-group row">
                                    <div class="align-center col-lg-6">
                                        <input type="text" maxlength="99" class="form-control" id="val-website" name="search" value="${search}">
                                    </div>
                                    <button type="summit" class="btn btn-primary" >Search</button>
                                </div>
                                </form>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Image</th>
                                                <th>Name</th>
                                                <th>Birthday</th>
                                                <th>Phone</th>
                                                <th>Gender</th>
                                                <th>Actions</th>
                                                <th>Actions</th>
                                                    
                                            </tr>
                                        </thead>
<!--                                        <c:forEach items="${ListP}" var="o">
-->                                            <tbody>
                                                <tr>
                                                    <th><img src="${o.img}" height="60" width="60" alt=""></th>
                                                    <td>${o.employeeName}</td>
                                                    <td>${o.dob}</td>
                                                    <td>${o.phone}</td>
                                                    <td class="color-primary">
                                                        <c:if test="${o.gender == 1}"> Male </c:if>
                                                        <c:if test="${o.gender == 0}"> Female </c:if>
                                                    </td>
                                                    <td><a href="UpdateEmployee?sid=${o.employeeID}">Update</a>    </td>
                                                    <td><a href="#" onclick="Myfuntion(${o.employeeID})">Delete</a></td>
                                                </tr>

                                            </tbody><!--
                                        </c:forEach> -->
                                    </table>
                                    <script>
                                        function Myfuntion(id){
                                            var op = confirm('Are you sure to delete');
                                            if(op=== true){
                                                window.location.href = 'DeleteEmployee?sid='+id;
                                            }
                                        }
                                    </script>
                                </div>

                            </div>
                        </div>
                    </div>              
                </div>
            </div>          
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