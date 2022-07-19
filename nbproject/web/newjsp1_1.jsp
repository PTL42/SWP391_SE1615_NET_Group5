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
        <link href="./plugins/sweetalert/css/sweetalert.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

    </head>

    <body>

        <!--*******************
            Preloader start
        ********************-->
        <form name="ludz" action="" method="post">
            <c:forEach items="${list2}" var="o">

                <div class="col-3  ">
                    <div class="card card-profile text-center">
                        <button onclick="buy222(${o.productID})" >
                            <span class="mb-1 text-primary"><img src="${o.img}" height="60" width="60" alt=""></span>
                            <h3 class="mb-0"></h3>
                            <p class="text-muted px-4">${o.productName}</p>
                        </button>
                        <input type="submit" onclick="buy222(${o.productID})" value="Buy item"/>
                        <h2>${o.productID}</h2>
                    </div>
                </div>

            </c:forEach>  
        </form>
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


        <!--                    <script src="./plugins/sweetalert/js/sweetalert.min.js"></script>
                            <script src="./plugins/sweetalert/js/sweetalert.init.js"></script>-->
   <script type="text/javascript">
    function buy222(id) {
    document.ludz.action="NewServlet?id="+id;
    document.ludz.submit();
}

</body>

</html>