<%-- 
    Document   : updateshippers
    Created on : Jul 2, 2022, 5:35:48 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form class="form-valide" action="shippers" method="post">
<input type="hidden" name="do" value="updateShippers">
    <div class="form-group row">
        <label class="col-lg-4 col-form-label" for="val-username">ID <span class="text-danger">*</span>
        </label>
        <div class="col-lg-6">
            <input type="text" readonly="" class="form-control" id="val-username" name="ids" placeholder="Enter a Company Name.." value="${ship.shipperID}">
        </div>
    </div>
    <div class="form-group row">
        <label class="col-lg-4 col-form-label" for="val-username">Company Name <span class="text-danger">*</span>
        </label>
        <div class="col-lg-6">
            <input type="text" class="form-control" id="val-username" name="val-name" placeholder="Enter a Company Name.." value="${ship.companyName}">
        </div>
    </div>
    <div class="form-group row">
        <label class="col-lg-4 col-form-label" for="val-email">Adress <span class="text-danger">*</span>
        </label>
        <div class="col-lg-6">
            <input type="text" class="form-control" id="val-email" name="address" placeholder="Your valid Address.." value="${ship.address}">
        </div>
    </div>
    <div class="form-group row">
        <label class="col-lg-4 col-form-label" for="val-phoneus">Phone  <span class="text-danger" >*</span>
        </label>
        <div class="col-lg-6">
            <input type="text" class="form-control" id="val-phoneus" name="val-phoneus" placeholder="212-999-0000" value="${ship.phone}">
        </div>
    </div>

    <div class="form-group row">
        <div class="col-lg-8 ml-auto">
            <input type="submit" name="submit" value="submit"  class="btn btn-primary" id="toastr-success-top-right">
        </div>
    </div>
</form>
            <div ${sessionScope.k11 == 1 ? 'style="display:block;"' : 'style="display:none;"'} >
                            <div id="messloi2" class="" style="
                                 color:white;
                                 border-radius: 10px;
                                 background: green;
                                 padding: 20px; 
                                 width: 300px;
                                 height: 80px;
                                 ">
                                <div  class="" aria-live="polite" style=""><div class="toast-progress" style="width: 2.6%;
                                                                                color: red;">
                                        
                                    </div>
                                    
                                    <div class="toast-title">Edit !
                                        <button style="background: green; margin-left: 160px" type="button" class="toast-close-button" role="button" onclick="vip6()">     ×</button>
                                    </div><div class="toast-message">This Is Success Message</div>

                                </div>

                            </div>
                        </div>
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
                                    document.getElementById("messloi2").style.display = "none";

                                }
                            }, 1000);
                        </script>