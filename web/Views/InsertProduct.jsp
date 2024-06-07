<%-- 
    Document   : InsertProduct
    Created on : May 30, 2024, 8:50:33 PM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Insert Product</h1>
        <form method="post" enctype="multipart/form-data">
            Category:
            <select name="category_id">
                <c:forEach items="${categoryList}" var="category">
                    <option value="${category.id}">${category.category}</option>
                </c:forEach>
            </select><br/>
            Brand:
            <select name="brand_id">
                <c:forEach items="${brandList}" var="brand">
                    <option value="${brand.id}">${brand.brandname}</option>
                </c:forEach>
            </select><br/>
            Room:
            <select name="room_id">
                <c:forEach items="${roomList}" var="room">
                    <option value="${room.id}">${room.roomname}</option>
                </c:forEach>
            </select><br/>
            Product Name:
            <input type="text" name="name"><br/>
            Description:
            <input type="text" name="description"><br/>
            Image:
            <input type="file" name="image" accept="image/*"><br/>
            Price:
            <input type="text" name="price"><br/>
            Quantity:
            <input type="text" name="quantity"><br/>
            <input type="submit" value="Insert">
        </form>
    </body>
</html>
