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
                    <a href="index.html">
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
                            <div class="drop-down   d-md-none">
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
                                    <span class="badge gradient-1 badge-pill badge-primary">3</span>
                                </a>
                                <div class="drop-down animated fadeIn dropdown-menu">
                                    <div class="dropdown-content-heading d-flex justify-content-between">
                                        <span class="">3 New Messages</span>  

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
                                    <span class="badge badge-pill gradient-2 badge-primary">3</span>
                                </a>
                                <div class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
                                    <div class="dropdown-content-heading d-flex justify-content-between">
                                        <span class="">2 New Notifications</span>  

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
                                <div class="drop-down dropdown-profile   dropdown-menu">
                                    <div class="dropdown-content-body">
                                        <ul>
                                            <li>
                                                <a href="app-profile.html"><i class="icon-user"></i> <span>Profile</span></a>
                                            </li>
                                            <li>
                                                <a href="email-inbox.html"><i class="icon-envelope-open"></i> <span>Inbox</span> <div class="badge gradient-3 badge-pill badge-primary">3</div></a>
                                            </li>

                                            <hr class="my-2">
                                            <li>
                                                <a href="page-lock.html"><i class="icon-lock"></i> <span>Lock Screen</span></a>
                                            </li>
                                            <li><a href="page-login.html"><i class="icon-key"></i> <span>Logout</span></a></li>
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
                                <li><a href="./index.html">Home 1</a></li>
                                <!-- <li><a href="./index-2.html">Home 2</a></li> -->
                            </ul>
                        </li>
                        <li class="mega-menu mega-menu-sm">
                            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <i class="icon-globe-alt menu-icon"></i><span class="nav-text">Layouts</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="./layout-blank.html">Blank</a></li>
                                <li><a href="./layout-one-column.html">One Column</a></li>
                                <li><a href="./layout-two-column.html">Two column</a></li>
                                <li><a href="./layout-compact-nav.html">Compact Nav</a></li>
                                <li><a href="./layout-vertical.html">Vertical</a></li>
                                <li><a href="./layout-horizontal.html">Horizontal</a></li>
                                <li><a href="./layout-boxed.html">Boxed</a></li>
                                <li><a href="./layout-wide.html">Wide</a></li>


                                <li><a href="./layout-fixed-header.html">Fixed Header</a></li>
                                <li><a href="layout-fixed-sidebar.html">Fixed Sidebar</a></li>
                            </ul>
                        </li>
                        <li class="nav-label">Apps</li>
                        <li>
                            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <i class="icon-envelope menu-icon"></i> <span class="nav-text">Email</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="./email-inbox.html">Inbox</a></li>
                                <li><a href="./email-read.html">Read</a></li>
                                <li><a href="./email-compose.html">Compose</a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">Apps</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="./app-profile.html">Profile</a></li>
                                <li><a href="./app-calender.html">Calender</a></li>
                            </ul>
                        </li>
                        <li>
                            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <i class="icon-graph menu-icon"></i> <span class="nav-text">Charts</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="./chart-flot.html">Flot</a></li>
                                <li><a href="./chart-morris.html">Morris</a></li>
                                <li><a href="./chart-chartjs.html">Chartjs</a></li>
                                <li><a href="./chart-chartist.html">Chartist</a></li>
                                <li><a href="./chart-sparkline.html">Sparkline</a></li>
                                <li><a href="./chart-peity.html">Peity</a></li>
                            </ul>
                        </li>
                        <li class="nav-label">UI Components</li>
                        <li>
                            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <i class="icon-grid menu-icon"></i><span class="nav-text">UI Components</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="./ui-accordion.html">Accordion</a></li>
                                <li><a href="./ui-alert.html">Alert</a></li>
                                <li><a href="./ui-badge.html">Badge</a></li>
                                <li><a href="./ui-button.html">Button</a></li>
                                <li><a href="./ui-button-group.html">Button Group</a></li>
                                <li><a href="./ui-cards.html">Cards</a></li>
                                <li><a href="./ui-carousel.html">Carousel</a></li>
                                <li><a href="./ui-dropdown.html">Dropdown</a></li>
                                <li><a href="./ui-list-group.html">List Group</a></li>
                                <li><a href="./ui-media-object.html">Media Object</a></li>
                                <li><a href="./ui-modal.html">Modal</a></li>
                                <li><a href="./ui-pagination.html">Pagination</a></li>
                                <li><a href="./ui-popover.html">Popover</a></li>
                                <li><a href="./ui-progressbar.html">Progressbar</a></li>
                                <li><a href="./ui-tab.html">Tab</a></li>
                                <li><a href="./ui-typography.html">Typography</a></li>
                                <!-- </ul>
                            </li>
                            <li>
                                <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                    <i class="icon-layers menu-icon"></i><span class="nav-text">Components</span>
                                </a>
                                <ul aria-expanded="false"> -->
                                <li><a href="./uc-nestedable.html">Nestedable</a></li>
                                <li><a href="./uc-noui-slider.html">Noui Slider</a></li>
                                <li><a href="./uc-sweetalert.html">Sweet Alert</a></li>
                                <li><a href="./uc-toastr.html">Toastr</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="widgets.html" aria-expanded="false">
                                <i class="icon-badge menu-icon"></i><span class="nav-text">Widget</span>
                            </a>
                        </li>
                        <li class="nav-label">Forms</li>
                        <li>
                            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <i class="icon-note menu-icon"></i><span class="nav-text">Forms</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="./form-basic.html">Basic Form</a></li>
                                <li><a href="./form-validation.html">Form Validation</a></li>
                                <li><a href="./form-step.html">Step Form</a></li>
                                <li><a href="./form-editor.html">Editor</a></li>
                                <li><a href="./form-picker.html">Picker</a></li>
                            </ul>
                        </li>
                        <li class="nav-label">Table</li>
                        <li>
                            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <i class="icon-menu menu-icon"></i><span class="nav-text">Table</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="./table-basic.html" aria-expanded="false">Basic Table</a></li>
                                <li><a href="./table-datatable.html" aria-expanded="false">Data Table</a></li>
                            </ul>
                        </li>
                        <li class="nav-label">Pages</li>
                        <li>
                            <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                                <i class="icon-notebook menu-icon"></i><span class="nav-text">Pages</span>
                            </a>
                            <ul aria-expanded="false">
                                <li><a href="./page-login.html">Login</a></li>
                                <li><a href="./page-register.html">Register</a></li>
                                <li><a href="./page-lock.html">Lock Screen</a></li>
                                <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">Error</a>
                                    <ul aria-expanded="false">
                                        <li><a href="./page-error-404.html">Error 404</a></li>
                                        <li><a href="./page-error-403.html">Error 403</a></li>
                                        <li><a href="./page-error-400.html">Error 400</a></li>
                                        <li><a href="./page-error-500.html">Error 500</a></li>
                                        <li><a href="./page-error-503.html">Error 503</a></li>
                                    </ul>
                                </li>
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
                                        <form action="ChangePass" method="post" class="mt-5 mb-3 login-input">
                                            <div class="form-group">
                                                <input type="password" class="form-control" name="passwordoder" placeholder="Password" >
                                            </div>
                                            <div class="form-group">
                                                <input type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,8}"  class="form-control" name="password" id="password" placeholder="New Password" required onChange="onChange()">
                                            </div>
                                            <div class="form-group">
                                                <input type="password" class="form-control" name="confirm"  id="confirm_password" placeholder="Confirm Password" required onChange="onChange()">
                                                <span id='message2'></span>
                                            </div>
                                            <h3>${requestScope.mess}</h3>
                                            <h1 id="haha">${requestScope.n}</h1>
                                            <div class="form-group row">
                                                <div class="col-lg-8 ml-auto">
                                                    <button  type="submit" name="submit" onclick="myfun()" class="btn btn-primary" id="confirmsave" >Reset</button>
                                                </div>
                                            </div>
                                        </form>
                                        <div id="message">
                                            <h3>Password must contain the following:</h3>
                                            <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
                                            <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
                                            <p id="number" class="invalid">A <b>number</b></p>
                                            <p id="length" class="invalid"> <b>8 characters</b></p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                                           
                    <div id="confirmsave1" class="">
                        <div  ${requestScope.n == 1 ? 'style="display:block;"' : 'style="display:none;"'} id="toast-container" class="toast-bottom-full-width">
                            <div class="toast toast-success" aria-live="polite" style="">
                                <div class="toast-progress" style="width: 18.6%;">
                                </div>
                                <button id="tat" type="button" class="toast-close-button" role="button" onclick="vip()">
                                    ×</button>
                                <div class="toast-title">Change password successfully</div>
                                <div class="toast-message">This Is Success Message</div></div>

                        </div>
                           <div ${requestScope.n == 0 ? 'style="display:block;"' : 'style="display:none;"'} id="toast-container" class="toast-bottom-full-width">
                       <div class="toast toast-error" aria-live="assertive" style="">
                           <div class="toast-progress" style="width: 35.76%;">
                               
                           </div>
                           <button type="button" class="toast-close-button" role="button" onclick="vip()">×</button>
                           <div class="toast-title">Password Old is wrong</div>
                           <div class="toast-message">This Is error Message</div>
                               
                       </div>
                    </div>
              
                    </div>
                    <script>
                        function myfun() {

                            document.getElementById("confirmsave1").style.display = "block";
                        }
                        function vip() {

                            document.getElementById("confirmsave1").style.display = "none";

                        }
                        function vip2() {

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
                <script>
                                    function onChange() {
                                        const password = document.querySelector('input[name=password]');
                                        const confirm = document.querySelector('input[name=confirm]');
                                        if (confirm.value === password.value) {
                                            confirm.setCustomValidity('');
                                        } else {
                                            confirm.setCustomValidity('Passwords do not match');
                                        }
                                    }
                </script>

                <script>
                    $('#password, #confirm_password').on('keyup', function () {
                        if ($('#password').val() == $('#confirm_password').val()) {
                            $('#message2').html('Matching').css('color', 'green');
                        } else
                            $('#message2').html('Not Matching').css('color', 'red');
                    });
                </script>
                </body>
                <style>
                    /* Style all input fields */
                    input {
                        width: 100%;
                        padding: 12px;
                        border: 1px solid #ccc;
                        border-radius: 4px;
                        box-sizing: border-box;
                        margin-top: 6px;
                        margin-bottom: 16px;
                    }

                    /* Style the submit button */
                    input[type=submit] {
                        background-color: #04AA6D;
                        color: white;
                    }

                    /* Style the container for inputs */
                    .container {
                        background-color: #f1f1f1;
                        padding: 20px;
                    }

                    /* The message box is shown when the user clicks on the password field */
                    #message {
                        display:none;
                        background: #f1f1f1;
                        color: #000;
                        position: relative;
                        padding: 20px;
                        margin-top: 10px;
                    }

                    #message p {
                        padding: 10px 35px;
                        font-size: 18px;
                    }

                    /* Add a green text color and a checkmark when the requirements are right */
                    .valid {
                        color: green;
                    }

                    .valid:before {
                        position: relative;
                        left: -35px;
                        content: "V";
                    }

                    /* Add a red text color and an "x" when the requirements are wrong */
                    .invalid {
                        color: red;
                    }

                    .invalid:before {
                        position: relative;
                        left: -35px;
                        content: "X";
                    }
                </style>
                <script>
                    var myInput = document.getElementById("password");
                    var letter = document.getElementById("letter");
                    var capital = document.getElementById("capital");
                    var number = document.getElementById("number");
                    var length = document.getElementById("length");

                    // When the user clicks on the password field, show the message box
                    myInput.onfocus = function () {
                        document.getElementById("message").style.display = "block";
                    }

                    // When the user clicks outside of the password field, hide the message box
                    myInput.onblur = function () {
                        document.getElementById("message").style.display = "none";
                    }

                    // When the user starts to type something inside the password field
                    myInput.onkeyup = function () {
                        // Validate lowercase letters
                        var lowerCaseLetters = /[a-z]/g;
                        if (myInput.value.match(lowerCaseLetters)) {
                            letter.classList.remove("invalid");
                            letter.classList.add("valid");
                        } else {
                            letter.classList.remove("valid");
                            letter.classList.add("invalid");
                        }

                        // Validate capital letters
                        var upperCaseLetters = /[A-Z]/g;
                        if (myInput.value.match(upperCaseLetters)) {
                            capital.classList.remove("invalid");
                            capital.classList.add("valid");
                        } else {
                            capital.classList.remove("valid");
                            capital.classList.add("invalid");
                        }

                        // Validate numbers
                        var numbers = /[0-9]/g;
                        if (myInput.value.match(numbers)) {
                            number.classList.remove("invalid");
                            number.classList.add("valid");
                        } else {
                            number.classList.remove("valid");
                            number.classList.add("invalid");
                        }

                        // Validate length
                        if (myInput.value.length >= 8) {
                            length.classList.remove("invalid");
                            length.classList.add("valid");
                        } else {
                            length.classList.remove("valid");
                            length.classList.add("invalid");
                        }
                    }
                </script>

                </body>

                </html>