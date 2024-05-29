<%-- 
    Document   : test
    Created on : May 29, 2024, 4:32:01 PM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>



        <%-- Duyệt qua tất cả các order --%>
        <c:forEach var="order" items="${orders}">
            <c:set var="count" value="0" scope="page" />
            <c:set var="flag" value="0" scope="page" />
            <%-- Duyệt qua tất cả các order detail --%>
            <c:forEach var="orderDetail" items="${orderDetails}">
                <%-- Duyệt qua tất cả các product --%>
                <c:forEach var="product" items="${products}">
                    <%-- Kiểm tra nếu product có trong orderDetail --%>
                    <c:if test="${product.id == orderDetail.productId}">
                        <%-- Hiển thị product nếu flag chưa bằng 1 --%>
                        <c:if test="${flag == 0}">
                            
                            <%--show cái sản phẩm ra ở đây--%>
                            <%--đổi giá trị biến cờ  = 1--%>
                            <c:set var="flag" value="1" scope="page" />
                        </c:if>
                        <c:if test="${flag == 1}">
                            
                            <%--tăng giá trị biến count để đếm số sản phẩm được ẩn đi--%>
                            <c:set var="count" value="${count + 1}" scope="page" />
                        </c:if>
                    </c:if>
                </c:forEach>
            </c:forEach>
            <%--hiển thị các link dẫn đến trang OrderDetail, nút đánh giá đơn hàng, ....--%>
        </c:forEach>



    </body>
</html>
