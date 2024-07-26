<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Details</title>
        <link rel="icon" href="image/logoshop.png" type="image/png">
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
                    <h2>Manager Order</h2>
                    <div style="display: flex;
                         justify-content: space-between">
                        <div class="search-container">
                            <form  id="FormSearch">

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
                                <form id="sortForm" action="AssignToSale" method="post">

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
                    <form id="filterForm" action="AssignToSale" method="post">
                        <div class="search-container" style="margin: 20px 0px">


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
                            <div class="dropdown" style="margin-left: 15px;
                                 width: 240px">
                                <div class="dropbtn">
                                    Trạng Thái Phân Đơn 
                                    <span><i class="fa fa-chevron-down"></i></span>
                                </div>
                                <ul class="dropdown-content">
                                    <li>
                                        <input type="radio" name="sale"  value="0" style="display: inline-block" />   Chưa phân
                                    </li>
                                    <li>
                                        <input type="radio" name="sale"  value="a" style="display: inline-block" />   Đã phân
                                    </li>

                                </ul>
                            </div>

                            <div class="form-group">
                                <button type="button" id="clearButton" class="btn btn-secondary" >Clear</button>
                            </div>
                        </div>
                    </form>


                    <div id="order-container">

                        <table class="table table-striped table-bordered">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">Mã</th>
                                    <th scope="col">Người đặt</th>
                                    <th scope="col">Đơn giá</th>
                                    <th scope="col">Ngày đặt</th>
                                    <th scope="col">Trạng thái</th>
                                    <th scope="col">Tên Nv kinh doanh</th>
                                    <th scope="col">Chi tiết</th>
                                    <th scope="col">Phân đơn</th>
                                </tr>
                            </thead>
                            <tbody id="dataTableBody">

                            </tbody>
                        </table>
                        <div class="modal fade" id="SearchSaleModal" tabindex="-1" aria-labelledby="SearchSaleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="SearchSaleModalLabel">Danh sách nhân viên Kinh doanh</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>

                                    <!-- Modal Body -->
                                    <div class="modal-body">
                                        <form id="SaleForm" class="d-flex mb-3">
                                            <input type="text" class="form-control me-2" placeholder="Search by name..." name="apartofname">
                                            <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                                            <button type="button" id="clearButtonSale" class="btn btn-secondary" >Hủy lọc</button>

                                        </form>
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Mã</th>
                                                    <th>Tên Nv kinh doanh</th>
                                                    <th>Giới tính</th>
                                                    <th>Số điện thoại</th>
                                                    <th>Email</th>
                                                    <th>Trạng thái</th>

                                                    <th>Chọn</th>
                                                </tr>
                                            </thead>
                                            <tbody id="tablesale">

                                            </tbody>
                                        </table>
                                        <div class="sortpagibar pagi clearfix text-center">
                                            <div id="pagination" class="clearfix">

                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                    <form id="paginationForm-sale" >
                                                        <input type="hidden" name="action" value="pagination">
                                                        <div id="page-pagination-sale">

                                                            <span class="page-node">&hellip;</span>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Modal Footer -->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Đóng</button>
                                        <button id="assignSaleButton" type="submit" class="btn btn-success" form="createAccountForm">Chọn</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <form id="assignSaleForm" style="display: none" action="${pageContext.request.contextPath}/SaleAssignOrder" method="get">
                            <input type="hidden" id="selectedOrderId" name="selectedOrderId" value="">
                            <input type="hidden" id="selectedSaleId" name="selectedSaleId">
                        </form>

                    </div>
                </div>
                <div class="sortpagibar pagi clearfix text-center">
                    <div id="pagination" class="clearfix">

                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <form id="paginationForm" >
                                <input type="hidden" name="action" value="pagination">
                                <div id="page-pagination">

                                    <span class="page-node">&hellip;</span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>                             
        </div>
        <form id="hiddenForm"  style="display: none;">
            <input type="hidden" name="search" value="">
            <input type="hidden" name="sortby" value="">
            <input type="hidden" name="fromDate" value="">
            <input type="hidden" name="toDate" value="">
            <!-- Tạo nhiều input cho status-filter vì có thể chọn nhiều giá trị -->
            <input type="hidden" name="status-filter" value="">
            <input type="hidden" name="status-filter" value="">
            <input type="hidden" name="status-filter" value="">
            <input type="hidden" name="status-filter" value="">
            <input type="hidden" name="page" value="">
            <input type="hidden" name="sale" value="">
        </form>
        <%@include file="DashboardFooter.jsp" %>

        <script>

            $(document).ready(function () {
                // Function to handle form submissions
                function handleFormSubmit() {
                    // Gather data from SearchForm
                    var searchValue = $('#FormSearch input[name="search"]').val();
                    // Gather data from sortForm
                    var sortByValue = $('#sortForm input[name="sortby"]:checked').val();
                    var saleByValue = $('#filterForm input[name="sale"]:checked').val();
                    // Gather data from filterForm
                    var fromDateValue = $('#filterForm input[name="fromDate"]').val();
                    var toDateValue = $('#filterForm input[name="toDate"]').val();
                    var pageValue = $('#paginationForm input[name="page"]:checked').val();
                    var statusValues = [];
                    $('#filterForm input[name="status-filter"]:checked').each(function () {
                        statusValues.push($(this).val());
                    });




                    // Populate hiddenForm inputs with gathered data
                    $('#hiddenForm input[name="search"]').val(searchValue);
                    $('#hiddenForm input[name="sortby"]').val(sortByValue);
                    $('#hiddenForm input[name="sale"]').val(saleByValue);
                    $('#hiddenForm input[name="fromDate"]').val(fromDateValue);
                    $('#hiddenForm input[name="toDate"]').val(toDateValue);
                    // Set multiple inputs for status-filter
                    $('#hiddenForm input[name^="status-filter"]').each(function (index) {
                        $(this).val(statusValues[index] || ''); // Assign value or empty string if no value
                    });
                    $('#hiddenForm input[name="page"]').val(pageValue);
                    // Submit hiddenForm




                    $.ajax({
                        type: 'POST',
                        url: 'AssignToSale',
                        data: $('#hiddenForm').serialize(), // Serialize form data
                        success: function (response) {
                            // Handle success response if needed
                            console.log('Form submitted successfully.');
                            console.log(response);
                            // Example: Update table with new data
                            updateTable(response.orders);
                            const totalPages = response.totalPages;
                            $('#page-pagination').empty();

                            // Thêm các nút phân trang vào form
                            for (let page = 1; page <= totalPages; page++) {
                                const input = $('<input>').attr({
                                    type: 'radio',
                                    name: 'page',
                                    id: `page${page}`,
                                    value: page,
                                    style: 'display: none;'
                                });
                                const label = $('<label>').attr({
                                    for : `page${page}`,
                                    class: 'page-node',
                                    'aria-label': `Trang ${page}`,
                                    style: 'width: 25px; border: groove;'
                                }).text(page);

                                $('#page-pagination').append(input).append(label);
                                label.on('click', function () {
                                    $(this).prev('input[type="radio"]').prop('checked', true); // Đánh dấu ô radio tương ứng là đã chọn
                                    handleFormSubmit(); // Gọi lại hàm xử lý khi submit form
                                });
                            }
                        },
                        error: function (xhr, status, error) {
                            // Handle errors if any
                            console.error('Form submission error:', error);
                        }
                    });





                }
                // Function to load data on page load
                function loadDataOnPageLoad() {


                    $.ajax({
                        type: 'POST',
                        url: 'AssignToSale',
                        data: $('#hiddenForm').serialize(), // Serialize form data if needed
                        success: function (response) {
                            // Handle success response
                            console.log('Data loaded successfully.');
                            console.log(response);
                            // Update table with initial data
                            updateTable(response.orders);

                        },
                        error: function (xhr, status, error) {
                            // Handle errors if any
                            console.error('Error loading initial data:', error);
                        }
                    });





                    $.ajax({
                        type: 'POST',
                        url: 'AssignToSale',

                        success: function (data) {
                            console.log(data); // In ra console để xem dữ liệu trả về từ Servlet
                            // Ví dụ data.totalPages chứa số lượng trang
                            const totalPages = data.totalPages;
                            $('#page-pagination').empty();

                            // Thêm các nút phân trang vào form
                            for (let page = 1; page <= totalPages; page++) {
                                const input = $('<input>').attr({
                                    type: 'radio',
                                    name: 'page',
                                    id: `page${page}`,
                                    value: page,
                                    style: 'display: none;'
                                });
                                const label = $('<label>').attr({
                                    for : `page${page}`,
                                    class: 'page-node',
                                    'aria-label': `Trang ${page}`,
                                    style: 'width: 25px; border: groove;'
                                }).text(page);

                                $('#page-pagination').append(input).append(label);
                                label.on('click', function () {
                                    $(this).prev('input[type="radio"]').prop('checked', true); // Mark corresponding radio button as checked
                                    handleFormSubmit(); // Call form submission handling again
                                });
                            }

                            // Xóa các phần tử hiện tại trong phân trang (nếu có)

                        },
                        error: function (xhr, status, error) {
                            console.error('Lỗi khi gửi yêu cầu AJAX:', error);
                        }
                    });

                }


                $('#FormSearch').submit(function (event) {
                    event.preventDefault();
                    handleFormSubmit();
                });

                $('input[name="sortby"]').on('change', function () {
                    event.preventDefault();
                    handleFormSubmit();
                });

                $('#filterForm input, #filterForm select').on('change', function () {
                    event.preventDefault();
                    handleFormSubmit();
                });
                $('#paginationForm input[name="page"]').on('click', function () {
                    event.preventDefault();
                    handleFormSubmit();
                });
                loadDataOnPageLoad();
            });
            //search sale
            $('#SaleForm').submit(function (event) {
                event.preventDefault();
                $.ajax({
                    type: 'POST',
                    url: 'SaleListServlet',
                    data: $('#SaleForm').serialize(),
                    success: function (response) {
                        // Handle success response if needed
                        console.log('Form submitted successfully.');
                        console.log(response);
                        // Example: Update table with new data
                        var tableBody = $('#tablesale');
                        tableBody.empty();
                        $.each(response.listsale, function (index, c) {
                            var row = '<tr >' +
                                    '<td>' + c.id + '</td>' +
                                    '<td>' + c.fullname + '</td>' +
                                    '<td>' + c.gender + '</td>' +
                                    '<td>' + c.phonenumber + '</td>' +
                                    '<td>' + c.email + '</td>' +
                                    '<td>' + c.status + '</td>' +
                                    '<td>' +
                                    '<div class="form-check">' +
                                    '<input class="form-check-input" type="radio" name="selectedSaleId" id="sale' + c.id + '" value="' + c.id + '">' +
                                    '</div>' +
                                    '</td>' +
                                    '</tr>';
                            tableBody.append(row);
                        });
                        const totalPages = response.totalPage;
                        $('#page-pagination-sale').empty();

                        // Thêm các nút phân trang vào form
                        for (let page = 1; page <= totalPages; page++) {
                            const input = $('<input>').attr({
                                type: 'radio',
                                name: 'page',
                                id: `page${page}`,
                                value: page,
                                style: 'display: none;'
                            });
                            const label = $('<label>').attr({
                                for : `page${page}`,
                                class: 'page-node',
                                'aria-label': `Trang ${page}`,
                                style: 'width: 25px; border: groove;'
                            }).text(page);

                            $('#page-pagination-sale').append(input).append(label);
                            label.on('click', function () {
                                $(this).prev('input[type="radio"]').prop('checked', true); // Đánh dấu ô radio tương ứng là đã chọn
                                pageSale(); // Gọi lại hàm xử lý khi submit form
                            });
                        }
                    },
                    error: function (xhr, status, error) {
                        // Handle errors if any
                        console.error('Form submission error:', error);
                    }
                });
            });
            //phân trang sale
            function  pageSale() {
                $.ajax({
                    type: 'POST',
                    url: 'SaleListServlet',
                    data: $('#paginationForm-sale').serialize(), // Serialize form data
                    success: function (response) {
                        // Handle success response if needed
                        console.log('Form submitted successfully.');
                        console.log(response);
                        // Example: Update table with new data
                        var tableBody = $('#tablesale');
                        tableBody.empty();
                        $.each(response.listsale, function (index, c) {
                            var row = '<tr >' +
                                    '<td>' + c.id + '</td>' +
                                    '<td>' + c.fullname + '</td>' +
                                    '<td>' + c.gender + '</td>' +
                                    '<td>' + c.phonenumber + '</td>' +
                                    '<td>' + c.email + '</td>' +
                                    '<td>' + c.status + '</td>' +
                                    '<td>' +
                                    '<div class="form-check">' +
                                    '<input class="form-check-input" type="radio" name="selectedSaleId" id="sale' + c.id + '" value="' + c.id + '">' +
                                    '</div>' +
                                    '</td>' +
                                    '</tr>';
                            tableBody.append(row);
                        });
                        const totalPages = response.totalPage;
                        $('#page-pagination-sale').empty();

                        // Thêm các nút phân trang vào form
                        for (let page = 1; page <= totalPages; page++) {
                            const input = $('<input>').attr({
                                type: 'radio',
                                name: 'page',
                                id: `page${page}`,
                                value: page,
                                style: 'display: none;'
                            });
                            const label = $('<label>').attr({
                                for : `page${page}`,
                                class: 'page-node',
                                'aria-label': `Trang ${page}`,
                                style: 'width: 25px; border: groove;'
                            }).text(page);

                            $('#page-pagination-sale').append(input).append(label);
                            label.on('click', function () {
                                $(this).prev('input[type="radio"]').prop('checked', true); // Đánh dấu ô radio tương ứng là đã chọn
                                pageSale(); // Gọi lại hàm xử lý khi submit form
                            });
                        }
                    },
                    error: function (xhr, status, error) {
                        // Handle errors if any
                        console.error('Form submission error:', error);
                    }
                });
            }
            $(document).on('click', '[data-bs-toggle="modal"]', function () {
                // Load sale data on page load
                $.ajax({
                    type: 'POST',
                    url: 'SaleListServlet',
                    success: function (response) {
                        // Handle success response
                        console.log('Sale data loaded successfully.');
                        console.log(response);
                        // Update table with initial sale data
                        updateTableSale(response.listsale);
                    },
                    error: function (xhr, status, error) {
                        // Handle errors if any
                        console.error('Error loading initial sale data:', error);
                    }
                });
                $.ajax({
                    type: 'POST',
                    url: 'SaleListServlet',

                    success: function (data) {
                        console.log(data); // In ra console để xem dữ liệu trả về từ Servlet
                        // Ví dụ data.totalPages chứa số lượng trang
                        const totalPages = data.totalPage;
                        $('#page-pagination-sale').empty();

                        // Thêm các nút phân trang vào form
                        for (let page = 1; page <= totalPages; page++) {
                            const input = $('<input>').attr({
                                type: 'radio',
                                name: 'page',
                                id: `page${page}`,
                                value: page,
                                style: 'display: none;'
                            });
                            const label = $('<label>').attr({
                                for : `page${page}`,
                                class: 'page-node',
                                'aria-label': `Trang ${page}`,
                                style: 'width: 25px; border: groove;'
                            }).text(page);

                            $('#page-pagination-sale').append(input).append(label);
                            label.on('click', function () {
                                $(this).prev('input[type="radio"]').prop('checked', true); // Mark corresponding radio button as checked
                                pageSale();
                            });
                        }



                    },
                    error: function (xhr, status, error) {
                        console.error('Lỗi khi gửi yêu cầu AJAX:', error);
                    }
                });


            });
            // gán đơn cho sale
            $(document).ready(function () {
                // When show modal button is clicked, set the orderId in the hidden input
                $(document).on('click', '[data-bs-toggle="modal"]', function () {
                    var orderId = $(this).data('order-id');
                    $('#selectedOrderId').val(orderId);
                });

                // Sử dụng event delegation cho radio buttons
                $(document).on('change', 'input[name="selectedSaleId"]', function () {
                    var selectedSaleId = $(this).val();
                    $('#selectedSaleId').val(selectedSaleId);
                });

                // Xử lý sự kiện click cho nút assignSaleButton
                $('#assignSaleButton').click(function () {
                    var selectedSaleId = $('input[name="selectedSaleId"]:checked').val();
                    if (selectedSaleId) {
                        $('#selectedSaleId').val(selectedSaleId);
                        $('#assignSaleForm').submit();
                    } else {
                        alert('Vui lòng chọn một sale trước khi xác nhận.');
                    }
                });

            });
            //phân trang order 
            function updatePage(data) {
                $('#page-pagination').empty();

                // Thêm các nút phân trang vào form
                for (let page = 1; page <= totalPages; page++) {
                    const input = $('<input>').attr({
                        type: 'radio',
                        name: 'page',
                        id: `page${page}`,
                        value: page,
                        style: 'display: none;'
                    });
                    const label = $('<label>').attr({
                        for : `page${page}`,
                        class: 'page-node',
                        'aria-label': `Trang ${page}`,
                        style: 'width: 25px; border: groove;'
                    }).text(page);

                    $('#page-pagination').append(input).append(label);
                }
            }
            //update table order
            function updateTable(data) {
                var tableBody = $('#dataTableBody');
                tableBody.empty();
                $.each(data, function (index, item) {
                    var row = '<tr>' +
                            '<td>' + item.id + '</td>' +
                            '<td>' + item.customer + '</td>' +
                            '<td>' + item.totalcost + '</td>' +
                            '<td>' + item.orderdate + '</td>' +
                            '<td>' + item.status + '</td>';
                    if (item.salename !== null) {

                        row += '<td>' + item.salename + '</td>';

                    } else {
                        row += '<td>' + 'Chưa Phân' + '</td>';
                    }


                    row += '<td><a href="OrderDetailServlet?id=' + item.id + '" class="btn btn-primary btn-sm">' +
                            '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">' +
                            '<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>' +
                            '<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>' +
                            '</svg>' +
                            '</a></td>' +
                            '<td><button class="btn btn-success" style="height: 30px;" type="button" data-bs-toggle="modal" data-bs-target="#SearchSaleModal" data-order-id="' + item.id + '">Tìm Nhân Viên Sale</button></td>' +
                            '</tr>';
                    tableBody.append(row);
                });
            }
            //update table sale 
            function updateTableSale(data) {
                var tableBody = $('#tablesale');
                tableBody.empty();
                $.each(data, function (index, c) {
                    var row = '<tr >' +
                            '<td>' + c.id + '</td>' +
                            '<td>' + c.fullname + '</td>' +
                            '<td>' + c.gender + '</td>' +
                            '<td>' + c.phonenumber + '</td>' +
                            '<td>' + c.email + '</td>' +
                            '<td>' + c.status + '</td>' +
                            '<td>' +
                            '<div class="form-check">' +
                            '<input class="form-check-input" type="radio" name="selectedSaleId" id="sale' + c.id + '" value="' + c.id + '">' +
                            '</div>' +
                            '</td>' +
                            '</tr>';
                    tableBody.append(row);
                });
            }


