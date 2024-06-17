<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyOrderInformation</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <style>
        body {
            background: #eee;
        }

        .card {
            box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
        }

        .card {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 0 solid rgba(0, 0, 0, .125);
            border-radius: 1rem;
        }

        .text-reset {
            --bs-text-opacity: 1;
            color: inherit !important;
        }

        a {
            color: #5465ff;
            text-decoration: none;
        }
        .button-order {
            text-align: center; /* Căn giữa nội dung bên trong .button-order */
            margin-top: 10px; /* Khoảng cách giữa địa chỉ và nút button */
        }

        .button-order button {
            width: auto; /* Để chiều rộng nút button tự động theo nội dung */
            padding: 5px 10px; /* Tạo khoảng đệm nhỏ hơn cho nút button */
            font-size: 14px; /* Điều chỉnh kích thước chữ cho nhỏ gọn */
        }
    </style>
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
            <div class="container-fluid" style="margin-top: 15px">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8">
                            <!-- Details -->
                            <div class="card mb-4">
                                <div class="card-body">
                                    <div class="mb-3 d-flex justify-content-between">
                                        <c:set var="order" value="${requestScope.order}"/>
                                        <input type="hidden" name="order_id" value="${order.id}">
                                        <div class="me-auto">
                                            <span><h3>OrderID: #${order.id}</h3></span>
                                        </div>
                                        <div class="ms-auto">
                                            <span>OrderTime: ${order.orderDate}</span>
                                        </div>
                                    </div>
                                    <table class="table table-borderless">
                                        <tbody>
                                            <c:forEach var="orderDetail" items="${orderDetailList}">
                                                <c:if test="${orderDetail.order_id == order.id}">
                                                    <c:forEach var="productDetail" items="${productDetailList}">
                                                        <c:if test="${productDetail.id == orderDetail.productdetail_id}">
                                                            <c:forEach var="product" items="${productList}">
                                                                <c:if test="${product.id == productDetail.product_id}">
                                                                    <c:forEach var="user" items="${userList}"> 
                                                                    </c:forEach>   
                                                                    <tr>
                                                                        <td>
                                                                            <div class="d-flex mb-2">
                                                                                <div class="flex-shrink-0">
                                                                                    <img src="image/product/${product.image}"
                                                                                         alt="" width="35" class="img-fluid">
                                                                                </div>
                                                                                <div class="flex-lg-grow-1 ms-3">
                                                                                    <h6 class="small mb-0">${product.name}</h6>
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
                                                                                </div>
                                                                            </div>
                                                                        </td>
                                                                        <td>${orderDetail.quantity}</td>
                                                                        <td class="text-end" style="text-decoration: line-through;">${product.price} </td>
                                                                        <td class="text-end">${orderDetail.price}</td>
                                                                    </tr>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr class="fw-bold">
                                                <td colspan="4" style="text-align: right; padding-right: 50px">TOTAL: ${order.totalcost}</td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 card mb-4">
                            <div class="card-body">
                                <div class="row">
                                    <div>
                                        <c:set var="order" value="${requestScope.order}"/>
                                        <input type="hidden" name="order_id" value="${order.id}">
                                        <c:forEach items="${address}" var="address">
                                            <c:if test="${address.id == order.address_id}">
                                                <c:forEach items="${userList}" var="user">
                                                    <c:if test="${user.id == address.customer_id}">

                                                        <h3 class="h6">Thông tin người nhận</h3>
                                                        <address>
                                                            <strong>Full name: ${user.fullname}</strong><br>
                                                            Gender: ${user.gender}<br>
                                                            Email: ${user.email}<br>
                                                            Phone: ${address.phonenumber}<br>
                                                            Address: ${address.address}<br>
                                                            <!--                                                        <abbr title="Phone">P:</abbr> (123) 456-7890-->
                                                        </address>
                                                        <div style="display: flex; justify-content: center">
                                                            <c:choose>
                                                                <c:when test="${order.status == 'Order'}">
                                                                    <button class="btn btn-secondary" style="width: 80px; height: 30px; margin-right: 20px">${order.status}</button>
                                                                    <button class="btn btn-success" style="width: 85px; height: 30px;" onclick="confirmConfirmedOrder()">Confirmed</button>
                                                                    <button class="btn btn-danger" style="width: 80px; height: 30px; margin-left: 20px" onclick="confirmCancelOrder()">Cancel Order</button>
                                                                </c:when>
                                                                <c:when test="${order.status == 'Cancel'}">
                                                                    <button class="btn btn-danger" style="width: 80px; height: 30px;">${order.status}</button>
                                                                </c:when>
                                                                <c:when test="${order.status == 'Done'}">
                                                                    <button class="btn btn-success" style="width: 80px; height: 30px; margin-right: 10px"><a href="link-to-your-page" >${order.status}</a></button>
                                                                    <button class="btn btn-primary" style="width: 80px; height: 30px; margin-left: 10px "><a href="Feedback?order_id=${order.id}" >Feedback</a></button>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <button class="btn btn-secondary" style="width: 80px; height: 30px;">${order.status}</button>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="DashboardFooter.jsp" %>

    <script>
        function confirmConfirmedOrder() {
            var confirmUpdate = confirm("Bạn có muốn xác nhận đơn hàng của mình ?");
            if (confirmUpdate) {
                var order_id = ${order.id}; // Lấy orderId từ biến JSP
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "OrderDetailServlet", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        if (xhr.status === 200) {
                            // Xử lý phản hồi thành công (nếu cần)
                            alert("Đã xác nhận đơn hàng thành công!");
                            // Có thể làm gì đó sau khi xác nhận thành công
                        } else {
                            // Xử lý lỗi nếu cần
                            alert("Có lỗi xảy ra khi xác nhận đơn hàng.");
                        }
                    }
                };
                xhr.send("order_id=" + order_id + "&action=confirm"); // Gửi thêm thông tin hành động
            } else {
                // Người dùng chọn No, không làm gì cả
            }
        }

        function confirmCancelOrder() {
            var confirmCancel = confirm("Bạn có muốn hủy đơn hàng của mình không?");
            if (confirmCancel) {
                var order_id = ${order.id}; // Lấy orderId từ biến JSP
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "OrderDetailServlet", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === XMLHttpRequest.DONE) {
                        if (xhr.status === 200) {
                            // Xử lý phản hồi thành công (nếu cần)
                            alert("Đã hủy đơn hàng thành công!");
                            // Có thể làm gì đó sau khi hủy đơn hàng thành công
                        } else {
                            // Xử lý lỗi nếu cần
                            alert("Có lỗi xảy ra khi hủy đơn hàng.");
                        }
                    }
                };
                xhr.send("order_id=" + order_id + "&action=cancel");
            } else {
                // Người dùng chọn No, không làm gì cả
            }
        }

    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>




</html>