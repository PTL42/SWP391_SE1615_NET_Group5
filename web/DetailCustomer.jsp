
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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

      <div ${ROLE == 'ADMIN' ? '':'style="display: none"'}>
            <%@include file="vip/function.jsp" %>
        </div>
        <div ${ROLE == 'EMPLOYEES' ? '':'style="display: none"'}>
            <%@include file="vip/functionemp.jsp" %>
        </div>
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
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                        </ol>
                    </div>
                </div>
                <!-- row -->

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-4 col-xl-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="media align-items-center mb-4">
                                        <img class="mr-3" src="${pr.img}" width="80" height="80" alt="">
                                        <div class="media-body">
                                            <h3 class="mb-0" value >${pr.customerName}</h3>
                                            <p class="text-muted mb-0">${pr.adress}</p>
                                        </div>
                                    </div>




                                    <p class="text-muted"></p>
                                    <ul class="card-profile__info">
                                        <li class="mb-1"><strong class="text-dark mr-4">Mobile</strong> <span>${pr.phone}</span></li>
                                        <li><strong class="text-dark mr-4">Email</strong> <span>${pr.email}</span></li>
                                        <li><strong class="text-dark mr-4">User Name:</strong> <span>${pr.username}</span></li>

                                    </ul>
                                    <form action="HomeController?do=ListInvoice" method="post">

                                        <button type="submit" class="btn btn-primary" >Back</button>
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

</html>