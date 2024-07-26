<%-- 
    Document   : Setting
    Created on : Jun 28, 2024, 7:32:50 PM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách cài đặt</title>
        <link rel="icon" href="image/logoshop.png" type="image/png">
        <link class="js-stylesheet" href="../css/light.css" rel="stylesheet">
        <style>
            .switch {
                position: relative;
                display: inline-block;
                width: 90px;
                height: 34px;
            }

            .switch input {
                opacity: 0;
                width: 0;
                height: 0;
            }

            .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: red;
                transition: .4s;
                border-radius: 34px;
            }

            .slider:before {
                position: absolute;
                content: "Inactive";
                height: 26px;
                width: 80px;
                left: 20px;
                bottom: 4px;
                background-color: transparent;
                color: white;
                font-size: 12px;
                line-height: 26px;
                text-align: center;
                transition: .4s;
            }

            input:checked + .slider {
                background-color: green;
            }

            input:checked + .slider:before {
                content: "Active";
                right: 20px;
                left: auto;
            }

            .slider:after {
                position: absolute;
                content: "";
                height: 26px;
                width: 26px;
                left: 4px;
                bottom: 4px;
                background-color: white;
                transition: .4s;
                border-radius: 50%;
            }

            input:checked + .slider:after {
                transform: translateX(56px);
            }

            .edit-icon {
                cursor: pointer;
                color: #007bff;
                font-size: 22px;
            }
            .edit-icon:hover {
                color: #0056b3;
            }
            .save-icon, .cancel-icon {
                cursor: pointer;
                color: #28a745; /* Green for save */
                font-size: 25px;
            }
            .cancel-icon {
                color: #dc3545; /* Red for cancel */
            }
            .save-icon:hover {
                color: #218838;
            }
            .cancel-icon:hover {
                color: #c82333;
            }
            .hidden-form {
                display: none;
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="DashboardNavbar.jsp" %>
            <div class="main">
                <%@include file="DashboardHeader.jsp" %>
                <main class="content">
                    <div class="container-fluid p-0">
                        <div class="row mb-2 mb-xl-3">
                            <div class="col-auto d-none d-sm-block">
                                <h3>Danh sách <strong>Cài đặt</strong></h3>
                            </div>
                        </div>
                        <h3>Phân trang</h3>
                        <c:set value="${requestScope.itemsHomeProductsList}" var="itemsHomeProductsList" scope="page"/>
                        <c:set value="${requestScope.itemsPerProductListPage}" var="itemsPerProductListPage" scope="page"/>
                        <c:set value="${requestScope.itemsPerFeedbackListPage}" var="itemsPerFeedbackListPage" scope="page"/>
                        <c:set value="${requestScope.itemsPerCustomerListPage}" var="itemsPerCustomerListPage" scope="page"/>
                        <c:set value="${requestScope.itemsPerPostList}" var="itemsPerPostList" scope="page"/>
                        <c:set value="${requestScope.itemsPerSliderPage}" var="itemsPerSliderPage" scope="page"/>
                        <c:set value="${requestScope.itemsPerOrderList}" var="itemsPerOrderList" scope="page"/>
                        <c:set value="${requestScope.itemsPerShoppingCartsListPage}" var="itemsPerShoppingCartsListPage" scope="page"/>
                        <div class="row">
                            <div class="col-md-3">
                                <div style="background-color: white; margin: 0px 10px 20px; border: groove">
                                    <div style="display: flex; justify-content: space-between">
                                        <strong style="margin-left: 10px; margin-top: 10px">Danh sách sp trang chủ</strong>
                                        <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#editHomeProductsListModal">
                                            <i class="fas fa-edit"></i></button>
                                    </div>
                                    <div style="display: flex; justify-content: center; align-items: baseline">
                                        <b class="item-count" style="font-size: 60px">${itemsHomeProductsList}</b><span>sản phẩm/trang</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div style="background-color: white; margin: 0px 10px 20px; border: groove">
                                    <div style="display: flex; justify-content: space-between">
                                        <strong style="margin-left: 10px; margin-top: 10px">Danh sách sản phẩm</strong>
                                        <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#editProductsListModal">
                                            <i class="fas fa-edit"></i></button>
                                    </div>
                                    <div style="display: flex; justify-content: center; align-items: baseline">
                                        <b class="item-count" style="font-size: 60px">${itemsPerProductListPage}</b><span>sản phẩm/trang</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div style="background-color: white; margin: 0px 10px 20px; border: groove">
                                    <div style="display: flex; justify-content: space-between">
                                        <strong style="margin-left: 10px; margin-top: 10px">Danh sách đánh giá</strong>
                                        <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#editFeedbacksListModal">
                                            <i class="fas fa-edit"></i></button>
                                    </div>
                                    <div style="display: flex; justify-content: center; align-items: baseline">
                                        <b class="item-count" style="font-size: 60px">${itemsPerFeedbackListPage}</b><span>sản phẩm/trang</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div style="background-color: white; margin: 0px 10px 20px; border: groove">
                                    <div style="display: flex; justify-content: space-between">
                                        <strong style="margin-left: 10px; margin-top: 10px">Danh sách người dùng</strong>
                                        <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#editCustomersListModal">
                                            <i class="fas fa-edit"></i></button>
                                    </div>
                                    <div style="display: flex; justify-content: center; align-items: baseline">
                                        <b class="item-count" style="font-size: 60px">${itemsPerCustomerListPage}</b><span>người dùng/trang</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div style="background-color: white; margin: 0px 10px 20px; border: groove">
                                    <div style="display: flex; justify-content: space-between">
                                        <strong style="margin-left: 10px; margin-top: 10px">Danh sách bài viết</strong>
                                        <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#editPostsListModal">
                                            <i class="fas fa-edit"></i></button>
                                    </div>
                                    <div style="display: flex; justify-content: center; align-items: baseline">
                                        <b class="item-count" style="font-size: 60px">${itemsPerPostList}</b><span>bài viết/trang</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div style="background-color: white; margin: 0px 10px 20px; border: groove">
                                    <div style="display: flex; justify-content: space-between">
                                        <strong style="margin-left: 10px; margin-top: 10px">Danh sách thanh trượt</strong>
                                        <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#editSlidersListModal">
                                            <i class="fas fa-edit"></i></button>
                                    </div>
                                    <div style="display: flex; justify-content: center; align-items: baseline">
                                        <b class="item-count" style="font-size: 60px">${itemsPerSliderPage}</b><span>ảnh trượt/trang</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div style="background-color: white; margin: 0px 10px 20px; border: groove">
                                    <div style="display: flex; justify-content: space-between">
                                        <strong style="margin-left: 10px; margin-top: 10px">Danh sách đơn hàng</strong>
                                        <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#editOrdersListModal">
                                            <i class="fas fa-edit"></i></button>
                                    </div>
                                    <div style="display: flex; justify-content: center; align-items: baseline">
                                        <b class="item-count" style="font-size: 60px">${itemsPerOrderList}</b><span>đơn hàng/trang</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div style="background-color: white; margin: 0px 10px 20px; border: groove">
                                    <div style="display: flex; justify-content: space-between">
                                        <strong style="margin-left: 10px; margin-top: 10px">Danh sách giỏ hàng</strong>
                                        <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#editShoppingCartsListModal">
                                            <i class="fas fa-edit"></i></button>
                                    </div>
                                    <div style="display: flex; justify-content: center; align-items: baseline">
                                        <b class="item-count" style="font-size: 60px">${itemsPerShoppingCartsListPage}</b><span>sản phẩm/trang</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr/>
                        <div class="container row">
                            <h3>Cài đặt</h3>
                            <div class="col-md-2" style="justify-content: flex-start; align-items: center">
                                <div style="background-color: white; width: 165px; height: 30px; display: flex; justify-content: center; align-items: center; border: groove">
                                    <a class="nav-link active" data-toggle="tab" href="#userRole">
                                        <div>Vai trò người dùng</div>
                                    </a>
                                </div>
                                <div style="background-color: white; width: 165px; height: 30px; display: flex; justify-content: center; align-items: center; border: groove">
                                    <a class="nav-link" data-toggle="tab" href="#category">
                                        <div>Danh mục</div>
                                    </a>
                                </div>
                                <div style="background-color: white; width: 165px; height: 30px; display: flex; justify-content: center; align-items: center; border: groove">
                                    <a class="nav-link" data-toggle="tab" href="#brand">
                                        <div>Thương hiệu</div>
                                    </a>
                                </div>
                                <div style="background-color: white; width: 165px; height: 30px; display: flex; justify-content: center; align-items: center; border: groove">
                                    <a class="nav-link" data-toggle="tab" href="#room">
                                        <div>Phòng</div>
                                    </a>
                                </div>
                                <div style="background-color: white; width: 165px; height: 30px; display: flex; justify-content: center; align-items: center; border: groove">
                                    <a class="nav-link" data-toggle="tab" href="#color">
                                        <div>Màu sắc</div>
                                    </a>
                                </div>
                                <div style="background-color: white; width: 165px; height: 30px; display: flex; justify-content: center; align-items: center; border: groove">
                                    <a class="nav-link" data-toggle="tab" href="#saleOff">
                                        <div>Giảm giá</div>
                                    </a>
                                </div>
                                <div style="background-color: white; width: 165px; height: 30px; display: flex; justify-content: center; align-items: center; border: groove">
                                    <a class="nav-link" data-toggle="tab" href="#categoryOfPost">
                                        <div>Danh mục bài đăng</div>
                                    </a>
                                </div>  
                            </div>

                            <!-- Tab content -->
                            <div class="tab-content col-md-10">
                                <div id="userRole" class="tab-pane fade show active">
                                    <div style="display: flex; justify-content: space-between">
                                        <div><h3>Vai trò người dùng</h3></div>
                                        <div><button class="btn btn-primary" type="button" data-toggle="modal" data-target="#addNewUserRoleModal">Thêm vai trò +</button></div>
                                    </div>
                                    <div style="border: groove">
                                        <table class="table">
                                            <thead>
                                            <th>ID</th>
                                            <th>Tên vai trò</th>
                                            <th>Trạng thái</th>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.userRoleList}" var="userRole">
                                                    <tr>
                                                        <td>${userRole.id}</td>
                                                        <td>${userRole.rolename}</td>
                                                        <td><form class="statusFormUserRole statusForm" action="SettingServlet" method="post">
                                                                <input type="hidden" name="action" value="changeStatusUserRole">
                                                                <input type="hidden" name="userRoleID" value="${userRole.id}">
                                                                <input type="hidden" name="statusChange" value="">
                                                                <label class="switch">
                                                                    <input type="checkbox" name="status" value="${userRole.status}" <c:if test="${userRole.status == 'Active'}">checked</c:if> <c:if test="${userRole.rolename == 'Admin'}">disabled</c:if> >
                                                                        <span class="slider"></span>
                                                                    </label>
                                                                </form>
                                                            </td>
                                                        </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div id="category" class="tab-pane fade">
                                    <div style="display: flex; justify-content: space-between">
                                        <div><h3>Danh mục</h3></div>
                                        <div><button class="btn btn-primary" type="button" data-toggle="modal" data-target="#addNewCategoryModal">Thêm danh mục +</button></div>
                                    </div>
                                    <div style="border: groove">
                                        <table class="table">
                                            <thead>
                                            <th>ID</th>
                                            <th>Tên danh mục</th>
                                            <th>Trạng thái</th>
                                            <th>Hành động</th>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.categoryList}" var="category">
                                                    <tr>
                                                        <td>${category.id}</td>
                                                        <td class="edit">
                                                            <div class="category-name">${category.category}</div>
                                                            <div class="hidden-form">
                                                                <form action="SettingServlet" method="POST" class="category-form">
                                                                    <input type="hidden" name="action" value="editCategory"/>
                                                                    <input type="hidden" name="categoryID" value="${category.id}"/>
                                                                    <input type="text" name="categoryName" value="${category.category}" style="width: 150px"/>
                                                                </form>
                                                            </div>
                                                        </td>
                                                        <td><form class="statusFormCategory statusForm" action="SettingServlet" method="post">
                                                                <input type="hidden" name="action" value="changeStatusCategory">
                                                                <input type="hidden" name="categoryID" value="${category.id}">
                                                                <input type="hidden" name="statusChange" value="">
                                                                <label class="switch">
                                                                    <input type="checkbox" name="status" value="${category.status}" <c:if test="${category.status == 'Active'}">checked</c:if> >
                                                                        <span class="slider"></span>
                                                                    </label>
                                                                </form>
                                                            </td>
                                                            <td>
                                                                <button class="btn edit-category-btn">
                                                                    <i class="fas fa-edit edit-icon"></i> Chỉnh sửa
                                                                </button>
                                                                <button class="btn save-category-btn" style="display: none;">
                                                                    <i class="fas fa-save save-icon"></i> Lưu
                                                                </button>
                                                                <button class="btn cancel-category-btn" style="display: none;">
                                                                    <i class="fas fa-times cancel-icon"></i> Hủy
                                                                </button>
                                                            </td>
                                                        </tr>
                                                </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div id="brand" class="tab-pane fade">
                                    <div style="display: flex; justify-content: space-between">
                                        <div><h3>Thương hiệu</h3></div>
                                        <div><button class="btn btn-primary" type="button" data-toggle="modal" data-target="#addNewBrandModal">Thêm thương hiệu +</button></div>
                                    </div>
                                    <div style="border: groove">
                                        <table class="table">
                                            <thead>
                                            <th>ID</th>
                                            <th>Tên thương hiệu</th>
                                            <th>Trạng thái</th>
                                            <th>Hành động</th>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.brandList}" var="brand">
                                                    <tr>
                                                        <td>${brand.id}</td>
                                                        <td class="edit">
                                                            <div class="brand-name">${brand.brandname}</div>
                                                            <div class="hidden-form">
                                                                <form action="SettingServlet" method="POST" class="brand-form">
                                                                    <input type="hidden" name="action" value="editBrand"/>
                                                                    <input type="hidden" name="brandID" value="${brand.id}"/>
                                                                    <input type="text" name="brandName" value="${brand.brandname}" style="width: 100px"/>
                                                                </form>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <form class="statusFormBrand statusForm" action="SettingServlet" method="post">
                                                                <input type="hidden" name="action" value="changeStatusBrand">
                                                                <input type="hidden" name="brandID" value="${brand.id}">
                                                                <input type="hidden" name="statusChange" value="">
                                                                <label class="switch">
                                                                    <input type="checkbox" name="status" value="${brand.status}" <c:if test="${brand.status == 'Active'}">checked</c:if> >
                                                                        <span class="slider"></span>
                                                                    </label>
                                                                </form>
                                                            </td>
                                                            <td>
                                                                <button class="btn edit-brand-btn">
                                                                    <i class="fas fa-edit edit-icon"></i>Chỉnh sửa
                                                                </button>
                                                                <button class="btn save-brand-btn" style="display: none;">
                                                                    <i class="fas fa-save save-icon"></i> Lưu
                                                                </button>
                                                                <button class="btn cancel-brand-btn" style="display: none;">
                                                                    <i class="fas fa-times cancel-icon"></i> Hủy
                                                                </button>
                                                            </td>
                                                        </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div id="room" class="tab-pane fade">
                                    <div style="display: flex; justify-content: space-between">
                                        <div><h3>Phòng</h3></div>
                                        <div><button class="btn btn-primary" type="button" data-toggle="modal" data-target="#addNewRoomModal">Thêm phòng +</button></div>
                                    </div>
                                    <div style="border: groove">
                                        <table class="table">
                                            <thead>
                                            <th>ID</th>
                                            <th>Tên phòng</th>
                                            <th>Trạng thái</th>
                                            <th>Hành động</th>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.roomList}" var="room">
                                                    <tr>
                                                        <td>${room.id}</td>
                                                        <td class="edit">
                                                            <div class="room-name">${room.roomname}</div>
                                                            <div class="hidden-form">
                                                                <form action="SettingServlet" method="POST" class="room-form">
                                                                    <input type="hidden" name="action" value="editRoom"/>
                                                                    <input type="hidden" name="roomID" value="${room.id}"/>
                                                                    <input type="text" name="roomName" value="${room.roomname}" style="width: 150px"/>
                                                                </form>
                                                            </div>
                                                        </td>
                                                        <td><form class="statusFormRoom statusForm" action="SettingServlet" method="post">
                                                                <input type="hidden" name="action" value="changeStatusRoom">
                                                                <input type="hidden" name="roomID" value="${room.id}">
                                                                <input type="hidden" name="statusChange" value="">
                                                                <label class="switch">
                                                                    <input type="checkbox" name="status" value="${room.status}" <c:if test="${room.status == 'Active'}">checked</c:if> >
                                                                        <span class="slider"></span>
                                                                    </label>
                                                                </form>
                                                            </td>
                                                            <td>
                                                                <button class="btn edit-room-btn">
                                                                    <i class="fas fa-edit edit-icon"></i> Chỉnh sửa
                                                                </button>
                                                                <button class="btn save-room-btn" style="display: none;">
                                                                    <i class="fas fa-save save-icon"></i> Lưu
                                                                </button>
                                                                <button class="btn cancel-room-btn" style="display: none;">
                                                                    <i class="fas fa-times cancel-icon"></i> Hủy
                                                                </button>
                                                            </td>
                                                        </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div id="color" class="tab-pane fade">
                                    <div style="display: flex; justify-content: space-between">
                                        <div><h3>Màu sắc</h3></div>
                                        <div><button class="btn btn-primary" type="button" data-toggle="modal" data-target="#addNewColorModal">Thêm màu sắc +</button></div>
                                    </div>
                                    <div style="border: groove">
                                        <table class="table">
                                            <thead>
                                            <th>ID</th>
                                            <th>Tên màu sắc</th>
                                            <th>Mã màu sắc</th>
                                            <th>Trạng thái</th>
                                            <th>Hành động</th>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.colorList}" var="color">
                                                    <tr>
                                                        <td>${color.id}</td>
                                                        <td class="edit">
                                                            <div class="color-name">${color.colorname}</div>
                                                            <div class="hidden-form">
                                                                <form action="SettingServlet" method="POST" class="color-form">
                                                                    <input type="hidden" name="action" value="editColor"/>
                                                                    <input type="hidden" name="colorID" value="${color.id}"/>
                                                                    <input type="text" name="colorName" value="${color.colorname}" style="width: 150px"/>
                                                                </form>
                                                            </div>
                                                        </td>
                                                        <td class="edit" style="display: flex; align-items: center">
                                                            <div style="width: 37px; height: 37px; background-color: ${color.colorcode}"></div>
                                                            <div class="color-code">${color.colorcode}</div>
                                                            <div class="hidden-form">
                                                                <form action="SettingServlet" method="POST" class="color-form">
                                                                    <input type="color" name="colorCode" value="${color.colorcode}" style="width: 37px; height: 37px" />
                                                                </form>
                                                            </div>
                                                        </td>
                                                        <td><form class="statusFormColor statusForm" action="SettingServlet" method="post">
                                                                <input type="hidden" name="action" value="changeStatusColor">
                                                                <input type="hidden" name="colorID" value="${color.id}">
                                                                <input type="hidden" name="statusChange" value="">
                                                                <label class="switch">
                                                                    <input type="checkbox" name="status" value="${color.status}" <c:if test="${color.status == 'Active'}">checked</c:if> >
                                                                        <span class="slider"></span>
                                                                    </label>
                                                                </form></td>
                                                            <td>
                                                                <button class="btn edit-color-btn">
                                                                    <i class="fas fa-edit edit-icon"></i> Chỉnh sửa
                                                                </button>
                                                                <button class="btn save-color-btn" style="display: none;">
                                                                    <i class="fas fa-save save-icon"></i> Lưu
                                                                </button>
                                                                <button class="btn cancel-color-btn" style="display: none;">
                                                                    <i class="fas fa-times cancel-icon"></i> Hủy
                                                                </button>
                                                            </td>
                                                        </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div id="saleOff" class="tab-pane fade">
                                    <div style="display: flex; justify-content: space-between">
                                        <div><h3>Giảm giá</h3></div>
                                        <div><button class="btn btn-primary" type="button" data-toggle="modal" data-target="#addNewSaleOffModal">Thêm giảm giá +</button></div>
                                    </div>
                                    <div style="border: groove">
                                        <table class="table">
                                            <thead>
                                            <th>ID</th>
                                            <th>Mã sản phẩm</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Giảm giá</th>
                                            <th>Trạng thái</th>
                                            <th>Hành động</th>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.saleOffList}" var="saleOff">
                                                    <tr>
                                                        <td>${saleOff.id}</td>
                                                        <c:forEach items="${requestScope.productList}" var="product">
                                                            <c:if test="${product.id == saleOff.product_id}">
                                                                <td>${product.id}</td>
                                                                <td style="display: flex; align-items: center"><div><img src="image/product/${product.image}" width="37px" height="37px" alt="alt" style="margin-right: 10px"/></div><div style="word-wrap: break-word;">${product.name}</div></td>
                                                                    </c:if>
                                                                </c:forEach>
                                                        <td class="edit">
                                                            <div class="saleOff-value">${saleOff.getSaleoffvalue()}</div>
                                                            <div class="hidden-form">
                                                                <form action="SettingServlet" method="POST" class="saleOff-form">
                                                                    <input type="hidden" name="action" value="editSaleOff"/>
                                                                    <input type="hidden" name="saleOffID" value="${saleOff.id}"/>
                                                                    <input type="text" name="saleOffValue" value="${saleOff.getSaleoffvalue()}" style="width: 50px"/>
                                                                </form>
                                                            </div>
                                                        </td>
                                                        <td><form class="statusFormSaleOff statusForm" action="SettingServlet" method="post">
                                                                <input type="hidden" name="action" value="changeStatusSaleOff">
                                                                <input type="hidden" name="saleOffID" value="${saleOff.id}">
                                                                <input type="hidden" name="statusChange" value="">
                                                                <label class="switch">
                                                                    <input type="checkbox" name="status" value="${saleOff.status}" <c:if test="${saleOff.status == 'Active'}">checked</c:if> >
                                                                        <span class="slider"></span>
                                                                    </label>
                                                                </form></td>
                                                            <td>
                                                                <button class="btn edit-saleOff-btn" style="width: 118px">
                                                                    <i class="fas fa-edit edit-icon"></i>Chỉnh sửa
                                                                </button>
                                                                <button class="btn save-saleOff-btn" style="display: none;">
                                                                    <i class="fas fa-save save-icon"></i> Lưu
                                                                </button>
                                                                <button class="btn cancel-saleOff-btn" style="display: none;">
                                                                    <i class="fas fa-times cancel-icon"></i> Hủy
                                                                </button>
                                                            </td>
                                                        </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div id="categoryOfPost" class="tab-pane fade">
                                    <div style="display: flex; justify-content: space-between">
                                        <div><h3>Danh mục bài viết</h3></div>
                                        <div><button class="btn btn-primary" type="button" data-toggle="modal" data-target="#addNewCategoryOfPostModal">Thêm danh mục bài viết +</button></div>
                                    </div>
                                    <div style="border: groove">
                                        <table class="table">
                                            <thead>
                                            <th>ID</th>
                                            <th>Tên danh mục bài viết</th>
                                            <th>Trạng thái</th>
                                            <th>Hành động</th>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${requestScope.categoryOfPostList}" var="categoryOfPost">
                                                    <tr>
                                                        <td>${categoryOfPost.id}</td>
                                                        <td class="edit">
                                                            <div class="categoryOfPost-name">${categoryOfPost.category}</div>
                                                            <div class="hidden-form">
                                                                <form action="SettingServlet" method="POST" class="room-form">
                                                                    <input type="hidden" name="action" value="editcategoryOfPost"/>
                                                                    <input type="hidden" name="categoryOfPostID" value="${categoryOfPost.id}"/>
                                                                    <input type="text" name="categoryOfPostName" value="${categoryOfPost.category}" style="width: 100px"/>
                                                                </form>
                                                            </div>
                                                        </td>
                                                        <td><form class="statusFormCategoryOfPost statusForm" action="SettingServlet" method="post">
                                                                <input type="hidden" name="action" value="changeStatusCategoryOfPost">
                                                                <input type="hidden" name="categoryOfPostID" value="${categoryOfPost.id}">
                                                                <input type="hidden" name="statusChange" value="">
                                                                <label class="switch">
                                                                    <input type="checkbox" name="status" value="${categoryOfPost.status}" <c:if test="${categoryOfPost.status == 'Active'}">checked</c:if> >
                                                                        <span class="slider"></span>
                                                                    </label>
                                                                </form></td>
                                                            <td>
                                                                <button class="btn edit-categoryOfPost-btn">
                                                                    <i class="fas fa-edit edit-icon"></i> Chỉnh sửa
                                                                </button>
                                                                <button class="btn save-categoryOfPost-btn" style="display: none;">
                                                                    <i class="fas fa-save save-icon"></i> Lưu
                                                                </button>
                                                                <button class="btn cancel-categoryOfPost-btn" style="display: none;">
                                                                    <i class="fas fa-times cancel-icon"></i> Hủy
                                                                </button>
                                                            </td>
                                                        </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>

        <!--Modal Add new User Role-->                            
        <div class="modal fade" id="addNewUserRoleModal" tabindex="-1" aria-labelledby="addNewUserRoleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="addNewUserRoleModalLabel">Thêm vai trò người dùng mới</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Thông tin</h4>
                        <form action="SettingServlet" method="post">
                            <input type="hidden" name="action" value="addNewUserRole">
                            <div class="form-group d-flex">
                                <label for="content" style="width: 30%">Tên vai trò người dùng:</label>
                                <input id="content" class="form-control" name="userRoleName" required/>
                            </div>
                            <div style="display: flex; justify-content: center; margin: 20px 0px 0px">
                                <button type="submit" class="btn btn-primary">Lưu</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--Modal Add new Category-->                            
        <div class="modal fade" id="addNewCategoryModal" tabindex="-1" aria-labelledby="addNewCategoryModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="addNewCategoryModalLabel">Thêm danh mục mới</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Thông tin</h4>
                        <form action="SettingServlet" method="post">
                            <input type="hidden" name="action" value="addNewCategory">
                            <div class="form-group d-flex">
                                <label for="content" style="width: 30%">Tên danh mục:</label>
                                <input id="content" class="form-control" name="categoryName" required/>
                            </div>
                            <div style="display: flex; justify-content: center; margin: 20px 0px 0px">
                                <button type="submit" class="btn btn-primary">Lưu</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--Modal Add new Brand-->                            
        <div class="modal fade" id="addNewBrandModal" tabindex="-1" aria-labelledby="addNewBrandModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="addNewBrandModalLabel">Thêm thương hiệu mới</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Thông tin</h4>
                        <form action="SettingServlet" method="post">
                            <input type="hidden" name="action" value="addNewBrand">
                            <div class="form-group d-flex">
                                <label for="content" style="width: 30%">Tên thương hiệu:</label>
                                <input id="content" class="form-control" name="brandName" required/>
                            </div>
                            <div style="display: flex; justify-content: center; margin: 20px 0px 0px">
                                <button type="submit" class="btn btn-primary">Lưu</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--Modal Add new Room-->                            
        <div class="modal fade" id="addNewRoomModal" tabindex="-1" aria-labelledby="addNewRoomModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="addNewRoomModalLabel">Thêm phòng mới</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Thông tin</h4>
                        <form action="SettingServlet" method="post">
                            <input type="hidden" name="action" value="addNewRoom">
                            <div class="form-group d-flex">
                                <label for="content" style="width: 30%">Tên phòng:</label>
                                <input id="content" class="form-control" name="roomName" required/>
                            </div>
                            <div style="display: flex; justify-content: center; margin: 20px 0px 0px">
                                <button type="submit" class="btn btn-primary">Lưu</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--Modal Add new Color-->                            
        <div class="modal fade" id="addNewColorModal" tabindex="-1" aria-labelledby="addNewColorModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="addNewColorModalLabel">Thêm màu sắc mới</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Thông tin</h4>
                        <form action="SettingServlet" method="post">
                            <input type="hidden" name="action" value="addNewColor">
                            <div class="form-group d-flex" style="margin-bottom: 10px">
                                <label for="color-content" style="width: 30%">Tên màu sắc:</label>
                                <input id="color-content" class="form-control" name="colorName" required/>
                            </div>
                            <div class="form-group row" style="justify-content: space-between">
                                <div class="d-flex col-md-5">
                                    <label for="code-content" style="width: 58%">Mã màu sắc:</label>
                                    <input id="code-content" class="form-control" style="width:90px" name="colorCode" value="" required/>
                                </div>
                                <div class="d-flex col-md-5">
                                    <label for="pickColor" style="width: 58%">Lựa chọn màu: </label>
                                    <input id="pickColor" type="color">
                                </div>
                            </div>
                            <div style="display: flex; justify-content: center; margin: 20px 0px 0px">
                                <button type="submit" class="btn btn-primary">Lưu</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--Modal Add new Sale Off-->                            
        <div class="modal fade" id="addNewSaleOffModal" tabindex="-1" aria-labelledby="addNewSaleOffModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="addNewSaleOffModalLabel">Thêm giảm giá mới</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Thông tin</h4>
                        <form action="SettingServlet" method="post">
                            <input type="hidden" name="action" value="addNewSaleOff">
                            <div class="form-group d-flex" style="margin-bottom: 10px">
                                <label for="product" style="width: 30%">Sản phẩm:</label>
                                <select id="product" class="form-control" name="productID">
                                    <c:forEach items="${requestScope.productList}" var="product">
                                        <option value="${product.id}">${product.id}-${product.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group d-flex">
                                <label for="content" style="width: 30%">Giảm giá:</label>
                                <input id="content" class="form-control" name="saleOfValue" required/>
                            </div>
                            <div style="display: flex; justify-content: center; margin: 20px 0px 0px">
                                <button type="submit" class="btn btn-primary">Lưu</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--Modal Add new Category Of Post-->                            
        <div class="modal fade" id="addNewCategoryOfPostModal" tabindex="-1" aria-labelledby="addNewCategoryOfPostModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="addNewCategoryOfPostModalLabel">Thêm danh mục bài viết mới</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Thông tin</h4>
                        <form action="SettingServlet" method="post">
                            <input type="hidden" name="action" value="addNewCategoryOfPost">
                            <div class="form-group d-flex">
                                <label for="content" style="width: 50%">Tên danh mục bài đăng:</label>
                                <input id="content" class="form-control" name="categoryOfPostName" required/>
                            </div>
                            <div style="display: flex; justify-content: center; margin: 20px 0px 0px">
                                <button type="submit" class="btn btn-primary">Lưu</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--Modal Home Products List-->
        <div class="modal fade" id="editHomeProductsListModal" tabindex="-1" aria-labelledby="editHomeProductsListModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="editHomeProductsListModalLabel">Cài đặt danh sách sản phẩm trang chủ</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Bạn có muốn thay đổi phân trang ?</h4>
                        <form id="HomeProductsListItemsForm" action="SettingServlet" method="post">
                            <input type="hidden" name="action" value="changeItemsOfHomeProductsList">
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <label for="old-content">Số lượng cũ:</label>
                                    <input id="old-content" class="form-control" value="${itemsHomeProductsList}" style="height: 50px; font-size: 30px" readonly/>
                                </div>
                                <div class="col-md-4 d-flex align-items-center justify-content-center">
                                    <i class="fas fa-arrow-right" style="font-size: 30px"></i>
                                </div>
                                <div class="col-md-4">
                                    <label for="new-content">Số lượng mới:</label>
                                    <input id="new-content" name="itemsPerHomeProductsList" class="form-control" style="height: 50px; font-size: 30px" required/>
                                </div>
                            </div>
                            <div style="display: flex; justify-content: center; margin: 20px 0px 0px">
                                <button type="submit" class="btn btn-primary">Lưu</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--Modal Products List-->
        <div class="modal fade" id="editProductsListModal" tabindex="-1" aria-labelledby="editProductsListModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="editProductsListModalLabel">Cài đặt danh sách sản phẩm</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Bạn có muốn thay đổi phân trang?</h4>
                        <form id="ProductsListItemsForm" action="SettingServlet" method="post">
                            <input type="hidden" name="action" value="changeItemsOfProductsList">
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <label for="old-content">Số lượng cũ:</label>
                                    <input id="old-content" class="form-control" value="${itemsPerProductListPage}" style="height: 50px; font-size: 30px" readonly/>
                                </div>
                                <div class="col-md-4 d-flex align-items-center justify-content-center">
                                    <i class="fas fa-arrow-right" style="font-size: 30px"></i>
                                </div>
                                <div class="col-md-4">
                                    <label for="new-content">Số lượng mới:</label>
                                    <input id="new-content" name="itemsPerProductsList" class="form-control" style="height: 50px; font-size: 30px" required/>
                                </div>
                            </div>
                            <div style="display: flex; justify-content: center; margin: 20px 0px 0px">
                                <button type="submit" class="btn btn-primary">Lưu</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--Modal Feedbacks List-->
        <div class="modal fade" id="editFeedbacksListModal" tabindex="-1" aria-labelledby="editFeedbacksListModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="editFeedbacksListModalLabel">Cài đặt danh sách đánh giá</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Bạn có muốn thay đổi phân trang?</h4>
                        <form id="FeedbacksListItemsForm" action="SettingServlet" method="post">
                            <input type="hidden" name="action" value="changeItemsOfFeedbacksList">
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <label for="old-content">Số lượng cũ:</label>
                                    <input id="old-content" class="form-control" value="${itemsPerFeedbackListPage}" style="height: 50px; font-size: 30px" readonly/>
                                </div>
                                <div class="col-md-4 d-flex align-items-center justify-content-center">
                                    <i class="fas fa-arrow-right" style="font-size: 30px"></i>
                                </div>
                                <div class="col-md-4">
                                    <label for="new-content">Số lượng mới:</label>
                                    <input id="new-content" name="itemsPerFeedbacksList" class="form-control" style="height: 50px; font-size: 30px" required/>
                                </div>
                            </div>
                            <div style="display: flex; justify-content: center; margin: 20px 0px 0px">
                                <button type="submit" class="btn btn-primary">Lưu</button> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--Modal Customers List-->
        <div class="modal fade" id="editCustomersListModal" tabindex="-1" aria-labelledby="editCustomersListModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="editCustomersListModalLabel">Cài đặt danh sách khách hàng</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Bạn có muốn thay đổi phân trang?</h4>
                        <form id="CustomersListItemsForm" action="SettingServlet" method="post">
                            <input type="hidden" name="action" value="changeItemsOfCustomersList">
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <label for="old-content">Số lượng cũ:</label>
                                    <input id="old-content" class="form-control" value="${itemsPerCustomerListPage}" style="height: 50px; font-size: 30px" readonly/>
                                </div>
                                <div class="col-md-4 d-flex align-items-center justify-content-center">
                                    <i class="fas fa-arrow-right" style="font-size: 30px"></i>
                                </div>
                                <div class="col-md-4">
                                    <label for="new-content">Số lượng mới:</label>
                                    <input id="new-content" name="itemsPerCustomersList" class="form-control" style="height: 50px; font-size: 30px" required/>
                                </div>
                            </div>
                            <div style="display: flex; justify-content: center; margin: 20px 0px 0px">
                                <button type="submit" class="btn btn-primary">Lưu</button> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--Modal Posts List-->
        <div class="modal fade" id="editPostsListModal" tabindex="-1" aria-labelledby="editPostsListModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="editPostsListModalLabel">Cài đặt danh sách bài viết</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Bạn có muốn thay đổi phân trang?</h4>
                        <form id="PostsListItemsForm" action="SettingServlet" method="post">
                            <input type="hidden" name="action" value="changeItemsOfPostsList">
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <label for="old-content">Số lượng cũ:</label>
                                    <input id="old-content" class="form-control" value="${itemsPerPostList}" style="height: 50px; font-size: 30px" readonly/>
                                </div>
                                <div class="col-md-4 d-flex align-items-center justify-content-center">
                                    <i class="fas fa-arrow-right" style="font-size: 30px"></i>
                                </div>
                                <div class="col-md-4">
                                    <label for="new-content">Số lượng mới:</label>
                                    <input id="new-content" name="itemsPerPostsList" class="form-control" style="height: 50px; font-size: 30px" required/>
                                </div>
                            </div>
                            <div style="display: flex; justify-content: center; margin: 20px 0px 0px">
                                <button type="submit" class="btn btn-primary">Lưu</button> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--Modal Sliders List-->
        <div class="modal fade" id="editSlidersListModal" tabindex="-1" aria-labelledby="editSlidersListModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="editSlidersListModalLabel">Cài đặt danh sách thanh trượt</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Bạn có muốn thay đổi phân trang?</h4>
                        <form id="SlidersListItemsForm" action="SettingServlet" method="post">
                            <input type="hidden" name="action" value="changeItemsOfSlidersList">
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <label for="old-content">Số lượng cũ:</label>
                                    <input id="old-content" class="form-control" value="${itemsPerSliderList}" style="height: 50px; font-size: 30px" readonly/>
                                </div>
                                <div class="col-md-4 d-flex align-items-center justify-content-center">
                                    <i class="fas fa-arrow-right" style="font-size: 30px"></i>
                                </div>
                                <div class="col-md-4">
                                    <label for="new-content">Số lượng mới:</label>
                                    <input id="new-content" name="itemsPerSlidersList" class="form-control" style="height: 50px; font-size: 30px" required/>
                                </div>
                            </div>
                            <div style="display: flex; justify-content: center; margin: 20px 0px 0px">
                                <button type="submit" class="btn btn-primary">Lưu</button> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--Modal Orders List-->
        <div class="modal fade" id="editOrdersListModal" tabindex="-1" aria-labelledby="editOrdersListModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="editOrdersListModalLabel">Cài đặt danh sách đơn hàng</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Bạn có muốn thay đổi phân trang của trang?</h4>
                        <form action="SettingServlet" method="post">
                            <input type="hidden" name="action" value="changeItemsOfOrdersList">
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <label for="old-content">Số lượng cũ:</label>
                                    <input id="old-content" class="form-control" value="${itemsPerOrderList}" style="height: 50px; font-size: 30px" readonly/>
                                </div>
                                <div class="col-md-4 d-flex align-items-center justify-content-center">
                                    <i class="fas fa-arrow-right" style="font-size: 30px"></i>
                                </div>
                                <div class="col-md-4">
                                    <label for="new-content">Số lượng mới:</label>
                                    <input id="new-content" name="itemsPerOrdersList" class="form-control" style="height: 50px; font-size: 30px" required/>
                                </div>
                            </div>
                            <div style="display: flex; justify-content: center; margin: 20px 0px 0px">
                                <button type="submit" class="btn btn-primary">Lưu</button> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--Modal Shopping Carts List-->
        <div class="modal fade" id="editShoppingCartsListModal" tabindex="-1" aria-labelledby="editShoppingCartsListModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="editShoppingCartsListModalLabel">Cài đặt danh sách giỏ hàng</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Bạn có muốn thay đổi phân trang của trang?</h4>
                        <form action="SettingServlet" method="post">
                            <input type="hidden" name="action" value="changeItemsOfShoppingCartsList">
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <label for="old-content">Số lượng cũ:</label>
                                    <input id="old-content" class="form-control" value="${itemsPerShoppingCartsListPage}" style="height: 50px; font-size: 30px" readonly/>
                                </div>
                                <div class="col-md-4 d-flex align-items-center justify-content-center">
                                    <i class="fas fa-arrow-right" style="font-size: 30px"></i>
                                </div>
                                <div class="col-md-4">
                                    <label for="new-content">Số lượng mới:</label>
                                    <input id="new-content" name="itemsPerShoppingCartsList" class="form-control" style="height: 50px; font-size: 30px" required/>
                                </div>
                            </div>
                            <div style="display: flex; justify-content: center; margin: 20px 0px 0px">
                                <button type="submit" class="btn btn-primary">Lưu</button> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="DashboardFooter.jsp" %>   
        <script src="../js/app.js"></script>
        <script>

            document.getElementById('pickColor').addEventListener('input', function () {
                document.getElementById('code-content').value = this.value;
            });

            $(document).ready(function () {
                $('a[data-toggle="tab"]').on('click', function (e) {
                    e.preventDefault();
                    var target = $(this).attr("href"); // Get the target tab pane
                    $('.tab-pane').removeClass('show active'); // Hide all tab panes
                    $(target).addClass('show active'); // Show the target tab pane

                    $('a[data-toggle="tab"]').removeClass('active'); // Remove 'active' class from all tabs
                    $(this).addClass('active'); // Add 'active' class to the clicked tab
                });
            });

            $(document).ready(function () {
                $('.update-item-count').on('click', function () {
                    var newItemsCount = $('#new-content').val(); // Lấy giá trị mới từ input trong modal
                    $('.item-count').text(newItemsCount); // Cập nhật giá trị mới vào tất cả các thẻ <b> có class item-count
                });
            });
            // JavaScript để xử lý sự kiện thay đổi checkbox
            document.querySelectorAll('.statusForm input[type="checkbox"]').forEach(function (checkbox) {
                checkbox.addEventListener('change', function () {
                    var newValue = this.checked ? 'Active' : 'Inactive';
                    this.closest('.statusForm').querySelector('input[name="statusChange"]').value = newValue;
                    console.log('Giá trị đã cập nhật:', newValue);
                });
            });

            /// Lắng nghe sự kiện khi checkbox thay đổi
            document.querySelectorAll('.statusFormUserRole input[type="checkbox"]').forEach(function (checkbox) {
                checkbox.addEventListener('change', function () {
                    var form = this.closest('.statusFormUserRole'); // Tìm form gần nhất có class là statusFormUserRole
                    var action = form.querySelector('input[name="action"]').value;
                    var userRoleID = form.querySelector('input[name="userRoleID"]').value;
                    var statusChange = this.checked ? 'Active' : 'Inactive'; // Lấy giá trị Active hoặc Inactive từ trạng thái checkbox

                    // Gửi dữ liệu bằng Ajax
                    var xhr = new XMLHttpRequest();
                    xhr.open('POST', form.getAttribute('action'), true);
                    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == 4) {
                            if (xhr.status == 200) {
                                console.log('Cập nhật trạng thái thành công');
                            } else {
                                console.error('Đã xảy ra lỗi trong quá trình cập nhật trạng thái');
                            }
                        }
                    };

                    // Chuẩn bị dữ liệu gửi đi
                    var params = 'action=' + encodeURIComponent(action) +
                            '&userRoleID=' + encodeURIComponent(userRoleID) +
                            '&statusChange=' + encodeURIComponent(statusChange);
                    xhr.send(params);
                });
            });

            document.querySelectorAll('.statusFormCategory input[type="checkbox"]').forEach(function (checkbox) {
                checkbox.addEventListener('change', function () {
                    var form = this.closest('.statusFormCategory'); // Tìm form gần nhất có class là statusFormUserRole
                    var action = form.querySelector('input[name="action"]').value;
                    var categoryID = form.querySelector('input[name="categoryID"]').value;
                    var statusChange = this.checked ? 'Active' : 'Inactive'; // Lấy giá trị Active hoặc Inactive từ trạng thái checkbox

                    // Gửi dữ liệu bằng Ajax
                    var xhr = new XMLHttpRequest();
                    xhr.open('POST', form.getAttribute('action'), true);
                    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == 4) {
                            if (xhr.status == 200) {
                                console.log('Cập nhật trạng thái thành công');
                            } else {
                                console.error('Đã xảy ra lỗi trong quá trình cập nhật trạng thái');
                            }
                        }
                    };

                    // Chuẩn bị dữ liệu gửi đi
                    var params = 'action=' + encodeURIComponent(action) +
                            '&categoryID=' + encodeURIComponent(categoryID) +
                            '&statusChange=' + encodeURIComponent(statusChange);
                    xhr.send(params);
                });
            });

            document.querySelectorAll('.statusFormBrand input[type="checkbox"]').forEach(function (checkbox) {
                checkbox.addEventListener('change', function () {
                    var form = this.closest('.statusFormBrand'); // Tìm form gần nhất có class là statusFormUserRole
                    var action = form.querySelector('input[name="action"]').value;
                    var brandID = form.querySelector('input[name="brandID"]').value;
                    var statusChange = this.checked ? 'Active' : 'Inactive'; // Lấy giá trị Active hoặc Inactive từ trạng thái checkbox

                    // Gửi dữ liệu bằng Ajax
                    var xhr = new XMLHttpRequest();
                    xhr.open('POST', form.getAttribute('action'), true);
                    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == 4) {
                            if (xhr.status == 200) {
                                console.log('Cập nhật trạng thái thành công');
                            } else {
                                console.error('Đã xảy ra lỗi trong quá trình cập nhật trạng thái');
                            }
                        }
                    };

                    // Chuẩn bị dữ liệu gửi đi
                    var params = 'action=' + encodeURIComponent(action) +
                            '&brandID=' + encodeURIComponent(brandID) +
                            '&statusChange=' + encodeURIComponent(statusChange);
                    xhr.send(params);
                });
            });

            document.querySelectorAll('.statusFormRoom input[type="checkbox"]').forEach(function (checkbox) {
                checkbox.addEventListener('change', function () {
                    var form = this.closest('.statusFormRoom'); // Tìm form gần nhất có class là statusFormUserRole
                    var action = form.querySelector('input[name="action"]').value;
                    var roomID = form.querySelector('input[name="roomID"]').value;
                    var statusChange = this.checked ? 'Active' : 'Inactive'; // Lấy giá trị Active hoặc Inactive từ trạng thái checkbox

                    // Gửi dữ liệu bằng Ajax
                    var xhr = new XMLHttpRequest();
                    xhr.open('POST', form.getAttribute('action'), true);
                    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == 4) {
                            if (xhr.status == 200) {
                                console.log('Cập nhật trạng thái thành công');
                            } else {
                                console.error('Đã xảy ra lỗi trong quá trình cập nhật trạng thái');
                            }
                        }
                    };

                    // Chuẩn bị dữ liệu gửi đi
                    var params = 'action=' + encodeURIComponent(action) +
                            '&roomID=' + encodeURIComponent(roomID) +
                            '&statusChange=' + encodeURIComponent(statusChange);
                    xhr.send(params);
                });
            });

            document.querySelectorAll('.statusFormColor input[type="checkbox"]').forEach(function (checkbox) {
                checkbox.addEventListener('change', function () {
                    var form = this.closest('.statusFormColor'); // Tìm form gần nhất có class là statusFormUserRole
                    var action = form.querySelector('input[name="action"]').value;
                    var colorID = form.querySelector('input[name="colorID"]').value;
                    var statusChange = this.checked ? 'Active' : 'Inactive'; // Lấy giá trị Active hoặc Inactive từ trạng thái checkbox

                    // Gửi dữ liệu bằng Ajax
                    var xhr = new XMLHttpRequest();
                    xhr.open('POST', form.getAttribute('action'), true);
                    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == 4) {
                            if (xhr.status == 200) {
                                console.log('Cập nhật trạng thái thành công');
                            } else {
                                console.error('Đã xảy ra lỗi trong quá trình cập nhật trạng thái');
                            }
                        }
                    };

                    // Chuẩn bị dữ liệu gửi đi
                    var params = 'action=' + encodeURIComponent(action) +
                            '&colorID=' + encodeURIComponent(colorID) +
                            '&statusChange=' + encodeURIComponent(statusChange);
                    xhr.send(params);
                });
            });

            document.querySelectorAll('.statusFormSaleOff input[type="checkbox"]').forEach(function (checkbox) {
                checkbox.addEventListener('change', function () {
                    var form = this.closest('.statusFormSaleOff'); // Tìm form gần nhất có class là statusFormUserRole
                    var action = form.querySelector('input[name="action"]').value;
                    var saleOffID = form.querySelector('input[name="saleOffID"]').value;
                    var statusChange = this.checked ? 'Active' : 'Inactive'; // Lấy giá trị Active hoặc Inactive từ trạng thái checkbox

                    // Gửi dữ liệu bằng Ajax
                    var xhr = new XMLHttpRequest();
                    xhr.open('POST', form.getAttribute('action'), true);
                    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == 4) {
                            if (xhr.status == 200) {
                                console.log('Cập nhật trạng thái thành công');
                            } else {
                                console.error('Đã xảy ra lỗi trong quá trình cập nhật trạng thái');
                            }
                        }
                    };

                    // Chuẩn bị dữ liệu gửi đi
                    var params = 'action=' + encodeURIComponent(action) +
                            '&saleOffID=' + encodeURIComponent(saleOffID) +
                            '&statusChange=' + encodeURIComponent(statusChange);
                    xhr.send(params);
                });
            });

            document.querySelectorAll('.statusFormCategoryOfPost input[type="checkbox"]').forEach(function (checkbox) {
                checkbox.addEventListener('change', function () {
                    var form = this.closest('.statusFormCategoryOfPost'); // Tìm form gần nhất có class là statusFormUserRole
                    var action = form.querySelector('input[name="action"]').value;
                    var categoryOfPostID = form.querySelector('input[name="categoryOfPostID"]').value;
                    var statusChange = this.checked ? 'Active' : 'Inactive'; // Lấy giá trị Active hoặc Inactive từ trạng thái checkbox

                    // Gửi dữ liệu bằng Ajax
                    var xhr = new XMLHttpRequest();
                    xhr.open('POST', form.getAttribute('action'), true);
                    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == 4) {
                            if (xhr.status == 200) {
                                console.log('Cập nhật trạng thái thành công');
                            } else {
                                console.error('Đã xảy ra lỗi trong quá trình cập nhật trạng thái');
                            }
                        }
                    };

                    // Chuẩn bị dữ liệu gửi đi
                    var params = 'action=' + encodeURIComponent(action) +
                            '&categoryOfPostID=' + encodeURIComponent(categoryOfPostID) +
                            '&statusChange=' + encodeURIComponent(statusChange);
                    xhr.send(params);
                });
            });
