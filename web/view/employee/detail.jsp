<%-- 
    Document   : detail
    Created on : Jun 7, 2022, 5:14:43 PM
    Author     : Long Thanh Pham
--%>

<%@page import="Model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Detail</title>
         <%
        Employee employee = (Employee)request.getAttribute("employee");
        %>
    </head>
    <body>
        ID: <%=employee.getId()%><br/>
        Name: <%=employee.getName()%> <br/>
        Dob:<%=employee.getDob()%><br/>
        Gender: <input type="checkbox" name="gender" 
                           <%=employee.isGender() ? "checked=\"checked\"" : ""%> value="male"/>Male
                    <input type="checkbox" name="gender" 
                           <%=!employee.isGender() ? "checked=\"checked\"" : ""%> value="female"/>Female<br/>
        Phone <%=employee.getPhone()%><br/>
        Salary: <%=employee.getSalary()%><br/>
        Department: <%=employee.getDept().getName()%><br/>
    </body>
</html>
