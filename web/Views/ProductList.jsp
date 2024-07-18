<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="//theme.hstatic.net/200000065946/1001187274/14/favicon.png?v=582"
              type="image/png" />
        <title>Tất Cả Sản Phẩm Đồ Gỗ Nội Thất Của MOHO</title>
        <meta name="description"
              content="Nội Thất MOHO an toàn sức khỏe, chất lượng quốc tế với nhiều đồ gỗ nội thất hiện đại cho phòng khách, phòng ăn, phòng ngủ, phòng làm việc, văn phòng và tủ bếp." />
        <link rel="preload stylesheet" as="style" fetchpriority="low"
              href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
        <link rel="preload stylesheet" as="style" fetchpriority="low"
              href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />

        <link rel="preload stylesheet" as="style" fetchpriority="low" href="css/style-theme.scss.css">
        <link rel="stylesheet" href="css/style.css">
        <!--+++++++++++++++++++++++++  JS ++++++++++++++++++++++++-->
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
            <script defer fetchpriority="low" src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"></script>

            <script defer fetchpriority="low" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


        <style>
            img {
                max-width: 100%;
                height: auto;
            }

            .w-100 {
                width: 100% !important;
            }

            .d-flex-owl {
                display: flex !important;
                overflow: hidden !important;
            }

            .d-flex-owl>* {
                min-width: 100% !important;
            }

            .rating {
                position: relative;
                display: inline-block;
                font-size: 24px;
                line-height: 1;
            }

            .rating::before {
                content: "★★★★★";
                color: #e3e3e3;
                /* Màu của sao không được đánh giá */
            }

            .rating::after {
                content: "★★★★★";
                color: #ffc107;
                /* Màu của sao được đánh giá */
                position: absolute;
                top: 0;
                left: 0;
                white-space: nowrap;
                overflow: hidden;
                width: 0;
            }

            .num-reviews {
                font-size: 14px;
                /* Kích thước chữ của số lượng đánh giá */
                color: #333;
                /* Màu chữ của số lượng đánh giá */
            }


            .product-addtocart {
                display: inline-block;
                margin-left: 50px;
            }

            .cart-button {
                background-color: orange;
                /* Màu cam */
                padding: 10px 15px;
                border-radius: 5px;
                text-decoration: none;
                color: white;
                display: flex;
                align-items: center;
            }

            .cart-button:hover {
                background-color: darkorange;
                /* Màu cam khi di chuột vào */
            }

            .cart-button svg {
                margin-right: 5px;
            }

            .product-quantity{
                display: flex;
                justify-content: space-evenly;
                align-items: center;
            }

        </style>

        <style>
            .color-checkbox {
                display: inline-block;
                cursor: pointer;
                margin: 5px;
            }

            .color-circle {
                width: 20px;
                height: 20px;
                border-radius: 50%;
                display: inline-block;
                border: 2px solid #ddd;
                box-sizing: border-box;
            }

            .color-checkbox input[type="checkbox"]:checked + .color-circle {
                border: 2px solid #000;
            }

            .check-box-list li input[type="radio"]:checked + label {
                background-color: #007bff;
                color: #fff;
                border: 1px solid #0056b3;
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
                font-weight: bold;
            }

            .check-box-list li label:hover {
                background-color: #e0e0e0;
            }
        </style>
    </head>

    <body id="nội-thất-moho" class="collection">
        <div class="main-body  layoutProduct_scroll ">
            <%@ include file="HomeHeader.jsp" %>
            <style>
                .dangongu {
                    display: none
                }
            </style>

            <main class="mainContent-theme">
                <div class="breadcrumb-shop">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pd5  ">
                                <ol class="breadcrumb breadcrumb-arrows" itemscope
                                    itemtype="http://schema.org/BreadcrumbList">
                                    <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                                        <a href="/" target="_self" itemprop="item" content="https://moho.com.vn"><span
                                                itemprop="name">Trang chủ</span></a>
                                        <meta itemprop="position" content="1" />
                                    </li>

                                    <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
                                        <a href="https://moho.com.vn/collections/all" target="_self">
                                            <span itemprop="item" content="https://moho.com.vn/collections/all"><span
                                                    itemprop="name">Danh mục</span></span>
                                        </a>
                                        <meta itemprop="position" content="2" />
                                    </li>


                                    <li class="active" itemprop="itemListElement" itemscope
                                        itemtype="http://schema.org/ListItem">
                                        <span itemprop="item"
                                              content="https://moho.com.vn/collections/tat-ca-san-pham-moho"><span
                                                itemprop="name">Tất cả sản phẩm Furniture</span></span>
                                        <meta itemprop="position" content="3" />
                                    </li>



                                </ol>
                            </div>
                        </div>

                    </div>
                </div>

                <div id="collection" class="collection-page">
                    <div class="main-content">

                        <div class=" banner-collection-header text-center">

                            <img loading="eager" fetchpriority="high" decoding="sync" width="1920" height="450"
                                 srcset="//file.hstatic.net/200000065946/collection/banner_web_1920x450-0410__1__6f2_c39476d703c04384bf6b292d1aef8d19_large.jpg 480w, //file.hstatic.net/200000065946/collection/banner_web_1920x450-0410__1__6f2_c39476d703c04384bf6b292d1aef8d19_2048x2048.jpg"
                                 alt="Tất cả sản phẩm MOHO" />

                        </div>

                        <div class="container">
                            <div class="row">
                                <div id="collection-body" class="wrap-collection-body clearfix">
                                    <div class="wrapper_layered_filter">
                                        <div class="wrap-filter">
                                            <div class="box_sidebar">
                                                <div class="layered">
                                                    <div class="layer_filter-container">
                                                        <div class="container">
                                                            <div class="wrap-collection-title">
                                                                <div class="heading-collection row">
                                                                    <div class="col-md-10 col-sm-12 col-xs-12">
                                                                        <h1 class="title">
                                                                            Tất cả sản phẩm Furniture
                                                                        </h1>
                                                                        <div class="alert-no-filter"></div>
                                                                    </div>
                                                                    <div class="layer_filter-group col-md-2">
                                                                        <div class="clearfix">
                                                                            <div class="group-filter">
                                                                                <div class="filter_group_title dropdown-filter">
                                                                                    <span>Sắp xếp</span>
                                                                                    <span class="icon-controls">
                                                                                        <i class="fa fa-chevron-down"></i>
                                                                                    </span>
                                                                                </div>
                                                                                <div class="filter_group_content filter-size s-filter">   
                                                                                    <form id="sortForm" action="ProductServlet" method="post">
                                                                                        <input type="hidden" name="action" value="sort" />
                                                                                        <ul class="check-box-list clearfix">
                                                                                            <li style="margin-bottom: 5px;">
                                                                                                <input type="radio" name="sortby" value="priceAsc" id="priceAsc" style="display: none;">
                                                                                                <label for="priceAsc" style="width: 170px; border: none; font-size: 14px; text-align: start">Giá tăng dần</label>
                                                                                            </li>
                                                                                            <li style="margin-bottom: 5px;">
                                                                                                <input type="radio" name="sortby" value="priceDesc" id="priceDesc" style="display: none;">
                                                                                                <label for="priceDesc" style="width: 170px; border: none; font-size: 14px; text-align: start">Giá giảm dần</label>
                                                                                            </li>
                                                                                            <li style="margin-bottom: 5px;">
                                                                                                <input type="radio" name="sortby" value="starAsc" id="starAsc" style="display: none;">
                                                                                                <label for="starAsc" style="width: 170px; border: none; font-size: 14px; text-align: start">Số sao tăng dần</label>
                                                                                            </li>
                                                                                            <li style="margin-bottom: 5px;">
                                                                                                <input type="radio" name="sortby" value="starDesc" id="starDesc" style="display: none;">
                                                                                                <label for="starDesc" style="width: 170px; border: none; font-size: 14px; text-align: start">Số sao giảm dần</label>
                                                                                            </li>
                                                                                        </ul>
                                                                                    </form>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="wrapper_layered_filter">
                                                <div class="wrap-filter">
                                                    <div class="box_sidebar">
                                                        <div class="layered">
                                                            <form id="filterForm" action="ProductServlet" method="post">
                                                                <input type="hidden" name="action" value="filter" />
                                                                <div class="layer_filter-container">
                                                                    <div class="layer_filter-title hidden-xs hidden-sm">
                                                                        <div class="title_filter">
                                                                            <span class="icon_title"><svg viewBox="0 0 20 20" style="margin-bottom: 20px;">
                                                                                <path fill="none" stroke-width="2"
                                                                                      stroke-linejoin="round"
                                                                                      stroke-miterlimit="10"
                                                                                      d="M12 9v8l-4-4V9L2 3h16z"></path>
                                                                                </svg>
                                                                            </span>
                                                                            <span>Bộ Lọc</span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="layer_filter-group">
                                                                        <div class="row clearfix">

                                                                            <!-- ./filter brand -->
                                                                            <div class="col-md-2">
                                                                                <div class="group-filter">
                                                                                    <div
                                                                                        class="filter_group_title dropdown-filter">
                                                                                        <span>Thương hiệu</span><span
                                                                                            class="icon-controls"><i
                                                                                                class="fa fa-chevron-down"></i></span>
                                                                                    </div>
                                                                                    <div class="filter_group_content filter-size s-filter">
                                                                                        <ul class="check-box-list clearfix">
                                                                                            <c:forEach items="${requestScope.brandList}" var="brand">
                                                                                                <li style="margin-right: 40px">
                                                                                                    <div>
                                                                                                        <input type="checkbox" value="${brand.id}" data-brand="${brand.brandname}" name="brand-filter" 
                                                                                                               <c:if test="${not empty selectedBrandList and selectedBrandList.contains(brand.id)}">checked</c:if>
                                                                                                               style="display: inline-block"/> ${brand.brandname}
                                                                                                    </div>

                                                                                                </li>
                                                                                            </c:forEach>
                                                                                        </ul>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-2">
                                                                                <div class="group-filter">
                                                                                    <div
                                                                                        class="filter_group_title dropdown-filter">
                                                                                        <span>Phòng</span><span
                                                                                            class="icon-controls"><i
                                                                                                class="fa fa-chevron-down"></i></span>
                                                                                    </div>
                                                                                    <div
                                                                                        class="filter_group_content filter-size s-filter">
                                                                                        <ul class="check-box-list clearfix">
                                                                                            <c:forEach items="${requestScope.roomList}" var="room">
                                                                                                <li>
                                                                                                    <input type="checkbox" value="${room.id}" data-room="${room.roomname}" name="room-filter"
                                                                                                           <c:if test="${not empty selectedRoomList and selectedRoomList.contains(room.id)}">checked</c:if>
                                                                                                           style="display: inline-block" /> ${room.roomname}
                                                                                                </li>
                                                                                            </c:forEach>
                                                                                        </ul>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-2 ">
                                                                                <div class="group-filter">
                                                                                    <div
                                                                                        class="filter_group_title dropdown-filter">
                                                                                        <span>DANH MỤC</span>
                                                                                        <span class="icon-controls"><i
                                                                                                class="fa fa-chevron-down"></i></span>
                                                                                    </div>
                                                                                    <div
                                                                                        class="filter_group_content filter-size s-filter">
                                                                                        <ul class="check-box-list clearfix">
                                                                                            <c:forEach items="${requestScope.categoryList}" var="category">
                                                                                                <li style="margin-right: 30px">
                                                                                                    <input type="checkbox" value="${category.id}" data-category="${category.category}" name="category-filter"
                                                                                                           <c:if test="${not empty selectedCategoryList and selectedCategoryList.contains(category.id)}">checked</c:if>
                                                                                                           style="display: inline-block" /> ${category.category}
                                                                                                </li>
                                                                                            </c:forEach>
                                                                                        </ul>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <!-- ./filter price -->

                                                                            <div class="col-md-3 ">
                                                                                <div class="group-filter">
                                                                                    <div
                                                                                        class="filter_group_title dropdown-filter">
                                                                                        <span>Giá sản phẩm</span><span
                                                                                            class="icon-controls"><i
                                                                                                class="fa fa-chevron-down"></i></span>
                                                                                    </div>
                                                                                    <div class="filter_group_content filter-size s-filter">
                                                                                        <ul class="check-box-list clearfix">
                                                                                            <li style="margin-right: 15px">
                                                                                                <input type="checkbox" name="price-filter" data-price="< 500.000₫" value="<500"
                                                                                                       <c:if test="${not empty selectedPriceList and selectedPriceList.contains('<500')}">checked</c:if>
                                                                                                           style="display: inline-block" /> < 500.000₫
                                                                                                </li>
                                                                                                <li style="margin-right: 15px">
                                                                                                    <input type="checkbox" name="price-filter" data-price="500,000₫ - 1,500,000₫" value="500<x<1500"
                                                                                                    <c:if test="${not empty selectedPriceList and selectedPriceList.contains('500<x<1500')}">checked</c:if>
                                                                                                        style="display: inline-block" /> 500,000₫ - 1,500,000₫
                                                                                                </li>
                                                                                                <li style="margin-right: 15px">
                                                                                                    <input type="checkbox" name="price-filter" data-price="1,500,000₫ - 5,000,000₫" value="1500<x<5000"
                                                                                                    <c:if test="${not empty selectedPriceList and selectedPriceList.contains('1500<x<5000')}">checked</c:if>
                                                                                                        style="display: inline-block" /> 1,500,000₫ - 5,000,000₫
                                                                                                </li>
                                                                                                <li style="margin-right: 15px">
                                                                                                    <input type="checkbox" name="price-filter" data-price="> 5,000,000₫" value=">5000"
                                                                                                    <c:if test="${not empty selectedPriceList and selectedPriceList.contains('>5000')}">checked</c:if>
                                                                                                        style="display: inline-block" /> > 5,000,000₫
                                                                                                </li>
                                                                                            </ul>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <!-- ./filter color -->

                                                                                <div class="col-md-2 ">
                                                                                    <div class="group-filter">
                                                                                        <div
                                                                                            class="filter_group_title dropdown-filter">
                                                                                            <span>Màu sắc</span><span
                                                                                                class="icon-controls"><i
                                                                                                    class="fa fa-chevron-down"></i>
                                                                                            </span>
                                                                                        </div>
                                                                                        <div
                                                                                            class="filter_group_content color-filter">
                                                                                            <ul class="check-box-list clearfix">
                                                                                            <c:forEach items="${requestScope.colorList}" var="color">
                                                                                                <li style="margin-right: 5px">
                                                                                                    <label class="color-checkbox">
                                                                                                        <input type="checkbox" value="${color.id}" data-color="${color.colorname}" name="color-filter"
                                                                                                               <c:if test="${not empty selectedColorList and selectedColorList.contains(color.id)}">checked</c:if>
                                                                                                                   style="display: none;" />
                                                                                                               <span class="color-circle" style="background-color:${color.colorcode};"></span>
                                                                                                    </label>${color.colorname}
                                                                                                </li>
                                                                                            </c:forEach>
                                                                                        </ul>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </form>
                                                            <div class="group_filter_tags">
                                                                <div class="filter_tags">			
                                                                    Thương hiệu: <b id="brand-tag"></b>		
                                                                    <span class="filter_tags_remove d-flex" data-filter="brand"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 50 50" xml:space="preserve">
                                                                        <path fill="#333" d="M9.016 40.837a1.001 1.001 0 0 0 1.415-.001l14.292-14.309 14.292 14.309a1 1 0 1 0 1.416-1.413L26.153 25.129 40.43 10.836a1 1 0 1 0-1.415-1.413L24.722 23.732 10.43 9.423a1 1 0 1 0-1.415 1.413l14.276 14.293L9.015 39.423a1 1 0 0 0 .001 1.414z"></path>
                                                                        </svg></span>
                                                                </div>
                                                                <div class="filter_tags">
                                                                    Phòng: <b id="room-tag"></b>
                                                                    <span class="filter_tags_remove d-flex" data-filter="room">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 50 50" xml:space="preserve">
                                                                        <path fill="#333" d="M9.016 40.837a1.001 1.001 0 0 0 1.415-.001l14.292-14.309 14.292 14.309a1 1 0 1 0 1.416-1.413L26.153 25.129 40.43 10.836a1 1 0 1 0-1.415-1.413L24.722 23.732 10.43 9.423a1 1 0 1 0-1.415 1.413l14.276 14.293L9.015 39.423a1 1 0 0 0 .001 1.414z"></path>
                                                                        </svg>
                                                                    </span>
                                                                </div>
                                                                <div class="filter_tags">			
                                                                    Danh mục: <b id="category-tag"></b>		
                                                                    <span class="filter_tags_remove d-flex" data-filter="category">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 50 50" xml:space="preserve">
                                                                        <path fill="#333" d="M9.016 40.837a1.001 1.001 0 0 0 1.415-.001l14.292-14.309 14.292 14.309a1 1 0 1 0 1.416-1.413L26.153 25.129 40.43 10.836a1 1 0 1 0-1.415-1.413L24.722 23.732 10.43 9.423a1 1 0 1 0-1.415 1.413l14.276 14.293L9.015 39.423a1 1 0 0 0 .001 1.414z"></path>
                                                                        </svg>
                                                                    </span>
                                                                </div>
                                                                <div class="filter_tags">
                                                                    Giá sản phẩm: <b id="price-tag"></b>
                                                                    <span class="filter_tags_remove d-flex" data-filter="price">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 50 50" xml:space="preserve">
                                                                        <path fill="#333" d="M9.016 40.837a1.001 1.001 0 0 0 1.415-.001l14.292-14.309 14.292 14.309a1 1 0 1 0 1.416-1.413L26.153 25.129 40.43 10.836a1 1 0 1 0-1.415-1.413L24.722 23.732 10.43 9.423a1 1 0 1 0-1.415 1.413l14.276 14.293L9.015 39.423a1 1 0 0 0 .001 1.414z"></path>
                                                                        </svg>
                                                                    </span>
                                                                </div>
                                                                <div class="filter_tags">
                                                                    Màu sắc: <b id="color-tag"></b>
                                                                    <span class="filter_tags_remove d-flex" data-filter="color">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 50 50" xml:space="preserve">
                                                                        <path fill="#333" d="M9.016 40.837a1.001 1.001 0 0 0 1.415-.001l14.292-14.309 14.292 14.309a1 1 0 1 0 1.416-1.413L26.153 25.129 40.43 10.836a1 1 0 1 0-1.415-1.413L24.722 23.732 10.43 9.423a1 1 0 1 0-1.415 1.413l14.276 14.293L9.015 39.423a1 1 0 0 0 .001 1.414z"></path>
                                                                        </svg>
                                                                    </span>
                                                                </div>
                                                                <div class="filter_tags filter_tags_remove_all opened"><span><a href="ProductServlet">Xóa hết</a></span></div>
                                                            </div>                                          
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container">
                                        <div class="row filter-here" id="product-container">
                                            <c:set value="${requestScope.htmlResponse}" var="htmlResponse"/>
                                            ${htmlResponse}
                                        </div >
                                    </div>

                                    <div class="sortpagibar pagi clearfix text-center">
                                        <div id="pagination" class="clearfix">

                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <form id="paginationForm" action="ProductServlet" method="post">
                                                    <input type="hidden" name="action" value="pagination">
                                                    <div id="page-pagination">
                                                        <c:forEach var="page" items="${pagenumber}">
                                                            <input type="radio" name="page" id="page${page}" value="${page}" style="display: none;">
                                                            <label for="page${page}" style="width: 25px; border: groove;" class="page-node" aria-label="Trang ${page}">${page}</label>
                                                        </c:forEach>
                                                        <span class="page-node">&hellip;</span>
                                                    </div>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>

        <%@ include file="HomeFooter.jsp" %>
        <div class="addThis_listSharing hidden-xs">
            <ul class="addThis_listing">
            </ul>
        </div>
        <div class="actionToolbar_mobile visible-xs ">
            <ul class="actionToolbar_listing">

            </ul>
        </div>

        <div id="site-overlay" class="site-overlay"></div>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var ratingContainers = document.querySelectorAll('.rating-container');
                ratingContainers.forEach(function (container) {
                    var ratingValue = parseFloat(container.getAttribute('data-rating'));
                    var numReviews = container.getAttribute('data-num-reviews');

                    // Cập nhật chiều rộng của sao đã đánh giá
                    var ratingElement = container.querySelector('.rating');
                    var starPercentage = (ratingValue / 5) * 100;
                    ratingElement.style.setProperty('--rating-width', starPercentage + '%');

                    // Cập nhật số lượng đánh giá
                    var numReviewsElement = container.querySelector('.num-reviews');
                    numReviewsElement.textContent = '(' + numReviews + ')';
                });
            });

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
                            $("#product-container").html(response); // Cập nhật nội dung sản phẩm
                        },
                        error: function (xhr, status, error) {
                            console.error("Error: " + error);
                        }
                    });
                }
            });


            $(document).ready(function () {
                // Bắt sự kiện khi người dùng thay đổi checkbox trong form
                $('#filterForm input[type="checkbox"]').change(function () {
                    // Tự động submit form bằng AJAX
                    submitFormWithAjax();
                });

                // Hàm để gửi yêu cầu AJAX
                function submitFormWithAjax() {
                    var form = $('#filterForm')[0]; // Lấy form theo id
                    $.ajax({
                        type: form.getAttribute("method"),
                        url: form.getAttribute("action"),
                        data: $(form).serialize(),
                        success: function (response) {
                            // Tách response bằng dấu '|'
                            var responses = response.split('|');
                            if (responses.length === 2) {
                                var htmlResponse = responses[0];
                                var pagePagination = responses[1];
                                console.log("Đây là product:" + htmlResponse);
                                console.log("Đây là phân trang:" + pagePagination);
                                // Cập nhật nội dung sản phẩm
                                $("#product-container").html(htmlResponse);

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

            });


            document.addEventListener('DOMContentLoaded', function () {
                function updateTags(inputSelector, tagId, filterClass) {
                    const inputs = document.querySelectorAll(inputSelector);
                    const tagElement = document.getElementById(tagId);
                    const filterTagDiv = tagElement.closest('.filter_tags');
                    const selectedItems = [];

                    inputs.forEach(input => {
                        if (input.checked) {
                            selectedItems.push(input.getAttribute('data-category') || input.getAttribute('data-brand') || input.getAttribute('data-room') || input.getAttribute('data-price') || input.getAttribute('data-color'));
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

                function submitFormWithAjax() {
                    var form = $('#filterForm')[0]; // Lấy form theo id
                    $.ajax({
                        type: form.getAttribute("method"),
                        url: form.getAttribute("action"),
                        data: $(form).serialize(),
                        success: function (response) {
                            // Tách response bằng dấu '|'
                            var responses = response.split('|');
                            if (responses.length === 2) {
                                var htmlResponse = responses[0];
                                var pagePagination = responses[1];
                                console.log("Đây là product:" + htmlResponse);
                                console.log("Đây là phân trang:" + pagePagination);
                                // Cập nhật nội dung sản phẩm
                                $("#product-container").html(htmlResponse);

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


                function clearFilter(inputSelector, tagId) {
                    const inputs = document.querySelectorAll(inputSelector);
                    const tagElement = document.getElementById(tagId);

                    inputs.forEach(input => {
                        input.checked = false;
                    });

                    tagElement.textContent = '';
                    const filterTagDiv = tagElement.closest('.filter_tags');
                    filterTagDiv.classList.remove('opened');

                    updateRemoveAllTag();
                    submitFormWithAjax();
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
                            case 'color':
                                clearFilter('input[name="color-filter"]', 'color-tag');
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

                // Update color tag
                document.querySelectorAll('input[name="color-filter"]').forEach(input => {
                    input.addEventListener('change', () => {
                        updateTags('input[name="color-filter"]', 'color-tag', 'color-filter');
                    });
                });

                // Initial update to set the state based on pre-selected filters
                updateTags('input[name="category-filter"]', 'category-tag', 'category-filter');
                updateTags('input[name="brand-filter"]', 'brand-tag', 'brand-filter');
                updateTags('input[name="room-filter"]', 'room-tag', 'room-filter');
                updateTags('input[name="price-filter"]', 'price-tag', 'price-filter');
                updateTags('input[name="color-filter"]', 'color-tag', 'color-filter');
            });

            $(document).ready(function () {
                $('.page-node').click(function (event) {
                    event.preventDefault(); // Ngăn chặn hành động mặc định của liên kết

                    var pageValue = $(this).text();
                    $("input[name='page'][value='" + pageValue + "']").prop('checked', true);

                    submitFormWithAjax();
                });

                function submitFormWithAjax() {
                    var form = $('#paginationForm')[0]; // Lấy form theo id

                    $.ajax({
                        type: form.getAttribute("method"),
                        url: form.getAttribute("action"),
                        data: $(form).serialize(),
                        success: function (response) {
                            $("#product-container").html(response); // Cập nhật nội dung sản phẩm
                        },
                        error: function (xhr, status, error) {
                            console.error("Error: " + error);
                        }
                    });
                }
            });
            
            $(document).ready(function () {
                var searchInput = $('#inputSearchAuto');
                var searchForm = $('#searchForm');
                var resultsWrapper = $('#ajaxSearchResults');
                var resultsContent = $('.resultsContent');
                var typingTimer; // Timer identifier
                var doneTypingInterval = 500; // Time in ms (500 ms)

                // Function to handle the AJAX request
                function submitSearch() {
                    var searchData = searchInput.val().trim();

                    if (searchData !== '') {
                        $.ajax({
                            type: 'POST',
                            url: searchForm.attr('action'),
                            data: searchForm.serialize(),
                            success: function (response) {
                                resultsWrapper.show(); // Use .show() to display results
                                resultsContent.html(response);
                                console.log(response);
                            },
                            error: function (xhr, status, error) {
                                console.error("Error: " + error);
                            }
                        });
                    } else {
                        resultsWrapper.hide(); // Use .hide() to hide results
                    }
                }

                // Handle input change event with a delay
                searchInput.on('input', function () {
                    clearTimeout(typingTimer);
                    typingTimer = setTimeout(submitSearch, doneTypingInterval);
                });

                // Handle click event on search button
                $('.btn-search').on('click', function () {
                    resultsWrapper.hide(); // Hide results when search button is clicked
//                    searchForm.submit();
                });
            });
        </script>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            .rating::after {
                content: "★★★★★";
                color: #ffc107;
                /* Màu của sao được đánh giá */
                position: absolute;
                top: 0;
                left: 0;
                white-space: nowrap;
                overflow: hidden;
                width: var(--rating-width);
            }
        </style>

    </body>

</html>
