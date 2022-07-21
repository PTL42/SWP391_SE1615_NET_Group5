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
        <title>Search page</title>
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
                Sidebar end
            ***********************************-->

            <!--**********************************
                Content body start
            ***********************************-->
            <div class="content-body">

                <div class="container-fluid">

                    <!--Alter message-->
                    <div style="padding: 0 20%; margin-top: 10px ">
                        <c:if test="${CREATE_PRODUCT_MSG_FAILED != null}">
                            <div class="alert alert-primary alert-dismissible fade show" role="alert">
                                <strong>Note:</strong> <span class="font-weight-semi-bold text-capitalize" style="color: black">${CREATE_PRODUCT_MSG_FAILED}</span>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>
                    </div>

                    <!--Form Group new product -->
                    <div class="container mb-5">
                        <div class="d-flex justify-content-center shadow-lg p-3 bg-body ">
                            <div class="wrapper w-75 mt-auto font-italic font-weight-bold">
                                <div class="wrapper-header text-center">
                                    <div class="d-flex flex-col justify-content-center">
                                        <p style="font-size: 1.5em">
                                            <i class="fa-solid fa-file-circle-plus"></i>
                                            New Product
                                        </p>
                                    </div>
                                </div>
                                <div class="wrapper-content">
                                    <form method="POST" action="MainController" enctype="multipart/form-data">
                                        <div class="form-group mt-3">
                                            <label>Product Name</label>
                                            <input type="text" maxlength="40" placeholder="Product name ex: Giày thể thao" value="${txtProductName}"  name="txtProductName" required class="form-control">
                                        </div>
                                        <div class="form-group mt-3">
                                            <label>Description</label>
                                            <input type="text" maxlength="40" placeholder="Description ex: Luôn tạo cho bạn một sự thoải mái nhất mỗi khi đi trên chân." value="${txtDescription}"name="txtDescription" class="form-control">
                                        </div>
                                        <div class="form-group mt-3">
                                            <label>Category</label>
                                            <select name="selectCategory" class="form-control">
                                                <option value="0">SELECT CATEGORY</option>
                                                <c:forEach items="${LIST_CATEGORY}" var="category">
                                                    <option class="dropdown-item" 
                                                            value="${category.categoryID}" ${category.categoryID == searchedCategoryID ? 'selected' : ''}>${category.categoryName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group mt-3">
                                            <label>Sale Price</label>
                                            <input type="number" step="4"  maxlength="9" min="1000" step="1000" 
                                                   oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                   value="${txtSalePrice}" name="txtSalePrice" placeholder="Sale Price" required class="form-control">
                                        </div>
                                        <div class="form-group mt-3">
                                            <label>Import Price</label>
                                            <input type="number"  step="4" maxlength="9" min="1000" step="1000"
                                                   oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                   value="${txtImportPrice}" name="txtImportPrice" placeholder="Import Price" required class="form-control">
                                        </div>

                                        <div class="form-group mt-3">
                                            <label>Import Date</label>
                                            <input type="date" placeholder="Import Date" value="${txtImportDate}" name="txtImportDate"
                                                   required  min="<%=LocalDate.now()%>" class="form-control">
                                        </div>

                                        <div class="form-group mt-3">
                                            <label>Quantity</label>
                                            <input type="number" placeholder="Quantity" maxlength="4" 
                                                   oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                                                   value="${txtQuantity}" min="1" required name="txtQuantity" class="form-control">
                                        </div>

                                        <div class=" form-group mt-3 img-thumbnail">
                                            <img class="rounded mx-auto d-block" id="uploadPreview" style="width: 50%; height: 35%;" />
                                            <input id="uploadImage" type="file" name="inputImage" value="${image}" onchange="PreviewImage();" />
                                        </div>
                                        <div class="mt-5 btn d-flex justify-content-center">
                                            <input class="btn w-75 btn-lg btn-outline-dark" type="submit" name="btnAction" value="Add Product">
                                        </div>
                                    </form>
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
                Modal confirm message end
            ***********************************-->

            <!--Confirm to remove-->
            <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Deleting Product</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Are you want to delete ?
                        </div>
                        <div class="modal-footer">
                            <form action="MainController" method="POST">
                                <input type="hidden" id="deleteProductID" name="txtProductID">
                                <button type="submit" name="btnAction" value="Delete Product" class="btn btn-danger">Delete</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <!--**********************************
                Modal confirm message end
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

        <script type="text/javascript">

                                                function PreviewImage() {
                                                    var oFReader = new FileReader();
                                                    oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);
                                                    oFReader.onload = function (oFREvent) {
                                                        document.getElementById("uploadPreview").src = oFREvent.target.result;
                                                    };
                                                }
                                                ;
                                                document.getElementById("logoutLink").onclick = function () {
                                                    document.getElementById("logoutForm").submit();
                                                };
        </script>

        <!--libraries of table-->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
        <!--libraries of bootstrap-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

    </body>

</html>