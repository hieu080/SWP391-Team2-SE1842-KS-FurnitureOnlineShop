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
    <link rel="preload stylesheet" as="style" fetchpriority="low" href="css/style-theme.scss.css">
    <link rel="preload stylesheet" as="style" fetchpriority="low"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
    <link rel="preload stylesheet" as="style" fetchpriority="low"
          href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script defer fetchpriority="low" src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"></script>

    <script defer fetchpriority="low" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
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
    <%@include file="HomeHeader.jsp" %>
    <div class="breadcrumb-shop">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pd5  ">
                    <ol class="breadcrumb breadcrumb-arrows" itemscope
                        itemtype="http://schema.org/BreadcrumbList">
                        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                            <a href="HomePage" target="_self" itemprop="item" content=""><span
                                    itemprop="name">Trang chủ</span></a>
                            <meta itemprop="position" content="1" />
                        </li>

                        <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                            <a href="MyOrderServlet" target="_self">
                                <span itemprop="item" content=""><span
                                        itemprop="name">Đơn hàng của tôi</span></span>
                            </a>
                            <meta itemprop="position" content="2" />
                        </li>
                    </ol>
                </div>
            </div>

        </div>
    </div>
    <div class="container" style="margin-top: 15px">
        <div class="row justify-content-center">
            <div class="col-md-2">
            </div>
            <div class="col-md-8">
                <c:forEach items="${orderList}" var="order" >
                    <div class="order-card" style="margin-bottom: 30px">
                        <h3>OrderID: #${order.id}</h3>
                        <div style="display: flex; justify-content: flex-end">
                            <h6><b>Order Time: ${order.orderDate}</b></h6>
                        </div>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th style="color: white;text-align: center">Product</th>
                                        <th style="color: white;text-align: center">ProductName</th>
                                        <th style="color: white;text-align: center">Color</th>
                                        <th style="color: white;text-align: center">Price</th>
                                        <th style="color: white;text-align: center">Quantity</th>
                                        <th style="color: white;text-align: center">Total</th>
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
                                                                    <td style="text-align: center"><img src="image/product/${product.image}" alt="Product" style="width:100px"></td>
                                                                    <td style="text-align: center">${product.name}</td>
                                                                    <c:forEach items="${colorList}" var="color">
                                                                        <c:if test="${productDetail.color_id == color.id}">
                                                                            <td style="text-align: center">${color.colorname}</td>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                    <td style="text-align: center">${orderDetail.price}</td>
                                                                    <td style="text-align: center">${orderDetail.quantity}</td>
                                                                    <td style="text-align: center">${order.totalcost}</td>
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
                            <div class="button-order" style="display: flex; justify-content: flex-end; margin-top: 10px">
                                <c:choose>
                                    <c:when test="${order.status == 'Order'}">
                                        <button style="width: 80px; height: 30px" class="btn btn-secondary" >Order</button>
                                    </c:when>
                                    <c:when test="${order.status == 'Cancel'}">
                                        <button style="width: 80px; height: 30px" class="btn btn-danger">Cancel</button>
                                    </c:when>
                                    <c:when test="${order.status == 'Done'}">
                                        <button style="width: 80px; height: 30px" class="btn btn-success">Done</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button style="width: 80px; height: 30px" class="btn btn-secondary">${order.status}</button>
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
    <%@include file="HomeFooter.jsp" %>
</body>

</html>
