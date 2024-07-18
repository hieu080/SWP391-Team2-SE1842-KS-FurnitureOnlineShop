<%-- 
    Document   : ProductListMKT
    Created on : Jun 5, 2024, 2:27:59 PM
    Author     : HELLO
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="css/main.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            th,
            td {
                padding: 10px;
                text-align: left;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                max-width: 150px;
                /* Set a maximum width as needed */
                text-align: center;
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
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                z-index: 1;
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
            .actions {
                /*                display: flex;
                                justify-content: center;
                                align-items: center;*/
            }
            .actions a {
                margin: 0 5px;
                color: black;
                text-decoration: none;
            }
            .actions a:hover {
                color: blue;
            }
            .add-new-product-btn {
                display: flex;
                align-items: center;
                justify-content: center;
                height: 40px;
                width: 155px;
                background-color: #fff;
                border: 1px solid #ccc;
                font-size: 16px;
                cursor: pointer;
            }
            .image {
                border-radius: 4px;
                overflow: hidden;
                margin-right: 15px;
                max-width: 50px;
                width: 100%;
                height: 50px;
            }
            .image img {
                width: 100%;
            }

            .custom-close-btn {
                position: absolute;
                right: 1.5rem; /* Adjust as needed */
                z-index: 1051; /* Ensure it appears above the modal content */
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
                width: 200px;
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

            .page-node{
                margin: 20px 10px;
            }
            .filter-form{
                display: flex;
                align-items: center;
            }
        </style>
    </head>

    <body>
        <div class="wrapper">
            <%@include file="DashboardNavbar.jsp" %>
            <div class="main">
                <%@include file="DashboardHeader.jsp" %>
                <div class="container" style="margin-top: 20px; margin-bottom: 20px">
                    <section class="section">
                        <div class="container-fluid" style="padding-left: 13px">
                            <div class="title-wrapper pt-30">
                                <div class="row align-items-center">
                                    <div class="col-md-6">
                                        <div class="title">
                                            <h2>User List</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ml-15 mr-15" style="display: flex; justify-content: space-between">
                            <div class="button-add">
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addUserModal">
                                    Add New User
                                </button>
                                <button type="button" class="btn btn-primary ml-15" onclick="reloadPage()">
                                    Reload Page
                                </button>
                            </div>

                            <div class="sort-wrapper">
                                <div class="sort-header">
                                    <span>Sắp xếp</span>
                                    <span class="icon-chevron">
                                        <i class="fa fa-chevron-down"></i>
                                    </span>
                                </div>
                                <div class="sort-content">
                                    <form id="sortForm" action="UserListServlet" method="post">
                                        <input type="hidden" name="action" value="sort" />
                                        <ul class="sort-list">
                                            <li style="margin-top: 10px">
                                                <input type="radio" name="sortby" value="IdAsc" id="IdAsc" style="display: none;">
                                                <label for="IdAsc">ID tăng dần</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sortby" value="IdDesc" id="IdDesc" style="display: none;">
                                                <label for="IdDesc">ID giảm dần</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sortby" value="fullnameAsc" id="fullnameAsc" style="display: none;">
                                                <label for="fullnameAsc">Tên tăng từ A-Z</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sortby" value="fullnameDesc" id="fullnameDesc" style="display: none;">
                                                <label for="fullnameDesc">Tên giảm từ Z-A</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sortby" value="genderAsc" id="genderAsc" style="display: none;">
                                                <label for="genderAsc">Giới tính từ A-Z</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sortby" value="genderDesc" id="genderDesc" style="display: none;">
                                                <label for="genderDesc">Giới tính từ Z-A</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sortby" value="emailAsc" id="emailAsc" style="display: none;">
                                                <label for="emailAsc">Email từ A-Z</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sortby" value="emailDesc" id="emailDesc" style="display: none;">
                                                <label for="emailDesc">Email từ Z-A</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sortby" value="phoneAsc" id="phoneAsc" style="display: none;">
                                                <label for="phoneAsc">Số điện thoại tăng dần</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sortby" value="phoneDesc" id="phoneDesc" style="display: none;">
                                                <label for="phoneDesc">Số điện thoại giảm dần</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sortby" value="roleAsc" id="roleAsc" style="display: none;">
                                                <label for="roleAsc">Role từ A-Z</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sortby" value="roleDesc" id="roleDesc" style="display: none;">
                                                <label for="roleDesc">Role từ Z-A</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sortby" value="statusUserAsc" id="statusUserAsc" style="display: none;">
                                                <label for="statusUserAsc">Status từ A-Z</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sortby" value="statusUserDesc" id="statusUserDesc" style="display: none;">
                                                <label for="statusUserDesc">Status từ Z-A</label>
                                            </li>
                                        </ul>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Add New Product Modal -->
                        <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="addProductModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addProductModalLabel">Add New User</h5>
                                        <button type="button" class="close btn btn-danger" data-dismiss="modal" aria-label="Close" style="margin-left: 532px;">
                                            <span aria-hidden="true" style="width: 40px; height: 20px">X</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="addUserForm" action="ManageUserServlet" method="post" enctype="multipart/form-data">
                                            <input type="hidden" name="action" value="addNewUser">
                                            <div class="form-group">
                                                <label for="fullname">Họ và tên</label>
                                                <input type="text" class="form-control" id="fullname" name="fullname" required value="${param.fullname}">
                                            </div>
                                            <div class="form-group">
                                                <label>Giới tính</label><br>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="gender" value="Male" id="genderMale" ${param.gender == 'Male' ? 'checked' : ''} required value="${param.gender}">
                                                    <label class="form-check-label" for="genderMale">Male</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="gender" value="Female" id="genderFemale" ${param.gender == 'Female' ? 'checked' : ''} required value="${param.gender}">
                                                    <label class="form-check-label" for="genderFemale">Female</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="phone">Số điện thoại</label>
                                                <input type="text" class="form-control" id="phone" name="phone" required value="${param.phone}">
                                            </div>
                                            <div class="form-group">
                                                <label for="address">Địa chỉ</label>
                                                <input type="text" class="form-control" id="address" name="address" required value="${param.address}">
                                            </div>
                                            <div class="form-group">
                                                <label for="email">Email</label>
                                                <input type="email" class="form-control" id="email" name="email" required value="${param.email}">
                                            </div>                                        
                                            <div class="form-group">
                                                <label for="roleId">Role:</label>
                                                <select class="form-control" id="roleId" name="roleID">
                                                    <c:forEach items="${requestScope.userRole}" var="userRole">
                                                        <option value="${userRole.id}">${userRole.rolename}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="status">Trạng thái:</label>
                                                <select class="form-control" id="status" name="status">
                                                    <option value="Inactive">Inactive</option>
                                                </select>
                                            </div>
                                            <div class="d-flex" style="justify-content: center; margin-top: 10px">
                                                <button type="submit" class="btn btn-primary">Save</button>
                                            </div>
                                            <div id="error-message" class="alert alert-danger" style="display: none; margin-top: 10px;">${requestScope.mess}</div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="ml-15 mb-15" style="margin: 20px 0px">
                            <form action="UserListServlet" method="post">
                                <input type="hidden" name="action" value="search"/> 
                                <div class="d-flex button-add ml-15">
                                    <input type="text" class="form-control" name="search" placeholder="Họ và tên, email, số điện thoại" style="width: 350px;" />
                                    <button class="btn btn-primary ml-15" type="submit">Search</button>
                                </div>
                            </form>
                        </div>       

                        <form id="filterForm" action="UserListServlet" method="post">
                            <input type="hidden" name="action" value="filter"/>
                            <div class="filter-form" style="margin-left: 15px">
                                <div style="font-weight: 600;
                                     font-size: 16px;
                                     text-transform: uppercase; margin-right: 20px">
                                    <span class="icon_title"><i class="fa fa-filter"></i></span>
                                    <span>Bộ Lọc</span>
                                </div>
                                <div class="dropdown">
                                    <div class="dropbtn">
                                        Gender
                                        <span><i class="fa fa-chevron-down"></i></span>
                                    </div>
                                    <ul class="dropdown-content">
                                        <li>
                                            <input type="checkbox" name="gender-filter" value="Male" style="display: inline-block" /> Male
                                        </li>
                                        <li>
                                            <input type="checkbox" name="gender-filter" value="Female" style="display: inline-block" /> Female
                                        </li>
                                    </ul>
                                </div>
                                <div class="dropdown">
                                    <div class="dropbtn">
                                        Role
                                        <span><i class="fa fa-chevron-down"></i></span>
                                    </div>
                                    <ul class="dropdown-content">
                                        <c:forEach items="${requestScope.userRole}" var="userRole">
                                            <li>
                                                <div style="display: flex; align-items: center">
                                                    <input type="checkbox" value="${userRole.id}" name="role_id-filter"/><span> ${userRole.rolename}</span>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <div class="dropdown">
                                    <div class="dropbtn">
                                        Status
                                        <span><i class="fa fa-chevron-down"></i></span>
                                    </div>
                                    <ul class="dropdown-content">
                                        <li>
                                            <input type="checkbox" name="status-filter" value="Active" /> Active
                                        </li>
                                        <li>
                                            <input type="checkbox" name="status-filter" value="Inactive" /> In Active
                                        </li>
                                        <li>
                                            <input type="checkbox" name="status-filter" value="Block" /> Block
                                        </li>

                                    </ul>
                                </div>
                                <div class="form-group" style="height: 40px">
                                    <button type="button" id="clearButton" class="btn btn-secondary" style="display: none; height: 40px">Clear</button>
                                </div>
                            </div>
                        </form>

                        <div class="card-style ml-15 mr-15">
                            <div class="table-responsive">
                                <table class="table top-selling-table">
                                    <thead>
                                        <tr>
                                            <th>
                                                <h6 class="text-sm text-medium" style="text-align: center;">ID</h6>
                                            </th>

                                            <th>
                                                <h6 class="text-sm text-medium" style="text-align: center;">Full name</h6>
                                            </th>
                                            <th class="min-width">
                                                <h6 class="text-sm text-medium" style="text-align: center;">Gender</h6>
                                            </th>
                                            <th class="min-width">
                                                <h6 class="text-sm text-medium" style="text-align: center;">Email</h6>
                                            </th>
                                            <th class="min-width">
                                                <h6 class="text-sm text-medium" style="text-align: center;">Phone Number</h6>
                                            </th>

                                            <th class="min-width">
                                                <h6 class="text-sm text-medium" style="text-align: center;">Role</h6>
                                            </th>
                                            <th class="min-width">
                                                <h6 class="text-sm text-medium" style="text-align: center;">Status</h6>
                                            </th>

                                            <th class="min-width">
                                                <h6 class="text-sm text-medium" style="text-align: center;">Action</h6>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody id="user-container">   
                                        <c:set value="${requestScope.htmlResponse}" var="htmlResponse"/>
                                        ${htmlResponse}
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="sortpagibar pagi clearfix text-center">
                            <div id="pagination" class="clearfix">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <form id="paginationForm" action="UserListServlet" method="post">
                                        <input type="hidden" name="action" value="pagination">
                                        <div id="page-pagination">
                                            <c:forEach var="page" items="${pagenumber}">
                                                <input type="radio" name="page" id="page${page}" value="${page}" style="display: none;">
                                                <label for="page${page}" style="width: 25px;
                                                       border: groove;" class="page-node" aria-label="Trang ${page}" onclick="handlePageClick(${page})">${page}</label>
                                            </c:forEach>
                                            <span class="page-node">&hellip;</span>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>                             
            </div>
        </div>
        <%@include file="DashboardFooter.jsp" %>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.bundle.min.js"></script>
        <script>
                                                           $(document).ready(function () {
                                                               $('#addUserForm').submit(function (e) {
                                                                   e.preventDefault(); // Ngăn chặn form submit mặc định

                                                                   $.ajax({
                                                                       type: 'POST',
                                                                       url: 'ManageUserServlet', // Đường dẫn tới servlet của bạn
                                                                       data: $('#addUserForm').serialize(),
                                                                       success: function (response) {
                                                                           if (response.trim() === 'success') {
                                                                               console.log('Modal hide triggered');
                                                                               console.log(response);
                                                                               $('#addUserModal').modal('hide'); // Đóng modal khi thành công
                                                                               alert('Email đã được gửi. Vui lòng xác nhận.');
                                                                               setTimeout(function () {
                                                                                   location.reload(); // Tải lại trang sau khi modal đã được đóng
                                                                               }, 500);
                                                                           } else {
                                                                               $('#error-message').html('Tài khoản đã tồn tại.'); // Hiển thị thông báo lỗi trong div error-message
                                                                               $('#error-message').show(); // Hiển thị div error-message
                                                                           }
                                                                       },
                                                                       error: function () {
                                                                           alert('Đã xảy ra lỗi trong quá trình xử lý.');
                                                                       }
                                                                   });
                                                               });
                                                           });
                                                           function reloadPage() {
                                                               fetch('/UserListServlet?action=logout', {method: 'GET'})
                                                                       .then(response => response.text())
                                                                       .then(data => {
                                                                           console.log(data); // Dùng để kiểm tra
                                                                           window.location.reload();
                                                                       })
                                                                       .catch(error => {
                                                                           console.error('Error:', error);
                                                                           // Xử lý lỗi nếu cần
                                                                       });
                                                           }
        </script>


        <script>
            function previewImage(event, imageId) {
                var input = event.target;
                var reader = new FileReader();

                reader.onload = function () {
                    var dataURL = reader.result;
                    var image = document.getElementById(imageId);
                    image.src = dataURL;
                };
                reader.readAsDataURL(input.files[0]);
            }
        </script>
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
                        $("#user-container").html(response); // Cập nhật nội dung sản phẩm
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
                            $("#user-container").html(response); // Cập nhật nội dung sản phẩm
                        },
                        error: function (xhr, status, error) {
                            console.error("Error: " + error);
                        }
                    });
                }
            });

            $(document).ready(function () {
                var filterForm = $('#filterForm');
                var clearButton = $('#clearButton');
                var checkboxes = filterForm.find('input[type="checkbox"]');

                function submitForm() {
                    $.ajax({
                        type: 'POST',
                        url: filterForm.attr('action'),
                        data: filterForm.serialize(),
                        success: function (response) {
                            var responses = response.split('|');
                            if (responses.length === 2) {
                                var htmlResponse = responses[0];
                                var pagePagination = responses[1];
                                // Cập nhật nội dung sản phẩm
                                $("#user-container").html(htmlResponse);
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

                // Bắt sự kiện thay đổi của checkbox
                checkboxes.on('change', function () {
                    clearButton.show(); // Hiển thị nút Clear khi có thay đổi
                    submitForm(); // Submit form
                });

                // Bắt sự kiện click nút Clear
                clearButton.on('click', function () {
                    checkboxes.prop('checked', false); // Bỏ chọn tất cả các checkbox
                    clearButton.hide(); // Ẩn nút Clear
                    submitForm(); // Submit form sau khi reset
                });
            });

        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    </body>
</html>
