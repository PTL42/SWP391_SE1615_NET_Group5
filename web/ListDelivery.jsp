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
                  <div style="padding: 0 20%; margin-top: 10px ">
                <c:if test="${ha==1}">
                    <div class="alert alert-primary alert-dismissible fade show" role="alert">
                        <strong>Note:</strong> <span font-weight-semi-bold text-capitalize style="color: black">${mess}</span>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
            </div>
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="form-validation">
                                    <h4>List Delivery</h4>
                                </div>
                                    <form class="form-valide" action="SearchDelivery" method="post">
                                <div class="form-group row">
                                    <div class="align-center col-lg-6">
                                        <input type="text" maxlength="99" class="form-control" id="val-website" name="search" value="${search}" >
                                    </div>
                                    <button type="summit" class="btn btn-primary" >Search</button>
                                </div>
                                </form>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                 <th>Code</th>
                                                <th>Name</th>
                                               <th>Phone</th>
                                               <th>Address</th>                                                                                                                                       
                                                <th>Status</th>
                                        
                                             
                                                    
                                            </tr>
                                        </thead>
                                        <c:forEach items="${List}" var="o">
                                            <tbody>
                                                <tr>
                                                  
                                                    
                                                    <td>${o.id}</td>
                                                    <td>${o.name}</td>
                                                    <td>${o.phone}</td>
                                                    <td>${o.address}</td>
                                                    <td>  <form action="ListDelivery" method="post"> 
                                                       
                                                          <input type="hidden" name="oid" value="${o.id}"  > 
                                                          
                                                      <select   name="stateid"  class="form-control input-rounded" class="form-control form-control-lg"  onchange="this.form.submit()">
                                                
                                                        <option class="fa fa-circle-o text-warning  mr-2" value="Not Shipped" ${o.status=='Not Shipped' ? 'selected="selected"' : ''}>Not Shipped</option>
                                                        <option class="fa fa-circle-o text-warning  mr-2" value="Shipped" ${o.status == 'Shipped' ? 'selected="selected"' : ''}>Shipped</option>
                                                        <option class="fa fa-circle-o text-success  mr-2" value="Delivered" ${o.status== 'Delivered' ? 'selected="selected"' : ''}>Delivered</option>

                                                   

                                                </select>
                                                    
                                                        </form> 
                                                    </td>                                                 
                                                                                                      
                                                </tr>

                                            </tbody>
                                        </c:forEach> 
                                    </table>
                                   
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