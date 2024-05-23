<%-- 
    Document   : test
    Created on : May 23, 2024, 2:52:18 PM
    Author     : HELLO
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${ empty brandList}">
            <p>Không tồn tại</p>
        </c:if>
        <c:forEach items="${brandList}" var="brand">
        <li>
            <a href="#" title="${brand.brandname}">
                ${brandname}
            </a>
        </li>
    </c:forEach>
</body>
</html>
