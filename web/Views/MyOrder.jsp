<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details</title>
    <link rel="preload stylesheet" as="style" fetchpriority="low"
          href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            margin-top: 20px;
        }
        .order-card {
            background-color: rgb(237 237 237);
            color: rgb(0, 0, 0);
            padding: 20px;
            border-radius: 8px;
            border: solid 1px;
            border-color: rgb(0, 0, 0);
        }
        .order-card h3,
        .order-card h6 {
            margin: 0;
        }
        .order-card table thead {
            background-color: #343a40;
            color: rgb(199, 180, 180);
        }
        .order-card table tbody tr {
            background-color: #cdbebe;
            color: black;
        }
        .order-card table tbody tr:nth-child(even) {
            background-color: #b8b1b1;
        }
        .table-response{
            margin-top: 20px;
        }
        .button-order{
            margin-left: 500px;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
                <c:forEach items="${orderList}" var="order" >
                    <div class="order-card">
                        <h3>OrderID: #${order.id}</h3>
                        <div class="row mt-3">

                            <div class="col-md-4 text-md-end">
                                <h6>OrderTime: ${order.orderDate}</h6>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>ProductName</th>
                                        <th>Color</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="firstProduct" value="true"/>
                                    <c:set var="productCount" value="0"/>
                                    <c:forEach var="orderDetail" items="${orderDetailList}">
                                        <c:if test="${orderDetail.order_id == order.id}">
                                            <c:forEach var="productDetail" items="${productDetailList}">
                                                <c:if test="${productDetail.id == orderDetail.productdetail_id}">
                                                    <c:forEach var="product" items="${productList}">
                                                        <c:if test="${product.id == productDetail.product_id}">
                                                            <tr>
                                                                <c:if test="${firstProduct}">
                                                                    <td><img src="image/product/${product.image}" alt="Product" style="width:100px"></td>
                                                                    <td>${product.name}</td>
                                                                    <c:forEach items="${colorList}" var="color">
                                                                        <c:if test="${productDetail.color_id == color.id}">
                                                                            <td>${color.colorname}</td>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <td>${orderDetail.price}</td>
                                                                    <td>${orderDetail.quantity}</td>
                                                                    <td>${order.totalcost}</td>
                                                                    <c:set var="firstProduct" value="false"/>
                                                                </c:if>
                                                                <c:if test="${!firstProduct}">
                                                                    <c:set var="productCount" value="${productCount + 1}"/>
                                                                </c:if>
                                                            </tr>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${productCount > 1}">
                                        <tr>
                                            <td colspan="6" style="text-decoration: none; color: black;">
                                                <a href="MyOrderInformationServlet?id=${order.id}" style="text-decoration: none; color: black;">
                                                    Số sản phẩm khác: ${productCount-1}
                                                </a>
                                            </td>
                                        </tr>
                                    </c:if>
                                    <tr>
                                        <td colspan="6" style="text-align: center;">
                                            <a href="MyOrderInformationServlet?id=${order.id}" style="text-decoration: none; color: black;">
                                                Xem chi tiết đơn hàng
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <div style="display: flex;justify-content: flex-end;">
                                <div></div>
                                <div><b>Total: </b>${order.totalcost}</div>
                            </div>
                            <div class="button-order">
                                <c:choose>
                                    <c:when test="${order.status == 'Order'}">
                                        <button class="btn btn-secondary btn-block" style="margin-left:200px">Order</button>
                                    </c:when>
                                    <c:when test="${order.status == 'Cancel'}">
                                        <button class="btn btn-danger btn-block" style="margin-left:200px">Cancel</button>
                                    </c:when>
                                    <c:when test="${order.status == 'Done'}">
                                        <button class="btn btn-success btn-block" style="margin-left:200px">Done</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-secondary btn-block" style="margin-left:200px">${order.status}</button>
                                    </c:otherwise>
                                </c:choose>
                            </div>

                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="col-md-2">
            </div>
        </div>
    </div>
    <div class="sortpagibar pagi clearfix text-center">
        <div id="pagination" class="clearfix">

            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <c:forEach var="page" items="${pagenumber}">
                    <a class="page-node" href="MyOrderServlet?page=${page}" aria-label="Trang ${page}">${page}</a>
                </c:forEach>
                <span class="page-node ">&hellip;</span>
            </div>
        </div>
    </div>
</body>

</html>