//          edit category
            document.addEventListener("DOMContentLoaded", function () {
                document.querySelectorAll(".edit-category-btn").forEach(function (button) {
                    button.addEventListener("click", function () {
                        let row = this.closest("tr");
                        let xDiv = row.querySelector(".category-name");
                        let formDiv = row.querySelector(".hidden-form");
                        let editButton = row.querySelector(".edit-category-btn");
                        let saveButton = row.querySelector(".save-category-btn");
                        let cancelButton = row.querySelector(".cancel-category-btn");

                        // Show the form and the save/cancel buttons, hide the edit button
                        xDiv.style.display = "none";
                        formDiv.style.display = "block";
                        editButton.style.display = "none";
                        saveButton.style.display = "inline-block";
                        cancelButton.style.display = "inline-block";
                    });
                });

                document.querySelectorAll(".save-category-btn").forEach(function (button) {
                    button.addEventListener("click", function () {
                        let row = this.closest("tr");
                        let xDiv = row.querySelector(".category-name");
                        let form = row.querySelector(".hidden-form form");
                        let formDiv = row.querySelector(".hidden-form");
                        let editButton = row.querySelector(".edit-category-btn");
                        let saveButton = row.querySelector(".save-category-btn");
                        let cancelButton = row.querySelector(".cancel-category-btn");
                        $.ajax({
                            type: form.getAttribute("method"),
                            url: form.getAttribute("action"),
                            data: $(form).serialize(),
                            success: function (response) {
                                // Update new value
                                let newValue = form.querySelector("input[name='categoryName']").value;
                                xDiv.textContent = newValue;

                                // Hide the form and the save/cancel buttons, show the edit button
                                xDiv.style.display = "block";
                                formDiv.style.display = "none";
                                editButton.style.display = "inline-block";
                                saveButton.style.display = "none";
                                cancelButton.style.display = "none";
                            },
                            error: function () {
                                alert("Error updating category name.");
                            }
                        });
                    });
                });

                document.querySelectorAll(".cancel-category-btn").forEach(function (button) {
                    button.addEventListener("click", function () {
                        let row = this.closest("tr");
                        let xDiv = row.querySelector(".category-name");
                        let formDiv = row.querySelector(".hidden-form");
                        let editButton = row.querySelector(".edit-category-btn");
                        let saveButton = row.querySelector(".save-category-btn");
                        let cancelButton = row.querySelector(".cancel-category-btn");

                        // Hide the form and the save/cancel buttons, show the edit button
                        xDiv.style.display = "block";
                        formDiv.style.display = "none";
                        editButton.style.display = "inline-block";
                        saveButton.style.display = "none";
                        cancelButton.style.display = "none";
                    });
                });
            });
