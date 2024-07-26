<%-- Document : HomeSlider Created on : May 23, 2024, 12:46:07 AM Author : ADMIN --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang Chủ</title>
        <link rel="icon" href="image/logoshop.png" type="image/png">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
            .dropdown-menu {
                min-width: 300px;
                padding: 0;
                overflow: hidden;
            }
            .dropdown-menu .p-3 {
                padding: 16px;
            }
            .text-center h2 {
                margin: 0 0 10px;
            }
            .list-unstyled {
                list-style: none;
                padding: 0;
                margin: 0;
            }
            .list-unstyled li {
                padding: 10px 0;
                border-bottom: 1px solid #eee;
            }
            .list-unstyled li:last-child {
                border-bottom: none;
            }
            .dropdown-item {
                color: #007bff;
                text-decoration: none;
                font-size: 14px;
            }
            .dropdown-item:hover {
                text-decoration: underline;
                background-color: transparent;
            }
        </style>
        <style>
            .dropdown-menu {
                display: none;
                position: absolute;
                background-color: white;
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
                z-index: 1;
                width: 200px;
            }
            .dropdown-menu.show {
                display: block;
            }
            .dropdown-menu .p-3 {
                padding: 16px;
            }
            .box-icon, .icon-box-text {
                display: inline-block;
                vertical-align: middle;
            }
            .box-icon svg, .box-icon--close svg {
                width: 24px;
                height: 24px;
            }
            .box {
                padding: 20px;
                border: 1px solid #ccc;
                margin-top: 10px;
                display: none;
                background-color: white;
                position: absolute;
                z-index: 1000;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
                margin-left: -40px
            }
        </style>
    </head>

    <body>
        <header id="site-header" class="main-header mainHeader_temp03 ">



            <div class="header-middle">
                <div class="container">
                    <div class="flexContainer-header row-flex flexAlignCenter">

                        <div class="header-upper-logo">
                            <div class="text-center fade-box">
                                <a href="#" itemprop="url" aria-label="logo">
                                    <img itemprop="logo" loading="lazy" decoding="async"
                                         src="image/logoshop.png"
                                         alt="Nội Thất MOHO"
                                         style="height: 70px; width: 90px;" />
                                </a>
                            </div>
                        </div>

                        <div class="header-upper-search-top hidden-xs hidden-sm">
                            <div class="header-search">
                                <div class="search-box wpo-wrapper-search">
                                    <form id="searchForm" action="${pageContext.request.contextPath}/ProductSearchServlet" class="searchform searchform-categoris ultimate-search" method="get">
                                        <div class="wpo-search-inner">
                                            <input type="hidden" name="action" value="search" />
                                            <input required id="inputSearchAuto" name="search" maxlength="40" autocomplete="off"
                                                   class="searchinput input-search search-input" type="text" size="20"
                                                   placeholder="Tìm kiếm sản phẩm...">
                                        </div>
                                        <button type="submit" class="btn-search" title="Tìm kiếm">
                                            <svg version="1.1" class="svg search" xmlns="http://www.w3.org/2000/svg"
                                                 xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                 viewBox="0 0 24 27" style="enable-background:new 0 0 24 27;"
                                                 xml:space="preserve">
                                            <path
                                                d="M10,2C4.5,2,0,6.5,0,12s4.5,10,10,10s10-4.5,10-10S15.5,2,10,2z M10,19c-3.9,0-7-3.1-7-7s3.1-7,7-7s7,3.1,7,7S13.9,19,10,19z">
                                            </path>
                                            <rect x="17" y="17"
                                                  transform="matrix(0.7071 -0.7071 0.7071 0.7071 -9.2844 19.5856)"
                                                  width="4" height="8"></rect>
                                            </svg>
                                        </button>
                                    </form>
                                    <div id="ajaxSearchResults" class="smart-search-wrapper ajaxSearchResults"
                                         style="display: none">
                                        <div class="resultsContent"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="header-upper-icon">
                            <div class="header-wrap-icon">
                                <div class="wrapper-search header-action">
                                    <a class="header-action-toggle" href="#" onclick="return false;" id="site-search-handle"
                                       aria-label="Tìm kiếm" title="Tìm kiếm">
                                        <span class="box-icon">
                                            <svg class="svg-ico-search" version="1.1" xmlns="http://www.w3.org/2000/svg"
                                                 x="0px" y="0px" viewBox="0 0 511.999 511.999"
                                                 style="enable-background:new 0 0 511.999 511.999;"
                                                 xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve">
                                            <path d="M508.874,478.708L360.142,329.976c28.21-34.827,45.191-79.103,45.191-127.309c0-111.75-90.917-202.667-202.667-202.667
                                                  S0,90.917,0,202.667s90.917,202.667,202.667,202.667c48.206,0,92.482-16.982,127.309-45.191l148.732,148.732
                                                  c4.167,4.165,10.919,4.165,15.086,0l15.081-15.082C513.04,489.627,513.04,482.873,508.874,478.708z M202.667,362.667
                                                  c-88.229,0-160-71.771-160-160s71.771-160,160-160s160,71.771,160,160S290.896,362.667,202.667,362.667z">
                                            </path>
                                            </svg>
                                            <span class="box-icon--close">
                                                <svg viewBox="0 0 19 19">
                                                <path
                                                    d="M9.1923882 8.39339828l7.7781745-7.7781746 1.4142136 1.41421357-7.7781746 7.77817459 7.7781746 7.77817456L16.9705627 19l-7.7781745-7.7781746L1.41421356 19 0 17.5857864l7.7781746-7.77817456L0 2.02943725 1.41421356.61522369 9.1923882 8.39339828z"
                                                    fill="currentColor" fill-rule="evenodd"></path>
                                                </svg>
                                            </span>
                                        </span>
                                    </a>
                                    <div class="header_dropdown_content site_search">
                                        <span class="box-triangle">
                                            <svg viewBox="0 0 20 9">
                                            <path
                                                d="M.47108938 9c.2694725-.26871321.57077721-.56867841.90388257-.89986354C3.12384116 6.36134886 5.74788116 3.76338565 9.2467995.30653888c.4145057-.4095171 1.0844277-.40860098 1.4977971.00205122L19.4935156 9H.47108938z"
                                                fill="#ffffff"></path>
                                            </svg>
                                        </span>
                                        <!--                                        <div class="site-nav-container">
                                                                                    <p class="titlebox">Tìm kiếm</p>
                                                                                    <div class="wpo-wrapper-search">
                                                                                        <form action="${pageContext.request.contextPath}/ProductServlet" method="post"
                                                                                              class="searchform searchform-categoris ultimate-search">
                                                                                            <div class="wpo-search-inner">
                                                                                                <input type="hidden" name="type" value="product" />
                                                                                                <input required id="inputSearchAuto-dk" name="search" maxlength="40"
                                                                                                       autocomplete="off" class="searchinput input-search search-input"
                                                                                                       type="text" size="20" placeholder="Tìm kiếm sản phẩm...">
                                                                                            </div>
                                                                                            <button type="submit" title="Tìm kiếm" class="btn-search"
                                                                                                    id="search-header-btn-dk">
                                                                                                <svg version="1.1" class="svg search"
                                                                                                     xmlns="http://www.w3.org/2000/svg"
                                                                                                     xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                                                                     viewBox="0 0 24 27" style="enable-background:new 0 0 24 27;"
                                                                                                     xml:space="preserve">
                                                                                                <path
                                                                                                    d="M10,2C4.5,2,0,6.5,0,12s4.5,10,10,10s10-4.5,10-10S15.5,2,10,2z M10,19c-3.9,0-7-3.1-7-7s3.1-7,7-7s7,3.1,7,7S13.9,19,10,19z">
                                                                                                </path>
                                                                                                <rect x="17" y="17"
                                                                                                      transform="matrix(0.7071 -0.7071 0.7071 0.7071 -9.2844 19.5856)"
                                                                                                      width="4" height="8"></rect>
                                                                                                </svg>
                                                                                            </button>
                                                                                        </form>
                                                                                        <div id="ajaxSearchResults-dk"
                                                                                             class="smart-search-wrapper ajaxSearchResults" style="display: none">
                                                                                            <div class="resultsContent"></div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>-->
                                    </div>
                                </div>


                                <div class="wrapper-account header-action">
                                    <c:choose>
                                        <c:when test="${not empty sessionScope.customer}">
                                            <a class="  dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span class="box-icon">
                                                    <svg class="svg-ico-account" version="1.1"
                                                         xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" viewBox="0 0 512 512"
                                                         style="enable-background:new 0 0 512 512;"
                                                         xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve">
                                                    <path d="M437.02,330.98c-27.883-27.882-61.071-48.523-97.281-61.018C378.521,243.251,404,198.548,404,148
                                                          C404,66.393,337.607,0,256,0S108,66.393,108,148c0,50.548,25.479,95.251,64.262,121.962
                                                          c-36.21,12.495-69.398,33.136-97.281,61.018C26.629,379.333,0,443.62,0,512h40c0-119.103,96.897-216,216-216s216,96.897,216,216
                                                          h40C512,443.62,485.371,379.333,437.02,330.98z M256,256c-59.551,0-108-48.448-108-108S196.449,40,256,40
                                                          c59.551,0,108,48.448,108,108S315.551,256,256,256z"></path>
                                                    </svg>
                                                    <span class="box-icon--close">
                                                        <svg viewBox="0 0 19 19">
                                                        <path
                                                            d="M9.1923882 8.39339828l7.7781745-7.7781746 1.4142136 1.41421357-7.7781746 7.77817459 7.7781746 7.77817456L16.9705627 19l-7.7781745-7.7781746L1.41421356 19 0 17.5857864l7.7781746-7.77817456L0 2.02943725 1.41421356.61522369 9.1923882 8.39339828z"
                                                            fill="currentColor" fill-rule="evenodd"></path>
                                                        </svg>
                                                    </span>
                                                </span>
                                                <span class="icon-box-text">
                                                    Tài khoản của
                                                    <span class="txtAcount">
                                                        <span>${sessionScope.customer.fullname}</span>
                                                        <i class="fa fa-angle-down" aria-hidden="true"></i>
                                                    </span>
                                                </span>
                                            </a>

                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                                <div class="p-3">
                                                    <div class="text-center">
                                                        <h2>Thông tin tài khoản</h2>
                                                    </div>
                                                    <ul class="list-unstyled">
                                                        <li style="font-size: 14px"><span>${sessionScope.customer.fullname}</span></li>
                                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/UserProfile">Tài khoản của bạn</a></li>
                                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/MyOrderServlet">Đơn hàng của tôi</a></li>
                                                        <li><a class="dropdown-item" href="#" id="openModal">Thay đổi mật khẩu</a></li>
                                                            <%@ include file="ChangePassword.jsp" %>


                                                        <div id="exampleModal" class="modal">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title">Thay Đổi Mật Khẩu</h5>
                                                                        <span class="close" id="closeModal">&times;</span>
                                                                    </div>
                                                                    <form id="changePasswordForm">
                                                                        <div class="modal-body">
                                                                            <div class="form-group">
                                                                                <input type="password" class="form-control" id="oldpass" placeholder="Mật khẩu cũ" name="oldpass" required>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <input type="password" class="form-control" id="newpass" name="newpass" placeholder="Mật khẩu mới" required 
                                                                                       pattern="(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}"
                                                                                       title="Mật khẩu phải có ít nhất 8 ký tự, bao gồm ít nhất một chữ hoa, một số và một ký tự đặc biệt.">
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <input type="password" class="form-control" id="renewpass" name="renewpass" placeholder="Nhập lại mật khẩu mới" required 
                                                                                       pattern="(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}"
                                                                                       title="Mật khẩu phải có ít nhất 8 ký tự, bao gồm ít nhất một chữ hoa, một số và một ký tự đặc biệt.">
                                                                            </div>
                                                                            <div class="form-check">
                                                                                <input type="checkbox" class="form-check-input" id="togglePasswords" onclick="togglePasswordVisibility()">
                                                                                <label class="form-check-label" for="togglePasswords">Hiển thị mật khẩu</label>
                                                                            </div>
                                                                            <div class="form-group text-danger">
                                                                                <p id="errorMessage">${mess}</p>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" id="closeModalFooter">Close</button>
                                                                            <button type="submit" class="btn btn-primary">Lưu</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>



                                                        <c:set value="${sessionScope.customer}" var="customer"/>
                                                        <c:if test="${customer.role_id == 2}">
                                                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/SaleDashboard">Sale Dashboard</a></li>
                                                            </c:if>
                                                            <c:if test="${customer.role_id == 3}">
                                                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/SaleDashboard">Sale Dashboard</a></li>
                                                            </c:if>
                                                            <c:if test="${customer.role_id == 4}">
                                                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/MarketingDashboard">Marketing Dashboard</a></li>
                                                            </c:if>
                                                            <c:if test="${customer.role_id == 5}">
                                                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/AdminDashboard">Admin Dashboard</a></li>
                                                            </c:if>
                                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/LogoutServlet">Đăng xuất</a></li>
                                                    </ul>
                                                </div>
                                            </div>

                                        </c:when>

                                        <c:otherwise>
                                            <a  href="#" onclick="toggleBoxes(event)"
                                                aria-label="Đăng nhập / Đăng ký Tài khoản của tôi">
                                                <span class="box-icon">
                                                    <svg class="svg-ico-account" version="1.1"
                                                         xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" viewBox="0 0 512 512"
                                                         style="enable-background:new 0 0 512 512;"
                                                         xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve">
                                                    <path d="M437.02,330.98c-27.883-27.882-61.071-48.523-97.281-61.018C378.521,243.251,404,198.548,404,148
                                                          C404,66.393,337.607,0,256,0S108,66.393,108,148c0,50.548,25.479,95.251,64.262,121.962
                                                          c-36.21,12.495-69.398,33.136-97.281,61.018C26.629,379.333,0,443.62,0,512h40c0-119.103,96.897-216,216-216s216,96.897,216,216
                                                          h40C512,443.62,485.371,379.333,437.02,330.98z M256,256c-59.551,0-108-48.448-108-108S196.449,40,256,40
                                                          c59.551,0,108,48.448,108,108S315.551,256,256,256z"></path>
                                                    </svg>
                                                    <span class="box-icon--close">
                                                        <svg viewBox="0 0 19 19">
                                                        <path
                                                            d="M9.1923882 8.39339828l7.7781745-7.7781746 1.4142136 1.41421357-7.7781746 7.77817459 7.7781746 7.77817456L16.9705627 19l-7.7781745-7.7781746L1.41421356 19 0 17.5857864l7.7781746-7.77817456L0 2.02943725 1.41421356.61522369 9.1923882 8.39339828z"
                                                            fill="currentColor" fill-rule="evenodd"></path>
                                                        </svg>
                                                    </span>
                                                </span>

                                                <span class="icon-box-text">
                                                    Đăng nhập / Đăng ký
                                                    <span class="txtAcount">Tài khoản của tôi <i class="fa fa-angle-down"
                                                                                                 aria-hidden="true"></i>
                                                    </span>
                                                </span>
                                            </a>
                                            <%@ include file="ForgetPassword.jsp" %>
                                            <%@ include file="ResetPassword.jsp" %>
                                            <%@ include file="Register.jsp" %>
                                            <%@ include file="Login.jsp" %>

                                        </c:otherwise>
                                    </c:choose>




                                </div>
                                <div class="wrapper-cart header-action">
                                    <c:choose>
                                        <c:when test="${sessionScope.customer != null}">
                                            <%@ include file="CartDropDown.jsp" %>


                                        </c:when>
                                        <c:otherwise>
                                            <a class="header-action-toggle" href="#"  onclick="showlogin()" id="site-cart-handle-sucess" aria-label="3 Giỏ hàng">
                                                <span class="box-icon">
                                                    <svg class="svg-ico-cart" enable-background="new 0 0 512 512" height="512"
                                                         viewBox="0 0 512 512" width="512" xmlns="http://www.w3.org/2000/svg">
                                                    <g>
                                                    <path
                                                        d="m472 452c0 11.046-8.954 20-20 20h-20v20c0 11.046-8.954 20-20 20s-20-8.954-20-20v-20h-20c-11.046 0-20-8.954-20-20s8.954-20 20-20h20v-20c0-11.046 8.954-20 20-20s20 8.954 20 20v20h20c11.046 0 20 8.954 20 20zm0-312v192c0 11.046-8.954 20-20 20s-20-8.954-20-20v-172h-40v60c0 11.046-8.954 20-20 20s-20-8.954-20-20v-60h-192v60c0 11.046-8.954 20-20 20s-20-8.954-20-20v-60h-40v312h212c11.046 0 20 8.954 20 20s-8.954 20-20 20h-232c-11.046 0-20-8.954-20-20v-352c0-11.046 8.954-20 20-20h60.946c7.945-67.477 65.477-120 135.054-120s127.109 52.523 135.054 120h60.946c11.046 0 20 8.954 20 20zm-121.341-20c-7.64-45.345-47.176-80-94.659-80s-87.019 34.655-94.659 80z">
                                                    </path>
                                                    </g>
                                                    </svg>
                                                    <span class="box-icon--close">
                                                        <svg viewBox="0 0 19 19">
                                                        <path
                                                            d="M9.1923882 8.39339828l7.7781745-7.7781746 1.4142136 1.41421357-7.7781746 7.77817459 7.7781746 7.77817456L16.9705627 19l-7.7781745-7.7781746L1.41421356 19 0 17.5857864l7.7781746-7.77817456L0 2.02943725 1.41421356.61522369 9.1923882 8.39339828z"
                                                            fill="currentColor" fill-rule="evenodd"></path>
                                                        </svg>
                                                    </span>
                                                    <span class="box-text">
                                                        <span class="count-holder">0</span>
                                                    </span>
                                                </span>
                                                <span class="icon-box-text">Giỏ hàng</span>
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <div class="dangongu">

                                    <a href="#" data-lang="en" class="social-network lang_en handle_lang"><img
                                            loading="lazy" decoding="async"
                                            style="vertical-align: middle;margin-bottom:4px;width: 22px;"
                                            src="//theme.hstatic.net/200000065946/1001187274/14/en.jpg?v=582"
                                            alt="Tiếng Anh" /></a>

                                </div>

                            </div>


                        </div>
                    </div>
                </div>
            </div>
            <div class="header-menu-desktop menu-desktop hidden-xs hidden-sm">
                <div class="container">
                    <div class="header-nav-menu">
                        <div class="wrap-logo wrap-logo-sticky">

                            <a href="#" aria-label="logo">
                                <img loading="lazy" decoding="async"
                                     src="//theme.hstatic.net/200000065946/1001187274/14/logo.png?v=582"
                                     alt="Nội Thất MOHO" />
                            </a>

                        </div>
                        <div id="main-nav-menu" style="display: flex; justify-content: center">
                            <nav class="navbar-mainmenu">
                                <ul class="menuList-main">


                                    <li class="has-submenu  levl-1">
                                        <a href="${pageContext.request.contextPath}/HomePage" title="Trang chủ">
                                            Trang chủ



                                            <label class="menu__label"></label>
                                            <i class="fa fa-chevron-down" aria-hidden="true"></i>
                                        </a>


                                    </li>
                                    <li class="has-submenu  levl-1">
                                        <a href="${pageContext.request.contextPath}/ProductServlet" title="Sản Phẩm">
                                            Sản Phẩm

                                            <label class="menu__label">NEW</label>
                                            <i class="fa fa-chevron-down" aria-hidden="true"></i>
                                        </a>
                                        <ul class="menuList-submain level-1">
                                            <c:forEach items="${categoryList}" var="category">

                                                <li class="">
                                                    <a href="${pageContext.request.contextPath}/ProductServlet?action=showCategory&id=${category.id}" title="${category.category}">
                                                        ${category.category}
                                                    </a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </li>

                                    <li class="has-submenu  levl-1">
                                        <a href="ProductServlet" title="Thương Hiệu">
                                            Thương Hiệu


                                            <label class="menu__label"></label>
                                            <i class="fa fa-chevron-down" aria-hidden="true"></i>
                                        </a>
                                        <ul class="menuList-submain level-1">
                                            <c:forEach items="${brandList}" var="brand">

                                                <li class="">
                                                    <a href="${pageContext.request.contextPath}/ProductServlet?action=showBrand&id=${brand.id}" title="${brand.brandname}">
                                                        ${brand.brandname}
                                                    </a>
                                                </li>
                                            </c:forEach>
                                        </ul>

                                    </li>

                                    <li class="has-submenu  levl-1">
                                        <a href="ProductServlet" title="Khuyến Mãi">
                                            Phòng

                                            <label class="menu__label"></label>
                                            <i class="fa fa-chevron-down" aria-hidden="true"></i>
                                        </a>

                                        <ul class="menuList-submain level-1">
                                            <c:forEach items="${roomList}" var="room">
                                                <li class="">
                                                    <a href="${pageContext.request.contextPath}/ProductServlet?action=showRoom&id=${room.id}">
                                                        ${room.roomname}
                                                    </a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </li>

                                    <li class="has-submenu  levl-1">
                                        <a href="${pageContext.request.contextPath}/BlogListServlet" title="Tin tức">
                                            Tin tức



                                            <label class="menu__label"></label>
                                            <i class="fa fa-chevron-down" aria-hidden="true"></i>
                                        </a>
                                        <ul class="menuList-submain level-1">

                                            <c:forEach items="${categoryOfPostList}" var="categoryOfPost">
                                                <li class="">
                                                    <a href="${pageContext.request.contextPath}/BlogListServlet?category=${categoryOfPost.getId()}">
                                                        ${categoryOfPost.category}
                                                    </a>
                                                </li>
                                            </c:forEach>

                                        </ul>

                                    </li>

                                    <li class="has-submenu  levl-1">
                                        <a href="#" title="Dịch Vụ">
                                            Dịch Vụ


                                            <label class="menu__label"></label>
                                            <i class="fa fa-chevron-down" aria-hidden="true"></i>
                                        </a>

                                        <ul class="menuList-submain level-1">

                                            <c:forEach items="${pageList}" var="page">

                                                <li class="">
                                                    <a href="PageServlet?pageID=${page.id}" title="Chính Sách Bán Hàng">
                                                        ${page.name}
                                                    </a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </li>
                                    <li class="">
                                        <!--			<a href="/pages/brand-story" title="About Us"  > -->
                                        <a href="AboutUsServlet" title="About Us">
                                            About Us
                                            <label class="menu__label"></label>
                                        </a>
                                    </li>

                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                function toggleBoxes(event) {
                    event.preventDefault();
                    var box1 = document.getElementById('box1');
                    var box2 = document.getElementById('box2');

                    if (box1.style.display === 'none' && box2.style.display === 'none') {
                        box1.style.display = 'block';
                    } else {
                        box1.style.display = 'none';
                        box2.style.display = 'none';
                    }
                }

                function toggleDiv(showId, hideId) {
                    var showDiv = document.getElementById(showId);
                    var hideDiv = document.getElementById(hideId);

                    // Show the clicked div
                    showDiv.style.display = 'block';
                    // Hide the other div
                    hideDiv.style.display = 'none';
                }
                function showlogin() {
                    var box1 = document.getElementById('box1');
                    box1.style.display = 'block';
                }
            </script>
        </header>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var toggle = document.getElementById('dropdownMenuLink');
                var menu = document.querySelector('.dropdown-menu');

                toggle.addEventListener('click', function (event) {
                    event.preventDefault();
                    menu.classList.toggle('show');
                });

                // Close dropdown if clicked outside
                window.addEventListener('click', function (event) {
                    if (!toggle.contains(event.target) && !menu.contains(event.target)) {
                        menu.classList.remove('show');
                    }
                });
            });

