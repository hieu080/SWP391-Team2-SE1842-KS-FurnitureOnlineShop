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

        <!-- Banner trang chủ -->


        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>

</html>