// nút clear 
            $('#clearButton').on('click', function () {
                $('#FormSearch')[0].reset();
                $('#filterForm')[0].reset();
                $('#filterForm input[type="checkbox"]').prop('checked', false);
                $('#filterForm input, #filterForm select').trigger('change');
            });
            $('#clearButtonSale').on('click', function () {
                $('#SaleForm')[0].reset();
                $.ajax({
                    type: 'POST',
                    url: 'SaleListServlet',
                    success: function (response) {
                        // Handle success response
                        console.log('Sale data loaded successfully.');
                        console.log(response);
                        // Update table with initial sale data
                        updateTableSale(response.listsale);
                    },
                    error: function (xhr, status, error) {
                        // Handle errors if any
                        console.error('Error loading initial sale data:', error);
                    }
                });
                $.ajax({
                    type: 'POST',
                    url: 'SaleListServlet',

                    success: function (data) {
                        console.log(data); // In ra console để xem dữ liệu trả về từ Servlet
                        // Ví dụ data.totalPages chứa số lượng trang
                        const totalPages = data.totalPage;
                        $('#page-pagination-sale').empty();

                        // Thêm các nút phân trang vào form
                        for (let page = 1; page <= totalPages; page++) {
                            const input = $('<input>').attr({
                                type: 'radio',
                                name: 'page',
                                id: `page${page}`,
                                value: page,
                                style: 'display: none;'
                            });
                            const label = $('<label>').attr({
                                for : `page${page}`,
                                class: 'page-node',
                                'aria-label': `Trang ${page}`,
                                style: 'width: 25px; border: groove;'
                            }).text(page);

                            $('#page-pagination-sale').append(input).append(label);
                            label.on('click', function () {
                                $(this).prev('input[type="radio"]').prop('checked', true); // Mark corresponding radio button as checked
                                pageSale();
                            });
                        }



                    },
                    error: function (xhr, status, error) {
                        console.error('Lỗi khi gửi yêu cầu AJAX:', error);
                    }
                });

            });

        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </body>
</html>
