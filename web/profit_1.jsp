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

            <div class="container-fluid mt-3">
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-1">
                            <div class="card-body">
                                <h3 class="card-title text-white">Products Sold</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white">${productsold}</h2>
                                    <p class="text-white mb-0">${date}</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-shopping-cart"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-2">
                            <div class="card-body">
                                <h3 class="card-title text-white">Net Profit</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white">$ 8541</h2>
                                    <p class="text-white mb-0">Jan - March 2019</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-money"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-3">
                            <div class="card-body">
                                <h3 class="card-title text-white">Total Employee</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white">${countem}</h2>
                                    <p class="text-white mb-0">Jan - March 2019</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-users"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card gradient-4">
                            <div class="card-body">
                                <h3 class="card-title text-white">Customer Total</h3>
                                <div class="d-inline-block">
                                    <h2 class="text-white">99%</h2>
                                    <p class="text-white mb-0">Jan - March 2019</p>
                                </div>
                                <span class="float-right display-5 opacity-5"><i class="fa fa-heart"></i></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body pb-0 d-flex justify-content-between">
                                        <div style="display: block;" id="totalweek">
                                            <div class="row">
                                            <h4 class="mb-1">Product Sales</h4>
                                            <a  href="searchprofit">
                                     <span style=" border-radius: 50%;height: 50px;width: 100px;font-size: 20px;margin-left: 1294px;" class="badge-primary px-4">Search</span>
                                        </a>
                                            </div>
                                            <p>Total Earnings of the Week</p>
                                            <h3 class="m-0">$${totalweek}</h3>
                                            
                                        </div>
                                        <div style="display: none;" id="totalmoth">
                                            <h4 class="mb-1">Product Sales</h4>
                                            <p>Total Earnings of the Moth</p>
                                            <h3 class="m-0">$${totalmoth}</h3>
                                           <a href="#">
                                     <span class="badge badge-primary px-2">Search</span>
                                        </a>
                                        </div>
                                        <div>
                                                <ul>
                                          
                                                    <li class="d-inline-block mr-3"><a onclick="week()" class="text-dark">Week</a></li>
                                                    <li class="d-inline-block"><a onclick="moth()"class="text-dark">Month</a></li>
                                                    
                                                </ul>
                                            </div>
                                    </div>
                                        
                                    
                                    <div class="chart-wrapper">
                                        <!--<canvas id="chart_widget_2"></canvas>-->
                             <input type="hidden" id="thu2"

                                           value="${thu2}"
                                               name="">
                             <input type="hidden" id="thu3"

                                          value="${thu3}"
                                               name="">
                             <input type="hidden" id="thu4"

                                           value="${thu4}"
                                               name="">
                             <input type="hidden" id="thu5"

                                            value="${thu5}"
                                               name="">
                             <input type="hidden" id="thu6"

                                           value="${thu6}"
                                               name="">
                             <input type="hidden" id="thu7"

                                           v value="${thu7}"
                                               name="">
                             <input type="hidden" id="cn"

                                           value="${cn}"
                                               name="">
                             
                             
                             
                             
                             <input type="hidden" id="thang1"

                                           value="${thang1}"
                                               name="">
                             <input type="hidden" id="thang2"

                                          value="${thang2}"
                                               name="">
                             <input type="hidden" id="thang3"

                                           value="${thang3}"
                                               name="">
                            <input type="hidden" id="thang4"

                                           value="${thang4}"
                                               name="">
                             <input type="hidden" id="thang5"

                                            value="${thang5}"
                                               name="">
                             <input type="hidden" id="thang6"

                                           value="${thang6}"
                                               name="">
                             <input type="hidden" id="thang7"

                                           v value="${thang7}"
                                               name="">
                             <input type="hidden" id="thang8"

                                           value="${thang8}"
                                               name="">
                             <input type="hidden" id="thang9"

                                           value="${thang9}"
                                               name="">
                             <input type="hidden" id="thang9"

                                           value="${thang9}"
                                               name="">
                             <input type="hidden" id="thang10"

                                           value="${thang10}"
                                               name="">
                             <input type="hidden" id="thang11"

                                           value="${thang11}"
                                               name="">
                             <input type="hidden" id="thang12"

                                           value="${thang12}"
                                               name="">
                                          
                                  <canvas style="display: block;" id="lineChart" width="500" height="250"></canvas>
                                  <canvas style="display: none;"  id="lineChart2" width="500" height="250"></canvas>
                           
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                                               <script>
                                                     function week() {

                                      document.getElementById("lineChart").style.display = "block";
                                      document.getElementById("lineChart2").style.display = "none";
                                      document.getElementById("totalweek").style.display = "block";
                                         document.getElementById("totalmoth").style.display = "none";
                            }
                                                     function moth() {

                                      document.getElementById("lineChart").style.display = "none";
                                      document.getElementById("lineChart2").style.display = "block";
                                      document.getElementById("totalweek").style.display = "none";
                                   document.getElementById("totalmoth").style.display = "block";
                            }
                                               </script>
                

                <div class="row">
                    <div style=" " class="col-lg-6 col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Order Summary</h4>
                                      <input type="hidden" id="productnametoday"

                                           value=" <c:forEach items="${listtoday}" var="b">${b.productname},</c:forEach>"
                                               name="">
                            <input type="hidden" id="productquantitytoday"

                                           value=" <c:forEach items="${listtoday}" var="b">${b.quantity},</c:forEach>"
                                               name="">
                            
                                </div>
                                               <div width="900" height="" class="chart-wrapper">
                          
                                <canvas id="singelBarChart"  width="500" height="250"></canvas>
                                 
                            </div>
                            </div>
                            
                        </div>    
                        <div class="col-lg-6 col-md-6">
                            <div class="card card-widget">
                                <div class="card-body">
                                    <h5 class="text-muted">Order Overview </h5>
                                    <h2 class="mt-4">5680</h2>
                                    <span>Total Revenue</span>
                                    <div class="mt-4">
                                        <h4>30</h4>
                                        <h6>Online Order <span class="pull-right">30%</span></h6>
                                        <div class="progress mb-3" style="height: 7px">
                                            <div class="progress-bar bg-primary" style="width: 30%;" role="progressbar"><span class="sr-only">30% Order</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-4">
                                        <h4>50</h4>
                                        <h6 class="m-t-10 text-muted">Offline Order <span class="pull-right">50%</span></h6>
                                        <div class="progress mb-3" style="height: 7px">
                                            <div class="progress-bar bg-success" style="width: 50%;" role="progressbar"><span class="sr-only">50% Order</span>
                                            </div>
                                        </div>
                                    </div>
                                   
                                </div>
                            </div>
                            
                        </div>
