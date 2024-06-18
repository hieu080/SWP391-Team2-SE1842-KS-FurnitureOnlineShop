<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="preload stylesheet" as="style" fetchpriority="low"
              href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />

        <link rel="preload stylesheet" as="style" fetchpriority="low" href="css/style-theme.scss.css">
        <link rel="stylesheet" href="css/style.css">


        <!--+++++++++++++++++++++++++  JS ++++++++++++++++++++++++-->


        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


        <script defer fetchpriority="low"
        src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <title>Product List</title>
        <style>
            body {
                background-color: #f8f9fa;
            }



            .product-list-header1 {
                background-color: #fff;
                border-bottom: 2px solid #dee2e6;
                padding: 10px 0;
            }

            .shop-section1 {
                background-color: #fff;
                padding: 10px;
                border: 1px solid #dee2e6;
                border-radius: 5px;
                margin-bottom: 20px;
            }

            .list-group-item1 {
                padding: 15px;
                border: 1px solid #dee2e6;
                border-radius: 5px;
                background-color: #fff;
            }

            .list-group-item1:not(:last-child) {
                margin-bottom: 10px;
            }

            .product-image1 {
                width: 80px;
                height: 80px;
                object-fit: cover;
            }

            .footer-section1 {
                background-color: #fff;
                padding: 15px 0;
                border-top: 2px solid #dee2e6;
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
                            <div style="background-color: #f2f2f2; padding: 20px 0; border-left: 3px solid #000; margin-left: 3%;margin-right: 2%;"></div>
                            <div class="ml-2">
                                <h2>Giỏ hàng</h2>
                            </div>
                        </a>
                    </div>
                    <div class="col-2"></div>
                    <div class="ml-auto col-5">
                        <form action="${pageContext.request.contextPath}/ProductServlet" method="post" class="form-inline">
                            <input type="hidden" name="type" value="product" />
                            <div class="input-group">
                                <input required id="inputSearchAuto" name="search" maxlength="40" autocomplete="off"
                                       type="text" class="form-control" placeholder="Tìm kiếm sản phẩm...">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-primary" title="Tìm kiếm">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                             class="bi bi-search" viewBox="0 0 16 16">
                                        <path
                                            d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <h2 class="d-flex justify-content-center">Giỏ Hàng Của Bạn </h2>
        <div class="container">
            <main class="mb-4">
                <h2 class="visually-hidden">Product List Section</h2>
                <div class="row m-0 mb-3 product-list-header1">

                    <div class="col-1">

                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag-check" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M10.854 8.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708 0"/>
                        <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1m3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1z"/>
                        </svg>
                    </div>
                    <div class="col-5 d-flex justify-content-center align-items-center">Sản Phẩm</div>
                    <div class="col d-flex justify-content-center align-items-center">Đơn Giá</div>
                    <div class="col-1 d-flex justify-content-center align-items-center">Số Lượng</div>
                    <div class="col d-flex justify-content-center align-items-center">Số Tiền</div>
                    <div class="col d-flex justify-content-center align-items-center">Thao Tác</div>

                </div>
                <c:if test="${empty listcartdetail}">
                    <h3 class="d-flex justify-content-center">Danh sách rỗng <a style="color: orange" href="${pageContext.request.contextPath}/ProductServlet"">Tìm thêm sản phẩm </a></h3>
                </c:if>
                <c:forEach items="${listcartdetail}" var="cartdetail" varStatus="status">
                    <c:choose>
                        <c:when test="${cartdetail.productDetail.quantity>=1}">
                            <section class="shop-section1 p-0">
                                <h3 class="visually-hidden">Shop Section</h3>
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <div class="d-flex align-items-center">

                                        <a href="${pageContext.request.contextPath}/MoreProduct?brand= ${cartdetail.brand.id}&&brandname=${cartdetail.brand.brandname}"
                                           class="ms-2 d-flex align-items-center text-decoration-none text-dark">
                                            <span>Shop: </span>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                                 class="bi bi-shop" viewBox="0 0 16 16">
                                            <path
                                                d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.37 2.37 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0M1.5 8.5A.5.5 0 0 1 2 9v6h1v-5a1 1 0 0 1 1-1h3a1 1 0 0 1 1 1v5h6V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5M4 15h3v-5H4zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1zm3 0h-2v3h2z" />
                                            </svg>
                                            ${cartdetail.brand.brandname}
                                        </a>
                                    </div>
                                    <div class="d-flex align-items-center">

                                        <a href="${pageContext.request.contextPath}/MoreProduct?category=${cartdetail.category.id}&&categoryname=${cartdetail.category.category}"
                                           class="ms-2 d-flex align-items-center text-decoration-none text-dark">
                                            <span>Category:</span>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                                 class="bi bi-bookmarks" viewBox="0 0 16 16">
                                            <path
                                                d="M2 4a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v11.5a.5.5 0 0 1-.777.416L7 13.101l-4.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v10.566l3.723-2.482a.5.5 0 0 1 .554 0L11 14.566V4a1 1 0 0 0-1-1z" />
                                            <path
                                                d="M4.268 1H12a1 1 0 0 1 1 1v11.768l.223.148A.5.5 0 0 0 14 13.5V2a2 2 0 0 0-2-2H6a2 2 0 0 0-1.732 1" />
                                            </svg>
                                            ${cartdetail.category.category}
                                        </a>
                                    </div>

                                </div>
                                <section class="list-group" role="list">
                                    <div class="list-group-item1" role="listitem">
                                        <div class="row align-items-center">
                                            <div class="col-1">
                                                <input type="checkbox" class="product-checkbox" aria-checked="false" aria-disabled="false" tabindex="0"
                                                       role="checkbox" aria-label="Click here to select this product"
                                                       ${cartdetail.cartItem.status == 'selected' ? 'checked' : ''}>
                                                <!-- Form ẩn để gửi trạng thái -->
                                                <form id="statusForm${status.index}" action="${pageContext.request.contextPath}/UpdateCartItemStatus" method="post" style="display:none;">
                                                    <input type="hidden" name="cartid" value="${cartdetail.cartItem.id}">
                                                    <input type="hidden" id="statusInput${status.index}" name="status" value="">
                                                </form>
                                            </div>
                                            <div class="col-5 d-flex justify-content-center align-items-center row">
                                                <div class="col-3"><a
                                                        href="/Điện-thoại-Xiaomi-Redmi-Note-13-Mới-100-Bảo-hành-18-tháng-Hàng-Chính-Hãng-i.68527388.24907835906?xptdk=50a6e1b5-1e45-4eb4-a98b-cc885d6c793b">
                                                        <img src="image/product/${cartdetail.product.image}"
                                                             class="img-thumbnail product-image1 me-2" alt="product image">
                                                    </a></div>

                                                <div class="col-6">
                                                    <a href="/Điện-thoại-Xiaomi-Redmi-Note-13-Mới-100-Bảo-hành-18-tháng-Hàng-Chính-Hãng-i.68527388.24907835906?xptdk=50a6e1b5-1e45-4eb4-a98b-cc885d6c793b"
                                                       class="text-decoration-none text-dark">${cartdetail.product.name}</a>

                                                </div>
                                                <div class="col-3">
                                                    <button class="btn btn-outline-secondary btn-sm">${cartdetail.color.colorname}</button>
                                                </div>
                                            </div>

                                            <div class="col d-flex justify-content-center align-items-center">
                                                <div class="d-flex justify-content-center align-items-center">
                                                    <c:set var="hasSale" value="false" />
                                                    <c:forEach items="${requestScope.saleOffList}" var="saleoff">
                                                        <c:if test="${saleoff.product_id == cartdetail.product.id}">  
                                                            <c:set var="hasSale" value="true" />
                                                            <c:choose>
                                                                <c:when test="${saleoff.getSaleoffvalue() == 0}">
                                                                    <span style="color: black">${cartdetail.product.price}₫</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span>${cartdetail.product.price - cartdetail.product.price * saleoff.getSaleoffvalue() / 100}₫</span>
                                                                    <span class="pro-price-del">
                                                                        <del class="compare-price">
                                                                            ${cartdetail.product.price}₫
                                                                        </del>
                                                                    </span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <div class="col-1 d-flex justify-content-center align-items-center">
                                                <!-- Form ẩn để cập nhật số lượng sản phẩm -->
                                                <form id="updateCartForm${status.index}" action="${pageContext.request.contextPath}/UpdateCartQuantity" method="post" style="display:none;">
                                                    <input type="hidden" name="cartid" value="${cartdetail.cartItem.id}">
                                                    <input type="hidden" id="quantity${status.index}" name="quantity" value="${cartdetail.cartItem.quantity}">
                                                    <!-- Thêm trường ẩn để lưu giá sản phẩm sau khi tính toán -->
                                                    <input type="hidden" id="totalPrice${status.index}" name="totalPrice" value="">
                                                </form>
                                                <!-- Input và nút bấm để thay đổi số lượng -->
                                                <div class="input-group input-group-sm ">
                                                    <button type="button" class="btn btn-outline-secondary" onclick="updateQuantity(${status.index}, -1,${cartdetail.productDetail.quantity}, ${cartdetail.cartItem.totalcost})">-</button>
                                                    <input type="number" id="quantityInput${status.index}" class="form-control text-center" min="1"  value="${cartdetail.cartItem.quantity}" readonly >
                                                    <button type="button" class="btn btn-outline-secondary" onclick="updateQuantity(${status.index}, 1,${cartdetail.productDetail.quantity}, ${cartdetail.cartItem.totalcost})">+</button>
                                                </div>
                                            </div>
                                            <div class="col d-flex justify-content-center align-items-center">
                                                <span>${cartdetail.cartItem.totalcost}₫</span>
                                            </div>
                                            <form id="deleteCartForm${status.index}" action="${pageContext.request.contextPath}/DeleteCartItem" method="post" style="display:none;">
                                                <input type="hidden" name="cartid" value="${cartdetail.cartItem.id}">
                                            </form>

                                            <div class="col d-flex justify-content-center align-items-center">
                                                <button class="btn btn-danger btn-sm me-2" onclick="document.getElementById('deleteCartForm${status.index}').submit();">Xóa</button>
                                                <a href="${pageContext.request.contextPath}/MoreProduct?brand= ${cartdetail.brand.id}&&category= ${cartdetail.category.id}&&brandname=${cartdetail.brand.brandname}&&categoryname=${cartdetail.category.category}" class="btn btn-outline-secondary btn-sm">Tìm thêm sản phẩm </a>
                                            </div>

                                        </div>
                                    </div>
                                </section>
                            </section>
                        </c:when>

                        <c:otherwise>
                            <div>
                                Sản Phẩm : ${cartdetail.product.name} đã hết !
                            </div>
                        </c:otherwise>
                    </c:choose>

                </c:forEach>


                <form id="UpdateAllStatusCart" action="${pageContext.request.contextPath}/UpdateCartItemStatus" method="get" style="display:none;">

                    <input type="hidden" id="statusInput" name="status" value="">

                </form>


            </main>
            <section>
                <div class="footer-section1">
                    <h3 class="visually-hidden">cart_accessibility_footer_checkout_row</h3>
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="d-flex align-items-center">
                            <input type="checkbox" id="selectAllProducts" aria-checked="false" aria-disabled="false" tabindex="0" role="checkbox"
                                   aria-label="Click here to select all products" ${sessionScope.statusallcart == 'selected' ? 'checked' : ''}>
                            :Chọn Tất Cả (${countcartitem})
                            <button class="btn btn-link" onclick="document.getElementById('deleteCartForm').submit();">Xóa</button>

                        </div>
                        <form id="deleteCartForm" action="${pageContext.request.contextPath}/DeleteCartItem" method="get" style="display:none;">
                            <input type="hidden" name="cartid" value="${cartdetail.cartItem.id}">
                        </form>
                        <div class="d-flex align-items-center">
                            <div class="d-flex me-3">
                                <div>Tổng thanh toán (${countcartitemselected} Sản phẩm):</div>
                                <div class="fw-bold">${sumtotalprice}</div>
                            </div>
                            <form id="deleteCartForm" action="${pageContext.request.contextPath}/DeleteCartItem" method="get" style="display:none;">
                                <input type="hidden" name="cartid" value="${cartdetail.cartItem.id}">
                            </form>
                            <a href="${pageContext.request.contextPath}/CartContact" class="btn btn-primary" >Mua hàng</a>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <c:choose>
            <c:when test="${sessionScope.moreproduct ne null}">
                <section class="section section-collection">
                    <div class="wrapper-heading-home text-center">
                        <div class="container">

                            <div class="site-animation">
                                <h2>
                                    <a href="/collections/uu-dai">

                                        Các Sản Phẩm Của --${sessionScope.brand}--${sessionScope.category}

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

                            <c:forEach items="${sessionScope.moreproduct}" var="product">
                                <div class="col-md-3 col-sm-6 col-xs-6 pro-loop col-4">
                                    <div class="product-block product-resize site-animation single-product">
                                        <div class="product-img fade-box">
                                            <c:forEach items="${requestScope.saleOffList}" var="saleoff">
                                                <c:if test="${saleoff != null && saleoff.product_id != null && saleoff.product_id == product.id}">
                                                    <c:choose>
                                                        <c:when test="${saleoff.getSaleoffvalue() != null && saleoff.getSaleoffvalue() != 0}">
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
                                            <a href="#"
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
                                                        <c:forEach items="${requestScope.saleList}" var="saleoff">
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

                                                        <div>Số lượng: ${product.getQuantity()}</div>
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
            </c:when>
            <c:otherwise>
                <%@ include file="HomeProduct.jsp" %>
            </c:otherwise>
        </c:choose>


        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
                                function updateQuantity(index, change, maxquantity, pricePerItem) {
                                    var quantityInput = document.getElementById("quantityInput" + index);
                                    var oldQuantity = parseInt(quantityInput.value);
                                    var quantity = parseInt(quantityInput.value) + change;
                                    if (quantity < 1)
                                        quantity = 1;
                                    if (quantity > maxquantity)
                                        quantity = maxquantity;
                                    quantityInput.value = quantity;
                                    document.getElementById("quantity" + index).value = quantity;

                                    // Calculate the total price and set it in the hidden input
                                    var totalPrice = pricePerItem / oldQuantity * quantity;
                                    document.getElementById("totalPrice" + index).value = totalPrice;

                                    // Submit the form
                                    document.getElementById("updateCartForm" + index).submit();
                                }
                                document.getElementById('selectAllProducts').addEventListener('change', function () {
                                    var checkboxes = document.querySelectorAll('.product-checkbox');
                                    checkboxes.forEach((checkbox, index) => {
                                        checkbox.checked = this.checked;

                                    });
                                    const form = document.getElementById('UpdateAllStatusCart');
                                    const statusInput = document.getElementById('statusInput');
                                    if (this.checked) {
                                        statusInput.value = 'selected';
                                    } else {
                                        statusInput.value = 'unselected';
                                    }
                                    form.submit();
                                });

                                document.addEventListener('DOMContentLoaded', (event) => {
                                    document.querySelectorAll('.product-checkbox').forEach((checkbox, index) => {
                                        checkbox.addEventListener('change', function () {
                                            const form = document.getElementById('statusForm' + index);
                                            const statusInput = document.getElementById('statusInput' + index);
                                            if (this.checked) {
                                                statusInput.value = 'selected';
                                            } else {
                                                statusInput.value = 'unselected';
                                            }
                                            form.submit();
                                        });
                                    });
                                });

                                document.addEventListener('DOMContentLoaded', (event) => {
                                    // Lấy tất cả các form với class 'status-form' và gửi form với status 'unselect'
                                    document.querySelectorAll('.status-form').forEach((form) => {
                                        const statusInput = form.querySelector('input[name="status"]');
                                        statusInput.value = 'unselected';
                                        form.submit();
                                    });
                                });

                                document.getElementById('myLink').addEventListener('click', function (event) {
                                    event.preventDefault(); // Ngăn chặn hành động mặc định của liên kết
                                    document.getElementById('myDiv').style.display = 'none'; // Làm cho thẻ div biến mất

                                });

        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>