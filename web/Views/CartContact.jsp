<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .payment-details {
                margin-top: 10px;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #f9f9f9;
                display: none; /* Ẩn mặc định */
            }
        </style>
    </head>

    <body>
        <section style="background-color: #f2f2f2;">
            <div class="container py-4">
                <div class="d-flex align-items-center row">
                    <div class="col-5">
                        <a href="${pageContext.request.contextPath}/HomePage" class="d-flex align-items-center text-dark text-decoration-none">
                            <div>
                                <!-- Add your logo here -->
                                <img src="image/furniture-high-resolution-logo-transparent.png" style="height: 48px;" alt="Logo"
                                     class="img-fluid">
                            </div>
                            <div style="background-color: #f2f2f2;padding: 20px 0; border-left: 3px solid #000;margin-left: 3%;margin-right: 2%;">
                            </div>
                            <div class="ml-2 d-flex align-items-center">
                                <h2>Thanh Toán </h2>
                            </div>
                        </a>
                    </div>
                    <div class="col-2"></div>
                    <div class="ml-auto col-5">

                    </div>
                </div>
            </div>
        </section>
        <div role="main" class="container">
            <div class="card mb-3">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="d-flex align-items-center">
                            <svg height="16" viewBox="0 0 12 16" width="12"
                                 class="shopee-svg-icon icon-location-marker mr-2">
                            <path
                                d="M6 3.2c1.506 0 2.727 1.195 2.727 2.667 0 1.473-1.22 2.666-2.727 2.666S3.273 7.34 3.273 5.867C3.273 4.395 4.493 3.2 6 3.2zM0 6c0-3.315 2.686-6 6-6s6 2.685 6 6c0 2.498-1.964 5.742-6 9.933C1.613 11.743 0 8.498 0 6z"
                                fill-rule="evenodd"></path>
                            </svg>
                            <h2 class="h5">Địa chỉ nhận hàng</h2>
                        </div>

                        <button class="btn btn-outline-primary" type="button" class="btn btn-primary" data-toggle="modal"
                                data-target="#addressModal">Thay đổi</button>

                        <div class="modal fade" id="addressModal" tabindex="-1" role="dialog"
                             aria-labelledby="addressModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addressModalLabel">Địa Chỉ Của Tôi</h5>
                                        <button type="button" class="close" id="closeAddressModal" data-dismiss="modal">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="updateAddressCartForm" action="${pageContext.request.contextPath}/UpdateAddressCartContact" method="post">
                                            <input type="hidden" id="shouldOpenModal" name="shouldOpenModal" value="${shouldOpenModal}">
                                            <c:forEach items="${addresslist}" var="address">
                                                <div class="address-card d-flex justify-content-between">
                                                    <div class="d-flex">
                                                        <div>
                                                            <c:choose >
                                                                <c:when test="${address.status eq 'default' }"><input type="radio" name="selectedAddressId" value="${address.id}" checked></c:when>
                                                                <c:otherwise><input type="radio" name="selectedAddressId" value="${address.id}"></c:otherwise>
                                                            </c:choose>

                                                        </div>

                                                        <div>

                                                            <c:choose >
                                                                <c:when test="${address.fullname ne ''}"><strong>${address.fullname}</strong></c:when>
                                                                <c:otherwise><strong>${sessionScope.customer.fullname}</strong></c:otherwise>
                                                            </c:choose>
                                                            <div>${address.phonenumber}</div>
                                                            <div>${address.addressdetail}</div>
                                                            <div>${address.address}</div>

                                                        </div>
                                                    </div>
                                                    <div>
                                                        <a href="${pageContext.request.contextPath}/UpdateAddress?id=${address.id}"  class="btn btn-link">Cập nhật</a>
                                                    </div>
                                                </div>

                                                <c:if test="${address.status eq 'default' }">
                                                    <div class="badge badge-default">Mặc định</div>
                                                </c:if>
                                            </c:forEach>
                                        </form>

                                        <button class="btn btn-outline-primary btn-block" type="button"
                                                class="btn btn-primary" data-toggle="modal" data-target="#newAddressModal">Thêm
                                            Địa Chỉ Mới</button>


                                        <div class="modal fade" id="newAddressModal" tabindex="-1" role="dialog"
                                             aria-labelledby="newAddressModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-lg" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="newAddressModalLabel">Địa chỉ mới</h5>
                                                        <button type="button" class="close" id="closeNewAddressModal" data-dismiss="modal">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form id="addNewAddress" action="${pageContext.request.contextPath}/AddNewAddress" method="Get">
                                                            <div class="form-group">
                                                                <label for="fullName" class="form-label">Họ và tên</label>
                                                                <input type="text" class="form-control" id="fullName" name="fullname"
                                                                       placeholder="Họ và tên" autocomplete="name"
                                                                       maxlength="64">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="phoneNumber" class="form-label">Số điện
                                                                    thoại</label>
                                                                <input type="text" class="form-control" id="addPhoneNumber" name="phonenumber"
                                                                       placeholder="Số điện thoại"
                                                                       autocomplete="user-address-phone">
                                                                <div class="invalid-feedback" id="phoneError1">Số điện thoại không hợp lệ. Vui lòng nhập số điện thoại Việt Nam hợp lệ.</div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="province" class="form-label">Tỉnh/Thành
                                                                    phố</label>
                                                                <select class="form-control" id="province" name="tinh">
                                                                    <option value="">Chọn Tỉnh/Thành phố</option>
                                                                    <option value="Hà Nội">Hà Nội</option>
                                                                    <option value="TP. Hồ Chí Minh">TP. Hồ Chí Minh</option>
                                                                    <!-- Add more options as needed -->
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="district" class="form-label">Quận/Huyện</label>
                                                                <select class="form-control" id="district" disabled name="huyen">
                                                                    <option value="">Chọn Quận/Huyện</option>
                                                                    <!-- Options will be loaded based on selected province -->
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="ward" class="form-label">Phường/Xã</label>
                                                                <select class="form-control" id="ward" disabled name="xa">
                                                                    <option value="">Chọn Phường/Xã</option>
                                                                    <!-- Options will be loaded based on selected district -->
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="specificAddress" class="form-label">Địa chỉ cụ
                                                                    thể</label>
                                                                <textarea class="form-control" id="specificAddress" rows="2"
                                                                          placeholder="Địa chỉ cụ thể"
                                                                          autocomplete="user-street-address"
                                                                          maxlength="128" name="addressdetail"></textarea>
                                                            </div>
                                                            <div>
                                                                <input type="checkbox" name="status" value="default">
                                                                Đặt làm mặc định
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary"
                                                                id="backNewAddressModal" data-dismiss="modal">Trở Lại</button>
                                                        <button type="submit" class="btn btn-primary" form="addNewAddress">Hoàn thành</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>




                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" id="cancelAddressModal" data-dismiss="modal">Huỷ</button>
                                        <button type="submit" class="btn btn-primary" form="updateAddressCartForm">Xác nhận</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="editAddressModal" tabindex="-1" role="dialog" aria-labelledby="newAddressModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="newAddressModalLabel">Chỉnh sửa Địa chỉ</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="EditAddress" action="${pageContext.request.contextPath}/UpdateAddress" method="post">
                                            <input type="hidden" id="shouldEditModal" name="shouldOpenModal" value="${shouldEditModal}">
                                            <input type="hidden" id="id" name="id" value="${address.id}">
                                            <div class="form-group">
                                                <label for="fullName" class="form-label">Họ và tên</label>
                                                <c:choose>
                                                    <c:when test="${address.fullname ne ''}">
                                                        <input type="text" class="form-control" id="fullName" name="fullname" placeholder="Họ và tên" autocomplete="name" value="${address.fullname}" maxlength="64">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="text" class="form-control" id="fullName" name="fullname" placeholder="Họ và tên" autocomplete="name" value="${requestScope.customer.fullname}" maxlength="64">
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="form-group">
                                                <label for="phoneNumber" class="form-label">Số điện thoại</label>
                                                <input type="text" class="form-control" id="editPhoneNumber" name="phonenumber" value="${address.phonenumber}" placeholder="Số điện thoại" autocomplete="user-address-phone">
                                            </div>
                                            <div class="form-group">
                                                <label for="province" class="form-label">Tỉnh/Thành phố</label>
                                                <select class="form-control" id="province1" name="tinh">
                                                    <option value="">Chọn Tỉnh/Thành phố</option>
                                                    <option value="Hà Nội">Hà Nội</option>
                                                    <option value="TP. Hồ Chí Minh">TP. Hồ Chí Minh</option>
                                                    <!-- Add more options as needed -->
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="district" class="form-label">Quận/Huyện</label>
                                                <select class="form-control" id="district1" disabled name="huyen">
                                                    <option value="">Chọn Quận/Huyện</option>
                                                    <!-- Options will be loaded based on selected province -->
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="ward" class="form-label">Phường/Xã</label>
                                                <select class="form-control" id="ward1" disabled name="xa">
                                                    <option value="">Chọn Phường/Xã</option>
                                                    <!-- Options will be loaded based on selected district -->
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="specificAddress" class="form-label">Địa chỉ cụ thể</label>
                                                <textarea class="form-control" id="specificAddress" rows="2" placeholder="Địa chỉ cụ thể" autocomplete="user-street-address" maxlength="128" name="addressdetail">${address.addressdetail}</textarea>
                                            </div>
                                            <div>
                                                <c:choose>
                                                    <c:when test="${addressupdate.status eq 'default'}">
                                                        <input type="checkbox" name="status" value="default" checked> Đặt làm mặc định
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="checkbox" name="status" value="default"> Đặt làm mặc định
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" id="backEditAddressModal" class="btn btn-secondary" >Trở Lại</button>
                                        <button type="submit" class="btn btn-primary" form="EditAddress">Hoàn thành</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div style="padding-left: 2%">
                    <c:choose>
                        <c:when test="${addressupdate!=null}">

                            <p class="mb-1">

                                <c:choose >
                                    <c:when test="${addressupdate.fullname ne ''}"><strong>${addressupdate.fullname}</strong></c:when>
                                    <c:otherwise><strong>${sessionScope.customer.fullname}</strong></c:otherwise>
                                </c:choose> 
                                ${addressupdate.phonenumber}</p>
                            <p class="mb-1">${addressupdate.addressdetail} </p>
                            <p class="mb-1"> ${addressupdate.address}</p>
                            <c:if test="${addressupdate.status eq 'default'}">
                                <p class="text-muted">Mặc định</p>
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${addresslist}" var="address">

                                <c:set var="status" value="default" ></c:set>
                                <c:if test="${address.status eq status }">
                                    <p class="mb-1">

                                        <c:choose>
                                            <c:when test="${address.fullname ne ''}">
                                                <strong>${address.fullname}</strong>
                                            </c:when>
                                            <c:otherwise>
                                                <strong>${sessionScope.customer.fullname}</strong>
                                            </c:otherwise>
                                        </c:choose>

                                        ${address.phonenumber}</p>
                                    <p class="mb-1">${address.addressdetail} </p>
                                    <p class="mb-1"> ${address.address}</p>
                                    <p class="text-muted">Mặc định</p>
                                </c:if>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>


                </div>
            </div>




            <div class="card mb-3">
                <div class="card-body">
                    <h2 class="h5">Sản phẩm</h2>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>

                                    <th scope="col-3 d-flex justify-content-center align-items-center">Sản phẩm</th>
                                    <th scope="col-2 d-flex justify-content-center align-items-center">Đơn giá</th>
                                    <th scope="col-2 d-flex justify-content-center align-items-center">Số lượng</th>
                                    <th scope="col-2 d-flex justify-content-center align-items-center">Thành tiền</th>
                                    <th scope="col-3 d-flex justify-content-center align-items-center">Lời nhắn</th>
                                </tr>
                            </thead>
                            <tbody>
                                 <c:if test="${empty listcartdetail}">
                                 <h3 class="d-flex justify-content-center">Chưa có sản phẩm vui lòng trở lại <a href="${pageContext.request.contextPath}/CartDetail" style="color: orange" >Giỏ Hàng</a></h3>
                                    </c:if>
                                <c:forEach items="${listcartdetail}" var="cartdetail" varStatus="status">
                                   
                                    <tr>
                                        <td class="align-middle">

                                            <a href="${pageContext.request.contextPath}/MoreProduct?brand= ${cartdetail.brand.id}&&brandname=${cartdetail.brand.brandname}"
                                               class="ms-2 text-decoration-none text-dark d-flex align-items-center">
                                                <span>Shop:</span>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                     fill="currentColor" class="bi bi-shop ml-1" viewBox="0 0 16 16">
                                                <path
                                                    d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.37 2.37 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0M1.5 8.5A.5.5 0 0 1 2 9v6h1v-5a1 1 0 0 1 1-1h3a1 1 0 0 1 1 1v5h6V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5M4 15h3v-5H4zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1zm3 0h-2v3h2z" />
                                                </svg>
                                                ${cartdetail.brand.brandname}
                                            </a>
                                        </td>
                                        <td class="align-middle">
                                            <a href="${pageContext.request.contextPath}/MoreProduct?category=${cartdetail.category.id}&&categoryname=${cartdetail.category.category}"
                                               class="ms-2 text-decoration-none text-dark d-flex align-items-center">
                                                <span>Category:</span>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                     fill="currentColor" class="bi bi-bookmarks ml-1" viewBox="0 0 16 16">
                                                <path
                                                    d="M2 4a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v11.5a.5.5 0 0 1-.777.416L7 13.101l-4.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v10.566l3.723-2.482a.5.5 0 0 1 .554 0L11 14.566V4a1 1 0 0 0-1-1z" />
                                                <path
                                                    d="M4.268 1H12a1 1 0 0 1 1 1v11.768l.223.148A.5.5 0 0 0 14 13.5V2a2 2 0 0 0-2-2H6a2 2 0 0 0-1.732 1" />
                                                </svg>
                                                ${cartdetail.category.category}
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>


                                        <td class="align-middle">
                                            <div class="d-flex align-items-center">
                                                <img class="mr-2" alt="product image"
                                                     src="image/product/${cartdetail.product.image}"
                                                     width="40" height="40">
                                                <span>${cartdetail.product.name}</span>
                                            </div>

                                            <div>${cartdetail.color.colorname}</div>
                                        </td>
                                        <td class="align-middle">
                                            ${cartdetail.cartItem.totalcost/cartdetail.cartItem.quantity}

                                        </td>
                                        <td class="align-middle">${cartdetail.cartItem.quantity}</td>
                                        <td class="align-middle">${cartdetail.cartItem.totalcost}</td>
                                        <td class="align-middle">
                                            <div class="form-group">
                                                <label for="message">Lời nhắn:</label>
                                                <input type="text" class="form-control" id="message"
                                                       placeholder="Lưu ý cho Người bán...">
                                            </div>
                                            <div >
                                                <h3 class="h6">Tổng số tiền (1 sản phẩm):</h3>
                                                <div>${cartdetail.cartItem.totalcost}</div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>


            <div class="card mb-3">
                <div class="card-body">
                    <h2 class="h5">Phương thức thanh toán</h2>
                    <div class="btn-group-toggle" data-toggle="buttons">
                        <!-- Sử dụng forEach để lặp qua danh sách các phương thức thanh toán -->
                        <!-- Sử dụng radio button để chọn phương thức thanh toán -->
                        <c:forEach items="${paymentmethodList}" var="method" varStatus="loop">
                            <label class="btn btn-outline-secondary">
                                <input type="radio" name="payment" class="payment-radio" onclick="togglePaymentDetails(${loop.index})"> ${method.name}
                            </label>
                        </c:forEach>
                    </div>

                    <!-- Chi tiết phương thức thanh toán -->
                    <c:forEach items="${paymentmethodList}" var="method" varStatus="loop">
                        <div class="payment-details d-none" id="payment-details-${loop.index}">
                            <!-- Sử dụng mã JSTL để hiển thị hình ảnh và mô tả của từng phương thức thanh toán -->
                            <div class="d-flex justify-content-center"><img src="image/${method.image}" alt="alt" style="width: 50%;height: 50%"></div>
                            <div>${method.description}</div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="card mb-3">
                <div class="card-body">
                    <h3 class="h6">Tổng thanh toán</h3>
                    <div class="d-flex justify-content-between">
                        <div>
                            <p class="mb-1">Tổng tiền hàng</p>

                            <p class="mb-1">Tổng thanh toán</p>
                        </div>
                        <div>
                            <p class="mb-1">₫${sumtotalprice}</p>

                            <p class="font-weight-bold">₫${sumtotalprice}</p>
                        </div>
                    </div>
                    <div class="alert alert-info" role="alert">
                        Nhấn "Đặt hàng" đồng nghĩa với việc bạn đồng ý tuân theo <a
                            href="https://help.shopee.vn/portal/article/77242" target="_blank"
                            rel="noopener noreferrer">Điều khoản Furniture</a>
                    </div>
                    <button class="btn btn-primary btn-block">Đặt hàng</button>
                    <a href="${pageContext.request.contextPath}/CartDetail" class="btn btn-primary btn-block">Back To CartDetail</a>
                </div>
            </div>
        </div>

        <%@ include file="HomeFooter.jsp" %>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <script>
                                    $(document).ready(function () {
                                        $('#province').change(function () {
                                            var province = $(this).val();
                                            if (province) {
                                                // Enable district dropdown and load options based on province
                                                $('#district').prop('disabled', false);
                                                $('#district').html('<option value="">Chọn Quận/Huyện</option>');
                                                // Add district options dynamically based on selected province
                                                if (province == 'Hà Nội') {
                                                    $('#district').append('<option value="Cầu Giấy">Cầu Giấy</option>');
                                                    $('#district').append('<option value="Đống Đa">Đống Đa</option>');
                                                } else if (province == 'TP. Hồ Chí Minh') {
                                                    $('#district').append('<option value="Minh Khai">Minh Khai</option>');
                                                    $('#district').append('<option value="Bình Tân">Bình Tân</option>');
                                                }
                                            } else {
                                                $('#district').prop('disabled', true);
                                                $('#district').html('<option value="">Chọn Quận/Huyện</option>');
                                                $('#ward').prop('disabled', true);
                                                $('#ward').html('<option value="">Chọn Phường/Xã</option>');
                                            }
                                        });

                                        $('#district').change(function () {
                                            var district = $(this).val();
                                            if (district) {
                                                // Enable ward dropdown and load options based on district
                                                $('#ward').prop('disabled', false);
                                                $('#ward').html('<option value="">Chọn Phường/Xã</option>');
                                                // Add ward options dynamically based on selected district
                                                if (district == 'Cầu Giấy') {
                                                    $('#ward').append('<option value="Yên Hòa">Yên Hòa</option>');
                                                    $('#ward').append('<option value="Dịch Vọng">Dịch Vọng</option>');
                                                } else if (district == 'Đống Đa') {
                                                    $('#ward').append('<option value="Khâm Thiên">Khâm Thiên</option>');
                                                    $('#ward').append('<option value="Quang Trung">Quang Trung</option>');
                                                }
                                            } else {
                                                $('#ward').prop('disabled', true);
                                                $('#ward').html('<option value="">Chọn Phường/Xã</option>');
                                            }
                                        });
                                    });
                                    $(document).ready(function () {
                                        $('#province1').change(function () {
                                            var province = $(this).val();
                                            if (province) {
                                                // Enable district dropdown and load options based on province
                                                $('#district1').prop('disabled', false);
                                                $('#district1').html('<option value="">Chọn Quận/Huyện</option>');
                                                // Add district options dynamically based on selected province
                                                if (province == 'Hà Nội') {
                                                    $('#district1').append('<option value="Cầu Giấy">Cầu Giấy</option>');
                                                    $('#district1').append('<option value="Đống Đa">Đống Đa</option>');
                                                } else if (province == 'TP. Hồ Chí Minh') {
                                                    $('#district1').append('<option value="Minh Khai">Minh Khai</option>');
                                                    $('#district1').append('<option value="Bình Tân">Bình Tân</option>');
                                                }
                                            } else {
                                                $('#district1').prop('disabled', true);
                                                $('#district1').html('<option value="">Chọn Quận/Huyện</option>');
                                                $('#ward1').prop('disabled', true);
                                                $('#ward1').html('<option value="">Chọn Phường/Xã</option>');
                                            }
                                        });

                                        $('#district1').change(function () {
                                            var district = $(this).val();
                                            if (district) {
                                                // Enable ward dropdown and load options based on district
                                                $('#ward1').prop('disabled', false);
                                                $('#ward1').html('<option value="">Chọn Phường/Xã</option>');
                                                // Add ward options dynamically based on selected district
                                                if (district == 'Cầu Giấy') {
                                                    $('#ward1').append('<option value="Yên Hòa">Yên Hòa</option>');
                                                    $('#ward1').append('<option value="Dịch Vọng">Dịch Vọng</option>');
                                                } else if (district == 'Đống Đa') {
                                                    $('#ward1').append('<option value="Khâm Thiên">Khâm Thiên</option>');
                                                    $('#ward1').append('<option value="Quang Trung">Quang Trung</option>');
                                                }
                                            } else {
                                                $('#ward1').prop('disabled', true);
                                                $('#ward1').html('<option value="">Chọn Phường/Xã</option>');
                                            }
                                        });
                                    });
                                    
                                    // Handle closing modals with jQuery
                                    $('#closeAddressModal, #cancelAddressModal').click(function () {
                                        $('#addressModal').modal('hide');
                                    });

                                    $('#closeNewAddressModal, #backNewAddressModal').click(function () {
                                        $('#newAddressModal').modal('hide');
                                    });

                                    $(document).ready(function () {
                                        // Kiểm tra nếu cần mở modal
                                        if ($('#shouldOpenModal').val() === 'true') {
                                            $('#addressModal').modal('show');
                                        }
                                    });
                                    $(document).ready(function () {
                                        $('#backEditAddressModal').click(function () {
                                            $('#editAddressModal').modal('hide');
                                            $('#addressModal').modal('show');
                                        });
                                    });
                                    $(document).ready(function () {
                                        // Kiểm tra nếu cần mở modal
                                        if ($('#shouldEditModal').val() === 'true') {
                                            $('#editAddressModal').modal('show');
                                        }
                                    });
                                    function validatePhoneNumber() {
                                        var phoneNumber = document.getElementById('editPhoneNumber').value;
                                        var phoneRegex = /^(0|\+84)[3|5|7|8|9]\d{8}$/;

                                        if (!phoneRegex.test(phoneNumber)) {
                                            document.getElementById('editPhoneNumber').classList.add('is-invalid');
                                            document.getElementById('phoneError2').style.display = 'block';
                                            return false;
                                        }

                                        document.getElementById('editPhoneNumber').classList.remove('is-invalid');
                                        document.getElementById('phoneError2').style.display = 'none';
                                        return true;
                                    }
                                    function validatePhoneNumber() {
                                        var phoneNumber = document.getElementById('addPhoneNumber').value;
                                        var phoneRegex = /^(0|\+84)[3|5|7|8|9]\d{8}$/;

                                        if (!phoneRegex.test(phoneNumber)) {
                                            document.getElementById('addPhoneNumber').classList.add('is-invalid');
                                            document.getElementById('phoneError1').style.display = 'block';
                                            return false;
                                        }

                                        document.getElementById('addPhoneNumber').classList.remove('is-invalid');
                                        document.getElementById('phoneError1').style.display = 'none';
                                        return true;
                                    }
                                    function togglePaymentDetails(index) {
                                        // Ẩn tất cả các payment-details trước khi hiển thị
                                        $(".payment-details").removeClass("d-block").addClass("d-none");

                                        // Hiển thị payment-details tương ứng với index được truyền vào
                                        $("#payment-details-" + index).removeClass("d-none").addClass("d-block");
                                    }


        </script>
    </body>

</html>