<!--                        <div class="col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body px-0">
                                    <h4 class="card-title px-4 mb-3">Todo</h4>
                                    <div class="todo-list">
                                        <div class="tdl-holder">
                                            <div class="tdl-content">
                                                <ul id="todo_list">
                                                    <li><label><input type="checkbox"><i></i><span>Get up</span><a href='#' class="ti-trash"></a></label></li>
                                                    <li><label><input type="checkbox" checked><i></i><span>Stand up</span><a href='#' class="ti-trash"></a></label></li>
                                                    <li><label><input type="checkbox"><i></i><span>Don't give up the fight.</span><a href='#' class="ti-trash"></a></label></li>
                                                    <li><label><input type="checkbox" checked><i></i><span>Do something else</span><a href='#' class="ti-trash"></a></label></li>
                                                </ul>
                                            </div>
                                            <div class="px-4">
                                                <input type="text" class="tdl-new form-control" placeholder="Write new item and hit 'Enter'...">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>-->
            </div>
                
                <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>Table Invoice</h4>
                                </div>
                                <div class="col-lg-6">
                                     <span class="badge badge-primary px-2">All</span>
                                    </div>
                                    
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <!--<th>#</th>-->
                                                <th>InvoiceID</th>
                                                <th>CreatedDate</th>
                                                <th>EmployeeID</th>
                                                <th>CustomerID</th>
                                                <th>Detail</th>  
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listI}" var="o">
                                            <tr>
                                                <th>${o.invoiceID}</th>
                                                <td>${o.createdDate}</td>
                                                <td><a href="DetailEmployee?sid=${o.employeeID}" >${o.employeeID}</a>
                                                </td>
                                                <td><a href="DetailCustomer?sid=${o.customerID}" >${o.customerID}</td>
                                                <td class="color-primary"><a href="Bill?sid=${o.invoiceID}" >Details</a></td>
                                            </tr>
                                            </c:forEach>
                                        
                                       </tbody>
                                    </table>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                 
                    <!-- /# column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>Table Product</h4>
                                </div>
                                <div class="col-lg-6">
                                     <span class="badge badge-primary px-2">All</span>
                                    </div>
                                    
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>Status</th>
                                                <th>Date</th>
                                                <th>Price</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th>1</th>
                                                <td>Kolor Tea Shirt For Man</td>
                                                <td><span class="badge badge-primary px-2">Sale</span>
                                                </td>
                                                <td>January 22</td>
                                                <td class="color-primary">$21.56</td>
                                            </tr>
                                            <tr>
                                                <th>2</th>
                                                <td>Kolor Tea Shirt For Women</td>
                                                <td><span class="badge badge-danger px-2">Tax</span>
                                                </td>
                                                <td>January 30</td>
                                                <td class="color-success">$55.32</td>
                                            </tr>
                                            <tr>
                                                <th>3</th>
                                                <td>Blue Backpack For Baby</td>
                                                <td><span class="badge badge-success px-2">Extended</span>
                                                </td>
                                                <td>January 25</td>
                                                <td class="color-danger">$14.85</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>Table Customer</h4>
                                </div>
                                <div class="col-lg-6">
                                     <span class="badge badge-primary px-2">All</span>
                                    </div>
                                    
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Name</th>
                                                <th>Status</th>
                                                <th>Date</th>
                                                <th>Price</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th>1</th>
                                                <td>Kolor Tea Shirt For Man</td>
                                                <td><span class="badge badge-primary px-2">Sale</span>
                                                </td>
                                                <td>January 22</td>
                                                <td class="color-primary">$21.56</td>
                                            </tr>
                                            <tr>
                                                <th>2</th>
                                                <td>Kolor Tea Shirt For Women</td>
                                                <td><span class="badge badge-danger px-2">Tax</span>
                                                </td>
                                                <td>January 30</td>
                                                <td class="color-success">$55.32</td>
                                            </tr>
                                            <tr>
                                                <th>3</th>
                                                <td>Blue Backpack For Baby</td>
                                                <td><span class="badge badge-success px-2">Extended</span>
                                                </td>
                                                <td>January 25</td>
                                                <td class="color-danger">$14.85</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title"> Table Employees</h4>
                                <div class="table-responsive">
                                    <div class="col-lg-6"><a>
                                     <span class="badge badge-primary px-2">All</span>
                                        </a>
                                    </div>
                                    
                                    <table class="table header-border">
                                        <thead>
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">First Name</th>
                                                <th scope="col">Last Name</th>
                                                <th scope="col">User Name</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th>1</th>
                                                <td>Jacklyn</td>
                                                <td>G.Bearden</td>
                                                <td>@jacklyn</td>
                                            </tr>
                                            <tr>
                                                <th>2</th>
                                                <td>Nancy</td>
                                                <td>J. Daniels</td>
                                                <td>@daniels</td>
                                            </tr>
                                            <tr>
                                                <th>3</th>
                                                <td>Betty</td>
                                                <td>R. Christensen</td>
                                                <td>@betty</td>
                                            </tr>
                                            <tr>
                                                <th>4</th>
                                                <td>Lucinda</td>
                                                <td>D. Sears</td>
                                                <td>@lucinda</td>
                                            </tr>
                                            <tr>
                                                <th>5</th>
                                                <td>William</td>
                                                <td>T. Marks</td>
                                                <td>@william.marks</td>
                                            </tr>
                                        </tbody>
                                    </table>
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
 <script>
     var ctx = document.getElementById("lineChart");
      var thu2 = $("#thu2").val();
      var thu3 = $("#thu3").val();
      var thu4 = $("#thu4").val();
      var thu5 = $("#thu5").val();
      var thu6 = $("#thu6").val();
      var thu7 = $("#thu7").val();
      var cn = $("#cn").val();
