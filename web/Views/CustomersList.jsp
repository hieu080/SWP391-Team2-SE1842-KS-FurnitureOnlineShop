<%-- 
    Document   : PostsList
    Created on : Jun 12, 2024, 3:37:09 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <title>Customers List</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9W9gE97nN9gqTckvYy7OfFs63QF7zCSQwwDWW" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.all.min.js"></script>
        <style>
            .dataTable th::before,
            .dataTable th::after {
                content: none !important;
                display: none !important;
            }

        </style>
    </head>

    <body>
        <div class="wrapper"> 
            <%@include file="DashboardNavbar.jsp" %>
            <div class="main">
                <%@include file="DashboardHeader.jsp" %>
                <div class="container card mt-3" >
                    <h1 class="mt-3">Customers List</h1>
                    <div>
                        <div class="ml-15 mb-15 d-flex mt-3" style="align-items: center">
                            <div style="font-weight: 600; font-size: 16px; text-transform: uppercase;">
                                <span class="icon_title"><i class="fa fa-filter"></i></span>
                                <span>Bộ Lọc</span>
                            </div>
                            <div> 
                                <select class="form-select ms-3" id="status-filter">
                                    <option value="">Tất cả trạng thái</option>
                                    <option value="Trực tuyến">Trực tuyến</option>
                                    <option value="Ngoại tuyến">Ngoại tuyến</option>
                                    <option value="Đã chặn">Đã chặn</option>
                                </select>
                            </div>
                        </div>            

                    </div>
                    <table id="table" class="display" style="width:100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên khách hàng</th>
                                <th>Giới tính</th>
                                <th>Số điện thoại</th>
                                <th>Email</th>
                                <th>Trạng thái</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listCus}" var="c">
                                <tr>
                                    <td>${c.getId()}</td>
                                    <td>${c.getFullname()}</td>
                                    <td>${c.getGender()}</td>
                                    <td>${c.getPhonenumber()}</td>
                                    <td>${c.getEmail()}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${c.getStatus() eq 'online'}"><p style="color:green">Trực tuyến</p></c:when>
                                            <c:when test="${c.getStatus() eq 'offline'}"><p style="color:grey">Ngoại tuyến</p></c:when>
                                            <c:when test="${c.getStatus() eq 'block'}"><p style="color:red">Đã chặn</p></c:when>
                                        </c:choose>
                                    </td>
                                    <td><a href="CustomerDetails?id=${c.getId()}" class="text-decoration-none text-black btn btn-info">Chi tiết</a></td>
                                </tr>  
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- Button to Open the Modal -->
                    <div class="mb-3">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createAccountModal"
                                style="width:auto">
                            Tạo tài khoản khách
                        </button>
                    </div>
                    <!-- The Modal to create new account-->
                    <div class="modal" id="createAccountModal">
                        <div class="modal-dialog">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Tạo tài khoản</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal Body -->
                                <div class="modal-body">
                                    <form id="createAccountForm" action="CustomersList" method="post">

                                        <div class="form-group">
                                            <label for="fullname">Tên:</label>
                                            <input type="text" class="form-control" id="fullname" name="fullname" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="gender">Giới tính:</label>
                                            <select name="gender" id="gender" class="form-select">
                                                <option value="Nam">
                                                    Nam
                                                </option>
                                                <option value="Nữ">
                                                    Nữ
                                                </option>
                                                <option value="Khác">
                                                    Khác
                                                </option>
                                            </select>

                                        </div>
                                        <div class="form-group">
                                            <label for="phone">Số điện thoại:</label>
                                            <input type="text" class="form-control" id="phone" name="phone" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="address">Địa chỉ:</label>
                                            <input type="text" class="form-control" id="address" name="address" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Email:</label>
                                            <input type="email" class="form-control" id="email" name="email" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="password">Mật khẩu:</label>
                                            <input type="password" class="form-control" id="password" name="password" required
                                                   pattern="(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}"
                                                   title="Mật khẩu phải có ít nhất 8 ký tự, bao gồm ít nhất một chữ hoa, một số và một ký tự đặc biệt.">
                                        </div>
                                        <div>
                                            <input type="checkbox" id="togglePasswords" onclick="togglePasswordVisibility10()"> Hiển thị mật khẩu
                                        </div>
                                    </form>
                                    <p <c:if test="${msg eq 'Tạo thành công'}">
                                            style="color:green"</c:if>
                                        style="color:red">${msg}</p>
                                </div>

                                <!-- Modal Footer -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
                                    <button id="createAccountButton" type="submit" class="btn btn-success" form="createAccountForm">Tạo tài khoản</button>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="DashboardFooter.jsp" %>
        <script>
            function togglePasswordVisibility10() {
                const passwordField = document.getElementById('password');
                console.log(passwordField);
                console.log(passwordField.type);
                if (passwordField.type === "password") {
                    passwordField.type = 'text';
                    console.log(passwordField.type);
                } else {
                    passwordField.type = 'password';
                    console.log(passwordField.type);
                }
            }


            $(document).ready(function () {
                var result = '${result}';
                if (result === 'success') {
                    Swal.fire({
                        title: 'Tạo thành công',
                        icon: 'success',
                        confirmButtonText: 'Đóng'
                    });
                } else if (result === 'failure') {
                    Swal.fire({
                        title: 'Tạo thất bại',
                        text: '${error}',
                        icon: 'error',
                        confirmButtonText: 'Đóng'
                    });
                }
            });

            $(document).ready(function () {
                if (${msg!=null}) {
                    $('#createAccountModal').modal('show');
                }

                // Khôi phục lại trang từ localStorage trước khi khởi tạo DataTable
                var currentPage = localStorage.getItem('currentPage');
                currentPage = currentPage ? parseInt(currentPage) : 0;

                var table = $('#table').DataTable({
                    "columnDefs": [
                        {"targets": [6], "searchable": false}, // tắt tính năng tìm kiếm cho các cột khác
                        {"orderable": false, "targets": [0, 2, 6]} // Vô hiệu hóa sắp xếp cho các cột
                    ],
                    "language": {
                        "search": "Tìm kiếm:"
                    },
                    "pageLength": 5,
                    "dom": 'rftp',
                    "displayStart": currentPage * 5 // Hiển thị trang đã lưu
                });

                // Lắng nghe sự thay đổi của thẻ select
                $('#status-filter').on('change', function () {
                    var status = $(this).val();

                    // Áp dụng bộ lọc cho DataTable
                    table.column(5).search(status).draw();
                });

                // Lưu trữ trang hiện tại vào localStorage khi thay đổi trang
                table.on('page.dt', function () {
                    var pageInfo = table.page.info();
                    localStorage.setItem('currentPage', pageInfo.page);
                });


            });
        </script>

    </body>

</html>