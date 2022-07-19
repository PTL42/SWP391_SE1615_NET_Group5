<%-- 
    Document   : listsearchproduct
    Created on : Jun 29, 2022, 8:41:50 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form action="HomePageEmployeeController" class="sign-in-form" method="POST">
    <input type="hidden" name="do" value="ListSearchProduct">
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