//          edit brand
            document.addEventListener("DOMContentLoaded", function () {
                document.querySelectorAll(".edit-brand-btn").forEach(function (button) {
                    button.addEventListener("click", function () {
                        let row = this.closest("tr");
                        let xDiv = row.querySelector(".brand-name");
                        let formDiv = row.querySelector(".hidden-form");
                        let editButton = row.querySelector(".edit-brand-btn");
                        let saveButton = row.querySelector(".save-brand-btn");
                        let cancelButton = row.querySelector(".cancel-brand-btn");

                        // Show the form and the save/cancel buttons, hide the edit button
                        xDiv.style.display = "none";
                        formDiv.style.display = "block";
                        editButton.style.display = "none";
                        saveButton.style.display = "inline-block";
                        cancelButton.style.display = "inline-block";
                    });
                });

                document.querySelectorAll(".save-brand-btn").forEach(function (button) {
                    button.addEventListener("click", function () {
                        let row = this.closest("tr");
                        let form = row.querySelector(".hidden-form form");
                        let xDiv = row.querySelector(".brand-name");
                        let formDiv = row.querySelector(".hidden-form");
                        let editButton = row.querySelector(".edit-brand-btn");
                        let saveButton = row.querySelector(".save-brand-btn");
                        let cancelButton = row.querySelector(".cancel-brand-btn");
                        // Perform AJAX request to submit form data
                        $.ajax({
                            type: form.getAttribute("method"),
                            url: form.getAttribute("action"),
                            data: $(form).serialize(),
                            success: function (response) {
                                // Update new value
                                let newValue = form.querySelector("input[name='brandName']").value;
                                xDiv.textContent = newValue;

                                // Hide the form and the save/cancel buttons, show the edit button
                                xDiv.style.display = "block";
                                formDiv.style.display = "none";
                                editButton.style.display = "inline-block";
                                saveButton.style.display = "none";
                                cancelButton.style.display = "none";
                            },
                            error: function () {
                                alert("Error updating brand name.");
                            }
                        });
                    });
                });


                document.querySelectorAll(".cancel-brand-btn").forEach(function (button) {
                    button.addEventListener("click", function () {
                        let row = this.closest("tr");
                        let xDiv = row.querySelector(".brand-name");
                        let formDiv = row.querySelector(".hidden-form");
                        let editButton = row.querySelector(".edit-brand-btn");
                        let saveButton = row.querySelector(".save-brand-btn");
                        let cancelButton = row.querySelector(".cancel-brand-btn");

                        // Hide the form and the save/cancel buttons, show the edit button
                        xDiv.style.display = "block";
                        formDiv.style.display = "none";
                        editButton.style.display = "inline-block";
                        saveButton.style.display = "none";
                        cancelButton.style.display = "none";
                    });
                });
            });
