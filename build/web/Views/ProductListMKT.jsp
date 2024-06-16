<%-- 
    Document   : ProductListMKT
    Created on : Jun 5, 2024, 2:27:59 PM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

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
            }

            .dropbtn {
                background-color: white;
                color: black;
                padding: 10px;
                font-size: 16px;
                border: 1px solid #ccc;
                cursor: pointer;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                z-index: 1;
                padding-left: 0px;
            }

            .dropdown-content a {
                color: black;
                padding: 5px 10px;
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
        </style>
    </head>

    <body style="background-color:#f1f5f9;">
        <aside class="sidebar-nav-wrapper">
            <div class="navbar-logo">
                <a href="AdminServlet">
                    <img src="" alt="logo" />
                </a>
            </div>
            <nav class="sidebar-nav">
                <ul>
                    <li class="nav-item nav-item-has-children">
                        <a href="#0" class="collapsed" data-bs-toggle="collapse" data-bs-target="#ddmenu_1"
                           aria-controls="ddmenu_1" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon">
                                <svg width="20" height="20" viewBox="0 0 20 20" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M8.74999 18.3333C12.2376 18.3333 15.1364 15.8128 15.7244 12.4941C15.8448 11.8143 15.2737 11.25 14.5833 11.25H9.99999C9.30966 11.25 8.74999 10.6903 8.74999 10V5.41666C8.74999 4.7263 8.18563 4.15512 7.50586 4.27556C4.18711 4.86357 1.66666 7.76243 1.66666 11.25C1.66666 15.162 4.83797 18.3333 8.74999 18.3333Z" />
                                <path
                                    d="M17.0833 10C17.7737 10 18.3432 9.43708 18.2408 8.75433C17.7005 5.14918 14.8508 2.29947 11.2457 1.75912C10.5629 1.6568 10 2.2263 10 2.91665V9.16666C10 9.62691 10.3731 10 10.8333 10H17.0833Z" />
                                </svg>
                            </span>
                            <span class="text">Dashboard</span>
                        </a>
                        <ul id="ddmenu_1" class="collapse dropdown-nav">
                            <li>
                                <a href="AdminServlet"> Admin </a>
                            </li>
                            <li>
                                <a href="HomeServlet" class="active"> Shop Page </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item nav-item-has-children">
                        <a href="#0" class="" data-bs-toggle="collapse" data-bs-target="#ddmenu_2" aria-controls="ddmenu_2"
                           aria-expanded="true" aria-label="Toggle navigation">
                            <span class="icon">
                                <svg width="20" height="20" viewBox="0 0 20 20" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M11.8097 1.66667C11.8315 1.66667 11.8533 1.6671 11.875 1.66796V4.16667C11.875 5.43232 12.901 6.45834 14.1667 6.45834H16.6654C16.6663 6.48007 16.6667 6.50186 16.6667 6.5237V16.6667C16.6667 17.5872 15.9205 18.3333 15 18.3333H5.00001C4.07954 18.3333 3.33334 17.5872 3.33334 16.6667V3.33334C3.33334 2.41286 4.07954 1.66667 5.00001 1.66667H11.8097ZM6.66668 7.70834C6.3215 7.70834 6.04168 7.98816 6.04168 8.33334C6.04168 8.67851 6.3215 8.95834 6.66668 8.95834H10C10.3452 8.95834 10.625 8.67851 10.625 8.33334C10.625 7.98816 10.3452 7.70834 10 7.70834H6.66668ZM6.04168 11.6667C6.04168 12.0118 6.3215 12.2917 6.66668 12.2917H13.3333C13.6785 12.2917 13.9583 12.0118 13.9583 11.6667C13.9583 11.3215 13.6785 11.0417 13.3333 11.0417H6.66668C6.3215 11.0417 6.04168 11.3215 6.04168 11.6667ZM6.66668 14.375C6.3215 14.375 6.04168 14.6548 6.04168 15C6.04168 15.3452 6.3215 15.625 6.66668 15.625H13.3333C13.6785 15.625 13.9583 15.3452 13.9583 15C13.9583 14.6548 13.6785 14.375 13.3333 14.375H6.66668Z" />
                                <path
                                    d="M13.125 2.29167L16.0417 5.20834H14.1667C13.5913 5.20834 13.125 4.74197 13.125 4.16667V2.29167Z" />
                                </svg>
                            </span>
                            <span class="text">Pages</span>
                        </a>
                        <ul id="ddmenu_2" class="collapsed show dropdown-nav">
                            <li>
                                <a href="CRUDServlet" class="active"> Settings </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </aside>
        <main class="main-wrapper">
            <header class="header">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-5 col-md-5 col-6">
                        </div>
                        <div class="col-lg-7 col-md-7 col-6">
                            <div class="header-right">
                                <!-- profile start -->
                                <div class="profile-box ml-15">
                                    <button class="dropdown-toggle bg-transparent border-0" type="button" id="profile"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                        <div class="profile-info">
                                            <div class="info">
                                                <div class="image">
                                                    <img src="" alt="" />
                                                </div>
                                                <div>
                                                    <h6 class="fw-500">Adam Joe</h6>
                                                    <p>Admin</p>
                                                </div>
                                            </div>
                                        </div>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profile">
                                        <li>
                                            <div class="author-info flex items-center">
                                                <div class="image">
                                                    <img src="" alt="image">
                                                </div>
                                                <div class="content">
                                                    <h4 class="text-sm">Adam Joe</h4>
                                                    <a class="text-black/40 dark:text-white/40 hover:text-black dark:hover:text-white text-xs"
                                                       href="#">Email@gmail.com</a>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="divider"></li>
                                        <li>
                                            <a href="#0">
                                                <i class="lni lni-user"></i> View Profile
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#0">
                                                <i class="lni lni-alarm"></i> Notifications
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#0"> <i class="lni lni-inbox"></i> Messages </a>
                                        </li>
                                        <li>
                                            <a href="#0"> <i class="lni lni-cog"></i> Settings </a>
                                        </li>
                                        <li class="divider"></li>
                                        <li>
                                            <a href="#0"> <i class="lni lni-exit"></i> Sign Out </a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- profile end -->
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <section class="section">
                <div class="container-fluid" style="padding-left: 13px">
                    <div class="title-wrapper pt-30">
                        <div class="row align-items-center">
                            <div class="col-md-6">
                                <div class="title">
                                    <h2>Product List</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ml-15 mr-15" style="display: flex; justify-content: space-between">
                    <div>
                        <button class="add-new-product-btn"> Add New Product <i class="fas fa-plus"></i></button>
                    </div>

                    <div class="dropdown" style="width: 180px; margin-left: 65px;">
                        <div class="dropbtn">
                            SẮP XẾP
                            <span><i class="fa fa-chevron-down"></i></span>
                        </div>
                        <ul class="dropdown-content" style="min-width: 180px">
                            <li><a href="${pageContext.request.contextPath}/ProductListMKTServlet?sortby=priceAsc">Giá tăng dần</a></li>
                            <li><a href="${pageContext.request.contextPath}/ProductListMKTServlet?sortby=priceDesc">Giá giảm dần</a></li>
                            <li><a href="${pageContext.request.contextPath}/ProductListMKTServlet?sortby=quantityAsc">Số lượng tăng dần</a></li>
                            <li><a href="${pageContext.request.contextPath}/ProductListMKTServlet?sortby=quantityDesc">Số lượng giảm dần</a></li>
                        </ul>
                    </div>
                </div>
                <div class="ml-15 mb-15">
                    <form method="post">
                        <input type="text" name="search" placeholder="Tên sản phẩm" style="width: 350px;" />
                        <button type="submit">Search</button>
                    </form>
                </div>
                <div class="d-flex">
                    <form method="post">
                        <div class="dropdown" style="width: 135px; margin-left: 15px;">
                            <div class="dropbtn">
                                Danh mục
                                <span><i class="fa fa-chevron-down"></i></span>
                            </div>
                            <ul class="dropdown-content" style="min-width: 135px;">
                                <c:forEach items="${requestScope.categoryList}" var="category">
                                    <li>
                                        <input type="checkbox" value="${category.id}" name="category-filter"
                                               <c:if test="${not empty selectedCategoryList and selectedCategoryList.contains(category.id)}">checked</c:if>
                                               /> ${category.category}
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                        <div class="dropdown" style="width: 150px;">
                            <div class="dropbtn">
                                Thương hiệu
                                <span><i class="fa fa-chevron-down"></i></span>
                            </div>
                            <ul class="dropdown-content" style="min-width: 150px;">
                                <c:forEach items="${requestScope.brandList}" var="brand">
                                    <li>
                                        <div>
                                            <input type="checkbox" value="${brand.id}" name="brand-filter" 
                                                   <c:if test="${not empty selectedBrandList and selectedBrandList.contains(brand.id)}">checked</c:if>
                                                   /> ${brand.brandname}
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                        <div class="dropdown" style="width: 140px;">
                            <div class="dropbtn">
                                Phòng
                                <span><i class="fa fa-chevron-down"></i></span>
                            </div>
                            <ul class="dropdown-content" style="min-width: 140px;">
                                <c:forEach items="${requestScope.roomList}" var="room">
                                    <li>
                                        <input type="checkbox" value="${room.id}" name="room-filter"
                                               <c:if test="${not empty selectedRoomList and selectedRoomList.contains(room.id)}">checked</c:if>
                                               /> ${room.roomname}
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                        <div class="dropdown" style="width: 200px;">
                            <div class="dropbtn">
                                Giá
                                <span><i class="fa fa-chevron-down"></i></span>
                            </div>
                            <ul class="dropdown-content" style="min-width: 200px;">
                                <li>
                                    <input type="checkbox" name="price-filter" value="<500"
                                           <c:if test="${not empty selectedPriceList and selectedPriceList.contains('<500')}">checked</c:if>
                                               style="display: inline-block" /> < 500.000₫
                                    </li>
                                    <li>
                                        <input type="checkbox" name="price-filter" value="500<x<1500"
                                        <c:if test="${not empty selectedPriceList and selectedPriceList.contains('500<x<1500')}">checked</c:if>
                                            style="display: inline-block" /> 500,000₫ - 1,500,000₫
                                    </li>
                                    <li>
                                        <input type="checkbox" name="price-filter" value="1500<x<5000"
                                        <c:if test="${not empty selectedPriceList and selectedPriceList.contains('1500<x<5000')}">checked</c:if>
                                            style="display: inline-block" /> 1,500,000₫ - 5,000,000₫
                                    </li>
                                    <li>
                                        <input type="checkbox" name="price-filter" value=">5000"
                                        <c:if test="${not empty selectedPriceList and selectedPriceList.contains('>5000')}">checked</c:if>
                                            style="display: inline-block" /> > 5,000,000₫
                                    </li>
                                </ul>
                            </div>

                            <div class="dropdown" style="width: 100px;">
                                <div class="dropbtn">
                                    Status
                                    <span><i class="fa fa-chevron-down"></i></span>
                                </div>
                                <ul class="dropdown-content" style="min-width: 100px;">
                                    <li>
                                        <input type="checkbox" value="Active" name="status-filter" /> Active
                                    </li>
                                    <li>
                                        <input type="checkbox" value="In Active" name="status-filter" /> In Active
                                    </li>
                                    </li>
                                </ul>
                            </div>
                            |
                            <button type="submit" class="ml-10 mr-10">Lọc</button>
                            <button><a href="${pageContext.request.contextPath}/ProductListMKTServlet?clearfilter=yes" style="text-decoration: none; color: black;">Bỏ lọc</a></button>
                    </form>

                </div>
                <div>
                    <div class="card-style ml-15 mr-15">
                        <div class="table-responsive">
                            <table class="table top-selling-table">
                                <thead>
                                    <tr>
                                        <th>
                                            <h6 class="text-sm text-medium">ID</h6>
                                        </th>
                                        <th>
                                            <h6 class="text-sm text-medium">Image</h6>
                                        </th>
                                        <th>
                                            <h6 class="text-sm text-medium">Product</h6>
                                        </th>
                                        <th class="min-width">
                                            <h6 class="text-sm text-medium">Category</h6>
                                        </th>
                                        <th class="min-width">
                                            <h6 class="text-sm text-medium">Brand</h6>
                                        </th>
                                        <th class="min-width">
                                            <h6 class="text-sm text-medium">Room</h6>
                                        </th>
                                        <th class="min-width">
                                            <h6 class="text-sm text-medium">Price</h6>
                                        </th>
                                        <th class="min-width">
                                            <h6 class="text-sm text-medium">Quantity</h6>
                                        </th>
                                        <th class="min-width">
                                            <h6 class="text-sm text-medium">Status</h6>
                                        </th>
                                        <th class="min-width">
                                            <h6 class="text-sm text-medium">Action</h6>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.productList}" var="product">
                                        <tr>
                                            <td>
                                                <div>
                                                    <p class="text-sm">${product.id}</p>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="image">
                                                    <img src="image/product/${product.image}" alt="${product.name}" />
                                                </div>
                                            </td>
                                            <td>
                                                <div class="text-sm">
                                                    <p class="text-sm">${product.name}</p>
                                                </div>
                                            </td>
                                            <td>
                                                <p class="text-sm">
                                                    <c:forEach items="${requestScope.categoryList}" var="category">
                                                        <c:if test="${product.category_id == category.id}">${category.category}
                                                        </c:if>
                                                    </c:forEach>
                                                </p>
                                            </td>
                                            <td>
                                                <p class="text-sm">
                                                    <c:forEach items="${requestScope.brandList}" var="brand">
                                                        <c:if test="${product.brand_id == brand.id}">${brand.brandname}
                                                        </c:if>
                                                    </c:forEach>
                                                </p>
                                            </td>
                                            <td>
                                                <p class="text-sm">
                                                    <c:forEach items="${requestScope.roomList}" var="room">
                                                        <c:if test="${product.room_id == room.id}">${room.roomname}
                                                        </c:if>
                                                    </c:forEach>
                                                </p>
                                            </td>
                                            <td>
                                                <p class="text-sm">${product.price} VND</p>
                                            </td>
                                            <td>
                                                <p class="text-sm">${product.quantity}</p>
                                            </td>
                                            <td>
                                                <p class="text-sm">${product.status}</p>
                                            </td>
                                            <td class="actions">
                                                <p>
                                                    <a href="#" title="View" data-toggle="modal" data-target="#viewProductModal"
                                                       data-productId ="${product.id}"><i class="fas fa-eye"></i></a>

                                                    <a href="#" title="Edit" data-toggle="modal" data-target="#editProductModal"
                                                       data-productId ="${product.id}"><i class="fas fa-edit"></i></a>
                                                    <a href="#" title="Delete" data-toggle="modal" data-target="#deleteProductModal"
                                                       data-productId ="${product.id}"><i class="fas fa-trash-alt"></i></a>
                                                </p>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- end card -->
                    </div>
                    <!-- end col -->
                </div>
                <div class="sortpagibar pagi clearfix text-center">
                    <div id="pagination" class="clearfix">

                        <div>
                            <c:forEach var="page" items="${pagenumber}">
                                <a class="mr-10" style="color: black; text-decoration: none;" href="ProductListMKTServlet?page=${page}" aria-label="Trang ${page}">${page}</a>
                            </c:forEach>
                            <span class="mr-10">&hellip;</span>
                        </div>
                    </div>
                </div>
            </section>

            <div class="modal fade" id="viewProductModal" tabindex="-1" aria-labelledby="viewProductModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="viewProductModalLabel">Product Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <c:set var="productView" value="" scope="page"/>
                        <c:forEach items="${requestScope.productList}" var="product">
                            <c:if test="${product.id == param.productID}">
                                <c:set var="productView" value="product" scope="page"/>
                            </c:if>
                        </c:forEach>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-8">
                                    <p><b>Product ID:</b> #${productView.id}</p>
                                    <p><b>Product Name:</b> ${productView.name}</p>
                                    <p><b>Category:</b>
                                        <c:forEach items="${requestScope.categoryList}" var="category">
                                            <c:if test="${productView.category_id == category.id}">${category.category}
                                            </c:if>
                                        </c:forEach>
                                    </p>
                                    <p><b>Brand:</b> 
                                        <c:forEach items="${requestScope.brandList}" var="brand">
                                            <c:if test="${productView.brand_id == brand.id}">${brand.brandname}
                                            </c:if>
                                        </c:forEach>
                                    </p>
                                    <p><b>Room:</b> 
                                        <c:forEach items="${requestScope.roomList}" var="room">
                                            <c:if test="${productView.room_id == room.id}">${room.roomname}
                                            </c:if>
                                        </c:forEach>
                                    </p>
                                </div>
                                <div class="col-md-4">
                                    <img src="image/product/${productView.image}"
                                         alt="" style="width: 135px; height: 135px;">
                                </div>
                                <div class="col-md-6">
                                    <c:set var="totalRating" value="0" scope="page" />
                                    <c:set var="reviewCount" value="0" scope="page" />

                                    <c:forEach items="${requestScope.feedbackList}" var="feedback">
                                        <c:if test="${feedback.product_id == product.id}">
                                            <c:set var="totalRating" value="${totalRating + feedback.votescore}" scope="page" />
                                            <c:set var="reviewCount" value="${reviewCount + 1}" scope="page" />
                                        </c:if>
                                    </c:forEach>
                                    <c:set var="averageRating" value="${reviewCount != 0 ? totalRating / reviewCount : 0}" scope="page" />
                                    <p><b>Score:</b> ${averageRating} sao</p>
                                    <p><b>Price:</b> ${productView.price} VNĐ</p>
                                    <p><b>Quantity:</b> ${productView.quantity}</p>
                                    <p><b>Status:</b> ${productView.status}</p>
                                </div>
                                <div class="col-md-6">
                                    <div style="display: flex; justify-content: space-around;">
                                        <c:forEach items="${requestScope.productDetailList}" var="productDetail">
                                            <c:forEach items="${requestScope.colorList}" var="color">
                                                <c:if test="${productDetail.color_id == color.id}">
                                                    <b>Color:</b><a href="#" class="viewImagesLink" data-productDetailID="${productDetail.id}"> ${productDetail.color}</a>
                                                </c:if>
                                            </c:forEach>
                                            <p><b>SL:</b> ${productDetail.quantity}</p>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <p><b>Description:</b></p>
                                    <p>${productView.description}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="imageModalLabel">Product Images</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body row">
                            <c:set var="productDetail_id" value="${param.productDetailID}" scope="page"/>
                            <c:forEach items="${requestScope.attachedImageList}" var="attachedImage">
                                <c:if test="${productDetail_id == attachedImage.productdetail_id}">
                                    <div class="col-md-6">
                                        <img src="image/product/${attachedImage.image}"
                                             alt="${attachedImage.image}" style="max-width: 100%;">
                                    </div>
                                </c:if>
                            </c:forEach>

                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.bundle.min.js"></script>
        <script>
            document.querySelectorAll('.viewImagesLink').forEach(function (element) {
                element.addEventListener('click', function (event) {
                    event.preventDefault();
                    var productDetailID = this.getAttribute('data-productDetailID');
                    $('#imageModal').modal('show');
                });
            });

        </script>
        
        
       
        
        
    </body>

</html>