<%-- 
    Document   : insert
    Created on : Jun 7, 2022, 5:14:28 PM
    Author     : Long Thanh Pham
--%>

<%@page import="Model.Department"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Employee"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
        <form action="update" method="POST">
            Id: ${requestScope.employee.id} <input type="hidden" name="id" value="${requestScope.employee.id}" /> <br/>
            Name: <input type="text" value="${requestScope.employee.name}" name="name"/> <br/>
            Gender: <input type="radio" 
                           ${ requestScope.employee.gender? "checked=\"checked\"" : ""}
                           name="gender" value="male"/> Male
            <input type="radio"
                   ${ !requestScope.employee.gender? "checked=\"checked\"" : ""}
                   name="gender" value="female"/> Female<br/>
            Dob: <input type="date" value="${requestScope.employee.dob}" name="dob"/> <br/>
            Phone <input type="text" value="${requestScope.employee.phone}" name="phone"/> <br/>
            Salary <input type="text" value="${requestScope.employee.salary}" name="salary"/> <br/>
            Department: <select name="did">
                <c:forEach items="${requestScope.depts}" var="d">
                    <option 
                        <c:if test="${d.id eq requestScope.employee.dept.id}">
                            selected="selected"
                        </c:if>
                        value="${d.id}">
                        ${d.name}
                    </option>
                </c:forEach>
            </select>
            <br/>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
