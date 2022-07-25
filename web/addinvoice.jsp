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
        <%@include file="vip/Panner.jsp" %>

        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->

        <%@include file="vip/functionemp.jsp" %>

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
                    <div class="col-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Product</h4>
                                <form action="HomePageEmployeeController" class="sign-in-form" method="POST">
                                    <input type="hidden" name="do" value="ListSearchProduct">
                                    <div class="row"> 
                                        <div class="col-5">
                                            <div class="form-group">
                                                <input type="text" name="searchname" class="form-control input-rounded" placeholder="Search Product" value="${searchname}">
                                            </div>
                                        </div>
                                        <div class="col-5">
                                            <div class="form-group" class="form-control input-rounded">
                                                <select name="cate"  class="form-control input-rounded" class="form-control form-control-lg">
                                                    <option value="all" >Select Category</option>
                                                    <c:forEach items="${listcate}" var="c">
                                                        <option value="${c.categoryID}" ${c.categoryID== cate ? 'selected="selected"' : ''}>${c.categoryName}</option>

                                                    </c:forEach>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-2">
                                            <input  class="form-control input-rounded" type="submit" value="Search">
                                        </div>
                                    </div>
                                </form>
                                <div class="table-responsive">
                                    <c:if test="${sessionScope.n==1}">  <%@include file="vip/listallproductinvoice.jsp" %></c:if>
                                    <c:if test="${sessionScope.n==2}">  <%@include file="vip/listsearchproduct.jsp" %></c:if>
                                
                                    </div>

                                </div>



                            </div>                       
                        </div>




                        <div class="col-lg-6">
                            <form autocomplete="off" action="HomePageEmployeeController">
                                <div class="autocomplete" style="width:300px;">
                                    <div class="row">
                                        <div class="col-7">
                                            <input id="myInput" type="text" name="myCountry" placeholder="Customer Name" value="${namecus}" required="">
                                    </div>
                                    <input type="hidden" id="bestsalelabel"
                                           value=" <c:forEach items="${listcus}" var="b">${b},</c:forEach>"
                                               name="">
                                           <div class="col-lg-3">
                                               <input id="myInput" type="text" name="myCountry" placeholder="ID" value="${idcus}" readonly="">
                                    </div>
                                    <div class="col-lg-2">
                                        <input type="submit" value="Submit">
                                    </div>
                                </div>
                            </div>
                        </form>
                        <form autocomplete="off" action="addtocart3">
                            <div class="autocomplete" style="width:300px;">
                                <div class="row">


                                    <div class="col-lg-7">
                                        <input id="myInput" type="text" pattern="^[0-9]+$" name="id" placeholder="Code Product" value="" required="">
                                    </div>
                                    <div class="col-lg-2">
                                        <input type="submit" value="Add">
                                    </div>
                                </div>
                            </div>
                        </form>
                                           <h1>${sessionScope.n1}</h1>
                        <div ${sessionScope.n1 == 5 ? 'style="display:block;"' : 'style="display:none;"'} >
                            <div id="messloi" class="" style="
                                 color:white;
                                 border-radius: 25px;
                                 background: red;
                                 padding: 20px; 
                                 width: 300px;
                                 ">
                                <div  class="" aria-live="polite" style=""><div class="toast-progress" style="width: 2.6%;
                                                                                color: red;">
                                    </div><button type="button" class="toast-close-button" role="button" onclick="vip3()">×</button>
                                    <div class="toast-title">There is no code for this product!</div><div class="toast-message">This Is Success Message</div>

                                </div>

                            </div>
                        </div>
                        <div ${sessionScope.n1 == 6 ? 'style="display:block;"' : 'style="display:none;"'} >
                            <div id="messloi2" class="" style="
                                 color:white;
                                 border-radius: 25px;
                                 background: red;
                                 padding: 20px; 
                                 width: 300px;
                                 ">
                                <div  class="" aria-live="polite" style=""><div class="toast-progress" style="width: 2.6%;
                                                                                color: red;">
                                    </div><button type="button" class="toast-close-button" role="button" onclick="vip6()">×</button>
                                    <div class="toast-title">Customers cannot be left blank!</div><div class="toast-message">This Is Success Message</div>

                                </div>

                            </div>
                        </div>
                        <div ${sessionScope.n1 == 7 ? 'style="display:block;"' : 'style="display:none;"'} >
                            <div id="messloi3" class="" style="
                                 color:white;
                                 border-radius: 25px;
                                 background: red;
                                 padding: 20px; 
                                 width: 300px;
                                 ">
                                <div  class="" aria-live="polite" style=""><div class="toast-progress" style="width: 2.6%;
                                                                                color: red;">
                                    </div><button type="button" class="toast-close-button" role="button" onclick="vip7()">×</button>
                                    <div class="toast-title">There are no products in the cart!</div><div class="toast-message">This Is Success Message</div>

                                </div>

                            </div>
                        </div>
                        <script>

                            function vip3() {

                                document.getElementById("messloi").style.display = "none";

                            }

                            var thoiluong = 5;
                            setInterval(function () {
                                thoiluong--;
                                sophut = Math.floor(thoiluong / 60);
                                sogiay = thoiluong % 60;



                                if (thoiluong <= 0) {
                                    thoiluong = 0;
                                    document.getElementById("messloi").style.display = "none";

                                }
                            }, 1000);
                        </script>
                        <script>

                            function vip6() {

                                document.getElementById("messloi2").style.display = "none";

                            }

                            var thoiluong = 5;
                            setInterval(function () {
                                thoiluong--;
                                sophut = Math.floor(thoiluong / 60);
                                sogiay = thoiluong % 60;



                                if (thoiluong <= 0) {
                                    thoiluong = 0;
                                    document.getElementById("messloi").style.display = "none";

                                }
                            }, 1000);
                        </script>
                              <script>

                            function vip7() {

                                document.getElementById("messloi3").style.display = "none";

                            }

                            var thoiluong = 5;
                            setInterval(function () {
                                thoiluong--;
                                sophut = Math.floor(thoiluong / 60);
                                sogiay = thoiluong % 60;



                                if (thoiluong <= 0) {
                                    thoiluong = 0;
                                    document.getElementById("messloi").style.display = "none";

                                }
                            }, 1000);
                        </script>
                        <div class="card">
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered zero-configuration">

                                        <thead>
                                        <h3>Invoice No:${idinvoicenew} </h3>
                                        <tr>
                                            <th class="text-center gui_productname">Item Information <i
                                                    class="text-danger">*</i></th>
                                            <th class="text-center invoice_fields">Batch No<i
                                                    class="text-danger">*</i></th>

                                            <th class="text-center">Qnty <i
                                                    class="text-danger">*</i></th>
                                            <th class="text-center">Rate <i class="text-danger">*</i>
                                            </th>


                                            <th class="text-center">Total</th>
                                            <th class="text-center">Action</th>
                                        </tr>

                                        </thead>
                                        <c:forEach items="${cart}" var="o">
                                            <form action="updatequatity">
                                                <tr>
                                                <input type="hidden" name="pid" value="${o.value.product.productID}">
                                                <td><img height="60" width="60" src="${o.value.product.img}"></td>
                                                <td>${o.value.product.productName}</td>
                                                <td><input style="width:70px" onchange="this.form.submit()" name="quantity" type="number" value="${o.value.quantity}"></td>
                                                <td>${o.value.product.price}</td>
                                                <td>${o.value.quantity*o.value.product.price}</td>
                                                <td><a href="deletecart?pid=${o.value.product.productID}">Delete</a></td>
                                                </tr>
                                            </form>

                                        </c:forEach>
                                    </table>
                                    <h1>Total:${total2}VND</h1>
                                    <!-- row -->

                                    <a href="removeall" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete ?')" style="" xpath="1">Delete All</a> 


                                    <form class="form-valide" action="adInvoiceDB" method="post">
                                        <div class="form-group row">
                                            <div class="col-lg-8 ml-auto">
                                                <button  type="submit" name="submit" onclick="myfun()" class="btn btn-primary" id="confirmsave" >Save</button>
                                            </div>
                                        </div>
                                    </form>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div  ${sessionScope.n1 == 8 ? 'style="display:block;"' : 'style="display:none;"'} id="confirmsave1" class="">
            <div id="toast-container" class="toast-top-full-width">
                <div class="toast toast-success" aria-live="polite" style=""><div class="toast-progress" style="width: 2.6%;">
                    </div><button type="button" class="toast-close-button" role="button" onclick="vip()">×</button>
                    <div class="toast-title">Add Invoice</div><div class="toast-message">This Is Success Message</div>

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
            var thoiluong = 15;
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
//            console.log(countries);

            /*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
            autocomplete(document.getElementById("myInput"), countries);
            let text2 = document.getElementById("myInput").textContent;
            console.log(text2);
    </script>


</body>

</html>