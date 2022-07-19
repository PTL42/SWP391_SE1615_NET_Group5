
<!DOCTYPE html>
<html>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <head>
        <link data-require="sweet-alert@*" data-semver="0.4.2" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Quixlab - Bootstrap Admin Dashboard Template by Themefisher.com</title>
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
        <!-- Custom Stylesheet -->
        <link href="./plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <!--        <div id="preloader">
                    <div class="loader">
                        <svg class="circular" viewBox="25 25 50 50">
                        <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
                        </svg>
                    </div>
                </div>-->
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

            <div class="content-body">

                <div class="row page-titles mx-0">
                    <div class="col p-md-0">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                            <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                        </ol>
                    </div>
                </div>

                <div class="container-fluid">

                    <div class="row">
                        <div class="col-7">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Product</h4>
                                    <div class="table-responsive">
                                        <form name="f" action="">
                                            <div class="row">     
                                                <!--<form name="f" action="">-->
                                                <c:forEach items="${list2}" var="o">

                                                    <div class="col-3  ">
                                                        <div class="card card-profile text-center">
                                                            <a href="addtocart3?id=${o.productID}"  style="cursor: pointer;">
                                                                <span class="mb-1 text-primary"><img src="${o.img}" height="60" width="60" alt=""></span>
                                                                <h3 class="mb-0"></h3>
                                                                <p class="text-muted px-4">${o.productName}</p>
                                                            </a>

                                                        </div>
                                                    </div>

                                                </c:forEach>  
                                                <!--                                                          </form>-->
                                            </div> 
                                        </form>

                                    </div>

                                </div>



                            </div>                       
                        </div>




                        <div class="col-lg-5">
                            <form autocomplete="off" action="HomePageEmployeeController">
                                <div class="autocomplete" style="width:300px;">
                                    <input id="myInput" type="text" name="myCountry" placeholder="Customer Name" value="${namecus}">
                                    <input type="hidden" id="bestsalelabel"

                                           value=" <c:forEach items="${listcus}" var="b">${b},</c:forEach>"
                                               name="">
                                           <input type="submit" name="Giu">
                                    </div>

                                </form>
                                <div class="card">
                                    <div class="card-body">

                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered zero-configuration">

                                                <thead>
                                                    <tr>
                                                        <th class="text-center gui_productname">Item Information <i
                                                                class="text-danger">*</i></th>
                                                        <th class="text-center invoice_fields">Batch No<i
                                                                class="text-danger">*</i></th>
                                                        <th class="text-center">Av. Qnty.</th>
                                                        <th class="text-center">Qnty <i
                                                                class="text-danger">*</i></th>
                                                        <th class="text-center">Rate <i class="text-danger">*</i>
                                                        </th>
                                                        <th class="text-center" style="width: 90px;">Dis %</th>
                                                        <th class="text-center invoice_fields">Dis. Value </th>

                                                        <th class="text-center">Total</th>
                                                        <th class="text-center">Action</th>
                                                    </tr>

                                                </thead>
                                            <c:forEach items="${cart}" var="o">
                                                <tr>
                                                    <td><img height="60" width="60" src="${o.value.product.img}"></td>
                                                    <td>${o.value.product.productName}</td>
                                                    <td>${o.value.quantity}</td>
                                                    <td>${o.value.product.price}</td>
                                                    <td>${o.value.quantity*o.value.product.price}</td>
                                                    <td>Delete</td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                        <h1>Total:</h1>
                                        <!-- row -->
                                        <form  id="from1">
                                            <button class="btn mb-1 btn-success">Save</button>
                                        </form> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="toast-container" class="toast-top-full-width">
                <div class="toast toast-success" aria-live="polite" style=""><div class="toast-progress" style="width: 2.6%;">
                    </div><button type="button" class="toast-close-button" role="button">×</button>
                    <div class="toast-title">Top Full Width</div><div class="toast-message">This Is Success Message</div>

                </div>
            </div>
            <script>
                document.querySelector('#from1').addEventListener('submit', function (e) {
                    var form = this;

                    e.preventDefault();

                    swal({
                        title: "Are you sure?",
                        text: "You will not be able to recover this imaginary file!",
                        icon: "warning",
                        buttons: [
                            'No, cancel it!',
                            'Yes, I am sure!'
                        ],
                        dangerMode: true,
                    }).then(function (isConfirm) {
                        if (isConfirm) {
                            swal({
                                title: 'Shortlisted!',
                                text: 'Candidates are successfully shortlisted!',
                                icon: 'success'
                            }).then(function () {
                                form.submit();
                            });
                        } else {
                            swal("Cancelled", "Your imaginary file is safe :)", "error");
                        }
                    });
                });
            </script>

            <style>
                .swal-button--confirm {
                    background-color: #DD6B55;
                }
            </style>
    </body>
    <script src="plugins/common/common.min.js"></script>
    <script src="js/custom.min.js"></script>
    <script src="js/settings.js"></script>
    <script src="js/gleek.js"></script>
    <script src="js/styleSwitcher.js"></script>
    <script src="./plugins/tables/js/jquery.dataTables.min.js"></script>
    <script src="./plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
    <script src="./plugins/tables/js/datatable-init/datatable-basic.min.js"></script>

    <style>


        /*the container must be positioned relative:*/
        .autocomplete {
            position: relative;
            display: inline-block;
        }

        input {
            border: 1px solid transparent;
            background-color: #f1f1f1;
            padding: 10px;
            font-size: 16px;
        }

        input[type=text] {
            background-color: #f1f1f1;
            width: 100%;
        }

        input[type=submit] {
            background-color: DodgerBlue;
            color: #fff;
            cursor: pointer;
        }

        .autocomplete-items {
            position: absolute;
            border: 1px solid #d4d4d4;
            border-bottom: none;
            border-top: none;
            z-index: 99;
            /*position the autocomplete items to be the same width as the container:*/
            top: 100%;
            left: 0;
            right: 0;
        }

        .autocomplete-items div {
            padding: 10px;
            cursor: pointer;
            background-color: #fff; 
            border-bottom: 1px solid #d4d4d4; 
        }

        /*when hovering an item:*/
        .autocomplete-items div:hover {
            background-color: #e9e9e9; 
        }

        /*when navigating through the items using the arrow keys:*/
        .autocomplete-active {
            background-color: DodgerBlue !important; 
            color: #ffffff; 
        }

    </style>
    <script>

                var bestslabel = $("#bestsalelabel").val();
                var splitbslabel = bestslabel.substring(0, bestslabel.length - 1);
                var bestsalelabel = splitbslabel.split(",");

                bestsalelabel[0] = bestsalelabel[0].substring(1, bestsalelabel[0].length);
                function autocomplete(inp, arr) {
                    /*the autocomplete function takes two arguments,
                     the text field element and an array of possible autocompleted values:*/
                    var currentFocus;
                    /*execute a function when someone writes in the text field:*/
                    inp.addEventListener("input", function (e) {
                        var a, b, i, val = this.value;
                        /*close any already open lists of autocompleted values*/
                        closeAllLists();
                        if (!val) {
                            return false;
                        }
                        currentFocus = -1;
                        /*create a DIV element that will contain the items (values):*/
                        a = document.createElement("DIV");
                        a.setAttribute("id", this.id + "autocomplete-list");
                        a.setAttribute("class", "autocomplete-items");
                        /*append the DIV element as a child of the autocomplete container:*/
                        this.parentNode.appendChild(a);
                        /*for each item in the array...*/
                        for (i = 0; i < arr.length; i++) {
                            /*check if the item starts with the same letters as the text field value:*/
                            if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
                                /*create a DIV element for each matching element:*/
                                b = document.createElement("DIV");
                                /*make the matching letters bold:*/
                                b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                                b.innerHTML += arr[i].substr(val.length);
                                /*insert a input field that will hold the current array item's value:*/
                                b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                                /*execute a function when someone clicks on the item value (DIV element):*/
                                b.addEventListener("click", function (e) {
                                    /*insert the value for the autocomplete text field:*/
                                    inp.value = this.getElementsByTagName("input")[0].value;
                                    /*close the list of autocompleted values,
                                     (or any other open lists of autocompleted values:*/
                                    closeAllLists();
                                });
                                a.appendChild(b);
                            }
                        }
                    });
                    /*execute a function presses a key on the keyboard:*/
                    inp.addEventListener("keydown", function (e) {
                        var x = document.getElementById(this.id + "autocomplete-list");
                        if (x)
                            x = x.getElementsByTagName("div");
                        if (e.keyCode == 40) {
                            /*If the arrow DOWN key is pressed,
                             increase the currentFocus variable:*/
                            currentFocus++;
                            /*and and make the current item more visible:*/
                            addActive(x);
                        } else if (e.keyCode == 38) { //up
                            /*If the arrow UP key is pressed,
                             decrease the currentFocus variable:*/
                            currentFocus--;
                            /*and and make the current item more visible:*/
                            addActive(x);
                        } else if (e.keyCode == 13) {
                            /*If the ENTER key is pressed, prevent the form from being submitted,*/
                            e.preventDefault();
                            if (currentFocus > -1) {
                                /*and simulate a click on the "active" item:*/
                                if (x)
                                    x[currentFocus].click();
                            }
                        }
                    });
                    function addActive(x) {
                        /*a function to classify an item as "active":*/
                        if (!x)
                            return false;
                        /*start by removing the "active" class on all items:*/
                        removeActive(x);
                        if (currentFocus >= x.length)
                            currentFocus = 0;
                        if (currentFocus < 0)
                            currentFocus = (x.length - 1);
                        /*add class "autocomplete-active":*/
                        x[currentFocus].classList.add("autocomplete-active");
                    }
                    function removeActive(x) {
                        /*a function to remove the "active" class from all autocomplete items:*/
                        for (var i = 0; i < x.length; i++) {
                            x[i].classList.remove("autocomplete-active");
                        }
                    }
                    function closeAllLists(elmnt) {
                        /*close all autocomplete lists in the document,
                         except the one passed as an argument:*/
                        var x = document.getElementsByClassName("autocomplete-items");
                        for (var i = 0; i < x.length; i++) {
                            if (elmnt != x[i] && elmnt != inp) {
                                x[i].parentNode.removeChild(x[i]);
                            }
                        }
                    }
                    /*execute a function when someone clicks in the document:*/
                    document.addEventListener("click", function (e) {
                        closeAllLists(e.target);
                    });
                }

                /*An array containing all the country names in the world:*/
                var countries = bestsalelabel;
                console.log(countries);

                /*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
                autocomplete(document.getElementById("myInput"), countries);
    </script>

</html>