//            console.log(thu2);
    ctx.height = 150;
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
            datasets: [
                {
                    label: "ProductSale",
                    borderColor: "rgba(144,	104,	190,.9)",
                    borderWidth: "1",
                    backgroundColor: "rgba(117, 113, 249,1)",
                    data: [thu2, thu3, thu4, thu5, thu6, thu7, cn]
                },
                
            ]
        },
        options: {
            responsive: true,
            tooltips: {
                mode: 'index',
                intersect: false
            },
            hover: {
                mode: 'nearest',
                intersect: true
            }

        }
    });
     var productnametoday = $("#productnametoday").val();
                var splitbslabel = productnametoday.substring(0, productnametoday.length - 1);
                var productnametoday = splitbslabel.split(",");
                 productnametoday[0] = productnametoday[0].substring(1, productnametoday[0].length-1);
        
    var productquantitytoday = $("#productquantitytoday").val();
                var splitbslabe2 = productquantitytoday.substring(0, productquantitytoday.length - 1);
                var productquantitytoday = splitbslabe2.split(",");
                  productquantitytoday[0] = productquantitytoday[0].substring(1, productquantitytoday[0].length);
                for (var i = 0, max = productnametoday.length; i < max; i++) {
                            if(productnametoday[i].length>9){
                                productnametoday[i] = productnametoday[i].substring(0, productnametoday[0].length-5)+"...";
}
                     
}
//                console.log(productnametoday);
//                console.log(productquantitytoday);
  var ctx = document.getElementById("singelBarChart");