//          edit room
            document.addEventListener("DOMContentLoaded", function () {
                document.querySelectorAll(".edit-room-btn").forEach(function (button) {
                    button.addEventListener("click", function () {
                        let row = this.closest("tr");
                        let xDiv = row.querySelector(".room-name");
                        let formDiv = row.querySelector(".hidden-form");
                        let editButton = row.querySelector(".edit-room-btn");
                        let saveButton = row.querySelector(".save-room-btn");
                        let cancelButton = row.querySelector(".cancel-room-btn");

                        // Show the form and the save/cancel buttons, hide the edit button
                        xDiv.style.display = "none";
                        formDiv.style.display = "block";
                        editButton.style.display = "none";
                        saveButton.style.display = "inline-block";
                        cancelButton.style.display = "inline-block";
                    });
                });

                document.querySelectorAll(".save-room-btn").forEach(function (button) {
                    button.addEventListener("click", function () {
                        let row = this.closest("tr");
                        let form = row.querySelector(".hidden-form form");
                        let xDiv = row.querySelector(".room-name");
                        let formDiv = row.querySelector(".hidden-form");
                        let editButton = row.querySelector(".edit-room-btn");
                        let saveButton = row.querySelector(".save-room-btn");
                        let cancelButton = row.querySelector(".cancel-room-btn");
                        // Perform AJAX request to submit form data
                        $.ajax({
                            type: form.getAttribute("method"),
                            url: form.getAttribute("action"),
                            data: $(form).serialize(),
                            success: function (response) {
                                // Update new value
                                let newValue = form.querySelector("input[name='roomName']").value;
                                xDiv.textContent = newValue;

                                // Hide the form and the save/cancel buttons, show the edit button
                                xDiv.style.display = "block";
                                formDiv.style.display = "none";
                                editButton.style.display = "inline-block";
                                saveButton.style.display = "none";
                                cancelButton.style.display = "none";
                            },
                            error: function () {
                                alert("Error updating room name.");
                            }
                        });
                    });
                });


                document.querySelectorAll(".cancel-room-btn").forEach(function (button) {
                    button.addEventListener("click", function () {
                        let row = this.closest("tr");
                        let xDiv = row.querySelector(".room-name");
                        let formDiv = row.querySelector(".hidden-form");
                        let editButton = row.querySelector(".edit-room-btn");
                        let saveButton = row.querySelector(".save-room-btn");
                        let cancelButton = row.querySelector(".cancel-room-btn");

                        // Hide the form and the save/cancel buttons, show the edit button
                        xDiv.style.display = "block";
                        formDiv.style.display = "none";
                        editButton.style.display = "inline-block";
                        saveButton.style.display = "none";
                        cancelButton.style.display = "none";
                    });
                });
            });
