<%-- 
    Document   : listallproductinvoice
    Created on : Jun 29, 2022, 8:34:39 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form action="HomePageEmployeeController" class="sign-in-form" method="POST">
    <input type="hidden" name="do" value="ListallProduct">
    <div class="row">     
        <!--<form name="f" action="">-->
        <c:forEach items="${list2}" var="o">

            <div class="col-3  ">
                <div class="card card-profile text-center">
                    <!--                    
                                        <a href="addtocart3?id=${o.productID}"  style="cursor: pointer;">
                                             <div ${o.productQuantity <=0 ? 'style="display:block;"' : 'style="display:none;"'} class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sold</div>
                                            <span class="mb-1 text-primary"><img src="${o.img}" height="60" width="60" alt=""></span>
                                            <h3 class="mb-0"></h3>
                                            <p class="text-muted px-4">${o.productName}</p>
                                        </a>-->
                    <c:choose>
                        <c:when test="${o.productQuantity<=0}">
                            <a   style="cursor: pointer;">
                                <div ${o.productQuantity <=0 ? 'style="display:block;"' : 'style="display:none;"'} class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sold</div>
                                <span class="mb-1 text-primary"><img src="${o.img}" height="60" width="60" alt=""></span>
                                <h3 class="mb-0"></h3>
                                <p class="text-muted px-4">${o.productName}</p>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="addtocart3?id=${o.productID}"  style="cursor: pointer;">
                                <div ${o.productQuantity <=0 ? 'style="display:block;"' : 'style="display:none;"'} class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sold</div>
                                <span class="mb-1 text-primary"><img src="${o.img}" height="60" width="60" alt=""></span>
                                <h3 class="mb-0"></h3>
                                <p class="text-muted px-4">${o.productName}</p>
                            </a>
                        </c:otherwise>
                    </c:choose>


                </div>
            </div>

        </c:forEach>  
<!--        <h1>${size2}</h1>-->
    </div> 
<!--    <nav aria-label="Page navigation example" style="margin-left: 30%">
        <ul class="pagination">
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
             <li ${page == 1 ? 'style="display:none;"' : 'style="display:block;"'} class="page-item"><a  class="page-link" href="HomePageEmployeeController?page=${page-1}">Previous</a></li>
            <c:forEach begin="1" end="${size2}"var="e">
                <li class="${e==page?'active':''}"><a class="page-link" href="HomePageEmployeeController?page=${e}">${e}</a></li>
            </c:forEach>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
            
           
                    <li ${page == size2 ? 'style="display:none;"' : 'style="display:block;"'} class="page-item"><a  class="page-link" href="HomePageEmployeeController?page=${page+1}">Next</a></li>
             
                

        </ul>
    </nav>-->
</form>