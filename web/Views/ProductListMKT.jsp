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

            .custom-close-btn {
                position: absolute;
                right: 1.5rem; /* Adjust as needed */
                z-index: 1051; /* Ensure it appears above the modal content */
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
                                            <h2>Product List</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ml-15 mr-15" style="display: flex; justify-content: space-between">
                            <div>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addProductModal">
                                    Add New Product
                                </button>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addProductDetailModal">
                                    Add New Product Detail
                                </button>
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

                        <!-- Add New Product Modal -->
                        <div class="modal fade" id="addProductModal" tabindex="-1" role="dialog" aria-labelledby="addProductModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addProductModalLabel">Add New Product</h5>
                                        <button type="button" class="close btn btn-danger" data-dismiss="modal" aria-label="Close" style="margin-left: 532px;">
                                            <span aria-hidden="true" style="width: 40px; height: 20px">X</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="ManageProductServlet" method="post" enctype="multipart/form-data">
                                            <input type="hidden" name="action" value="addNewProduct">
                                            <div class="form-group">
                                                <label for="productName">Product Name:</label>
                                                <input type="text" class="form-control" id="productName" name="productName">
                                            </div>
                                            <div class="row">
                                                <div class="col-md-7">
                                                    <div class="form-group">
                                                        <label for="categoryId">Category:</label>
                                                        <select class="form-control" id="categoryId" name="categoryId">
                                                            <c:forEach items="${requestScope.categoryList}" var="category">
                                                                <option value="${category.id}">${category.category}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="brandId">Brand:</label>
                                                        <select class="form-control" id="brandId" name="brandId">
                                                            <c:forEach items="${requestScope.brandList}" var="brand">
                                                                <option value="${brand.id}">${brand.brandname}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="roomId">Room:</label>
                                                        <select class="form-control" id="roomId" name="roomId">
                                                            <c:forEach items="${requestScope.roomList}" var="room">
                                                                <option value="${room.id}">${room.roomname}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="row">
                                                        <div class="form-group col-md-6">
                                                            <label for="priceProduct">Price:</label>
                                                            <input type="text" class="form-control" id="priceProduct" name="priceProduct">
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label for="quantityProduct">Quantity:</label>
                                                            <input type="text" class="form-control" id="quantityProduct" name="quantityProduct">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="imageProductInput">Image:</label>
                                                        <input type="file" class="form-control-file" id="imageProductInput" name="imageProduct" accept="image/*" onchange="previewImage(event, 'imageProduct')">
                                                    </div>
                                                </div>
                                                <div class="col-md-5">
                                                    <img id="imageProduct" src="" width="305px" height="305px" style="max-width: 100%; margin-top: 10px;">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="descriptionProduct">Description:</label>
                                                <textarea class="form-control" id="descriptionProduct" name="descriptionProduct" rows="4"></textarea>
                                            </div>
                                            <div class="d-flex" style="justify-content: center; margin-top: 10px">
                                                <button type="submit" class="btn btn-primary">Save</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Add New Product Detail Modal -->
                        <div class="modal fade" id="addProductDetailModal" tabindex="-1" role="dialog" aria-labelledby="addProductDetailModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addProductDetailModalLabel">Add New Product Detail</h5>
                                        <button type="button" class="close btn btn-danger" data-dismiss="modal" aria-label="Close" style="margin-left: 495px">
                                            <span aria-hidden="true" style="width: 40px; height: 20px">X</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="ManageProductServlet" method="post" enctype="multipart/form-data">
                                            <input type="hidden" name="action" value="addNewProductDetail">
                                            <div class="form-group">
                                                <label for="productDetailName">Product:</label>
                                                <select class="form-control" id="productDetailName" name="productId">
                                                    <c:forEach items="${requestScope.productList}" var="product">
                                                        <option value="${product.id}">${product.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="colorId">Color:</label>
                                                    <select class="form-control" id="colorId" name="colorId">
                                                        <c:forEach items="${requestScope.colorList}" var="color">
                                                            <option value="${color.id}">${color.colorname}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="quantityProductDetail">Quantity:</label>
                                                    <input type="text" class="form-control" id="quantityProductDetail" name="quantityProductDetail">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-3">
                                                    <label for="imageProductDetailInput1">Image 1:</label>
                                                    <input type="file" class="form-control-file" id="imageProductDetailInput1" name="imageProductDetail1" accept="image/*" onchange="previewImage(event, 'imagePreview1')" style="width: 90px; margin-bottom: 10px; margin-top: 10px">
                                                    <img id="imagePreview1" src="" width="173px" height="173px" style="max-width: 100%">
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label for="imageProductDetailInput2">Image 2:</label>
                                                    <input type="file" class="form-control-file" id="imageProductDetailInput2" name="imageProductDetail2" accept="image/*" onchange="previewImage(event, 'imagePreview2')" style="width: 90px; margin-bottom: 10px; margin-top: 10px">
                                                    <img id="imagePreview2" src="" width="173px" height="173px" style="max-width: 100%">
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label for="imageProductDetailInput3">Image 3:</label>
                                                    <input type="file" class="form-control-file" id="imageProductDetailInput3" name="imageProductDetail3" accept="image/*" onchange="previewImage(event, 'imagePreview3')" style="width: 90px; margin-bottom: 10px; margin-top: 10px">
                                                    <img id="imagePreview3" src="" width="173px" height="173px" style="max-width: 100%">
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label for="imageProductDetailInput4">Image 4:</label>
                                                    <input type="file" class="form-control-file" id="imageProductDetailInput4" name="imageProductDetail4" accept="image/*" onchange="previewImage(event, 'imagePreview4')" style="width: 90px; margin-bottom: 10px; margin-top: 10px">
                                                    <img id="imagePreview4" src="" width="173px" height="173px"  style="max-width: 100%">
                                                </div>
                                            </div>
                                            <div class="d-flex" style="justify-content: center; margin-top: 10px">
                                                <button type="submit" class="btn btn-primary">Save</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="ml-15 mb-15">
                            <form method="post">
                                <div class="d-flex">
                                    <input type="text" class="form-control" name="search" placeholder="Tên sản phẩm" style="width: 350px;" />
                                    <button class="btn btn-primary" type="submit">Search</button>
                                </div>
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
                                    <button type="submit" class="btn btn-primary ml-10 mr-10">Lọc</button>
                                    <button class="btn btn-secondary"><a href="${pageContext.request.contextPath}/ProductListMKTServlet?clearfilter=yes" style="text-decoration: none; color: black;">Bỏ lọc</a></button>
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
                                                            <a href="#" title="View" data-toggle="modal" data-target="#viewProductModal_${product.id}"><i class="fas fa-eye"></i></a>
                                                            <a href="#" title="Edit" data-toggle="modal" data-target="#editProductModal_${product.id}"><i class="fas fa-edit"></i></a>
                                                            <a href="#" title="Delete" data-toggle="modal" data-target="#deleteProductModal_${product.id}"><i class="fas fa-trash-alt"></i></a>
                                                        </p>

                                                    </td>
                                                </tr>
                                                <!--Modal View Detail-->
                                            <div class="modal fade" id="viewProductModal_${product.id}" tabindex="-1" aria-labelledby="viewProductModalLabel_${product.id}" aria-hidden="true">
                                                <div class="modal-dialog modal-fullscreen">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="viewProductModalLabel">Product Details</h5>
                                                            <button type="button" class="close custom-close-btn btn btn-danger" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true" style="width: 40px; height: 20px">X</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="row">
                                                                <div class="col-md-6 row">
                                                                    <div class="col-md-6">
                                                                        <img src="image/product/${product.image}" alt="" style="max-width: 100%">
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <b>Product ID:</b> #${product.id}<br/>
                                                                        <b>Product Name:</b> ${product.name}<br/>
                                                                        <b>Category:</b> 
                                                                        <c:forEach items="${requestScope.categoryList}" var="category">
                                                                            <c:if test="${product.category_id == category.id}">${category.category}</c:if>
                                                                        </c:forEach><br/>
                                                                        <b>Brand:</b> 
                                                                        <c:forEach items="${requestScope.brandList}" var="brand">
                                                                            <c:if test="${product.brand_id == brand.id}">${brand.brandname}</c:if>
                                                                        </c:forEach><br/>
                                                                        <b>Score:</b> ${product.staravg} sao<br/>
                                                                        <b>Price:</b> ${product.price} VNĐ<br/>
                                                                        <b>Room:</b> 
                                                                        <c:forEach items="${requestScope.roomList}" var="room">
                                                                            <c:if test="${product.room_id == room.id}">${room.roomname}</c:if>
                                                                        </c:forEach><br/>
                                                                        <b>Quantity:</b> ${product.quantity}<br/>
                                                                        <b>Status:</b> ${product.status}<br/>
                                                                        <c:forEach items="${requestScope.productDetailList}" var="productDetail">
                                                                            <c:if test="${productDetail.product_id == product.id}">
                                                                                <c:forEach items="${requestScope.colorList}" var="color">
                                                                                    <c:if test="${productDetail.color_id == color.id}">
                                                                                        <b>Color:</b> ${color.colorname}<br/>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                                <b>SL:</b> ${productDetail.quantity}<br/>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <b>Description:</b><br/>
                                                                        ${product.description}
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <c:forEach items="${requestScope.productDetailList}" var="productDetail">
                                                                        <c:if test="${productDetail.product_id == product.id}">
                                                                            <c:forEach items="${requestScope.colorList}" var="color">
                                                                                <c:if test="${productDetail.color_id == color.id}">
                                                                                    <b>Color:</b> ${color.colorname}<br/><br/>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                            <div class="row">
                                                                                <c:forEach items="${requestScope.attachedImageList}" var="attachedImage">
                                                                                    <c:if test="${productDetail.id == attachedImage.productdetail_id}">
                                                                                        <div class="col-md-3">
                                                                                            <img src="image/product/${attachedImage.image}" alt="${attachedImage.image}" style="max-width: 100%;">
                                                                                        </div>
                                                                                    </c:if>
                                                                                </c:forEach>
                                                                            </div>
                                                                        </c:if>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>



                                            <!--Modal Edit-->
                                            <div class="modal fade" id="editProductModal_${product.id}" tabindex="-1" aria-labelledby="editProductModalLabel_${product.id}" aria-hidden="true">
                                                <!-- Modal content -->
                                                <div class="modal-dialog modal-fullscreen">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="editProductModalLabel">Edit Product</h5>
                                                            <button type="button" class="close custom-close-btn btn btn-danger" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true" style="width: 40px; height: 20px">X</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form id="editProductForm" action="ManageProductServlet" method="post" enctype="multipart/form-data">
                                                                <input type="hidden" name="action" value="editProduct">
                                                                <input type="hidden" name="editProductId" id="editProductId" value="${product.id}">
                                                                <div class="row">
                                                                    <div class="col-md-6 row">
                                                                        <div class="col-md-6">
                                                                            <img id="imageProductPreview_${product.id}" src="image/product/${product.image}" alt="" style="max-width: 100%">
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <div style="margin-bottom: 5px">
                                                                                <b>Product Name:</b><input name="productName" value="${product.name}" style="width: 346px"/><br/>
                                                                            </div>
                                                                            <div style="margin-bottom: 5px">
                                                                                <b>Category:</b>
                                                                                <select name="categoryID">
                                                                                    <c:forEach items="${requestScope.categoryList}" var="category">
                                                                                        <c:choose>
                                                                                            <c:when test="${category.id == product.category_id}">
                                                                                                <option value="${category.id}" selected>${category.category}</option>
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <option value="${category.id}">${category.category}</option>
                                                                                            </c:otherwise>
                                                                                        </c:choose>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </div>
                                                                            <div style="margin-bottom: 5px">
                                                                                <b>Brand:</b> 
                                                                                <select name="brandID" style="margin-left: 28px; width: 140px">
                                                                                    <c:forEach items="${requestScope.brandList}" var="brand">
                                                                                        <c:choose>
                                                                                            <c:when test="${brand.id == product.brand_id}">
                                                                                                <option value="${brand.id}" selected>${brand.brandname}</option>
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <option value="${brand.id}">${brand.brandname}</option>
                                                                                            </c:otherwise>
                                                                                        </c:choose>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </div>

                                                                            <div style="margin-bottom: 5px">
                                                                                <b>Room:</b>
                                                                                <select name="roomID" style="margin-left: 29px; width: 140px">
                                                                                    <c:forEach items="${requestScope.roomList}" var="room">
                                                                                        <c:choose>
                                                                                            <c:when test="${room.id == product.room_id}">
                                                                                                <option value="${room.id}" selected>${room.roomname}</option>
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <option value="${room.id}">${room.roomname}</option>
                                                                                            </c:otherwise>
                                                                                        </c:choose>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </div>

                                                                            <div style="margin-bottom: 5px">
                                                                                <b>Price:</b><input type="text" name="priceProduct" value="${product.price}" style="margin-left: 38px; width: 140px"/> VNĐ<br/> 
                                                                            </div>

                                                                            <div style="margin-bottom: 5px">
                                                                                <b>Quantity:</b><input type="text" name="quantityProduct" value="${product.quantity}" style="margin-left: 9px; width: 140px"/><br/>
                                                                            </div>

                                                                            <div style="margin-bottom: 5px">
                                                                                <b>Status:</b>
                                                                                <select name="statusProduct" style="margin-left: 25px; width: 140px">
                                                                                    <c:choose>
                                                                                        <c:when test="${product.status == 'Active'}">
                                                                                            <option value="Active" selected>Active</option>
                                                                                            <option value="In Active">In Active</option>
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            <option value="Active">Active</option>
                                                                                            <option value="In Active" selected>In Active</option>
                                                                                        </c:otherwise>
                                                                                    </c:choose>
                                                                                </select>
                                                                            </div>
                                                                            <b>Image: </b>
                                                                            <input type="hidden" name="oldImageProduct" value="${product.image}"/>
                                                                            <input type="file" name="imageProduct" id="imageProductInput_${product.id}" onchange="previewImage(event, 'imageProductPreview_${product.id}')" accept="image/*"/>
                                                                        </div>
                                                                        <div class="col-md-12">
                                                                            <b>Description:</b><br/>
                                                                            <textarea name="desciptionProduct" rows="8" cols="56">
                                                                                ${product.description}
                                                                            </textarea>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div style="margin-top: 5px">
                                                                            <c:set var="count" value="1" scope="page"/>
                                                                            <c:set var="countImg" value="1" scope="page"/>
                                                                            <c:forEach items="${requestScope.productDetailList}" var="productDetail">
                                                                                <c:if test="${productDetail.product_id == product.id}">
                                                                                    <input type="hidden" name="productDetailID_${count}" value="${productDetail.id}"/>
                                                                                    <c:forEach items="${requestScope.colorList}" var="color">
                                                                                        <c:if test="${productDetail.color_id == color.id}">
                                                                                            <span style="margin-bottom: 5px">
                                                                                                <b>Color:</b>
                                                                                                <select name="colorID_${count}" style="width: 140px; margin-left: 10px">
                                                                                                    <c:forEach items="${requestScope.colorList}" var="color">
                                                                                                        <c:choose>
                                                                                                            <c:when test="${productDetail.color_id == color.id}">
                                                                                                                <option value="${color.id}" selected>${color.colorname}</option>
                                                                                                            </c:when>
                                                                                                            <c:otherwise>
                                                                                                                <option value="${color.id}">${color.colorname}</option>
                                                                                                            </c:otherwise>
                                                                                                        </c:choose>
                                                                                                    </c:forEach>
                                                                                                </select>
                                                                                            </span>
                                                                                        </c:if>
                                                                                    </c:forEach>
                                                                                    <b>Quantity detail:</b> <input type="text" name="quantityProductDetail_${count}" value="${productDetail.quantity}" style="width: 50px; margin-left: 10px"/><br/>
                                                                                    <b>Status:</b>
                                                                                    <select name="statusProductDetail_${count}" style="margin-left: 25px; width: 140px">
                                                                                        <c:choose>
                                                                                            <c:when test="${productDetail.status == 'Active'}">
                                                                                                <option value="Active" selected>Active</option>
                                                                                                <option value="In Active">In Active</option>
                                                                                            </c:when>
                                                                                            <c:otherwise>
                                                                                                <option value="Active">Active</option>
                                                                                                <option value="In Active" selected>In Active</option>
                                                                                            </c:otherwise>
                                                                                        </c:choose>
                                                                                    </select>
                                                                                    <c:set var="count" value="${count + 1}" scope="page"/>
                                                                                    <div class="modal-body row">
                                                                                        <c:forEach items="${requestScope.attachedImageList}" var="attachedImage">
                                                                                            <c:if test="${productDetail.id == attachedImage.productdetail_id}">
                                                                                                <input type="hidden" name="attachedImageID_${countImg}" value="${attachedImage.id}"/>
                                                                                                <input type="hidden" name="oldImageAttached_${countImg}" value="${attachedImage.image}"/>
                                                                                                <div class="col-md-3">
                                                                                                    <img id="imagePreview_${attachedImage.id}" src="image/product/${attachedImage.image}" alt="${attachedImage.image}" style="max-width: 100%">
                                                                                                    <div style="margin-bottom: 5px; display: flex">
                                                                                                        <b>Image: </b>
                                                                                                        <input type="file" name="imageProductDetail_${countImg}" id="imageProductDetailInput_${attachedImage.id}" style="width: 90px; margin-left: 15px" onchange="previewImage(event, 'imagePreview_${attachedImage.id}')" accept="image/*"/>
                                                                                                    </div>
                                                                                                    <c:set var="countImg" value="${countImg + 1}" scope="page"/>
                                                                                                </div>
                                                                                            </c:if>
                                                                                        </c:forEach>
                                                                                    </div><hr>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </div>
                                                                    </div>
                                                                    <div style="display: flex; justify-content: center">
                                                                        <button type="submit" class="btn btn-primary">Update</button>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Modal Delete -->
                                            <div class="modal fade" id="deleteProductModal_${product.id}" tabindex="-1" aria-labelledby="deleteProductModalLabel_${product.id}" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="deleteProductModalLabel_${product.id}">Confirm Delete</h5>
                                                            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p>Are you sure you want to delete this product?</p>
                                                            <form id="deleteProductForm" action="ManageProductServlet" method="post">
                                                                <input type="hidden" name="action" value="deleteProduct">
                                                                <input type="hidden" name="deleteProductId" id="deleteProductId" value="${product.id}">
                                                                <div class="d-flex justify-content-center">
                                                                    <button type="submit" class="btn btn-danger mx-2" style="width: 70px;">Yes</button>
                                                                    <button type="button" class="btn btn-secondary mx-2" data-bs-dismiss="modal" style="width: 70px;">No</button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
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
                </div>
            </div>
        </div>
        <%@include file="DashboardFooter.jsp" %>
    </main>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.bundle.min.js"></script>
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

</body>
</html>
