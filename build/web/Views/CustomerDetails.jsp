<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Customer Details</title>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
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
                <div class="container" style="margin-top: 20px">
                    <h1 class="mb-4">Chi tiết tài khoản: #${cus.getId()}</h1>
                    <div style="display: flex; justify-content: flex-end">
                        <button class="btn btn-secondary col-2 mb-5" data-toggle="modal" data-target="#customerChangesModal">Lịch sử chỉnh sửa</button>
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
                                <input id="fullname" type="text" class="form-control" name="fullname" value="${cus.getFullname()}" readonly>
                                <button type="button" class="btn btn-secondary btn-sm edit-btn" onclick="editField('fullname')">
                                    <i class="fas fa-edit"></i>
                                </button>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="subtitle" class="col-sm-2 col-form-label">Giới tính</label>
                            <div class="col-sm-10 d-flex align-items-center">
                                <input id="gender" type="text" class="form-control" name="gender" value="${cus.getGender()}" readonly>
                                <button type="button" class="btn btn-secondary btn-sm edit-btn" onclick="editField('gender')">
                                    <i class="fas fa-edit"></i>
                                </button>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="subtitle" class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-10 d-flex align-items-center">
                                <input id="email" type="email" class="form-control" name="email" value="${cus.getEmail()}" readonly>
                                <button type="button" class="btn btn-secondary btn-sm edit-btn" onclick="editField('email')">
                                    <i class="fas fa-edit"></i>
                                </button>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="subtitle" class="col-sm-2 col-form-label">Số điên thoại</label>
                            <div class="col-sm-10 d-flex align-items-center">
                                <input id="phone" type="text" class="form-control" name="phone" value="${cus.getPhonenumber()}" readonly>
                                <button type="button" class="btn btn-secondary btn-sm edit-btn" onclick="editField('phone')">
                                    <i class="fas fa-edit"></i>
                                </button>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="subtitle" class="col-sm-2 col-form-label">Địa chỉ</label>
                            <div class="col-sm-10 d-flex align-items-center">
                                <input id="add" type="text" class="form-control" name="add" value="${cus.getAddress()}" readonly>
                                <button type="button" class="btn btn-secondary btn-sm edit-btn" onclick="editField('add')">
                                    <i class="fas fa-edit"></i>
                                </button>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="subtitle" class="col-sm-2 col-form-label">Trạng thái</label>
                            <div class="col-sm-10 d-flex align-items-center">
                                <input id="status" type="text" class="form-control" name="status" value="${cus.getStatus()}" readonly>
                                <div style="margin-left: 42px"></div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-10 offset-sm-2">
                                <button id="saveBtn" type="submit" class="btn btn-primary" style="display:none;">Lưu</button>
                            </div>
                        </div>
                    </form>

                    <!-- Modal -->
                    <div class="modal fade" id="resultModal" tabindex="-1" aria-labelledby="resultModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="resultModalLabel">Thông báo</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <p id="modalMessage"></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="DashboardFooter.jsp" %>
        <script>
            function editField(fieldId) {
                var field = document.getElementById(fieldId);
                field.readOnly = false;
                document.getElementById('saveBtn').style.display = 'block';
            }

            $(document).ready(function () {
                var result = '${result}';
                if (result === 'success') {
                    $('#modalMessage').text('Lưu thành công.');
                    $('#resultModal').modal('show');
                } else if (result === 'failure') {
                    $('#modalMessage').text('Lưu thất bại.');
                    $('#resultModal').modal('show');
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
