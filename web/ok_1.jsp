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
        <link href="./plugins/toastr/css/toastr.min.css" rel="stylesheet">
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
         <c:if test="${ROLE == 'ADMIN'}">
            
         <%@include file="vip/function.jsp" %>
        
        </c:if>
         <c:if test="${ROLE != 'ADMIN'}">
            
             <%@include file="vip/functionemp.jsp" %>
        
        </c:if>
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
                                        <img class="mr-3" src="${sessionScope.emp.img}" width="80" height="80" alt="">
                                        <div class="media-body">
                                            <h3 class="mb-0">${sessionScope.emp.employeeName}</h3>
                                            <p class="text-muted mb-0"></p>
                                        </div>
                                    </div>



                                    <ul class="card-profile__info">
                                        <li class="mb-1"><strong class="text-dark mr-4">Mobile</strong> <span>${sessionScope.emp.phone}</span></li>
                                        <li><strong class="text-dark mr-4">Email</strong> <span>${sessionScope.emp.phone}</span></li>
                                    </ul>
                                </div>
                            </div>  
                        </div>
                        <div class="col-lg-8 col-xl-9">
                            <div class="card">
                                <div class="card-body">
                                    <div class="form-validation">
                                        <form class="form-valide" action="EditProfile" method="post">

                                            <div class="form-group row">
                                                <label class="col-lg-4 col-form-label" for="val-username">Full Name <span class="text-danger">*</span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <input type="text" class="form-control" id="val-username" name="name" value="${profile.employeeName}" placeholder="Enter a name..">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-4 col-form-label" for="val-email">Email <span class="text-danger">*</span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <input type="text" class="form-control" id="val-email" name="val-email" value="${profile.email}" placeholder="Your valid email..">
                                                </div>
                                            </div>


                                            <div class="form-group row">
                                                <label class="col-lg-4 col-form-label" for="val-skill">Gender <span class="text-danger">*</span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <select  class="form-control" id="val-skill" name="val-skill">

                                                        <option value="${profile.gender}" ${profile.gender == 1 ? 'selected="selected"' : ''}>Male</option>
                                                        <option value="${profile.gender}" ${profile.gender == 0 ? 'selected="selected"' : ''}>Female</option>

                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">

                                                <label class="col-lg-4 col-form-label" for="val-phoneus">DOB <span class="text-danger">*</span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <input type="date" class="form-control" id="val-currency" value="${profile.dob}" name="dob" placeholder="">
                                                </div>
                                            </div>


                                            <div class="form-group row">
                                                <label class="col-lg-4 col-form-label" for="val-phoneus">Phone (US) <span class="text-danger">*</span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <input type="text" class="form-control" id="val-phoneus" name="val-phoneus" value="${profile.phone}" placeholder="212-999-0000">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-lg-4 col-form-label" for="val-digits">Username <span class="text-danger">*</span>
                                                </label>
                                                <div class="col-lg-6">
                                                    <input type="text" readonly="" class="form-control" id="val-digits" name="val-digits" value="${profile.username}" placeholder="5">
                                                </div>
                                            </div>


                                            <div class="form-group row">

                                                <label class="col-lg-4 col-form-label" for="val-digits">Image<span class="text-danger">*</span>
                                                </label>
                                                <div class="col-lg-6">



                                                    <div class="form-group note-group-image-url" style="overflow:auto;">
                                                        <label>Image URL</label>
                                                        <input name="files" class="note-image-url form-control col-md-12" type="text" value="${profile.img}">
                                                    </div>
                                                </div>   
                                            </div>


                                            <div class="form-group row">
                                                <div class="col-lg-8 ml-auto">
                                                    <button  type="submit" name="submit" onclick="myfun()" class="btn btn-primary" id="confirmsave" >Submit</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div id="confirmsave1" class="selection_bubble_root" ${requestScope.n == 1 ? 'style="display:block;"' : 'style="display:none;"'}>
                        <div id="toast-container" class="toast-bottom-full-width">
                            <div class="toast toast-success" aria-live="polite" style="">
                                <div class="toast-progress" style="width: 18.6%;">
                                </div>
                                <button id="tat" type="button" class="toast-close-button" role="button" onclick="vip()">
                                    ×</button>
                                <div class="toast-title">Edit Successful.</div>
                                <div class="toast-message">This Is Success Message</div></div>

                        </div>
                    </div>

                    <script>
                        function myfun() {

                            document.getElementById("confirmsave1").style.display = "block";
                        }
                        function vip() {

                            document.getElementById("confirmsave1").style.display = "none";

                        }
                        var thoiluong = 5;
                        setInterval(function () {
                            thoiluong--;
                            sophut = Math.floor(thoiluong / 60);
                            sogiay = thoiluong % 60;



                            if (thoiluong <= 0) {
                                thoiluong = 0;
                                document.getElementById("confirmsave1").style.display = "none";

                            }
                        }, 1000);
                    </script>

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

                <!-- Toastr -->


                </body>

                </html>