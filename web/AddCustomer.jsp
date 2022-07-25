
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <!--*******************
            Preloader start
        ********************-->
        
        <div ${ROLE == 'ADMIN' ? '':'style="display: none"'}>
            <%@include file="vip/function.jsp" %>
        </div>
        <div ${ROLE == 'EMPLOYEES' ? '':'style="display: none"'}>
            <%@include file="vip/functionemp.jsp" %>
        </div>
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
          <c:if test="${not empty add}">
                        <div class="alert alert-primary alert-dismissible fade show" role="alert">
                            <strong>Note:</strong> <span font-weight-semi-bold text-capitalize style="color: black">ADD SUCCESS</span>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>
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
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="form-validation">
                                        <form class="form-valide" action="AddCustomer" method="post">

                                            <div class="form-group row">
                                                <label class="col-lg-4 col-form-label" for="val-email"> Name <span class="text-danger">*</span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <input type="text" maxlength="30" class="form-control" id="val-email" name="prName"  required="Mustinput">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-4 col-form-label" for="val-password"> Address <span class="text-danger">*</span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <input type="text" maxlength="99" class="form-control" id="val-password" name="prAddress" required="">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-4 col-form-label" for="val-confirm-password"> Phone <span class="text-danger">*</span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <input type="text"  maxlength="99" class="form-control" id="val-confirm-password" name="phone" required="" >
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-lg-4 col-form-label" for="val-currency">Image <span class="text-danger">*</span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <input type="text"  maxlength="199" class="form-control" id="val-currency" name="Image" required="">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-4 col-form-label" for="val-website"> Username <span class="text-danger">*</span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <input type="text" maxlength="99" class="form-control" id="val-website" name="detail" required="">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-4 col-form-label" for="val-website"> Password <span class="text-danger">*</span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <input type="password" maxlength="99" class="form-control" id="val-website" name="pass" required="">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-4 col-form-label" for="val-phoneus"> Gmail <span class="text-danger">*</span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <input type="text" maxlength="99"  class="form-control" id="val-phoneus" name="email" required="">
                                                </div>
                                            </div>


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
                </div>
                <!-- #/ container -->
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

        <script src="./plugins/validation/jquery.validate.min.js"></script>
        <script src="./plugins/validation/jquery.validate-init.js"></script>

    </body>

</html>