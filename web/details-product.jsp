<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Update page</title>
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
        <!-- Pignose Calender -->
        <link href="./plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
        <!-- Chartist -->
        <link rel="stylesheet" href="./plugins/chartist/css/chartist.min.css">
        <link rel="stylesheet" href="./plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
        <!-- Custom Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

        <!--use library of jquery-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
        <link rel="stylesheet" href="jquery.back-to-top.css">

        <!--cdn of bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/9d281e3188.js" crossorigin="anonymous"></script>
    </head>

    <body>
        <!--*******************
            Preloader start
        ********************-->
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

                <div class="container-fluid">

                    <!--Form Group Details data-->
                    <div class="container mb-5">
                        <div class="d-flex justify-content-center shadow-lg p-3 bg-body ">
                            <div class="wrapper w-75 mt-auto font-italic font-weight-bold">
                                <div class="wrapper-header text-center">
                                    <div class="d-flex flex-col justify-content-center">
                                        <p style="font-size: 1.5em">
                                            <i class="fa-solid fa-file-pen"></i>
                                            DETAIL PRODUCT 
                                            <c:if test="${ROLE == 'ADMIN'}">
                                                (ID = ${product.productID})
                                            </c:if>
                                        </p>
                                    </div>
                                </div>
                                <input type="hidden" name="txtProductID" value="${product.productID}">
                                <div class="wrapper-content">
                                    <div class="row">
                                        <div class="col-7">
                                            <c:set var="context" value="${pageContext.request.contextPath}" />
                                            <div class="form-group mt-3 img-thumbnail">
                                                <img class="rounded mx-auto d-block" id="uploadPreview" src="${product.img}" style="width: 75%; height: 50%" />
                                            </div>
                                        </div>
                                        <div class="col-5">
                                            <div class="row w-100">
                                                <div class="col-5">
                                                    <div class="mt-3">
                                                        Product Name:
                                                    </div>
                                                    <div class="mt-3">
                                                         Price:
                                                    </div>
<!--                                                    <div class="mt-3">
                                                        Import Date:
                                                    </div>-->
                                                    <div class="mt-3">
                                                        Category:
                                                    </div>
                                                    <div class="mt-3">
                                                        Quantity:
                                                    </div>
                                                    <c:if test="${ROLE == 'ADMIN' && not empty ROLE}">
                                                        <div class=" mt-3">
                                                            Cost
                                                        </div>
                                                    </c:if>
<!--                                                    <div class="mt-3">
                                                        Size:
                                                    </div>-->
                                                    <div class="mt-5">
                                                        Description:
                                                    </div>
                                                </div>
                                                <div class="col-7">
                                                    <div class="mt-3">
                                                        ${product.productName}
                                                    </div>
                                                    <div class="mt-3">
                                                        <fmt:setLocale value = "vi_VN"/>
                                                        <fmt:formatNumber value = "${product.price}"/> VNĐ
                                                    </div>
                                                  <div class="mt-3">
                                                      <c:forEach items="${LIST_CATEGORY}" var="category">
                                                          <p 
                                                                               ${category.categoryID == product.categoryID ? '' : 'style="display: none" '}>${category.categoryName}</p>
                                                                        </c:forEach>
                                                       
                                                    </div>
                                                    <div class="mt-3">
                                                        ${product.productQuantity}
                                                    </div>
                                                    <c:if test="${ROLE == 'ADMIN' && not empty ROLE}">
                                                        <div class="mt-3">
                                                            <fmt:setLocale value = "vi_VN"/>
                                                            <fmt:formatNumber value = "${product.cost}"/> $
                                                        </div>
                                                    </c:if>
                                               
                                                    <div class="mt-3">
                                                        ${product.description}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-10">
                                    <c:if test="${ROLE != 'ADMIN' && not empty ROLE }">
                                        <form method="POST" action="MainController">
                                            <div class="mt-5 btn d-flex justify-content-center">
                                                <input name="txtProductID" type="hidden" value="${product.productID}">
                                                <input class="btn w-75 btn-lg btn-outline-dark" type="submit" name="btnAction" value="Add To Cart">
                                            </div>
                                        </form>
                                    </c:if>
                                    <c:if test="${ROLE == 'ADMIN' && not empty ROLE }">
                                        <div class="row">
                                            <div class=" d-flex justify-content-between ">
                                                <div class="col-6">
                                                    <form action="MainController" method="POST">
                                                        <input name="txtProductID" type="hidden" value="${product.productID}">
                                                        <input type="hidden" name="btnAction" value="Go To Update Page">
                                                        <input class="btn w-75 btn-lg btn-outline-primary" type="submit" value="Edit Product">
                                                    </form>
                                                </div>
                                                <div class="col-6">
                                                    <input onclick="setIdForDeleteModal(${product.productID})" class="btn w-75 btn-lg btn-outline-primary" type="button" data-bs-toggle="modal" data-bs-target="#deleteModal" value="Delete Product">
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
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


            <!--Confirm to remove-->
            <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Delete Product</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Do you want to delete ?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">Close</button>
                            <form action="MainController" method="POST">
                                <input type="hidden" id="deleteProductID" name="txtProductID">
                                <button type="submit" name="btnAction" value="Delete Product" class="btn btn-outline-danger">Delete</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

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

        <script type="text/javascript">
                                                        document.getElementById("logoutLink").onclick = function () {
                                                            document.getElementById("logoutForm").submit();
                                                        };
//                                                        set id of product
                                                        function setIdForDeleteModal(productID) {
                                                            document.getElementById("deleteProductID").value = productID;
                                                        }
                                                        ;
                                                        document.getElementById("historyLink").onclick = function () {
                                                            document.getElementById("historyForm").submit();
                                                        };
        </script>
        <!--libraries of table-->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
        <!--libraries of bootstrap-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    </body>

</html>