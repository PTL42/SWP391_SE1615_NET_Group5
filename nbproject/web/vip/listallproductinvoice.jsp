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
        <table  id="table_product" >
        <c:forEach items="${list2}" var="o">
       
            <div  class="col-3  ">
                <div  class="card card-profile text-center">
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
                            </table>
<!--        <h1>${size2}</h1>-->
    </div> 
  
</form>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript">
                                                                                   //            use jquery to check paging
                                                                                $(document).ready(function () {
                                                                                    $('#table_product').DataTable({
                                                                                        "pageLength": 8,
                                                                                        "searching": false,
                                                                                        "bLengthChange": false
                                                                                    });
                                                                                });
                                                                                //                                              
                                                                                //                                                                                        
                                                                                //                                                                                                                                                                          set id of product
                                                                               
        </script>