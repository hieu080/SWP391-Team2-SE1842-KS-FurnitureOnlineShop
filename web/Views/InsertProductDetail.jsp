<%-- 
    Document   : InsertProductDetail
    Created on : Jun 7, 2024, 12:25:44 AM
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
        <h1>Insert Product Detail</h1>
        <form method="post" enctype="multipart/form-data">
            Product:
            <select name="productID">
                <c:forEach items="${productList}" var="product">
                    <option value="${product.id}">${product.name}</option>
                </c:forEach>
            </select>
            Color:
            <select name="colorID">
                <c:forEach items="${colorList}" var="color">
                    <option value="${color.id}">${color.colorname}</option>
                </c:forEach>
            </select>
            Quantity:
            <input type="text" name="quantityDetail"/><br/>
            Image 1:
            <input type="file" name="image1" accept="image/*"><br/>
            Image 2:
            <input type="file" name="image2" accept="image/*"><br/>
            Image 3:
            <input type="file" name="image3" accept="image/*"><br/>
            Image 4:
            <input type="file" name="image4" accept="image/*"><br/>
            <input type="submit" value="Insert">
        </form>
    </body>
</html>