//            $(document).ready(function () {
//                var searchInput = $('#inputSearchAuto');
//                var searchForm = $('#searchForm');
//                var resultsWrapper = $('#ajaxSearchResults');
//                var resultsContent = $('.resultsContent');
//                var typingTimer; // Timer identifier
//                var doneTypingInterval = 500; // Time in ms (500 ms)
//
//                // Function to handle the AJAX request
//                function submitSearch() {
//                    var searchData = searchInput.val().trim(); // Lấy giá trị của input và loại bỏ khoảng trắng đầu cuối
//
//                    // Kiểm tra nếu có giá trị trong input search
//                    if (searchData !== '') {
//                        $.ajax({
//                            type: 'POST', // Sử dụng phương thức POST
//                            url: searchForm.attr('action'), // Lấy địa chỉ URL từ thuộc tính action của form
//                            data: searchForm.serialize(), // Dữ liệu gửi đi là dữ liệu từ form đã được serialize
//                            success: function (response) {
//                                resultsWrapper.css('display', 'block'); // Hiển thị div lớn
//                                resultsContent.html(response); // Gán giá trị response vào resultContent
//                                console.log(response);
//                            },
//                            error: function (xhr, status, error) {
//                                console.error("Error: " + error);
//                            }
//                        });
//                    } else {
//                        resultsWrapper.css('display', 'none'); // Ẩn kết quả khi không có giá trị trong input
//                    }
//                }
//
//                // Bắt sự kiện khi thay đổi giá trị của input tìm kiếm
//                searchInput.on('input', function () {
//                    clearTimeout(typingTimer); // Clear the previous timer
//                    typingTimer = setTimeout(submitSearch, doneTypingInterval); // Set a new timer
//                });
//
//                // Bắt sự kiện khi click submit form
//                $('.btn-search').on('click', function () {
//                    resultsWrapper.css('display', 'none'); // Ẩn kết quả khi click vào nút tìm kiếm
//                    searchForm.submit();
//                });
//            });

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
            $(document).ready(function () {
                $('#openModal').on('click', function () {
                    $('#exampleModal').fadeIn();
                });

                $('#closeModal, #closeModalFooter').on('click', function () {
                    $('#exampleModal').fadeOut();
                });

                $(window).on('click', function (event) {
                    if ($(event.target).is('#exampleModal')) {
                        $('#exampleModal').fadeOut();
                    }
                });

                $('#changePasswordForm').on('submit', function (event) {
                    event.preventDefault(); // Prevent the default form submission

                    $.ajax({
                        url: '${pageContext.request.contextPath}/ChangePassword',
                        type: 'POST',
                        data: $(this).serialize(), // Serialize form data

                        success: function (data) {
                            if (data.status === 'error') {
                                $('#errorMessage').text(data.message);
                            } else {
                                $('#errorMessage').text(''); // Clear previous errors
                                alert(data.message); // Show success message or handle it as needed
                                $('#exampleModal').fadeOut();
                                location.reload();// Close the modal
                            }
                        },
                        error: function (xhr, status, error) {
                            console.error('Error:', error);
                            $('#errorMessage').text('Có lỗi xảy ra. Vui lòng thử lại.');
                        }
                    });
                });
            });

            function togglePasswordVisibility() {
                var passwordFields = $('input[type="password"]');
                passwordFields.each(function () {
                    $(this).attr('type', $(this).attr('type') === 'password' ? 'text' : 'password');
                });
            }
        </script>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>

</html>
