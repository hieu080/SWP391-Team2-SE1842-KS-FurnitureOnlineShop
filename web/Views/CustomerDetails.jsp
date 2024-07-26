<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Customer Details</title>
        <link rel="icon" href="image/logoshop.png" type="image/png">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.all.min.js"></script>
        <style>
            body {
                margin: 20px;
            }
            .thumbnail img {
                max-width: 100px;
                max-height: 100px;
            }
            .edit-btn {
                margin-left: 10px;
            }
            .form-group {
                display: flex;
                align-items: center;
            }
            .form-group input, .form-group select, .form-group textarea {
                flex-grow: 1;
            }

            .unchanged {
                color: black;
            }

            .changed {
                color: red;
            }

        </style>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="DashboardNavbar.jsp" %>
            <div class="main">
                <%@include file="DashboardHeader.jsp" %>
                <div class="container">
                    <h1 class="mb-4">Chi tiết tài khoản: #${cus.getId()}</h1>
                    <div class="row justify-content-center mb-4">

                        <button type="button" class="btn btn-secondary btn-sm edit-btn" onclick="editField('.ip')"
                                style="width:auto">
                            <p class="mb-0">Chỉnh sửa<i class="fas fa-edit pl-2"></i></p>
                        </button>
                    </div>

                    <!-- The Modal -->
                    <div class="modal fade" id="customerChangesModal">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">Lịch sử thay đổi</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal Body -->
                                <div class="modal-body">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>Tên</th>
                                                <th>Email</th>
                                                <th>Số điện thoại</th>
                                                <th>Giới tính</th>
                                                <th>Địa chỉ</th>
                                                <th>Ngày cập nhật</th>
                                                <th>Người cập nhật</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listchanges}" var="change">
                                                <tr>
                                                    <td>${change.getFullname()}</td>
                                                    <td>${change.getEmail()}</td>
                                                    <td>${change.getPhone()}</td>
                                                    <td>${change.getGender()}</td>
                                                    <td>${change.getAddress()} </td>
                                                    <td>${change.getUpdateddate()}</td>
                                                    <td><c:forEach items="${listMkt}" var="mkt">
                                                            <c:if test="${mkt.getId() == change.getUpdatedby()}">
                                                                <p>${mkt.getFullname()}</p>
                                                            </c:if>
                                                        </c:forEach></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <!-- Modal Footer -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                </div>

                            </div>
                        </div>
                    </div>


                    <form id="postForm" action="CustomerDetails?id=${cus.getId()}" method="post">

                        <div class="form-group row">
                            <label for="title" class="col-sm-2 col-form-label">Tên</label>
                            <div class="col-sm-10 d-flex align-items-center">
                                <input type="text" class="form-control ip" name="fullname" value="${cus.getFullname()}" readonly>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="subtitle" class="col-sm-2 col-form-label">Giới tính</label>
                            <div class="col-sm-10 d-flex align-items-center">
                                <input  type="text" class="form-control" id="gd1" value="${cus.getGender()}" readonly>
                                <select name="gender" style="display:none" id="gd2" class="form-control">
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
                        </div>

                        <div class="form-group row">
                            <label for="subtitle" class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-10 d-flex align-items-center">
                                <input type="email" class="form-control ip" name="email" value="${cus.getEmail()}" readonly>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="subtitle" class="col-sm-2 col-form-label">Số điên thoại</label>
                            <div class="col-sm-10 d-flex align-items-center">
                                <input type="number" class="form-control ip" name="phone" value="${cus.getPhonenumber()}" readonly>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="subtitle" class="col-sm-2 col-form-label">Địa chỉ</label>
                            <div class="col-sm-10 d-flex align-items-center">
                                <input  type="text" class="form-control ip" name="add" value="${cus.getAddress()}" readonly>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="subtitle" class="col-sm-2 col-form-label">Trạng thái</label>
                            <div class="col-sm-10 d-flex align-items-center">
                                <input type="text" class="form-control" name="status" value="${cus.getStatus()}" readonly>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-10 offset-sm-2">
                                <button id="saveBtn" type="submit" class="btn btn-primary" style="display:none;">Lưu</button>
                            </div>
                        </div>
                    </form>


                    <div class="row justify-content-end pr-3">
                        <button class="btn btn-secondary" data-toggle="modal" data-target="#customerChangesModal"
                                style="width:auto">Lịch sử</button>
                    </div>


                </div>
            </div>
        </div>
        <%@include file="DashboardFooter.jsp" %>
        <script>
            function editField(classname) {
                var field = document.querySelectorAll(classname);
                field.forEach(input => {
                    input.readOnly = false;
                }),
                        document.getElementById('gd1').style.display = 'none';
                document.getElementById('gd2').style.display = 'block';

                document.getElementById('saveBtn').style.display = 'block';
            }

            $(document).ready(function () {
                var result = '${result}';
                if (result === 'success') {
                    Swal.fire({
                        title: 'Lưu thành công',
                        icon: 'success',
                        confirmButtonText: 'Đóng'
                    });
                } else if (result === 'failure') {
                    Swal.fire({
                        title: 'Lưu thất bại',
                        text: '${error}',
                        icon: 'error',
                        confirmButtonText: 'Đóng'
                    });
                }
            });

            function highlightChanges() {
                const table = document.querySelector('#customerChangesModal table tbody');
                const rows = table.querySelectorAll('tr');

                rows.forEach(row => {
                    const cells = row.querySelectorAll('td');
                    cells.forEach((cell, index) => {
                        // Only apply to columns 1 to 5 (0-based index 0 to 4)
                        if (index < 5) {
                            if (cell.textContent.trim() !== 'unchanged') {
                                cell.classList.add('changed');
                            } else {
                                cell.classList.add('unchanged');
                            }
                        }
                    });
                });
            }

            $('#customerChangesModal').on('shown.bs.modal', function () {
                highlightChanges();
            });

        </script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.5.4/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>