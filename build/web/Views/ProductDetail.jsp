<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="//theme.hstatic.net/200000065946/1001187274/14/favicon.png?v=582"
              type="image/png" />
        <title>Tất Cả Sản Phẩm Đồ Gỗ Nội Thất Của MOHO</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

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

            .product-price {
                padding: 10px 0;
                border-bottom: 1px dotted #dfe0e1;
            }
            .product-price .pro-price {
                font-size: 17px;
                opacity: .92;
                font-weight: bold;
                color: #ef683a;
            }
            .product-price .pro-sale {
                display: inline-block;
                padding: 5px 15px;
                margin-right: 10px;
                background: #ededed;
                text-transform: uppercase;
                font-weight: 600;
                font-size: 15px;
                color: #f94c43;
            }
            .product-price del {
                font-size: 14px;
                color: #777a7b;
                padding-left: 10px;
                font-weight: 500;
            }

            .color-radio {
                position: relative;
                cursor: pointer;
                display: inline-block;
                margin-right: 10px; /* Optional: Adds space between color options */
            }

            .color-radio input[type="radio"] {
                display: none;
            }

            .color-radio .color-circle {
                width: 20px;
                height: 20px;
                border-radius: 50%;
                display: inline-block;
            }

            .color-radio .color-circle:hover::after {
                content: attr(title);
                position: absolute;
                background: #000;
                color: #fff;
                padding: 2px 5px;
                border-radius: 3px;
                top: 25px; /* Adjust this value to position tooltip below */
                left: 50%;
                transform: translateX(-50%);
                white-space: nowrap;
                font-size: 12px;
                z-index: 10;
            }

            .color-radio input[type="radio"]:checked + .color-circle {
                border: 2px solid #000; /* Add border or any other style to indicate selection */
            }

            .quantity-area {
                margin-bottom: 15px;
            }
            .quantity-area input#quantity {
                background: #fff;
                font-weight: 600;
                height: 32px;
                padding: 0;
                text-align: center;
                width: 70px;
                border: 1px solid #f5f5f5;
                border-left: none;
                border-right: none;
                border-radius: 1px;
                float: left;
                -webkit-appearance: none;
            }
            .quantity-area input.qty-btn {
                float: left;
                background: #f5f5f5;
                border: solid 1px #f5f5f5;
                cursor: pointer;
                font-weight: 600;
                font-size: 16px;
                outline: none;
                height: 32px;
                width: 32px;
                text-align: center;
                border-radius: 0;
            }
            btn-addtocart {
                font-size: 15px;
                font-weight: bold;
                text-transform: uppercase;
                box-shadow: none;
                padding: 14px 35px;
                line-height: 22px;
            }
            .rating-item {
                display: inline-block; /* Đặt các mục đánh giá vào cùng một hàng */
                text-align: center; /* Căn giữa nội dung */
                margin: 5px; /* Để lại khoảng cách giữa các mục đánh giá */
                cursor: pointer;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                transition: background-color 0.3s, transform 0.3s;
            }

            .rating-item:hover {
                background-color: #f0f0f0;
                transform: scale(1.05);
            }

            .stars {
                color: gold;
                margin-bottom: 5px;
                font-size: 20px;
            }
            .fit-image {
                width: 150px;
                height: 150px;
                object-fit: cover; /* cover, contain, fill, scale-down, none */
                object-position: center; /* Position of the image within the frame */
            }

        </style>
    </head>

    <body id="nội-thất-moho" class="collection">
        <div class="main-body ">
            <%@ include file="HomeHeader.jsp" %>
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
                <c:set var="product" value="${requestScope.product}"/>
                <div class="container">
                    <div class="row" style="margin-top: 30px">
                        <div class="col-md-7 row">
                            <c:forEach items="${productDetailList}" var="productDetail">
                                <c:if test="${product.id == productDetail.product_id}">
                                    <div class="col-md-3" id="productDetail_${productDetail.id}" style="display: none;">
                                        <c:forEach items="${requestScope.attachedImageList}" var="attachedImage">
                                            <c:if test="${productDetail.id == attachedImage.productdetail_id}">
                                                <div class="col-md-12">
                                                    <img src="image/product/${attachedImage.image}" alt="${attachedImage.image}" width="132px" height="132x" style="max-width: 100%; margin-bottom: 5px"/>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </c:if>
                            </c:forEach>
                            <div class="col-md-9">
                                <div class="tag-loop">
                                    <div class="icon icon_hot">
                                        <img loading="lazy" decoding="async"
                                             src="//theme.hstatic.net/200000065946/1001187274/14/icon_hot.png?v=582"
                                             alt="icon hot" style="width: 100px; margin-right: 15px"/>
                                    </div>
                                </div>
                                <img src="image/product/${product.image}" alt="${product.name}" width="545px" height="545px" style="max-width: 100%"/>
                            </div>
                        </div>
                        <div class="col-md-5">
                            <h3><b>${product.name}</b></h3>
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
                            <div class="d-flex" style="justify-content: space-between">
                                <div class="rating-container" data-rating="${product.staravg}" data-num-reviews="85">
                                    <div class="rating"></div>
                                    <span class="num-reviews"></span>
                                </div>
                                <div>
                                    <b>Đã bán: ${quantitySold}</b>
                                </div>
                            </div>

                            <div style="margin-top: 5px; margin-left: 5px; border-bottom: 1px dotted #dfe0e1; display: flex; justify-content: space-between">
                                <b>PID: #00${product.id}</b> 
                                <span>
                                    <b>Số lượng: </b> 
                                    <b id="quantityProduct">${product.quantity}</b>
                                </span>
                            </div>
                            <div class="product-price" id="price-preview">
                                <c:forEach items="${requestScope.saleOffList}" var="saleoff">
                                    <c:if test="${saleoff.product_id == product.id}">
                                        <c:choose>
                                            <c:when test="${saleoff.getSaleoffvalue() != 0}">
                                                <span class="pro-sale">-${saleoff.getSaleoffvalue()}%</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span></span>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                </c:forEach>

                                <c:set var="hasSale" value="false" />
                                <c:forEach items="${requestScope.saleOffList}" var="saleoff">
                                    <c:if test="${saleoff.product_id == product.id}">  
                                        <c:set var="hasSale" value="true" />
                                        <c:choose>
                                            <c:when test="${saleoff.getSaleoffvalue() == 0}">
                                                <span style="color: black">${product.price}₫</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="pro-price">${product.price - product.price * saleoff.getSaleoffvalue() / 100}₫</span>
                                                <del>${product.price}₫</del>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${!hasSale}">
                                    <span style="color: black">${product.price}₫</span>
                                </c:if>
                            </div>
                            <div style="border-bottom: 1px dotted #dfe0e1; margin-top: 10px">
                                <div id="colorName" style="margin-bottom: 10px">Color Name</div>
                                <div style="display: flex;">
                                    <c:set var="hasChecked" value="false" scope="page"/>
                                    <c:forEach items="${productDetailList}" var="productDetail">
                                        <c:if test="${product.id == productDetail.product_id}">
                                            <c:forEach items="${colorList}" var="color" varStatus="loop">
                                                <c:if test="${productDetail.color_id == color.id}">
                                                    <span>
                                                        <label class="color-radio">
                                                            <input type="radio" name="color" value="${color.colorname} (SL: ${productDetail.quantity})"
                                                                   data-product-detail-id="${productDetail.id}" onchange="updateColorName(this)"
                                                                   <c:if test="${!hasChecked}">
                                                                       checked
                                                                       <c:set var="hasChecked" value="true" scope="page"/>
                                                                   </c:if>>
                                                            <span class="color-circle" style="background-color: ${color.colorcode}"></span>
                                                        </label>
                                                    </span>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                            <div style="border-bottom: 1px dotted #dfe0e1; margin-top: 10px">
                                ${product.description}
                            </div>
                            <div class="quantity-area clearfix" style="margin-top:15px">
                                <input type="button" value="-" onclick="minusQuantity()" class="qty-btn">
                                <input type="text" id="quantity" name="quantity" value="1" min="1" class="quantity-selector" readonly>
                                <input type="button" value="+" onclick="plusQuantity()" class="qty-btn">
                            </div>
                            <p id="warningMessage" style="color: red; display: none;"></p>
                            <div class="wrap-addcart clearfix d-flex" style="justify-content:space-between">
                                <button class="add-to-cartProduct button red btn-addtocart addtocart-modal" style="width: 240px">Thêm vào giỏ</button>
                                <button id="buy_now" class="button red btn-addtocart addtocart-modal" style="margin-top: 0px; width: 240px"> Mua ngay </button>
                            </div>
                            <div class="infor_promotion" style="margin-top: 5px">
                                <p><i class="fa fa-check" aria-hidden="true"></i> Miễn phí giao hàng &amp; lắp đặt tại tất cả quận huyện thuộc TP.HCM, Hà Nội, Khu đô thị Ecopark, Biên Hòa và một số quận thuộc Bình Dương (*)</p>
                                <p><i class="fa fa-check" aria-hidden="true"></i> Miễn phí 1 đổi 1 - Bảo hành 2 năm - Bảo trì trọn đời (**)</p>
                                (*) Không áp dụng cho danh mục Đồ Trang Trí<p></p>
                                (**) Không áp dụng cho các sản phẩm Clearance. Chỉ bảo hành 01 năm cho khung ghế, mâm và cần đối với Ghế Văn Phòng<p></p>								
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <%@include file="ProductFeedback.jsp" %>
        <%@ include file="HomeProduct.jsp" %>
        <%@ include file="HomeFooter.jsp" %>


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

            document.addEventListener('DOMContentLoaded', function () {
                var ratingContainers = document.querySelectorAll('.feedback-rating');
                ratingContainers.forEach(function (container) {
                    var ratingValue = parseFloat(container.getAttribute('data-rating'));
                    // Cập nhật chiều rộng của sao đã đánh giá
                    var ratingElement = container.querySelector('.rating');
                    var starPercentage = (ratingValue / 5) * 100;
                    ratingElement.style.setProperty('--rating-width', starPercentage + '%');
                });
            });

            function updateColorName(radio) {
                var colorName = radio.value;
                document.getElementById('colorName').innerText = colorName;
                var productDetailId = radio.dataset.productDetailId; // Assuming productDetailId is stored in data-product-detail-id attribute

                // Hide all product detail divs
                var productDetailDivs = document.querySelectorAll('[id^="productDetail_"]');
                productDetailDivs.forEach(function (div) {
                    div.style.display = 'none';
                });

                // Display the corresponding product detail div
                var productDetailDiv = document.getElementById('productDetail_' + productDetailId);
                if (productDetailDiv) {
                    productDetailDiv.style.display = 'block'; // Show the product detail div
                }
            }

