<%-- 
    Document   : newjsp2
    Created on : Jun 11, 2022, 12:49:29 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row-5">
                <div class="col-3">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">Product</h4>
                            <div class="table-responsive">

                                <div class="row">             
                                    <c:forEach items="${list2}" var="o">
                                        <a style="" onclick="myFun()" >
                                            <div class="col-3  ">
                                                <div class="card card-profile text-center">
                                                    <span class="mb-1 text-primary"><img src="${o.img}" height="60" width="60" alt="">  <p class="text-muted px-4">${o.productName}</p></span>

                                                    <!--<p class="text-muted px-4">${o.productName}</p>-->

                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>  

                                </div> 
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <script>
            function myFun() {
                const btn = document.querySelectorAll(".col-3");
//                            console.log(btn);
                btn.forEach(function (accessories__list__item, index) {
                    accessories__list__item.addEventListener("click", function (event) {
                        var btnitem = event.target
                        var pro = btnitem.parentElement
                        var imgpro = pro.querySelector("img").src
                        var nampro = pro.querySelector("p").innerText
//                        console.log(nampro)
                      addcart(imgpro,nampro)
                    })

                })
                function addcart(imgpro, nampro) {
                    var addtr = document.createElement("tr")
                    var cartitem = document.querySelectorAll("tbody tr")
                     console.log(cartitem)

                
                var trcontent = '<tr><td>i<img style="width:70px;" src="' + imgpro + '" alt="Gamer" />  </td><td><p class="notok">' + "10$" + ' </p></td><td><input style="width:30px;" type="number"  value="1" min="0"></td><td>Xoá</td></tr>'
                addtr.innerHTML = trcontent
                var carttable = document.querySelector("tbody")
                // console.log(carttable)
                carttable.append(addtr)
//                carttotal()
            }



            }
        </script>
        <section class="cart">
            <form action="">
                <table>
                    <thead>
                        <tr>
                            <th>Sản Phẩm</th>
                            <th>Giá</th>
                            <th>SL</th>
                            <th>Chọn</th>
                        </tr>
                    </thead>
                    <tbody>
<!--                         <tr>
                        <td>i<img style="width:70px;" src="https://vnn-imgs-a1.vgcloud.vn/icdn.dantri.com.vn/2021/05/26/ngo-ngang-voi-ve-dep-cua-hot-girl-anh-the-chua-tron-18-docx-1622043349706.jpeg" alt="Gamer" />  </td>
                        <td><p>23$ </p></td>
                    <td><input style="width:30px;" type="number"  value="1" min="0"></td>
                         <td>Xoá</td>
                     </tr> -->
                    </tbody>
                </table>
                <div style="text-align:center ;" class="price-total">
                    <p style="font-weight:bold ;">Tổng tiền<span>0</span><sup>$</sup></p>
                </div>
            </form>
        </section>

    </body>
</html>
