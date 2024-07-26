<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh sách sản phẩm</title>
        <link rel="icon" href="image/logoshop.png" type="image/png">
        <link rel="stylesheet" href="css/main.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
        <style>
            th,
            td {
                padding: 10px;
                text-align: left;
                max-width: 120px; /* Set a maximum width as needed */
                word-break: break-word; /* Break long words to fit within the cell */
                text-align: center;
            }

            h6{
                text-align: center
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


            .actions a {
                margin: 0 5px;
                color: black;
                text-decoration: none;
            }
            .actions a:hover {
                color: blue;
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
                width: 170px;
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
                width: 140px;
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
        </style>
        <style>
            .filter_tags{
                position: relative;
                display: none;
                line-height: 22px;
                border-radius: 12px;
                margin: 0px 10px 0px 15px;
                color: #5d5d5d;
                background: #fff;
                border: 1px solid #dadada;
                font-size: 13px;
                padding: 0 8px 0 8px;
            }

            .opened{
                display: flex;
                align-items: baseline;
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
                                            <h2><a href="ProductListMKTServlet" style="text-decoration: none">Danh sách Sản phẩm</a></h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="ml-15 mr-15" style="display: flex; justify-content: space-between; margin-bottom: 20px">
                            <div class="button-add">
                                <button id="addNewProduct"  type="button" class="btn btn-primary" data-toggle="modal" data-target="#addProductModal">
                                    Thêm sản phẩm mới
                                </button>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addProductDetailModal">
                                    Thêm chi tiết sản phẩm
                                </button>
                            </div>
                            <!--Sort form-->
                            <div class="sort-wrapper">
                                <div class="sort-header">
                                    <span>Sắp xếp</span>
                                    <span class="icon-chevron">
                                        <i class="fa fa-chevron-down"></i>
                                    </span>
                                </div>
                                <div class="sort-content">
                                    <form id="sortForm" action="ProductListMKTServlet" method="post">
                                        <input type="hidden" name="action" value="sort" />
                                        <ul class="sort-list">
                                            <li style="margin-top: 10px">
                                                <input type="radio" name="sortby" value="priceAsc" id="priceAsc" style="display: none;">
                                                <label for="priceAsc">Giá tăng dần</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sortby" value="priceDesc" id="priceDesc" style="display: none;">
                                                <label for="priceDesc">Giá giảm dần</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sortby" value="quantityAsc" id="quantityAsc" style="display: none;">
                                                <label for="quantityAsc">Số lượng đang có tăng dần</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sortby" value="quantityDesc" id="quantityDesc" style="display: none;">
                                                <label for="quantityDesc">Số lượng đang có giảm dần</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sortby" value="quantitySoldAsc" id="quantitySoldAsc" style="display: none;">
                                                <label for="quantitySoldAsc">Số lượng đã bán tăng dần</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sortby" value="quantitySoldDesc" id="quantitySoldDesc" style="display: none;">
                                                <label for="quantitySoldDesc">Số lượng đã bán giảm dần</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sortby" value="starAsc" id="starAsc" style="display: none;">
                                                <label for="starAsc">Số sao tăng dần</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sortby" value="starDesc" id="starDesc" style="display: none;">
                                                <label for="starDesc">Số sao bán giảm dần</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sortby" value="createDateDesc" id="createDateDesc" style="display: none;">
                                                <label for="createDateDesc">Sản phẩm mới nhất</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="sortby" value="createDateAsc" id="createDateAsc" style="display: none;">
                                                <label for="createDateAsc">Sản phẩm cũ nhất</label>
                                            </li>
                                        </ul>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <!-- Add New Product Modal -->
                        <div class="modal fade" id="addProductModal" tabindex="-1" role="dialog" aria-labelledby="addProductModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h3 class="modal-title" id="addProductModalLabel"><b>Thêm sản phẩm mới</b></h3>
                                        <button type="button" class="close btn btn-danger" data-dismiss="modal" aria-label="Close" style="margin-left: 532px;">
                                            <span aria-hidden="true" style="width: 30px; height: 20px">X</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="ManageProductServlet" method="post" enctype="multipart/form-data">
                                            <input type="hidden" name="action" value="addNewProduct">
                                            <div class="form-group">
                                                <label for="productName"><b>Tên sản phẩm:</b></label>
                                                <input type="text" class="form-control" id="productName" name="productName">
                                            </div>
                                            <div class="row">
                                                <div class="col-md-7">
                                                    <div class="form-group">
                                                        <label for="categoryId"><b>Danh mục:</b></label>
                                                        <select class="form-control" id="categoryId" name="categoryId">
                                                            <c:forEach items="${requestScope.categoryList}" var="category">
                                                                <option value="${category.id}">${category.category}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="brandId"><b>Thương hiệu:</b></label>
                                                        <select class="form-control" id="brandId" name="brandId">
                                                            <c:forEach items="${requestScope.brandList}" var="brand">
                                                                <option value="${brand.id}">${brand.brandname}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="roomId"><b>Phòng: </b></label>
                                                        <select class="form-control" id="roomId" name="roomId">
                                                            <c:forEach items="${requestScope.roomList}" var="room">
                                                                <option value="${room.id}">${room.roomname}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="row" style="margin-bottom: 10px">
                                                        <div class="form-group col-md-6">
                                                            <label for="priceProduct"><b>Giá:</b></label>
                                                            <input type="text" class="form-control" id="priceProduct" name="priceProduct">
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label for="quantityProduct"><b>Số lượng:</b></label>
                                                            <input type="text" class="form-control" id="quantityProduct" name="quantityProduct">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="imageProductInput"><b>Ảnh chính:</b></label>
                                                        <input type="file" class="form-control-file" id="imageProductInput" name="imageProduct" accept="image/*" onchange="previewImage(event, 'imageProduct')">
                                                    </div>
                                                </div>
                                                <div class="col-md-5">
                                                    <img id="imageProduct" src="" width="305px" height="305px" style="max-width: 100%; margin-top: 10px;">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="descriptionProduct"><b>Mô tả:</b></label>
                                                <textarea class="form-control" id="descriptionProduct" name="descriptionProduct" rows="4"></textarea>
                                            </div>
                                            <script>
                                                CKEDITOR.replace('descriptionProduct');
                                            </script>
                                            <div class="d-flex" style="justify-content: center; margin-top: 10px">
                                                <button id="submitFormAddNewProduct" type="submit" class="btn btn-primary">Lưu</button>
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
                                        <h3 class="modal-title" id="addProductDetailModalLabel"><b>Thêm chi tiết sản phẩm</b></h3>
                                        <button type="button" class="close btn btn-danger" data-dismiss="modal" aria-label="Close" style="margin-left: 495px">
                                            <span aria-hidden="true" style="width: 30px; height: 20px">X</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="ManageProductServlet" method="post" enctype="multipart/form-data">
                                            <input type="hidden" name="action" value="addNewProductDetail">
                                            <div class="row">
                                                <div class="col-md-6 row">
                                                    <div class="form-group">
                                                        <label for="productDetailName"><b>Sản phẩm:</b></label>
                                                        <select class="form-control" id="productDetailName" name="productId">
                                                            <c:forEach items="${requestScope.productList}" var="product">
                                                                <option value="${product.id}">${product.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label for="colorId"><b>Màu sắc:</b></label>
                                                        <select class="form-control" id="colorId" name="colorId">
                                                            <c:forEach items="${requestScope.colorList}" var="color">
                                                                <option value="${color.id}">${color.colorname}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label for="quantityProductDetail"><b>Số lượng:</b></label>
                                                        <input style="height: 33px" type="text" class="form-control" id="quantityProductDetail" name="quantityProductDetail">
                                                    </div>
                                                    <div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div>
                                                </div>

                                                <div class="col-md-6 row">
                                                    <div class="form-group col-md-6">
                                                        <img id="imagePreview1" src="" width="173px" height="173px" style="max-width: 100%">
                                                        <div style="display: flex; justify-content: center">
                                                            <input type="file" class="form-control-file" id="imageProductDetailInput1" name="imageProductDetail1" accept="image/*" onchange="previewImage(event, 'imagePreview1')" style="width: 80px; margin-top: 10px">
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <img id="imagePreview2" src="" width="173px" height="173px" style="max-width: 100%">
                                                        <div style="display: flex; justify-content: center">
                                                            <input type="file" class="form-control-file" id="imageProductDetailInput2" name="imageProductDetail2" accept="image/*" onchange="previewImage(event, 'imagePreview2')" style="width: 80px; margin-top: 10px">
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <img id="imagePreview3" src="" width="173px" height="173px" style="max-width: 100%">
                                                        <div style="display: flex; justify-content: center">
                                                            <input type="file" class="form-control-file" id="imageProductDetailInput3" name="imageProductDetail3" accept="image/*" onchange="previewImage(event, 'imagePreview3')" style="width: 80px; margin-top: 10px">
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <img id="imagePreview4" src="" width="173px" height="173px"  style="max-width: 100%">
                                                        <div style="display: flex; justify-content: center">
                                                            <input type="file" class="form-control-file" id="imageProductDetailInput4" name="imageProductDetail4" accept="image/*" onchange="previewImage(event, 'imagePreview4')" style="width: 80px; margin-top: 10px">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="d-flex" style="justify-content: center; margin-top: 10px">
                                                <button type="submit" class="btn btn-primary">Lưu</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--Search Form-->
                        <div class="ml-15 mb-15">
                            <form id="searchForm" action="ProductListMKTServlet" method="get">
                                <input type="hidden" name="action" value="search"/>
                                <div class="d-flex button-add">
                                    <input type="text" class="form-control" name="search" placeholder="Tên sản phẩm" style="width: 350px;" />
                                    <button class="btn btn-primary" type="submit">Tìm kiếm</button>
                                </div>
                            </form>
                        </div>

                        <div>
                            <form id="filterForm" action="ProductListMKTServlet" method="post">
                                <input type="hidden" name="action" value="filter" />
                                <div class="ml-15 mb-15 d-flex" style="align-items: center">
                                    <div style="font-weight: 600; font-size: 16px; text-transform: uppercase;">
                                        <span class="icon_title"><i class="fa fa-filter"></i></span>
                                        <span>Bộ Lọc</span>
                                    </div>
                                    <div class="dropdown" style="margin-left: 15px; width: 160px">
                                        <div class="dropbtn">
                                            Danh mục
                                            <span><i class="fa fa-chevron-down"></i></span>
                                        </div>
                                        <ul class="dropdown-content">
                                            <c:forEach items="${requestScope.categoryList}" var="category">
                                                <li>
                                                    <input type="checkbox" value="${category.id}" name="category-filter" data-category="${category.category}"
                                                           <c:if test="${not empty selectedCategoryList and selectedCategoryList.contains(category.id)}">checked</c:if>
                                                           /> <span>${category.category}</span>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <div class="dropdown">
                                        <div class="dropbtn">
                                            Thương hiệu
                                            <span><i class="fa fa-chevron-down"></i></span>
                                        </div>
                                        <ul class="dropdown-content">
                                            <c:forEach items="${requestScope.brandList}" var="brand">
                                                <li>
                                                    <input type="checkbox" value="${brand.id}" name="brand-filter" data-brand="${brand.brandname}"
                                                           <c:if test="${not empty selectedBrandList and selectedBrandList.contains(brand.id)}">checked</c:if>
                                                           /> <span>${brand.brandname}</span>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <div class="dropdown" style="width: 170px">
                                        <div class="dropbtn">
                                            Phòng
                                            <span><i class="fa fa-chevron-down"></i></span>
                                        </div>
                                        <ul class="dropdown-content">
                                            <c:forEach items="${requestScope.roomList}" var="room">
                                                <li>
                                                    <input type="checkbox" value="${room.id}" name="room-filter" data-room="${room.roomname}"
                                                           <c:if test="${not empty selectedRoomList and selectedRoomList.contains(room.id)}">checked</c:if>
                                                           /><span> ${room.roomname}</span>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <div class="dropdown" style="width: 200px ">
                                        <div class="dropbtn">
                                            Giá
                                            <span><i class="fa fa-chevron-down"></i></span>
                                        </div>
                                        <ul class="dropdown-content">
                                            <li>
                                                <input type="checkbox" name="price-filter" value="<500" data-price="< 500.000₫"
                                                       <c:if test="${not empty selectedPriceList and selectedPriceList.contains('<500')}">checked</c:if>
                                                           style="display: inline-block" /><span> < 500.000₫</span>
                                                </li>
                                                <li>
                                                    <input type="checkbox" name="price-filter" value="500<x<1500" data-price="500,000₫ - 1,500,000₫"
                                                    <c:if test="${not empty selectedPriceList and selectedPriceList.contains('500<x<1500')}">checked</c:if>
                                                        style="display: inline-block" /><span> 500,000₫ - 1,500,000₫</span>
                                                </li>
                                                <li>
                                                    <input type="checkbox" name="price-filter" value="1500<x<5000" data-price="1,500,000₫ - 5,000,000₫"
                                                    <c:if test="${not empty selectedPriceList and selectedPriceList.contains('1500<x<5000')}">checked</c:if>
                                                        style="display: inline-block" /><span> 1,500,000₫ - 5,000,000₫</span>
                                                </li>
                                                <li>
                                                    <input type="checkbox" name="price-filter" value=">5000" data-price="> 5,000,000₫"
                                                    <c:if test="${not empty selectedPriceList and selectedPriceList.contains('>5000')}">checked</c:if>
                                                        style="display: inline-block" /><span> > 5,000,000₫</span>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="dropdown">
                                            <div class="dropbtn">
                                                Trạng thái
                                                <span><i class="fa fa-chevron-down"></i></span>
                                            </div>
                                            <ul class="dropdown-content">
                                                <li>
                                                    <input type="checkbox" value="Active" data-status="Active" name="status-filter" /><span> Active</span>
                                                </li>
                                                <li>
                                                    <input type="checkbox" value="Inactive" data-status="Inactive" name="status-filter" /><span> Inactive</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>            
                                </form>
                                <div class="group_filter_tags" style="margin-top: 10px; padding-bottom: 20px; display: flex">
                                    <div class="filter_tags ">			
                                        Danh mục:<b id="category-tag"></b>		
                                        <span class="filter_tags_remove" style="margin-left: 5px" data-filter="category"><i class="fa fa-times"></i></span>

                                    </div>
                                    <div class="filter_tags ">			
                                        Thương hiệu: <b id="brand-tag"></b>		
                                        <span class="filter_tags_remove" data-filter="brand"><i class="fa fa-times"></i></span>
                                    </div>
                                    <div class="filter_tags ">
                                        Phòng: <b id="room-tag"></b>
                                        <span class="filter_tags_remove" data-filter="room"><i class="fa fa-times"></i></span>
                                    </div>

                                    <div class="filter_tags ">
                                        Giá sản phẩm: <b id="price-tag"></b>
                                        <span class="filter_tags_remove" data-filter="price"><i class="fa fa-times"></i></svg>
                                        </span>
                                    </div>
                                    <div class="filter_tags ">
                                        Trạng thái: <b id="status-tag"></b>
                                        <span class="filter_tags_remove" data-filter="status"><i class="fa fa-times"></i></span>
                                    </div>
                                    <div class="filter_tags filter_tags_remove_all opened"><span><a href="ProductListMKTServlet">Xóa hết</a></span></div>
                                </div> 
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
                                                        <h6 class="text-sm text-medium">Ảnh</h6>
                                                    </th>
                                                    <th>
                                                        <h6 class="text-sm text-medium">Sản phẩm</h6>
                                                    </th>
                                                    <th class="min-width">
                                                        <h6 class="text-sm text-medium">Điểm đánh giá</h6>
                                                    </th>
                                                    <th class="min-width">
                                                        <h6 class="text-sm text-medium">Giá</h6>
                                                    </th>
                                                    <th class="min-width">
                                                        <h6 class="text-sm text-medium">Giảm giá</h6>
                                                    </th>
                                                    <th>
                                                        <h6 class="text-sm text-medium">SL đã bán</h6>
                                                    </th>
                                                    <th class="min-width">
                                                        <h6 class="text-sm text-medium">SL đang có</h6>
                                                    </th>
                                                    <th class="min-width">
                                                        <h6 class="text-sm text-medium">Trạng thái</h6>
                                                    </th>
                                                    <th class="min-width">
                                                        <h6 class="text-sm text-medium">Hành động</h6>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody id="product-container">
                                            <c:forEach items="${requestScope.productList}" var="product">
                                                <tr>
                                                    <td>
                                                        <div><p class="text-sm">${product.id}</p></div>
                                                    </td>
                                                    <td>
                                                        <div class="image"><img src="image/product/${product.image}" alt="${product.name}"></div>
                                                    </td>
                                                    <td>
                                                        <div class="text-sm"><p class="text-sm">${product.name}</p></div>
                                                    </td>
                                                    <td>
                                                        <p class="text-sm">
                                                        <div>${product.staravg} <span class="star" style="color: yellow">&#9733;</span> </div>
                                                        <div>(${product.numberFeedback}) vote</div>
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${product.saleOff > 0}">
                                                                <span class="text-danger">
                                                                    <fmt:formatNumber value="${product.salePrice}" type="number" minFractionDigits="0" maxFractionDigits="0" groupingUsed="true" />₫
                                                                </span>
                                                                <del>
                                                                    <fmt:formatNumber value="${product.price}" type="number" minFractionDigits="0" maxFractionDigits="0" groupingUsed="true" />₫
                                                                </del>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span>
                                                                    <fmt:formatNumber value="${product.price}" type="number" minFractionDigits="0" maxFractionDigits="0" groupingUsed="true" />₫
                                                                </span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <p class="text-sm text-danger">${product.saleOff}</p>
                                                    </td>
                                                    <td>
                                                        <p class="text-sm">${product.quantitySold}</p>
                                                    </td>
                                                    <td>
                                                        <p class="text-sm">${product.quantity}</p></td>
                                                    <td>
                                                        <p class="text-sm">${product.status}</p>
                                                    </td>
                                                    <td class="actions"><p><a href="ManageProductServlet?productID=${product.id}" title="View"><i class="fas fa-eye"></i></a></p>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="sortpagibar pagi clearfix text-center" style="margin-top: 15px">
                            <div id="pagination" class="clearfix">

                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <form id="paginationForm" action="ProductListMKTServlet" method="post">
                                        <input type="hidden" name="action" value="pagination">
                                        <div id="page-pagination">
                                            <c:forEach var="page" items="${pagenumber}">
                                                <input type="radio" name="page" id="page${page}" value="${page}" style="display: none;">
                                                <label for="page${page}" style="width: 25px; border: groove;" class="page-node" aria-label="Trang ${page}" onclick="submitFormWithPage(${page})">${page}</label>
                                            </c:forEach>
                                            <span class="page-node">&hellip;</span>
                                        </div>
                                    </form>

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
    <script>

        document.addEventListener('DOMContentLoaded', function () {
            function updateTags(inputSelector, tagId, filterClass) {
                const inputs = document.querySelectorAll(inputSelector);
                const tagElement = document.getElementById(tagId);
                const filterTagDiv = tagElement.closest('.filter_tags');
                const selectedItems = [];

                inputs.forEach(input => {
                    if (input.checked) {
                        selectedItems.push(input.getAttribute('data-category') || input.getAttribute('data-brand') || input.getAttribute('data-room') || input.getAttribute('data-price') || input.getAttribute('data-status'));
                    }
                });

                tagElement.textContent = selectedItems.join(', ');

                if (tagElement.textContent.trim() !== '') {
                    filterTagDiv.classList.add('opened');
                } else {
                    filterTagDiv.classList.remove('opened');
                }
                updateRemoveAllTag();
            }

            function updateRemoveAllTag() {
                const removeAllTag = document.querySelector('.filter_tags_remove_all');
                const filterTags = document.querySelectorAll('.filter_tags b');
                let anyTagNotEmpty = false;

                filterTags.forEach(tag => {
                    if (tag.textContent.trim() !== '') {
                        anyTagNotEmpty = true;
                    }
                });

                if (anyTagNotEmpty) {
                    removeAllTag.classList.add('opened');
                } else {
                    removeAllTag.classList.remove('opened');
                }
            }

            async function clearFilter(inputSelector, tagId) {
                const inputs = document.querySelectorAll(inputSelector);
                const tagElement = document.getElementById(tagId);

                inputs.forEach(input => {
                    input.checked = false;
                });

                tagElement.textContent = '';
                const filterTagDiv = tagElement.closest('.filter_tags');
                filterTagDiv.classList.remove('opened');

                updateRemoveAllTag();
                try {
                    // Gửi form với AJAX và chờ cho nó hoàn tất
                    await submitFormWithAjax('#filterForm');
                    // Gọi ReloadPagination sau khi submitFormWithAjax hoàn tất
                    ReloadPagination();
                } catch (error) {
                    console.error("An error occurred while clearing filters:", error);
                }
            }


            function submitFormWithAjax(formSelector) {
                var form = $(formSelector)[0]; // Lấy form theo selector

                return new Promise((resolve, reject) => {
                    $.ajax({
                        type: form.getAttribute("method"),
                        url: form.getAttribute("action"),
                        data: $(form).serialize(),
                        dataType: 'json', // Đảm bảo dữ liệu trả về là JSON
                        success: function (response) {
                            console.log(response); // Kiểm tra dữ liệu trả về từ server
                            displayProducts(response); // Hiển thị sản phẩm
                            resolve(); // Hoàn tất Promise
                        },
                        error: function (xhr, status, error) {
                            console.error("Error: " + error);
                            reject(error); // Từ chối Promise
                        }
                    });
                });
            }

            // Add click event listeners to each filter tag remove button
            document.querySelectorAll('.filter_tags_remove').forEach(button => {
                button.addEventListener('click', function () {
                    const filterType = this.dataset.filter;
                    switch (filterType) {
                        case 'category':
                            clearFilter('input[name="category-filter"]', 'category-tag');
                            break;
                        case 'brand':
                            clearFilter('input[name="brand-filter"]', 'brand-tag');
                            break;
                        case 'room':
                            clearFilter('input[name="room-filter"]', 'room-tag');
                            break;
                        case 'price':
                            clearFilter('input[name="price-filter"]', 'price-tag');
                            break;
                        case 'status':
                            clearFilter('input[name="status-filter"]', 'status-tag');
                            break;
                    }
                });
            });

            // Update category tag
            document.querySelectorAll('input[name="category-filter"]').forEach(input => {
                input.addEventListener('change', () => {
                    updateTags('input[name="category-filter"]', 'category-tag', 'category-filter');
                });
            });

            // Update brand tag
            document.querySelectorAll('input[name="brand-filter"]').forEach(input => {
                input.addEventListener('change', () => {
                    updateTags('input[name="brand-filter"]', 'brand-tag', 'brand-filter');
                });
            });

            // Update room tag
            document.querySelectorAll('input[name="room-filter"]').forEach(input => {
                input.addEventListener('change', () => {
                    updateTags('input[name="room-filter"]', 'room-tag', 'room-filter');
                });
            });

            // Update price tag
            document.querySelectorAll('input[name="price-filter"]').forEach(input => {
                input.addEventListener('change', () => {
                    updateTags('input[name="price-filter"]', 'price-tag', 'price-filter');
                });
            });

            // Update status tag
            document.querySelectorAll('input[name="status-filter"]').forEach(input => {
                input.addEventListener('change', () => {
                    updateTags('input[name="status-filter"]', 'status-tag', 'status-filter');
                });
            });

            // Initial update to set the state based on pre-selected filters
            updateTags('input[name="category-filter"]', 'category-tag', 'category-filter');
            updateTags('input[name="brand-filter"]', 'brand-tag', 'brand-filter');
            updateTags('input[name="room-filter"]', 'room-tag', 'room-filter');
            updateTags('input[name="price-filter"]', 'price-tag', 'price-filter');
            updateTags('input[name="status-filter"]', 'status-tag', 'status-filter');

            function renderPagination(pages) {
                var paginationHtml = '';
                pages.forEach(function (page) {
                    paginationHtml += `
            <input type="radio" name="page" id="page` + page + `" value="` + page + `" style="display: none;">
            <label for="page` + page + `" 
                   style="width: 25px; border: groove;" 
                   class="page-node" 
                   aria-label="Trang ` + page + `" 
                   onclick="submitFormWithPage(` + page + `)">
                   ` + page + `
            </label>
        `;
                });
                paginationHtml += '<span class="page-node">&hellip;</span>';
                return paginationHtml;
            }


            function ReloadPagination() {
                const container = document.getElementById('page-pagination');
                container.innerHTML = ''; // Làm rỗng nội dung hiện tại của container

                $.ajax({
                    type: "POST",
                    url: "ProductListMKTServlet",
                    data: {action: "reloadPagination"}, // Thêm biến action vào dữ liệu gửi đi
                    dataType: 'json', // Đảm bảo dữ liệu trả về là JSON
                    success: function (response) {
                        try {
                            if (Array.isArray(response)) {
                                console.log(response);
                                // Gọi hàm renderPagination và cập nhật nội dung container
                                container.innerHTML = renderPagination(response);
                            } else {
                                console.error("Unexpected response format:", response);
                            }
                        } catch (e) {
                            console.error("Error processing JSON response:", e);
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("Error: " + error);
                    }
                });
            }
        });

    </script>
    <script>
        function formatCurrency(number) {
            return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND', minimumFractionDigits: 0}).format(number).replace('₫', '') + '₫';
        }

// Định nghĩa hàm displayProducts trước khi sử dụng
        function displayProducts(products) {
            const container = document.getElementById('product-container');
            container.innerHTML = ''; // Xóa nội dung hiện có

            products.forEach(function (product) {
                // Tạo HTML cho sản phẩm
                let priceHTML;
                if (product.saleOff > 0) {
                    priceHTML = '<span class="text-danger">' + formatCurrency(product.salePrice) + '</span>' +
                            '<del>' + formatCurrency(product.price) + '</del>';
                } else {
                    priceHTML = '<span>' + formatCurrency(product.price) + '</span>';
                }

                const productHTML =
                        '<tr>' +
                        '<td>' +
                        '<div><p class="text-sm">' + product.id + '</p></div>' +
                        '</td>' +
                        '<td>' +
                        '<div class="image"><img src="image/product/' + product.image + '" alt="' + product.name + '"></div>' +
                        '</td>' +
                        '<td>' +
                        '<div class="text-sm"><p class="text-sm">' + product.name + '</p></div>' +
                        '</td>' +
                        '<td>' +
                        '<p class="text-sm">' +
                        '<div>' + product.staravg + ' <span class="star" style="color: yellow">&#9733;</span></div>' +
                        '<div>(' + product.numberFeedback + ') vote</div>' +
                        '</p>' +
                        '</td>' +
                        '<td>' +
                        '<p class="text-sm">' + priceHTML + '</p>' +
                        '</td>' +
                        '<td>' +
                        '<p class="text-sm text-danger">' + product.saleOff + '%</p>' +
                        '</td>' +
                        '<td>' +
                        '<p class="text-sm">' + product.quantitySold + '</p>' +
                        '</td>' +
                        '<td>' +
                        '<p class="text-sm">' + product.quantity + '</p>' +
                        '</td>' +
                        '<td>' +
                        '<p class="text-sm">Active</p>' +
                        '</td>' +
                        '<td class="actions">' +
                        '<p><a href="ManageProductServlet?productID=' + product.id + '" title="View"><i class="fas fa-eye"></i></a></p>' +
                        '</td>' +
                        '</tr>';

                // Thêm HTML sản phẩm vào container
                container.innerHTML += productHTML;
            });
        }

// Định nghĩa sự kiện khi tài liệu đã sẵn sàng
        $(document).ready(function () {
            // Bắt sự kiện khi người dùng thay đổi radio button
            $('input[type="radio"][name="sortby"]').change(function () {
                // Tự động submit form bằng AJAX
                submitFormWithAjax('#sortForm');
            });

            // Bắt sự kiện khi người dùng thay đổi checkbox trong form
            $('#filterForm input[type="checkbox"]').change(async function () {
                try {
                    // Tự động submit form bằng AJAX và chờ cho nó hoàn tất
                    await submitFormWithAjax('#filterForm');
                    // Gọi ReloadPagination sau khi submitFormWithAjax hoàn tất
                    ReloadPagination();
                } catch (error) {
                    console.error("An error occurred:", error);
                }
            });

            // Hàm để gửi yêu cầu AJAX
            function submitFormWithAjax(formSelector) {
                var form = $(formSelector)[0]; // Lấy form theo selector

                return new Promise((resolve, reject) => {
                    $.ajax({
                        type: form.getAttribute("method"),
                        url: form.getAttribute("action"),
                        data: $(form).serialize(),
                        dataType: 'json', // Đảm bảo dữ liệu trả về là JSON
                        success: function (response) {
                            console.log(response); // Kiểm tra dữ liệu trả về từ server
                            displayProducts(response); // Hiển thị sản phẩm
                            resolve(); // Hoàn tất Promise
                        },
                        error: function (xhr, status, error) {
                            console.error("Error: " + error);
                            reject(error); // Từ chối Promise
                        }
                    });
                });
            }

            function renderPagination(pages) {
                var paginationHtml = '';
                pages.forEach(function (page) {
                    paginationHtml += `
            <input type="radio" name="page" id="page` + page + `" value="` + page + `" style="display: none;">
            <label for="page` + page + `" 
                   style="width: 25px; border: groove;" 
                   class="page-node" 
                   aria-label="Trang ` + page + `" 
                   onclick="submitFormWithPage(` + page + `)">
                   ` + page + `
            </label>
        `;
                });
                paginationHtml += '<span class="page-node">&hellip;</span>';
                return paginationHtml;
            }


            function ReloadPagination() {
                const container = document.getElementById('page-pagination');
                container.innerHTML = ''; // Làm rỗng nội dung hiện tại của container

                $.ajax({
                    type: "POST",
                    url: "ProductListMKTServlet",
                    data: {action: "reloadPagination"}, // Thêm biến action vào dữ liệu gửi đi
                    dataType: 'json', // Đảm bảo dữ liệu trả về là JSON
                    success: function (response) {
                        try {
                            if (Array.isArray(response)) {
                                console.log(response);
                                // Gọi hàm renderPagination và cập nhật nội dung container
                                container.innerHTML = renderPagination(response);
                            } else {
                                console.error("Unexpected response format:", response);
                            }
                        } catch (e) {
                            console.error("Error processing JSON response:", e);
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error("Error: " + error);
                    }
                });
            }

        });

        $(document).ready(function () {
            // Hàm để xử lý sự kiện onclick và gửi yêu cầu AJAX
            window.submitFormWithPage = function (pageValue) {
                $("input[name='page'][value='" + pageValue + "']").prop('checked', true);
                console.log(pageValue);
                submitFormWithAjax();
            };

            function submitFormWithAjax() {
                var form = $('#paginationForm')[0]; // Lấy form theo id
                console.log($(form).serialize());
                $.ajax({
                    type: form.getAttribute("method"),
                    url: form.getAttribute("action"),
                    data: $(form).serialize(),
                    dataType: 'json',
                    success: function (response) {
                        console.log(response); // Kiểm tra dữ liệu trả về từ server
                        displayProducts(response); // Hiển thị sản phẩm
                    },
                    error: function (xhr, status, error) {
                        console.error("Error: " + error);
                    }
                });
            }

        });

    </script>
</body>
</html>
