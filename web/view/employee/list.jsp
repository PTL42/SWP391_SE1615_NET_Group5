<%-- 
    Document   : list
    Created on : Jun 7, 2022, 5:15:27 PM
    Author     : Long Thanh Pham
--%>

<%@page import="Model.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee List</title>
        <%
            ArrayList<Employee> employees = (ArrayList<Employee>) request.getAttribute("employees");
        %>
    </head>
    <script>
        function doUpdate(id)
        {
            window.location.href = "update?id=" + id;
        }
        function doDelete(id)
        {
            var c = confirm("Are you sure?");
            if (c)
            {
                window.location.href = "delete?id=" + id;
            }
        }
        function doDetail(id) {
            window.location.href = "detail?id=" + id;
        }
    </script>
    <body>
        <form action="HomeController" class="sign-in-form" method="POST">
            <input type="hidden" name="do" value="ListEmployee">


            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">List Employee</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">ListEmployee</h4>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered zero-configuration">
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Name</th>
                                                <th>Gender</th>
                                                <th>Date of Birth</th>
                                                <th>Phone</th>
                                                <th>Salary</th>
                                                <th>Department</th>                                               
                                            </tr>
                                        </thead>                                       
                                        <%for (Employee e : employees) {
                                        %>
                                        <tr>
                                            <td><%=e.getId()%></td>
                                            <td><%=e.getName()%></td>
                                            <td><% if (e.isGender()) {%>
                                                Male
                                                <%} else {%>
                                                Female
                                                <%}%>
                                            </td>
                                            <td><%=e.getDob()%></td>
                                            <td><%=e.getPhone()%></td>
                                            <td><%=e.getSalary()%></td>
                                            <td><%=e.getDept().getName()%></td>
                                            <td><input type="button" onclick="doUpdate(<%=e.getId()%>);" value="Update"/></td>
                                            <td><input type="button" onclick="doDelete(<%=e.getId()%>);" value="Delete"/></td>
                                        </tr>
                                        <%}%>                                    
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #/ container -->

        </form>
    </body>
</html>
