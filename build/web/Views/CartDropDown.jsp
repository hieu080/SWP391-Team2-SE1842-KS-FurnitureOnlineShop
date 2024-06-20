<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

        <!-- CSS của riêng bạn -->
        <link rel="stylesheet" href="css/style.css">
        <style>
            .a {
                background-color: #f8f9fa;
                border: 1px solid #e0e0e0;
                border-radius: 0.25rem;
                padding: 10px;
                width: 450px; /* Đã thay đổi kích thước dropdown */
                position: relative; /* Để có thể sử dụng vị trí tuyệt đối cho con */

            }

            .box-triangle {
                position: absolute;
                top: -10px;
                left: 50%;
                transform: translateX(-50%); /* Căn chỉnh tam giác ở giữa */
            }
            .box-triangle svg {
                display: block;
                margin: auto;
                width: 20px;
                height: auto;
            }
            .titlebox {
                font-size: 1.25rem;
                font-weight: bold;
                margin-bottom: 10px;
                text-align: center;
            }
            .cart-scroll {
                max-height: 200px;
                overflow-y: auto;
            }
            .list-item {
                border-bottom: 1px solid #e0e0e0;
                padding: 10px 0;
            }
            .item {

                align-items: center; /* Căn giữa các phần tử con */
            }
            .img {
                width: 80px; /* Độ rộng cố định cho hình ảnh */
            }
            .img img {
                width: 100%; /* Đảm bảo hình ảnh trong đầy đủ khung */
                height: auto;
            }
            .pro-title-view {
                font-weight: bold;
                color: #007bff;
                text-decoration: none;
            }
            .pro-title-view:hover {
                text-decoration: underline;
            }
            .pro-price-view {
                color: #dc3545;
                font-weight: bold;
                margin-right: 5px;
            }
            .cart_mini_compare {
                color: #6c757d;
                text-decoration: line-through;
                margin-right: 5px;
            }
            .remove-cart {
                color: #dc3545;
                cursor: pointer;
            }
            .line {
                border-top: 1px solid #e0e0e0;
                margin: 10px 0;
            }
            .table-total {
                width: 100%;
            }
            .btn-linktocart a {
                display: block;
                width: 100%;
                text-align: center;
                padding: 5px 0;
                background-color: #007bff;
                color: #fff;
                text-decoration: none;
                border-radius: 0.25rem;
            }
            .btn-linktocart a:hover {
                background-color: #0056b3;
            }
            .triangle {
                position: absolute;
                top: -10px;
                right: 20px;
                width: 0;
                height: 0;
                border: 1px solid rgba(0, 0, 0, .15);
            }

        </style>
    </head>
    <body>

        <div class="a dropdown-menu" aria-labelledby="dropdownMenuLink" style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(-300px, 42px);">
            <div class="triangle"></div>
            <span class="box-triangle">
                <svg viewBox="0 0 20 9">
                <path d="M.47108938 9c.2694725-.26871321.57077721-.56867841.90388257-.89986354C3.12384116 6.36134886 5.74788116 3.76338565 9.2467995.30653888c.4145057-.4095171 1.0844277-.40860098 1.4977971.00205122L19.4935156 9H.47108938z" fill="#ffffff"></path>
                </svg>
            </span>
            <div class="site-nav-container">
                <p class="titlebox">Giỏ hàng</p>
                <div class="cart-view clearfix container">
                    <div class="cart-scroll">
                        <table id="cart-view" class="table table-hover">
                            <tbody>
                                <c:forEach items="${listcartdetail}" var="cartdetail" varStatus="status">
                                    <tr class="list-item">
                                        <td class="img"><a href="/products/ghe-an-go-cao-su-tu-nhien-moho-vline-601" title="${cartdetail.product.name}"><img src="image/product/${cartdetail.product.image}" alt="" class="img-fluid"></a></td>
                                        <td class="item">
                                            <div><a class="pro-title-view" href="/products/ghe-an-go-cao-su-tu-nhien-moho-vline-601" title="${cartdetail.product.name}">${cartdetail.product.name}</a></div>
                                            <div><span class="variant">${cartdetail.color.colorname}</span></div>
                                            <div><span class="pro-quantity-view">Số lượng: ${cartdetail.cartItem.quantity}</span> </div>
                                            <div> <c:set var="hasSale" value="false" />
                                                <c:forEach items="${requestScope.saleOffList}" var="saleoff">
                                                    <c:if test="${saleoff.product_id == cartdetail.product.id}">
                                                        <c:set var="hasSale" value="true" />
                                                        <c:choose>
                                                            <c:when test="${saleoff.getSaleoffvalue() == 0}">
                                                                <span class="pro-price-view">${cartdetail.product.price}₫/1 sản phẩm</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="pro-price-view">${cartdetail.product.price - cartdetail.product.price * saleoff.getSaleoffvalue() / 100}₫/1 sản phẩm </span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:if>
                                                </c:forEach>
                                                <del class="cart_mini_compare">${cartdetail.product.price}₫</del>

                                            </div>

                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <span class="line"></span>
                    <table class="table-total">
                        <tbody>
                            <tr>
                                <td class="text-left">TỔNG TIỀN:</td>
                                <td class="text-right" id="total-view-cart">${sumtotalprice}₫</td>
                            </tr>
                            <tr class="btn-linktocart">
                                <td colspan="2"><a href="${pageContext.request.contextPath}/CartDetail" class="linktocart button dark">Xem giỏ hàng</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Bootstrap 5 JS bundle (includes Popper.js and Bootstrap JS) -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
