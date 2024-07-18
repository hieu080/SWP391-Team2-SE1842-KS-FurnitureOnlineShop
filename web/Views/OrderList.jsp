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
                /*background-color: rgb(237 237 237);*/
                color: rgb(0, 0, 0);
                padding: 20px;
                /*border-radius: 8px;*/
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
                height: 40px;
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
        <style>
            .sort-wrapper {
                position: relative;
            }
            .sort-header {
                position: relative;
                font-size: 14px;
                font-weight: 600;
                padding: 10px 15px;
                background: #fff;
                border: 1px solid #e7e7e7;
                text-transform: uppercase;
                cursor: pointer;
                display: flex;
                justify-content: space-between;
                width: 230px;
            }
            .sort-header .icon-chevron {
                position: relative;
                top: 5px;
                font-size: 8px;
            }
            .sort-content {
                position: absolute;
                left: 0;
                right: 0;
                padding: 5px 15px;
                background: #fff;
                z-index: 100;
                border: 1px solid #e7e7e7;
                border-top: 0;
                pointer-events: none;
                visibility: hidden;
                opacity: 0;
                transition: all 0.3s ease;
            }
            .sort-wrapper:hover .sort-content {
                pointer-events: auto;
                visibility: visible;
                opacity: 1;
            }
            .sort-list {
                padding: 0;
                list-style: none;
            }
            .sort-list li {
                margin-bottom: 5px;
            }
            .sort-list li label {
                width: 100%;
                border: none;
                font-size: 14px;
                text-align: start;
            }
            .sort-list li input[type="radio"]:checked + label {
                background-color: #007bff;
                color: #fff;
                border: 1px solid #0056b3;
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
                font-weight: bold;
            }
            .sort-list li label:hover {
                background-color: #e0e0e0;
            }
            .button-add button, input{
                height: 41px;
            }

            .dropdown {
                position: relative;
                display: inline-block;
                font-family: Arial, sans-serif;
                margin: 10px 5px;
                width: 150px;
            }
            .dropbtn {
                background-color: white;
                color: black;
                padding: 10px;
                font-size: 16px;
                /*                font-size: 16px;*/
                border: 1px solid #ccc;
                cursor: pointer;
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 100%;
                text-transform: uppercase;
                font-weight: 530;
            }
            .dropdown-content {
                background-color: #f9f9f9;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                z-index: 1;
                padding-left: 0px;
                min-width: 100%;
                left: 0;
                right: 0;
                border: 1px solid #e7e7e7;
                border-top: 0;
                padding: 5px 0;
                visibility: hidden;
                opacity: 0;
                transition: all 0.3s ease;
            }
            .dropdown-content li {
                padding: 5px 10px;
                list-style: none;
                font-size: 14px;
                border-bottom: 1px solid #e7e7e7;
                display: flex;
                align-items: center;
            }
            .dropdown-content li:last-child {
                border-bottom: none;
            }
            .dropdown-content li input[type="checkbox"] {
                margin-right: 10px;
            }
            .dropdown-content li:hover {
                background-color: #f1f1f1;
            }
            .dropdown:hover .dropdown-content {
                display: block;
                visibility: visible;
                opacity: 1;
            }
            .dropdown:hover .dropbtn {
                background-color: #f1f1f1;
            }
        </style>

        <style>
            .date-input-container {
                position: relative;
                display: inline-block;
            }

            .date-input-container input[type="date"] {
                padding-left: 2.5rem;
            }

            .date-input-container .fa-calendar-alt {
                position: absolute;
                left: 10px;
                top: 50%;
                transform: translateY(-50%);
                color: #888;
            }
            
            .page-node{
                margin: 10px 5px;
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
                    <div style="display: flex;
                         justify-content: space-between">
                        <div class="search-container">
                            <form action="OrderListServlet" method="post">
                                <input type="hidden" name="action" value="search"/>
                                <input type="text" name="search" placeholder="Tìm kiếm theo ID hoặc tên khách hàng" />
                                <button type="submit">Tìm kiếm</button>
                            </form>
                        </div>
                        <div class="sort-wrapper">
                            <div class="sort-header">
                                <span>Sắp xếp</span>
                                <span class="icon-chevron">
                                    <i class="fa fa-chevron-down"></i>
                                </span>
                            </div>
                            <div class="sort-content">
                                <form id="sortForm" action="OrderListServlet" method="post">
                                    <input type="hidden" name="action" value="sort" />
                                    <ul class="sort-list">
                                        <li style="margin-top: 10px">
                                            <input type="radio" name="sortby" value="dateAsc" id="dateAsc" style="display: none;">
                                            <label for="dateAsc">Ngày đặt tăng dần</label>
                                        </li>
                                        <li>
                                            <input type="radio" name="sortby" value="dateDesc" id="dateDesc" style="display: none;">
                                            <label for="dateDesc">Ngày đặt giảm dần</label>
                                        </li>
                                        <li>
                                            <input type="radio" name="sortby" value="nameAsc" id="nameAsc" style="display: none;">
                                            <label for="nameAsc">Tên khách hàng A-Z</label>
                                        </li>
                                        <li>
                                            <input type="radio" name="sortby" value="nameDesc" id="nameDesc" style="display: none;">
                                            <label for="nameDesc">Tên khách hàng Z-A</label>
                                        </li>
                                        <li>
                                            <input type="radio" name="sortby" value="totalCostAsc" id="totalCostAsc" style="display: none;">
                                            <label for="totalCostAsc">Tổng chi phí tăng dần</label>
                                        </li>
                                        <li>
                                            <input type="radio" name="sortby" value="totalCostDesc" id="totalCostDesc" style="display: none;">
                                            <label for="totalCostDesc">Tổng chi phí giảm dần</label>
                                        </li>
                                        <li>
                                            <input type="radio" name="sortby" value="statusAsc" id="statusAsc" style="display: none;">
                                            <label for="statusAsc">Tiến trình trạng thái tăng dần</label>
                                        </li>
                                        <li>
                                            <input type="radio" name="sortby" value="statusDesc" id="statusDesc" style="display: none;">
                                            <label for="statusDesc">Tiến trình trạng thái giảm dần</label>
                                        </li>
                                    </ul>
                                </form>
                            </div>
                        </div>
                    </div>
                    <form id="filterForm" action="OrderListServlet" method="post">
                        <div class="search-container" style="margin: 20px 0px">

                            <input type="hidden" name="action" value="filter" />
                            <div style="font-weight: 600;
                                 font-size: 16px;
                                 text-transform: uppercase; margin-right: 20px">
                                <span class="icon_title"><i class="fa fa-filter"></i></span>
                                <span>Bộ Lọc</span>
                            </div>
                            <div class="form-group">
                                <label for="from-date">Từ ngày:</label>
                                <div class="date-input-container">
                                    <input type="date" id="from-date" name="fromDate" class="form-control">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="to-date">Đến ngày:</label>
                                <div class="date-input-container">
                                    <input type="date" id="to-date" name="toDate" class="form-control">
                                </div>
                            </div>
                            <div class="dropdown" style="margin-left: 15px;
                                 width: 160px">
                                <div class="dropbtn">
                                    Status
                                    <span><i class="fa fa-chevron-down"></i></span>
                                </div>
                                <ul class="dropdown-content">
                                    <li>
                                        <input type="checkbox" name="status-filter" data-status="Order" value="Order" style="display: inline-block" /> Order
                                    </li>
                                    <li>
                                        <input type="checkbox" name="status-filter" data-status="Done" value="Done" style="display: inline-block" /> Done
                                    </li>
                                    <li>
                                        <input type="checkbox" name="status-filter" data-status="Confirmed" value="Confirmed" style="display: inline-block" /> Confirmed
                                    </li>
                                    <li>
                                        <input type="checkbox" name="status-filter" data-status="Cancled" value="Cancled" style="display: inline-block" /> Cancled
                                    </li>
                                </ul>
                            </div>
                            <div class="form-group">
                                <button type="button" id="clearButton" class="btn btn-secondary" style="display: none;">Clear</button>
                            </div>
                        </div>
                    </form>


                    <div id="order-container">
                        <c:set value="${requestScope.htmlResponse}" var="htmlResponse"/>
                        ${htmlResponse}
                        <!--                        <div>
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
                                                <th style="background-color: white; text-align: center">CustomerName</th>
                                                <th style="background-color: white; text-align: center">Product</th>
                                                <th style="background-color: white; text-align: center">ProductName</th>
                                                <th style="background-color: white; text-align: center">Price</th>
                                                <th style="background-color: white; text-align: center">Quantity</th>
                                                <th style="background-color: white; text-align: center">Total</th>

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
                                                                <td style="text-align: center; background-color: white;">${userList.fullname}</td>
                                                                <td style="text-align: center; background-color: white;"><img src="image/product/${product.image}" alt="Product" style="width:100px"></td>
                                                                <td style="text-align: center; background-color: white;">${product.name}<br/>
                                                                <c:forEach var="color" items="${colorList}">
                                                                    <c:if test="${productDetail.color_id == color.id}">
                                                                        <span class="small">${color.colorname}</span>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <c:forEach var="category" items="${categoryList}">
                                                                    <c:if test="${product.category_id == category.id}">
                                                                        <span class="small">(Phân loại: ${category.category})</span>  Thêm dấu ngoặc đơn ở đây 
                                                                    </c:if>
                                                                </c:forEach>
                                                            </td>
                                                            <td style="text-align: center; background-color: white;">${orderDetail.price}</td>
                                                            <td style="text-align: center; background-color: white;">${orderDetail.quantity}</td>
                                                            <td style="text-align: center; background-color: white;">${order.totalcost}</td>
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
                                    <td colspan="6" style="text-decoration: none; color: black; background-color: white;">
                                        <a href="OrderDetailServlet?id=${order.id}" style="text-decoration: none; color: black;">
                                            Số sản phẩm khác: ${productCount-1}
                                        </a>
                                    </td>
                                </tr>
                            </c:if>
                            <tr>
                                <td colspan="6" style="text-align: center; background-color: white;">
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
                                    <button style="width: 80px; height: 30px" class="btn btn-secondary" >Đã đặt hàng</button>
                                </c:when>
                                <c:when test="${order.status == 'Cancled'}">
                                    <button style="width: 80px; height: 30px" class="btn btn-danger">Đã hủy</button>
                                </c:when>
                                <c:when test="${order.status == 'Confirmed'}">
                                    <button style=" height: 30px" class="btn btn-info">Đã xác nhận đơn hàng</button>
                                </c:when>    
                                <c:when test="${order.status == 'Done'}">
                                    <c:set var="hasFeedback" value="false" />
                                    <c:forEach items="${requestScope.historyFeedbackOrder}" var="history">
                                        <c:if test="${order.id == history}">
                                            <c:set var="hasFeedback" value="true" />
                                        </c:if>
                                    </c:forEach>

                                    <c:choose>
                                        <c:when test="${hasFeedback}">
                                            <button class="btn btn-success" style="height: 30px; margin-right: 10px">
                                                Hoàn thành đơn hàng
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button class="btn btn-warning" style="height: 30px; margin-right: 10px">
                                                Hoàn thành đơn hàng
                                            </button>
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    <button style="width: 80px; height: 30px" class="btn btn-warning">${order.status}</button>
                                </c:otherwise>
                            </c:choose>
                        </div>

                    </div>
                </div>
                        </c:forEach>
                    </div>-->
                    </div>
                </div>
                <div class="sortpagibar pagi clearfix text-center">
                    <div id="pagination" class="clearfix">

                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <form id="paginationForm" action="OrderListServlet" method="post">
                                <input type="hidden" name="action" value="pagination">
                                <div id="page-pagination">
                                    <c:forEach var="page" items="${pagenumber}">
                                        <input type="radio" name="page" id="page${page}" value="${page}" style="display: none;">
                                        <label for="page${page}" style="width: 25px;
                                               border: groove;" class="page-node" aria-label="Trang ${page}" onclick="handlePageClick(${page})">${page}</label>
                                    </c:forEach>
                                    <span class="page-node">&hellip;</span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>                             
        </div>
        <%@include file="DashboardFooter.jsp" %>

        <script>
            function handlePageClick(pageValue) {
                // Đặt giá trị của input hidden thành giá trị trang được nhấp
                $("input[name='page']").val(pageValue);
                submitFormWithAjax();
            }

            function submitFormWithAjax() {
                var form = $('#paginationForm')[0]; // Lấy form theo id
                $.ajax({
                    type: form.getAttribute("method"),
                    url: form.getAttribute("action"),
                    data: $(form).serialize(),
                    success: function (response) {
                        $("#order-container").html(response); // Cập nhật nội dung sản phẩm
                    },
                    error: function (xhr, status, error) {
                        console.error("Error: " + error);
                    }
                });
            }

            $(document).ready(function () {
                // Bắt sự kiện khi người dùng thay đổi radio button
                $('input[type="radio"][name="sortby"]').change(function () {
                    // Tự động submit form bằng AJAX
                    submitFormWithAjax();
                });
                // Hàm để gửi yêu cầu AJAX
                function submitFormWithAjax() {
                    var form = $('#sortForm')[0]; // Lấy form theo id
                    $.ajax({
                        type: form.getAttribute("method"),
                        url: form.getAttribute("action"),
                        data: $(form).serialize(),
                        success: function (response) {
                            console.log(response);
                            $("#order-container").html(response); // Cập nhật nội dung sản phẩm
                        },
                        error: function (xhr, status, error) {
                            console.error("Error: " + error);
                        }
                    });
                }
            });

            $(document).ready(function () {
                var buttonClear = $('#clearButton');

                // Bắt sự kiện khi người dùng thay đổi bất kỳ input nào trong form
                $('#filterForm').on('change', 'input', function () {
                    // Kiểm tra nếu có bất kỳ input nào có giá trị thì bật nút Clear, ngược lại tắt nút Clear
                    if ($('#from-date').val() || $('#to-date').val() || $('#filterForm').find('input[type="checkbox"]:checked').length > 0) {
                        buttonClear.show();
                    } else {
                        buttonClear.hide();
                    }
                    // Tự động submit form bằng AJAX
                    submitFormWithAjax();
                });

                // Bắt sự kiện khi nhấn nút Clear
                buttonClear.click(function () {
                    // Clear date inputs
                    $('#from-date').val('');
                    $('#to-date').val('');
                    // Uncheck all checkboxes
                    $('input[type="checkbox"]').prop('checked', false);
                    // Disable the Clear button
                    buttonClear.hide();
                    // Submit the form to update the results
                    submitFormWithAjax();
                });

                // Hàm để gửi yêu cầu AJAX
                function submitFormWithAjax() {
                    var form = $('#filterForm')[0]; // Lấy form theo id
                    $.ajax({
                        type: form.getAttribute("method"),
                        url: form.getAttribute("action"),
                        data: $(form).serialize(),
                        success: function (response) {
                            // Tách response bằng dấu '|'
                            var responses = response.split('|');
                            if (responses.length === 2) {
                                var htmlResponse = responses[0];
                                var pagePagination = responses[1];
                                console.log("Đây là phân trang:" + pagePagination);
                                // Cập nhật nội dung sản phẩm
                                $("#order-container").html(htmlResponse);
                                // Cập nhật nội dung phân trang
                                $("#page-pagination").html(pagePagination);
                            } else {
                                console.error("Unexpected response format");
                            }
                        },
                        error: function (xhr, status, error) {
                            console.error("Error: " + error);
                        }
                    });
                }
            });


        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </body>
</html>