//            console.log(thu2);
    ctx.height = 250;
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: productnametoday,
            datasets: [
                {
                    label: "ProductSale",
                    borderColor: "rgba(144,	104,	190,.9)",
                    borderWidth: "1",
                    backgroundColor: "rgba(117, 113, 249,1)",
                    data: productquantitytoday
                },
                
            ]
        },
        options: {
            responsive: true,
            tooltips: {
                mode: 'index',
                intersect: false
            },
            hover: {
                mode: 'nearest',
                intersect: true
            }

        }
    });
    </script>
 <script>
     var ctx = document.getElementById("lineChart2");
      var th1 = $("#thang1").val();
      var th2 = $("#thang2").val();
      var th3 = $("#thang3").val();
      var th4 = $("#thang4").val();
      var th5 = $("#thang5").val();
      var th6 = $("#thang6").val();
      var th7 = $("#thang7").val();
      var th8 = $("#thang8").val();
      var th9 = $("#thang9").val();
      var th10 = $("#thang10").val();
      var th11 = $("#thang11").val();
      var th12 = $("#thang12").val();
//            console.log(th2);
//            console.log(th4);
//            console.log(th5);
//            console.log(th6);
    ctx.height = 150;
    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ["January", "February", "March", "April", "May", "June", "July","August","September","October","November","December"],
            datasets: [
                {
                    label: "ProductSale",
                    borderColor: "rgba(144,	104,	190,.9)",
                    borderWidth: "1",
                    backgroundColor: "rgba(117, 113, 249,1)",
                    data: [th1, th2, th3, th4, th5, th6, th7,th8,th9,th10,th11,th12]
                },
                
            ]
        },
        options: {
            responsive: true,
            tooltips: {
                mode: 'index',
                intersect: false
            },
            hover: {
                mode: 'nearest',
                intersect: true
            }

        }
    });

    </script>
</body>

</html>