//          edit color
            document.addEventListener("DOMContentLoaded", function () {
                document.querySelectorAll(".edit-color-btn").forEach(function (button) {
                    button.addEventListener("click", function () {
                        let row = this.closest("tr");

                        // Find all editable td elements and their respective form elements
                        row.querySelectorAll(".edit").forEach(function (editableTd) {
                            let colorNameDiv = editableTd.querySelector(".color-name");
                            let colorCodeDiv = editableTd.querySelector(".color-code");
                            let formDiv = editableTd.querySelector(".hidden-form");
                            let editButton = row.querySelector(".edit-color-btn");
                            let saveButton = row.querySelector(".save-color-btn");
                            let cancelButton = row.querySelector(".cancel-color-btn");

                            if (colorNameDiv) {
                                colorNameDiv.style.display = "none";
                            }
                            if (colorCodeDiv) {
                                colorCodeDiv.style.display = "none";
                                colorCodeDiv.previousElementSibling.style.display = "none";
                            }
                            formDiv.style.display = "block";
                            editButton.style.display = "none";
                            saveButton.style.display = "inline-block";
                            cancelButton.style.display = "inline-block";
                        });
                    });
                });

                document.querySelectorAll(".save-color-btn").forEach(function (button) {
                    button.addEventListener("click", function () {
                        let row = this.closest("tr");
                        let colorNameDiv = row.querySelector(".color-name");
                        let colorCodeDiv = row.querySelector(".color-code");

                        // Gather all forms in the row and serialize their data
                        let formsData = [];
                        row.querySelectorAll(".color-form").forEach(function (form) {
                            formsData.push($(form).serialize());
                        });

                        // Perform AJAX request to submit form data
                        $.ajax({
                            type: "POST",
                            url: "SettingServlet",
                            data: formsData.join("&"),
                            success: function (response) {
                                // Update the color name and color code with the new values
                                let newColorName = row.querySelector("input[name='colorName']").value;
                                let newColorCode = row.querySelector("input[name='colorCode']").value;
                                colorNameDiv.textContent = newColorName;
                                colorCodeDiv.textContent = newColorCode;
                                colorCodeDiv.previousElementSibling.style.backgroundColor = newColorCode;

                                // Hide the form and the save/cancel buttons, show the edit button
                                row.querySelectorAll(".edit").forEach(function (editableTd) {
                                    let colorNameDiv = editableTd.querySelector(".color-name");
                                    let colorCodeDiv = editableTd.querySelector(".color-code");
                                    let formDiv = editableTd.querySelector(".hidden-form");
                                    let editButton = row.querySelector(".edit-color-btn");
                                    let saveButton = row.querySelector(".save-color-btn");
                                    let cancelButton = row.querySelector(".cancel-color-btn");

                                    if (colorNameDiv) {
                                        colorNameDiv.style.display = "block";
                                    }
                                    if (colorCodeDiv) {
                                        colorCodeDiv.style.display = "flex";
                                        colorCodeDiv.previousElementSibling.style.display = "block";
                                    }
                                    formDiv.style.display = "none";
                                    editButton.style.display = "inline-block";
                                    saveButton.style.display = "none";
                                    cancelButton.style.display = "none";
                                });
                            },
                            error: function () {
                                alert("Error updating color.");
                            }
                        });
                    });
                });

                document.querySelectorAll(".cancel-color-btn").forEach(function (button) {
                    button.addEventListener("click", function () {
                        let row = this.closest("tr");

                        // Hide the form and the save/cancel buttons, show the edit button
                        row.querySelectorAll(".edit").forEach(function (editableTd) {
                            let colorNameDiv = editableTd.querySelector(".color-name");
                            let colorCodeDiv = editableTd.querySelector(".color-code");
                            let formDiv = editableTd.querySelector(".hidden-form");
                            let editButton = row.querySelector(".edit-color-btn");
                            let saveButton = row.querySelector(".save-color-btn");
                            let cancelButton = row.querySelector(".cancel-color-btn");

                            if (colorNameDiv) {
                                colorNameDiv.style.display = "block";
                            }
                            if (colorCodeDiv) {
                                colorCodeDiv.style.display = "flex";
                                colorCodeDiv.previousElementSibling.style.display = "block";
                            }
                            formDiv.style.display = "none";
                            editButton.style.display = "inline-block";
                            saveButton.style.display = "none";
                            cancelButton.style.display = "none";
                        });
                    });
                });
            });
