<%-- 
    Document   : insert
    Created on : Jun 7, 2022, 5:14:28 PM
    Author     : Long Thanh Pham
--%>

<%@page import="Model.Department"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Employee</title>
        <%
            ArrayList<Department> depts = (ArrayList<Department>) request.getAttribute("depts");
        %>
    </head>
    <body>
        <form action="insert" method="POST">
            EmployeeId: <input type="text" name="eid"/> <br/>
            Name: <input type="text" name="name"/> <br/>
            Gender: <input type="radio" checked="checked" name="gender" value="male"/> Male
            <input type="radio" name="gender" value="female"/> Female
            <br/>
            Dob: <input type="date" name="dob"/> <br/>
            Phone <input type="text" name="phone"/> <br/>
            Salary: <input type="text" name="salary"/> <br/>
            Department: <select name="did">
                <% for (Department d : depts) {
                %>
                <option value="<%=d.getId()%>"><%=d.getName()%></option>
                <%}%>
            </select>
            <br/>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