// Initialize the default color name on page load
            document.addEventListener('DOMContentLoaded', function () {
                // Lấy ra radio button mặc định có thuộc tính checked
                var defaultRadio = document.querySelector('input[name="color"]:checked');
                if (defaultRadio) {
                    updateColorName(defaultRadio); // Gọi hàm updateColorName cho radio mặc định
                }
            });

            function minusQuantity() {
                var quantityInput = document.getElementById('quantity');
                var currentValue = parseInt(quantityInput.value);
                var warningMessage = document.getElementById('warningMessage');

                if (currentValue > 1) {
                    quantityInput.value = currentValue - 1;
                    warningMessage.style.display = 'none';  // Hide warning message
                }
            }

            function plusQuantity() {
                var quantityInput = document.getElementById('quantity');
                var currentValue = parseInt(quantityInput.value);
                var maxQuantity = parseInt(document.getElementById('quantityProduct').innerText);
                var warningMessage = document.getElementById('warningMessage');

                if (currentValue < maxQuantity) {
                    quantityInput.value = currentValue + 1;
                    warningMessage.style.display = 'none';  // Hide warning message
                } else {
                    warningMessage.innerText = 'Quantity cannot exceed ' + maxQuantity;
                    warningMessage.style.display = 'block';  // Show warning message
                }
            }
            
            function setFeedbackId(feedbackId) {
                var feedbackIdInput = document.getElementById('deleteFeedbackId');
                if (feedbackIdInput) {
                    feedbackIdInput.value = feedbackId;
                } else {
                    console.error('Element with id "deleteFeedbackId" not found.');
                }
            }

        </script>


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
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>               
    </body>
</html>
