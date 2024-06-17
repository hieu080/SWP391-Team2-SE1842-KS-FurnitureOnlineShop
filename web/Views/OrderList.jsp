<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Details</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
            .search-container {
                margin: 20px 0;
                display: flex;
                align-items: center;
                gap: 10px;
            }
            .button-container {
                margin-top: 10px;
            }
            .dropdown {
                position: relative;
                display: inline-block;

            }

            .dropbtn {
                /*background-color: #4CAF50;*/
                height: 45px;
                margin-top: 25px;
                color: black;
                /*padding: 10px 16px;*/
                font-size: 16px;
                border: none;
                cursor: pointer;
                display: flex;
                align-items: center;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 200px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .dropdown-content a:hover {
                background-color: #f1f1f1;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }

            .dropdown:hover .dropbtn {
                background-color: #3e8e41;
            }

            .fa-chevron-down {
                margin-left: auto;
            }

            .search-container {
                display: flex;
                align-items: center;
            }

            .search-container input[type="text"] {
                padding: 10px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 4px;
                width: 350px;
            }

            .search-container button {
                color: black;
                padding: 10px 16px;
                font-size: 16px;
                border: none;
                cursor: pointer;
                margin-left: 10px;
                border-radius: 4px;
            }

            .search-container button:hover {
                background-color: #3e8e41;
            }

            /* CSS cho dropdown */
            .group-filter {
                position: relative;
                display: inline-block;
            }

            .filter_group_title {
                background-color: #f1f1f1;
                padding: 10px;
                cursor: pointer;
                border: 1px solid #ddd;
                border-radius: 4px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 200px; /* Độ rộng của tiêu đề */
            }

            .icon-controls {
                font-size: 12px;
            }

            .filter_group_content {
                display: none;
                position: absolute;
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
                width: 200px; /* Độ rộng dropdown */
                /* Khoảng cách với tiêu đề */
                transition: display 0.3s ease-in-out;
            }

            .check-box-list {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .check-box-list li {
                margin-bottom: 8px;
                margin-left: 15px;
                margin-top: 8px
            }

            .check-box-list input[type="checkbox"] {
                margin-right: 10px;
                display: inline-block;
            }

            /* Hiển thị dropdown khi hover vào tiêu đề */
            .group-filter:hover .filter_group_content {
                display: block;
            }

            /* Màu nền khi hover vào tiêu đề */
            .group-filter:hover .filter_group_title {
                background-color: #e5e5e5;
            }

        </style>
    </head>

    <body>
        <div class="wrapper">
            <%@include file="DashboardNavbar.jsp" %>
            <div class="main">
                <%@include file="DashboardHeader.jsp" %>
                <div class="container" style="margin-top: 20px">
                    <h2>OrderList</h2>
                    <form method="post">
                        <div style="display: flex; justify-content: space-between">
                            <div class="search-container">
                                <input type="text" name="search" placeholder="Tìm kiếm theo ID hoặc tên khách hàng" />
                                <button type="submit">Tìm kiếm</button>
                            </div>

                            <div class="dropdown" style="display:flex; justify-content: space-between;">
                                <button class="dropbtn">
                                    SẮP XẾP THEO  <i class="fas fa-chevron-down"></i>
                                </button>
                                <div class="dropdown-content">
                                    <a href="${pageContext.request.contextPath}/OrderListServlet?sortby=dateAsc">Ngày đặt tăng dần</a>
                                    <a href="${pageContext.request.contextPath}/OrderListServlet?sortby=dateDesc">Ngày đặt giảm dần</a>
                                    <a href="${pageContext.request.contextPath}/OrderListServlet?sortby=nameAsc">Tên khách hàng A-Z</a>
                                    <a href="${pageContext.request.contextPath}/OrderListServlet?sortby=nameDesc">Tên khách hàng Z-A</a>
                                    <a href="${pageContext.request.contextPath}/OrderListServlet?sortby=totalCostAsc">Tổng chi phí tăng dần</a>
                                    <a href="${pageContext.request.contextPath}/OrderListServlet?sortby=totalCostDesc">Tổng chi phí giảm dần</a>
                                    <a href="${pageContext.request.contextPath}/OrderListServlet?sortby=statusAsc">Tiến trình trạng thái tăng dần</a>
                                    <a href="${pageContext.request.contextPath}/OrderListServlet?sortby=statusDesc">Tiến trình trạng thái giảm dần </a>
                                </div>

                            </div>
                        </div>

                        <div class="search-container">
                            <label for="from-date">Từ ngày:</label>
                            <input type="date" id="from-date" name="fromDate" >

                            <label for="to-date">Đến ngày:</label>
                            <input type="date" id="to-date" name="toDate" >

                            <!-- Status filter checkboxes -->

                            <div class="group-filter">
                                <div class="filter_group_title dropdown-filter">
                                    <span>Trạng thái</span><span class="icon-controls"><i class="fas fa-chevron-down"></i></span>
                                </div>
                                <div class="filter_group_content filter-size s-filter" id="status-filter">
                                    <ul class="check-box-list clearfix">
                                        <li>
                                            <input type="checkbox" name="status-filter" value="Order"
                                                   <c:if test="${not empty selectStatusList and selectStatusList.contains('Order')}">checked</c:if>
                                                       style="display: inline-block" /> Order
                                            </li>
                                            <li>
                                                <input type="checkbox" name="status-filter" value="Done"
                                                <c:if test="${not empty selectStatusList and selectStatusList.contains('Done')}">checked</c:if>
                                                    style="display: inline-block" /> Done
                                            </li>
                                            <li>
                                                <input type="checkbox" name="status-filter" value="Confirm"
                                                <c:if test="${not empty selectStatusList and selectStatusList.contains('Confirm')}">checked</c:if>
                                                    style="display: inline-block" /> Confirm
                                            </li>
                                            <li>
                                                <input type="checkbox" name="status-filter" value="Cancel"
                                                <c:if test="${not empty selectStatusList and selectStatusList.contains('Cancel')}">checked</c:if>
                                                    style="display: inline-block" /> Cancel
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <button type="submit">Lọc</button>
                                <button><a href="${pageContext.request.contextPath}/OrderListServlet?clearfilter=yes" style="text-decoration: none; color: black">Bỏ lọc</a></button>
                        </div>
                    </form>

                    <div>
                        <div>
                            <c:forEach items="${orderList}" var="order" >
                                <div class="order-card" style="margin-bottom: 15px">
                                    <h3>OrderID: #${order.id}</h3>
                                    <div style="display: flex; justify-content: flex-end">
                                        <h6>Order Time: ${order.orderDate}</h6>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th style="color: white;text-align: center">CustomerName</th>
                                                    <th style="color: white;text-align: center">Product</th>
                                                    <th style="color: white;text-align: center">ProductName</th>
                                                    <th style="color: white;text-align: center">Price</th>
                                                    <th style="color: white;text-align: center">Quantity</th>
                                                    <th style="color: white;text-align: center">Total</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="firstProduct" value="true"/>
                                                <c:set var="productCount" value="0"/>
                                                <c:forEach var="userList" items="${userList}">
                                                    <c:if test="${order.customer_id == userList.id}">
                                                        <c:forEach var="orderDetail" items="${orderDetailList}">
                                                            <c:if test="${orderDetail.order_id == order.id}">
                                                                <c:forEach var="productDetail" items="${productDetailList}">
                                                                    <c:if test="${productDetail.id == orderDetail.productdetail_id}">
                                                                        <c:forEach var="product" items="${productList}">
                                                                            <c:if test="${product.id == productDetail.product_id}">
                                                                                <tr>
                                                                                    <c:if test="${firstProduct}">
                                                                                        <td style="text-align: center">${userList.fullname}</td>
                                                                                        <td style="text-align: center"><img src="image/product/${product.image}" alt="Product" style="width:100px"></td>
                                                                                        <td style="text-align: center">${product.name}<br/>
                                                                                            <c:forEach var="color" items="${colorList}">
                                                                                                <c:if test="${productDetail.color_id == color.id}">
                                                                                                    <span class="small">${color.colorname}</span>
                                                                                                </c:if>
                                                                                            </c:forEach>
                                                                                            <c:forEach var="category" items="${categoryList}">
                                                                                                <c:if test="${product.category_id == category.id}">
                                                                                                    <span class="small">(Phân loại: ${category.category})</span> <!-- Thêm dấu ngoặc đơn ở đây -->
                                                                                                </c:if>
                                                                                            </c:forEach>
                                                                                        </td>
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
                                                    </c:if>
                                                </c:forEach>
                                                <c:if test="${productCount > 1}">
                                                    <tr>
                                                        <td colspan="6" style="text-decoration: none; color: black;">
                                                            <a href="OrderDetailServlet?id=${order.id}" style="text-decoration: none; color: black;">
                                                                Số sản phẩm khác: ${productCount-1}
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                                <tr>
                                                    <td colspan="6" style="text-align: center;">
                                                        <a href="OrderDetailServlet?id=${order.id}" style="text-decoration: none; color: black;">
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
                                                    <button style="width: 80px; height: 30px" class="btn btn-secondary">Order</button>
                                                </c:when>
                                                <c:when test="${order.status == 'Cancel'}">
                                                    <button style="width: 80px; height: 30px" class="btn btn-danger">Cancel</button>
                                                </c:when>
                                                <c:when test="${order.status == 'Done'}">
                                                    <button style="width: 80px; height: 30px" class="btn btn-success">Done</button>
                                                </c:when>
                                                <c:when test="${order.status == 'Confirmed'}">
                                                    <button style="width: 80px; height: 30px" class="btn btn-danger">Confirmed</button>
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
                                <a class="page-node" href="OrderListServlet?page=${page}" aria-label="Trang ${page}">${page}</a>
                            </c:forEach>
                            <span class="page-node ">&hellip;</span>
                        </div>
                    </div>
                </div>
            </div>                             
        </div>
        <%@include file="DashboardFooter.jsp" %>
    </body>
</html>
