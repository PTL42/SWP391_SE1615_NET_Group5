<%-- 
    Document   : list
    Created on : Jun 8, 2022, 10:24:40 PM
    Author     : Long Thanh Pham
--%>

<%@page import="Model.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    </script>
    <body>
        <table border="1px">
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>DOB</th>
                <th>Gender</th>
                <th>Phone</th>
                <th>Salary</th>
                <th>Department</th>
            </tr>
            <%for (Employee e : employees) {
            %>
            <tr>
                <td><%=e.getId()%></td>
                <td><%=e.getName()%></td>
                <td><%=e.getDob()%></td>
                <td><input type="checkbox" name="gender" 
                           <%=e.isGender() ? "checked=\"checked\"" : ""%> value="male"/>Male
                    <input type="checkbox" name="gender" 
                           <%=!e.isGender() ? "checked=\"checked\"" : ""%> value="female"/>Female<br/></td>
                <td><%=e.getPhone()%></td>
                <td><%=e.getSalary()%></td>
                <td><%=e.getDept().getName()%></td>
<!--                <td><input type="button" onclick="doUpdate(<%=e.getId()%>);" value="Update"/></td>
                <td><input type="button" onclick="doDelete(<%=e.getId()%>);" value="Delete"/></td>-->
                <td><a href="update?id=<%=e.getId()%>">Edit</a></td>
                <td><a href="detail?id=<%=e.getId()%>">Detail</a></td>
                <td><a href="delete?id=<%=e.getId()%>">Delete</a></td>
            </tr>
            <%}%>
        </table>
        <a href="insert">Add Employee</a>
    </body>
</html>
