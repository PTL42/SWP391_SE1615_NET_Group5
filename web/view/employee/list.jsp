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
        <table>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Date of Birth</th>
                <th>Phone</th>
                <th>Salary</th>
                <th>Department</th>
            </tr>
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
    </body>
</html>
