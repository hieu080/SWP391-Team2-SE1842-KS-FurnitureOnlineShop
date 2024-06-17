<%-- Document : HomeSlider Created on : May 23, 2024, 12:46:07 AM Author : ADMIN --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="preload stylesheet" as="style" fetchpriority="low"
              href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
        <link rel="preload stylesheet" as="style" fetchpriority="low"
              href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />

        <link rel="preload stylesheet" as="style" fetchpriority="low" href="css/style-theme.scss.css">
        <link rel="stylesheet" href="css/style.css">
        <!--+++++++++++++++++++++++++  JS ++++++++++++++++++++++++-->



        <script defer fetchpriority="low"
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"></script>

        <script defer fetchpriority="low"
        src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
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
        </style>
    </head>

    <body>


        <!-- Nhóm sản phẩm 1 -->




        <section class="section section-collection">
            <div class="wrapper-heading-home text-center">
                <div class="container">

                    <div class="site-animation">
                        <h2>
                            <a href="/collections/uu-dai">

                                Các Sản Phẩm Mới Nhất 

                            </a>
                        </h2>
                        <span class="view-more">
                            <a href="${pageContext.request.contextPath}/ProductServlet">
                                Xem thêm
                            </a>
                        </span>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row filter-here">

                    <c:forEach items="${requestScope.productList}" var="product">
                        <div class="col-md-3 col-sm-6 col-xs-6 pro-loop col-4">
                            <div class="product-block product-resize site-animation single-product">
                                <div class="product-img fade-box">
                                    <c:forEach items="${requestScope.saleOffList}" var="saleoff">
                                        <c:if test="${saleoff.product_id == product.id}">

                                            <c:choose>
                                                <c:when test="${saleoff.getSaleoffvalue() != 0}">
                                                    <div class="product-sale"><span>-${saleoff.getSaleoffvalue()}%</span></div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div></div>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                    </c:forEach>

                                    <div class="tag-loop">
                                        <div class="icon icon_hot">
                                            <img loading="lazy" decoding="async"
                                                 src="//theme.hstatic.net/200000065946/1001187274/14/icon_hot.png?v=582"
                                                 alt="icon hot" />
                                        </div>
                                    </div>
                                    <a href="ProductDetailServlet?productId=${product.id}"
                                       title="${product.name}" class="image-resize">
                                        <picture class="loop-one-img ">
                                            <img loading="lazy" decoding="async" width="480"
                                                 height="480" class="img-loop"
                                                 alt="${product.name}"
                                                 src="image/product/${product.image}" />
                                        </picture>
                                    </a>
                                </div>
                                <div class="product-detail clearfix">
                                    <div class="box-pro-detail">
                                        <h3 class="pro-name">
                                            <a href="#"
                                               title="${product.name}">
                                                ${product.name}
                                            </a>
                                        </h3>
                                        <div class="box-pro-prices">
                                            <p class="pro-price highlight">
                                                <c:set var="hasSale" value="false" />
                                                <c:forEach items="${requestScope.saleOffList}" var="saleoff">
                                                    <c:if test="${saleoff.product_id == product.id}">  
                                                        <c:set var="hasSale" value="true" />
                                                        <c:choose>
                                                            <c:when test="${saleoff.getSaleoffvalue() == 0}">
                                                                <span style="color: black">${product.price}₫</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span>${product.price - product.price * saleoff.getSaleoffvalue() / 100}₫</span>
                                                                <span class="pro-price-del">
                                                                    <del class="compare-price">
                                                                        ${product.price}₫
                                                                    </del>
                                                                </span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:if>
                                                </c:forEach>
                                                <c:if test="${!hasSale}">
                                                    <span style="color: black">${product.price}₫</span>
                                                </c:if>
                                            </p>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 custom_review">
                                                <c:set var="reviewCount" value="0" scope="page" />

                                                <c:forEach items="${requestScope.feedbackList}" var="feedback">
                                                    <c:if test="${feedback.product_id == product.id}">
                                                        <c:set var="reviewCount" value="${reviewCount + 1}" scope="page" />
                                                    </c:if>
                                                </c:forEach>
                                                <div class="rating-container" data-rating="${product.staravg}" data-num-reviews="${reviewCount}">
                                                    <div class="rating"></div>
                                                    <span class="num-reviews"></span>
                                                </div>
                                                <div>Số lượng: ${product.getQuantity()}</div>
                                            </div>
                                            <c:set var="quantitySold" value="0" scope="page" /> 
                                            <c:forEach items="${requestScope.orderDetailList}" var="orderDetail">
                                                <c:forEach items="${requestScope.productDetailList}" var="productDetail">
                                                    <c:if test="${orderDetail.productdetail_id == productDetail.id}">
                                                        <c:if test="${productDetail.product_id == product.id}">
                                                            <c:set var="quantitySold" value="${quantitySold + orderDetail.quantity}" scope="page" />
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                            </c:forEach>
                                            <div
                                                class="col-lg-4 col-md-4 col-sm-4 col-xs-12 custom_sold_qty">
                                                <div class="cmpText">Đã bán ${quantitySold}</div>
                                                <span>
                                                    <c:forEach items="${productDetailList}" var="productDetail">
                                                        <c:if test="${product.id == productDetail.product_id}">
                                                            <c:forEach items="${colorList}" var="color">
                                                                <c:if test="${productDetail.color_id == color.id}">
                                                                    <label class="color-checkbox">
                                                                        <input type="checkbox" name="color" value="${color.id}" style="display: none;">
                                                                        <span class="color-circle" style="background-color:${color.colorcode};"></span>
                                                                    </label>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:if>
                                                    </c:forEach>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>

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

        </script>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
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