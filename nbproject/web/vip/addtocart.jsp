<%-- 
    Document   : addtocart
    Created on : Jun 12, 2022, 6:19:33 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
   <div class="col-lg-5">

                            <div class="card">
                                <div class="card-body">

                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered zero-configuration">

                                            <thead>
                                                <tr>
                                                    <th class="text-center gui_productname">Item Information <i
                                                            class="text-danger">*</i></th>
                                                    <th class="text-center invoice_fields">Batch No<i
                                                            class="text-danger">*</i></th>
                                                    <th class="text-center">Av. Qnty.</th>
                                                    <th class="text-center">Qnty <i
                                                            class="text-danger">*</i></th>
                                                    <th class="text-center">Rate <i class="text-danger">*</i>
                                                    </th>
                                                    <th class="text-center" style="width: 90px;">Dis %</th>
                                                    <th class="text-center invoice_fields">Dis. Value </th>

                                                    <th class="text-center">Total</th>
                                                    <th class="text-center">Action</th>
                                                </tr>
                                            
                                            </thead>
                                            <c:forEach items="${list33}" var="x">
                                                <tbody>
                                                <td><img height="60" width="60" src="${x.img}"></td>
                                                <td>${x.productName}</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                </tbody>
                                            </c:forEach>
                                        </table>
                                        <h1>Total:</h1>
                                        <!-- row -->
                                        <form  id="from1">
                                            <button class="btn mb-1 btn-success">Save</button>
                                        </form> 
                                    </div>
                                </div>
                            </div>
                        </div>
    </body>
</html>
