<%-- 
    Document   : update
    Created on : Jun 7, 2022, 5:14:35 PM
    Author     : Long Thanh Pham
--%>

<%@page import="Model.Department"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <%
        Employee employee = (Employee)request.getAttribute("employee");
        ArrayList<Department> departments = (ArrayList<Department>)request.getAttribute("depts");
        %>
    </head>
    <body>
        Id: <%=employee.getId()%> <input type="hidden" name="id" value="<%=employee.getId()%>"  /> <br/>
            Name: <input type="text" value="<%=employee.getName()%>" name="name"/> <br/>
            Gender: <input type="radio" 
                           <%=employee.isGender()?"checked=\"checked\"":""%>
                           value="male" name="gender"/> Male 
            <input type="radio" value="female" 
                           <%=!employee.isGender()?"checked=\"checked\"":""%>
                   name="gender"/> Female <br/>
            Dob: <input type="date" name="dob" value="<%=employee.getDob()%>" /> <br/>
            Phone <input type="text" name="position" value="<%=employee.getPhone()%>"/> <br/>
            Salary: <input type="text" name="salary" value="<%=employee.getSalary()%>"/> <br/>
            Department: <select name="did">
                <% for (Department d : departments) {
                %>
                <option value="<%=d.getId()%>"><%=d.getName()%></option>
                <%}%>
            </select>
            <br/>
    </body>
</html>
