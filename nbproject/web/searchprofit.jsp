<%@page import="java.time.LocalDate"%>
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
    <link href="./plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet">
    <!-- Page plugins css -->
    <link href="./plugins/clockpicker/dist/jquery-clockpicker.min.css" rel="stylesheet">
    <!-- Color picker plugins css -->
    <link href="./plugins/jquery-asColorPicker-master/css/asColorPicker.css" rel="stylesheet">
    <!-- Date picker plugins css -->
    <link href="./plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet">
    <!-- Daterange picker plugins css -->
    <link href="./plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
    <link href="./plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <link href="css/style.css" rel="stylesheet">

</head>

<body>

    <!--*******************
        Preloader start
    ********************-->
<!--
        ********************-->-->
          <%@include file="vip/Panner.jsp" %>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
        <%@include file="vip/function.jsp" %>

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
                    <div class="col-12">
                        <!-- Card -->
                       
                        <!-- Card -->
                        <div class="card">
                            <div class="card-body">
                                <form class="form-valide" action="searchprofit" method="post">
                                <div class="row">
                                    <div class="col-md-8">
                                  
                                        <div class="example">
                                            <h5 class="box-title m-t-30">Date Range picker</h5>
                                         
                                            <div class="input-daterange input-group" id="date-range">
                                                <input min="<%= LocalDate.now()%>" type="text" class="form-control min-date" name="start" value="${start}"> <span class="input-group-addon bg-info b-0 text-white">to</span>
                                                <input type="text" class="form-control" name="end" value="${end}"  min="<%= LocalDate.now()%>">
                                              
                                            </div>
                                           
                                        </div>
                                         
                                    </div>
                                       <div class="col-md-4">
                                           <input style="margin-bottom: -50px"  class="form-control input-rounded" type="submit" name="submit" value="Search">
                                       
                                       </div>
                                       <div class="col-md-2">
                                           <a class="form-control input-rounded" href="searchprofit">All</a>
                                       
                                       </div>
                                    
                                </div>
                                </form>
                            </div>
                        </div>
                           <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body pb-0 d-flex justify-content-between">
                                        <div style="display: block;" id="totalweek">
                                            <h4 class="mb-1">Product Sales</h4>
                                            <p></p>
                                            <h3 class="m-0">Date:${start} to ${end}</h3>
                                        </div>
                                        <div style="display: none;" id="totalmoth">
                                            <h4 class="mb-1">Product Sales</h4>
                                            <p>Total Earnings of the Moth</p>
                                            <h3 class="m-0">$${totalmoth}</h3>
                                        </div>
                                        <div>
                                            
                                            </div>
                                    </div>
                                        
                                    
                                    <div class="chart-wrapper">
                                        <!--<canvas id="chart_widget_2"></canvas>-->
                          
                                            <input type="hidden" id="productnametoday"

                                           value=" <c:forEach items="${listsearch}" var="b">${b.productname},</c:forEach>"
                                               name="">
                            <input type="hidden" id="productquantitytoday"

                                           value=" <c:forEach items="${listsearch}" var="b">${b.quantity},</c:forEach>"
                                               name="">
                                  <canvas style="display: block;" id="singelBarChart" width="900" height="300"></canvas>
                                
                           
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                                               <script>
                                     
                            
                                               </script>
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

    <script src="./plugins/moment/moment.js"></script>
    <script src="./plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
    <!-- Clock Plugin JavaScript -->
    <script src="./plugins/clockpicker/dist/jquery-clockpicker.min.js"></script>
    <!-- Color Picker Plugin JavaScript -->
    <script src="./plugins/jquery-asColorPicker-master/libs/jquery-asColor.js"></script>
    <script src="./plugins/jquery-asColorPicker-master/libs/jquery-asGradient.js"></script>
    <script src="./plugins/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"></script>
    <!-- Date Picker Plugin JavaScript -->
    <script src="./plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <!-- Date range Plugin JavaScript -->
    <script src="./plugins/timepicker/bootstrap-timepicker.min.js"></script>
    <script src="./plugins/bootstrap-daterangepicker/daterangepicker.js"></script>

    <script>
    (function($) {
    "use strict"


    // MAterial Date picker
    $('#mdate').bootstrapMaterialDatePicker({
        weekStart: 0,
        time: false
    });
    $('#timepicker').bootstrapMaterialDatePicker({
        format: 'HH:mm',
        time: true,
        date: false
    });
    $('#date-format').bootstrapMaterialDatePicker({
        format: 'dddd DD MMMM YYYY - HH:mm'
    });

    $('#min-date').bootstrapMaterialDatePicker({
        format: 'DD/MM/YYYY HH:mm',
        minDate: new Date()
    });
    // Clock pickers
    $('#single-input').clockpicker({
        placement: 'bottom',
        align: 'left',
        autoclose: true,
        'default': 'now'
    });
    $('.clockpicker').clockpicker({
        donetext: 'Done',
    }).find('input').change(function() {
        console.log(this.value);
    });
    
    $('#check-minutes').click(function(e) {
        // Have to stop propagation here
        e.stopPropagation();
        input.clockpicker('show').clockpicker('toggleView', 'minutes');
    });
    if (/mobile/i.test(navigator.userAgent)) {
        $('input').prop('readOnly', true);
    }
    // Colorpicker
    $(".colorpicker").asColorPicker();
    $(".complex-colorpicker").asColorPicker({
        mode: 'complex'
    });
    $(".gradient-colorpicker").asColorPicker({
        mode: 'gradient'
    });
    // Date Picker
    jQuery('.mydatepicker, #datepicker').datepicker();
    jQuery('#datepicker-autoclose').datepicker({
        autoclose: true,
        todayHighlight: true
    });
    jQuery('#date-range').datepicker({
        toggleActive: true
    });
    jQuery('#datepicker-inline').datepicker({
        todayHighlight: true
    });
    // Daterange picker
    $('.input-daterange-datepicker').daterangepicker({
        buttonClasses: ['btn', 'btn-sm'],
        applyClass: 'btn-danger',
        cancelClass: 'btn-inverse'
    });
    $('.input-daterange-timepicker').daterangepicker({
        timePicker: true,
        format: 'MM/DD/YYYY h:mm A',
        timePickerIncrement: 30,
        timePicker12Hour: true,
        timePickerSeconds: false,
        buttonClasses: ['btn', 'btn-sm'],
        applyClass: 'btn-danger',
        cancelClass: 'btn-inverse'
    });
    $('.input-limit-datepicker').daterangepicker({
        format: 'MM/DD/YYYY',
        minDate: '06/01/2015',
        maxDate: '06/30/2015',
        buttonClasses: ['btn', 'btn-sm'],
        applyClass: 'btn-danger',
        cancelClass: 'btn-inverse',
        dateLimit: {
            days: 6
        }
    });

















})(jQuery);
    </script>
    <script src="./plugins/chart.js/Chart.bundle.min.js"></script>
    <!-- Circle progress -->
    <!--<script src="./plugins/circle-progress/circle-progress.min.js"></script>-->
<script>
  
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
           console.log(productnametoday);
               console.log(productquantitytoday);
  var ctx = document.getElementById("singelBarChart");
//            console.log(thu2);
    ctx.height = 150;
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
 
</body>

</html>