//          edit saleOff
            document.addEventListener("DOMContentLoaded", function () {
                document.querySelectorAll(".edit-saleOff-btn").forEach(function (button) {
                    button.addEventListener("click", function () {
                        let row = this.closest("tr");
                        let xDiv = row.querySelector(".saleOff-value");
                        let formDiv = row.querySelector(".hidden-form");
                        let editButton = row.querySelector(".edit-saleOff-btn");
                        let saveButton = row.querySelector(".save-saleOff-btn");
                        let cancelButton = row.querySelector(".cancel-saleOff-btn");

                        // Show the form and the save/cancel buttons, hide the edit button
                        xDiv.style.display = "none";
                        formDiv.style.display = "block";
                        editButton.style.display = "none";
                        saveButton.style.display = "inline-block";
                        cancelButton.style.display = "inline-block";
                    });
                });

                document.querySelectorAll(".save-saleOff-btn").forEach(function (button) {
                    button.addEventListener("click", function () {
                        let row = this.closest("tr");
                        let form = row.querySelector(".hidden-form form");
                        let xDiv = row.querySelector(".saleOff-value");
                        let formDiv = row.querySelector(".hidden-form");
                        let editButton = row.querySelector(".edit-saleOff-btn");
                        let saveButton = row.querySelector(".save-saleOff-btn");
                        let cancelButton = row.querySelector(".cancel-saleOff-btn");
                        // Perform AJAX request to submit form data
                        $.ajax({
                            type: form.getAttribute("method"),
                            url: form.getAttribute("action"),
                            data: $(form).serialize(),
                            success: function (response) {
                                // Update the brand name with the new value
                                let newValue = form.querySelector("input[name='saleOffValue']").value;
                                xDiv.textContent = newValue;

                                // Hide the form and the save/cancel buttons, show the edit button
                                xDiv.style.display = "block";
                                formDiv.style.display = "none";
                                editButton.style.display = "inline-block";
                                saveButton.style.display = "none";
                                cancelButton.style.display = "none";
                            },
                            error: function () {
                                alert("Error updating room name.");
                            }
                        });
                    });
                });


                document.querySelectorAll(".cancel-saleOff-btn").forEach(function (button) {
                    button.addEventListener("click", function () {
                        let row = this.closest("tr");
                        let xDiv = row.querySelector(".saleOff-value");
                        let formDiv = row.querySelector(".hidden-form");
                        let editButton = row.querySelector(".edit-saleOff-btn");
                        let saveButton = row.querySelector(".save-saleOff-btn");
                        let cancelButton = row.querySelector(".cancel-saleOff-btn");

                        // Hide the form and the save/cancel buttons, show the edit button
                        xDiv.style.display = "block";
                        formDiv.style.display = "none";
                        editButton.style.display = "inline-block";
                        saveButton.style.display = "none";
                        cancelButton.style.display = "none";
                    });
                });
            });
