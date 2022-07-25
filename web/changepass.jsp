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
     <%@include file="vip/Panner.jsp" %>
            <!--**********************************
                Header end ti-comment-alt
            ***********************************-->
<div ${ROLE == 'CUSTOMER' ? '':'style="display: none"'}>
            <%@include file="vip/function.jsp" %>
        </div>
      <div ${ROLE == 'ADMIN' ? '':'style="display: none"'}>
            <%@include file="vip/function.jsp" %>
        </div>
        <div ${ROLE == 'EMPLOYEES' ? '':'style="display: none"'}>
            <%@include file="vip/functionemp.jsp" %>
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
                                            <h3 style="">${requestScope.mess}</h3>
                                            <!--<h1 id="haha">${requestScope.n}</h1>-->
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