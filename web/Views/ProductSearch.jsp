<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tìm kiếm sản phẩm</title>
        <link rel="icon" href="image/logoshop.png" type="image/png">
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
                                            <c:set value="${requestScope.numberResult}" var="numberResult"/>
                                            <div style="text-align: center; margin: 20px 0px">
                                                <h1 style="font-weight: 700">Tìm kiếm</h1>
                                                <div>Có <b>${numberResult} sản phẩm</b> cho tìm kiếm</div>
                                            </div>
                                        </div>   
                                    </div>
                                    <c:set value="${requestScope.keySearch}" var="keySearch"/>

                                    <!--list product--> 
                                    <div class="container">
                                        <div style="margin-bottom: 15px">Kết quả tìm kiếm cho <b>"${keySearch}"</b></div>

                                        <div class="row filter-here" id="product-container">
                                            <c:choose>
                                                <c:when test="${empty requestScope.productList}">
                                                    <div class="no-products">
                                                        <p>Không tìm thấy sản phẩm phù hợp.</p>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:forEach items="${requestScope.productList}" var="product">
                                                        <div class="col-md-3 col-sm-6 col-xs-6 pro-loop col-4">
                                                            <div class="product-block product-resize site-animation single-product">
                                                                <div class="product-img fade-box">
                                                                    <c:choose>
                                                                        <c:when test="${product.saleOff != 0}">
                                                                            <div class="product-sale"><span>-${product.saleOff}%</span></div>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <div></div>
                                                                        </c:otherwise>
                                                                    </c:choose>
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
                                                                                <c:choose>
                                                                                    <c:when test="${product.saleOff == 0}">
                                                                                        <span style="color: black">
                                                                                            <fmt:formatNumber value="${product.price}" type="number" minFractionDigits="0" maxFractionDigits="0" groupingUsed="true" />₫
                                                                                        </span>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <span>
                                                                                            <fmt:formatNumber value="${product.salePrice}" type="number" minFractionDigits="0" maxFractionDigits="0" groupingUsed="true" />₫
                                                                                        </span>
                                                                                        <span class="pro-price-del">
                                                                                            <del class="compare-price">
                                                                                                <fmt:formatNumber value="${product.price}" type="number" minFractionDigits="0" maxFractionDigits="0" groupingUsed="true" />₫
                                                                                            </del>
                                                                                        </span>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </p>
                                                                        </div>

                                                                        <div class="row">
                                                                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 custom_review">
                                                                                <div class="rating-container" data-rating="${product.staravg}" data-num-reviews="${product.numberFeedback}">
                                                                                    <div class="rating"></div>
                                                                                    <span class="num-reviews"></span>
                                                                                </div>
                                                                                <div>Số lượng: ${product.getQuantity()}</div>
                                                                            </div>
                                                                            <div
                                                                                class="col-lg-4 col-md-4 col-sm-4 col-xs-12 custom_sold_qty">
                                                                                <div class="cmpText">Đã bán ${product.quantitySold}</div>
                                                                                <span>
                                                                                    <c:forEach items="${product.colorList}" var="color">
                                                                                        <label class="color-checkbox">
                                                                                            <input type="checkbox" name="color" value="${color.id}" style="display: none;">
                                                                                            <span class="color-circle" style="background-color:${color.colorcode};"></span>
                                                                                        </label>
                                                                                    </c:forEach>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div >
                            </div>
                            <div class="sortpagibar pagi clearfix text-center">
                                <div id="pagination" class="clearfix">

                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <form id="paginationForm" action="ProductSearchServlet" method="post">
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
            function updateRatings() {
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
            }

// Gọi hàm khi trang đã tải
            document.addEventListener('DOMContentLoaded', function () {
                updateRatings();
            });

            //Phân trang
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
                            updateRatings();
                        },
                        error: function (xhr, status, error) {
                            console.error("Error: " + error);
                        }
                    });
                }

            });

            function formatCurrency(number) {
                return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND', minimumFractionDigits: 0}).format(number).replace('₫', '') + '₫';
            }

            function displayProducts(products) {
                const container = document.getElementById('product-container');
                container.innerHTML = ''; // Xóa nội dung hiện có

                products.forEach(product => {
                    // Khởi tạo các phần của HTML
                    let saleOffHTML = '';
                    let priceHTML = '';
                    let colorListHTML = '';

                    // Kiểm tra giảm giá
                    if (product.saleOff !== 0) {
                        saleOffHTML = `<div class="product-sale"><span>-` + product.saleOff + `%</span></div>`;
                    } else {
                        saleOffHTML = `<div></div>`;
                    }

                    // Kiểm tra giá
                    if (product.saleOff === 0) {
                        priceHTML = `<span style="color: black">` + formatCurrency(product.price) + `</span>`;
                    } else {
                        priceHTML = `
        <span>` + formatCurrency(product.salePrice) + `</span>
        <span class="pro-price-del">
            <del class="compare-price">` + formatCurrency(product.price) + `</del>
        </span>
    `;
                    }

                    // Tạo HTML cho danh sách màu sắc
                    colorListHTML = product.colorList.map(color => `
        <label class="color-checkbox">
            <input type="checkbox" name="color" value="` + color.id + `" style="display: none;">
            <span class="color-circle" style="background-color:` + color.colorcode + `"></span>
        </label>
    `).join('');

                    // Tạo HTML cho sản phẩm
                    const productHTML = `
        <div class="col-md-3 col-sm-6 col-xs-6 pro-loop col-4">
            <div class="product-block product-resize site-animation single-product">
                <div class="product-img fade-box">`
                            + saleOffHTML +
                            `<div class="tag-loop">
                        <div class="icon icon_hot">
                            <img loading="lazy" decoding="async"
                                 src="//theme.hstatic.net/200000065946/1001187274/14/icon_hot.png?v=582"
                                 alt="icon hot" />
                        </div>
                    </div>
                    <a href="ProductDetailServlet?productId=` + product.id + `"
                       title="` + product.name + `" class="image-resize">
                        <picture class="loop-one-img">
                            <img loading="lazy" decoding="async" width="480"
                                 height="480" class="img-loop"
                                 alt="` + product.name + `"
                                 src="image/product/` + product.image + `" />
                        </picture>
                    </a>
                </div>
                <div class="product-detail clearfix">
                    <div class="box-pro-detail">
                        <h3 class="pro-name">
                            <a href="#" title="` + product.name + `">`
                            + product.name +
                            `</a>
                        </h3>
                        <div class="box-pro-prices">
                            <p class="pro-price highlight">`
                            + priceHTML +
                            `</p>
                        </div>
                        <div class="row">
                            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 custom_review">
                                <div class="rating-container" data-rating="` + product.staravg + `" data-num-reviews="` + product.numberFeedback + `">
                                    <div class="rating"></div>
                                    <span class="num-reviews"></span>
                                </div>
                                <div>Số lượng: ` + product.quantity + `</div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 custom_sold_qty">
                                <div class="cmpText">Đã bán ` + product.quantitySold + `</div>
                                <span>`
                            + colorListHTML +
                            `</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    `;
                    // Thêm HTML sản phẩm vào container
                    container.innerHTML += productHTML;
                });
            }

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