//          edit category of post
            document.addEventListener("DOMContentLoaded", function () {
                document.querySelectorAll(".edit-categoryOfPost-btn").forEach(function (button) {
                    button.addEventListener("click", function () {
                        let row = this.closest("tr");
                        let xDiv = row.querySelector(".categoryOfPost-name");
                        let formDiv = row.querySelector(".hidden-form");
                        let editButton = row.querySelector(".edit-categoryOfPost-btn");
                        let saveButton = row.querySelector(".save-categoryOfPost-btn");
                        let cancelButton = row.querySelector(".cancel-categoryOfPost-btn");

                        // Show the form and the save/cancel buttons, hide the edit button
                        xDiv.style.display = "none";
                        formDiv.style.display = "block";
                        editButton.style.display = "none";
                        saveButton.style.display = "inline-block";
                        cancelButton.style.display = "inline-block";
                    });
                });

                document.querySelectorAll(".save-categoryOfPost-btn").forEach(function (button) {
                    button.addEventListener("click", function () {
                        let row = this.closest("tr");
                        let form = row.querySelector(".hidden-form form");
                        let xDiv = row.querySelector(".categoryOfPost-name");
                        let formDiv = row.querySelector(".hidden-form");
                        let editButton = row.querySelector(".edit-categoryOfPost-btn");
                        let saveButton = row.querySelector(".save-categoryOfPost-btn");
                        let cancelButton = row.querySelector(".cancel-categoryOfPost-btn");
                        // Perform AJAX request to submit form data
                        $.ajax({
                            type: form.getAttribute("method"),
                            url: form.getAttribute("action"),
                            data: $(form).serialize(),
                            success: function (response) {
                                // Update new value
                                let newValue = form.querySelector("input[name='categoryOfPostName']").value;
                                xDiv.textContent = newValue;

                                // Hide the form and the save/cancel buttons, show the edit button
                                xDiv.style.display = "block";
                                formDiv.style.display = "none";
                                editButton.style.display = "inline-block";
                                saveButton.style.display = "none";
                                cancelButton.style.display = "none";
                            },
                            error: function () {
                                alert("Error updating Category Of Post name.");
                            }
                        });
                    });
                });


                document.querySelectorAll(".cancel-categoryOfPost-btn").forEach(function (button) {
                    button.addEventListener("click", function () {
                        let row = this.closest("tr");
                        let xDiv = row.querySelector(".categoryOfPost-name");
                        let formDiv = row.querySelector(".hidden-form");
                        let editButton = row.querySelector(".edit-categoryOfPost-btn");
                        let saveButton = row.querySelector(".save-categoryOfPost-btn");
                        let cancelButton = row.querySelector(".cancel-categoryOfPost-btn");

                        // Hide the form and the save/cancel buttons, show the edit button
                        xDiv.style.display = "block";
                        formDiv.style.display = "none";
                        editButton.style.display = "inline-block";
                        saveButton.style.display = "none";
                        cancelButton.style.display = "none";
                    });
                });
            });
        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
