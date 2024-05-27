<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="//theme.hstatic.net/200000065946/1001187274/14/favicon.png?v=582"
              type="image/png" />
        <title>Tất Cả Sản Phẩm Đồ Gỗ Nội Thất Của MOHO</title>
        <meta name="description"
              content="Nội Thất MOHO an toàn sức khỏe, chất lượng quốc tế với nhiều đồ gỗ nội thất hiện đại cho phòng khách, phòng ăn, phòng ngủ, phòng làm việc, văn phòng và tủ bếp." />
        <link rel="preload" as="image" fetchpriority="low"
              href="//theme.hstatic.net/200000065946/1001187274/14/logo.png?v=582">

        <!--+++++++++++++++++++++++++  CSS ++++++++++++++++++++++++-->
        <link rel="preload stylesheet" as="style" fetchpriority="low"
              href="//theme.hstatic.net/200000065946/1001187274/14/plugins.css?v=582">
        <link rel="preload stylesheet" as="style" fetchpriority="low"
              href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
        <link rel="preload stylesheet" as="style" fetchpriority="low"
              href="//theme.hstatic.net/200000065946/1001187274/14/styles.css?v=582">
        <link rel="preload stylesheet" as="style" fetchpriority="low"
              href="//theme.hstatic.net/200000065946/1001187274/14/style-theme.scss.css?v=582">

        <script defer fetchpriority="low" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <script defer fetchpriority="low" src="//theme.hstatic.net/200000065946/1001187274/14/scripts.js?v=582"></script>
        <script defer src="https://anhnoi-haravan.s3-ap-southeast-1.amazonaws.com/static/js/mainScript.js"></script>


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


    </head>

    <body id="nội-thất-moho" class="collection">
        <div class="main-body  layoutProduct_scroll ">
            <header id="site-header" class="main-header mainHeader_temp03 ">

                <div class="topbar">
                    <div class="container">
                        <div class="top-bar-content text-center">
                            <p>Furniture miễn phí giao hàng & lắp đặt tại TP.HCM, Hà Nội</p>

                        </div>
                    </div>
                </div>

                <div class="header-middle">
                    <div class="container">
                        <div class="flexContainer-header row-flex flexAlignCenter">
                            <div class="header-upper-menu-mobile header-action hidden-md hidden-lg">
                                <div class="header-action-toggle site-handle" id="site-menu-handle">
                                    <span class="hamburger-menu" aria-hidden="true">
                                        <span class="bar"></span>
                                    </span>
                                </div>
                                <div class="header_dropdown_content site_menu_mobile">
                                    <span class="box-triangle">
                                        <svg viewBox="0 0 20 9">
                                        <path
                                            d="M.47108938 9c.2694725-.26871321.57077721-.56867841.90388257-.89986354C3.12384116 6.36134886 5.74788116 3.76338565 9.2467995.30653888c.4145057-.4095171 1.0844277-.40860098 1.4977971.00205122L19.4935156 9H.47108938z"
                                            fill="#ffffff"></path>
                                        </svg>
                                    </span>
                                </div>

                            </div>
                            <div class="header-upper-logo">
                                <div class="wrap-logo text-center fade-box">


                                    <a href="#" itemprop="url" aria-label="logo">
                                        <img itemprop="logo" loading="lazy" decoding="async"
                                             src="images\furniture-high-resolution-logo-transparent.png"
                                             alt="Nội Thất Furniture" />
                                    </a>


                                </div>
                            </div>
                            <div class="header-upper-search-top hidden-xs hidden-sm">
                                <div class="header-search">
                                    <div class="search-box wpo-wrapper-search">
                                        <form action="ProductServlet" method="post" class="searchform searchform-categoris ultimate-search">
                                            <div class="wpo-search-inner">
                                                <input required id="inputSearchAuto" name="search" maxlength="40" autocomplete="off" class="searchinput input-search search-input" type="text" size="20" placeholder="Tìm kiếm sản phẩm...">
                                            </div>
                                            <button type="submit" class="btn-search" title="Tìm kiếm">
                                                <svg version="1.1" class="svg search" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 24 27" style="enable-background:new 0 0 24 27;" xml:space="preserve">
                                                <path d="M10,2C4.5,2,0,6.5,0,12s4.5,10,10,10s10-4.5,10-10S15.5,2,10,2z M10,19c-3.9,0-7-3.1-7-7s3.1-7,7-7s7,3.1,7,7S13.9,19,10,19z"></path>
                                                <rect x="17" y="17" transform="matrix(0.7071 -0.7071 0.7071 0.7071 -9.2844 19.5856)" width="4" height="8"></rect>
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
                                        <a class="header-action-toggle" href="#" onclick="return false;"
                                           id="site-search-handle" aria-label="Tìm kiếm" title="Tìm kiếm">
                                            <span class="box-icon">
                                                <svg class="svg-ico-search" version="1.1" xmlns="http://www.w3.org/2000/svg"
                                                     x="0px" y="0px" viewBox="0 0 511.999 511.999"
                                                     style="enable-background:new 0 0 511.999 511.999;"
                                                     xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve">
                                                <path
                                                    d="M508.874,478.708L360.142,329.976c28.21-34.827,45.191-79.103,45.191-127.309c0-111.75-90.917-202.667-202.667-202.667
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
                                            <div class="site-nav-container">
                                                <p class="titlebox">Tìm kiếm</p>
                                                <div class="wpo-wrapper-search">
                                                    <form action="/search"
                                                          class="searchform searchform-categoris ultimate-search">
                                                        <div class="wpo-search-inner">
                                                            <input type="hidden" name="type" value="product" />
                                                            <input required id="inputSearchAuto-dk" name="q" maxlength="40"
                                                                   autocomplete="off"
                                                                   class="searchinput input-search search-input" type="text"
                                                                   size="20" placeholder="Tìm kiếm sản phẩm...">
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
                                                         class="smart-search-wrapper ajaxSearchResults"
                                                         style="display: none">
                                                        <div class="resultsContent"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="wrapper-account header-action">
                                        <a class="header-action-toggle" href="#" id="site-account-handle"
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
                                                                                             aria-hidden="true"></i></span>
                                            </span>
                                        </a>
                                        <div class="header_dropdown_content site_account ">
                                            <span class="box-triangle">
                                                <svg viewBox="0 0 20 9">
                                                <path
                                                    d="M.47108938 9c.2694725-.26871321.57077721-.56867841.90388257-.89986354C3.12384116 6.36134886 5.74788116 3.76338565 9.2467995.30653888c.4145057-.4095171 1.0844277-.40860098 1.4977971.00205122L19.4935156 9H.47108938z"
                                                    fill="#ffffff"></path>
                                                </svg>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="wrapper-cart header-action">
                                        <a class="header-action-toggle" href="#" onclick="return false;"
                                           id="site-cart-handle" aria-label="0 Giỏ hàng">
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

                                <a href="https://moho.com.vn" aria-label="logo">
                                    <img loading="lazy" decoding="async"
                                         src="//theme.hstatic.net/200000065946/1001187274/14/logo.png?v=582"
                                         alt="Nội Thất MOHO" />
                                </a>
                            </div>
                            <div id="main-nav-menu">
                                <nav class="navbar-mainmenu">
                                    <ul class="menuList-main" style="    display: flex;
                                        justify-content: space-evenly;">
                                        <li class="has-submenu active levl-1">
                                            <a href="/collections/tat-ca-san-pham-moho" title="Trang chủ">
                                                Trang chủ
                                                <label class="menu__label"></label>
                                            </a>
                                        </li>
                                        <li class="has-submenu  levl-1">
                                            <a href="/collections/bo-suu-tap-moi" title="Sản phẩm">
                                                Sản phẩm
                                                <label class="menu__label">NEW</label>
                                            </a>
                                        </li>
                                        <li class="has-submenu  levl-1">
                                            <a href="/pages/kitchen" title="Thương hiệu">
                                                Thương hiệu
                                                <label class="menu__label"></label>
                                                <i class="fa fa-chevron-down" aria-hidden="true"></i>
                                            </a>
                                            <ul class="menuList-submain level-1">
                                                <c:forEach items="${requestScope.brandList}" var="brand">
                                                    <li>
                                                        <a href="#" title="${brand.brandName}">
                                                            ${brand.brandName}
                                                        </a>
                                                    </li>
                                                </c:forEach>

                                            </ul>
                                        </li>
                                        <li class="has-submenu  levl-1">
                                            <a href="/collections/uu-dai" title="Phòng">
                                                Phòng
                                                <label class="menu__label"></label>
                                                <i class="fa fa-chevron-down" aria-hidden="true"></i>
                                            </a>

                                            <ul class="menuList-submain level-1">
                                                <c:forEach items="${requestScope.roomList}" var="room">
                                                    <li>
                                                        <a href="#" title="${room.roomname}">
                                                            ${room.roomname}
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                        <li class="has-submenu  levl-1">
                                            <a href="/blogs/media" title="Blog">
                                                Blog
                                                <label class="menu__label"></label>
                                                <i class="fa fa-chevron-down" aria-hidden="true"></i>
                                            </a>
                                            <ul class="menuList-submain level-1">
                                                <li class="">
                                                    <a href="/blogs/media" title="Media">
                                                        Media
                                                    </a>
                                                </li>
                                                <li class="">
                                                    <a href="/blogs/news" title="News">
                                                        News
                                                    </a>
                                                </li>
                                                <li class="">
                                                    <a href="/blogs/people" title="People">
                                                        People
                                                    </a>
                                                </li>
                                                <li class="">
                                                    <a href="/blogs/inspiration" title="Inspiration">
                                                        Inspiration
                                                    </a>
                                                </li>
                                                <li class="">
                                                    <a href="/blogs/noi-that-ung-dung" title="Tips">
                                                        Tips
                                                    </a>
                                                </li>
                                                <li class="">
                                                    <a href="/blogs/kitchen" title="Kitchen">
                                                        Kitchen
                                                    </a>
                                                </li>
                                            </ul>
                                        </li>

                                        <li class="has-submenu  levl-1">
                                            <a href="#" title="Dịch Vụ">
                                                Dịch Vụ
                                                <label class="menu__label"></label>
                                                <i class="fa fa-chevron-down" aria-hidden="true"></i>
                                            </a>
                                            <ul class="menuList-submain level-1">
                                                <c:forEach items="${requestScope.pageList}" var="page">
                                                    <li>
                                                        <a href="#" title="${page.name}">
                                                            ${page.name}
                                                        </a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </li>

                                        <li class="">
                                            <!--			<a href="/pages/brand-story" title="About Us"  > -->
                                            <a href="/pages/brand-story" title="About Us">
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
            </header>

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

                                    <div class="container">
                                        <div class="wrap-collection-title">
                                            <div class="heading-collection row">
                                                <div class="col-md-9 col-sm-12 col-xs-12">
                                                    <h1 class="title">
                                                        Tất cả sản phẩm Furniture
                                                    </h1>

                                                    <div class="alert-no-filter"></div>

                                                </div>
                                                <div class="col-md-3 col-sm-12 col-xs-12">
                                                    <div class="collection_fillter_sortby">

                                                        <div class="collection_fillterby visible-xs visible-sm">
                                                            <div class="layer_filter-title box_style">
                                                                <p class="title_filter">
                                                                    <span class="icon_title"><svg viewBox="0 0 20 20">
                                                                        <path fill="none" stroke-width="2"
                                                                              stroke-linejoin="round"
                                                                              stroke-miterlimit="10"
                                                                              d="M12 9v8l-4-4V9L2 3h16z"></path>
                                                                        </svg></span>
                                                                    Bộ lọc
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="wrapper_layered_filter">
                                                <div class="wrap-filter">
                                                    <div class="box_sidebar">
                                                        <div class="layered">
                                                            <form method="post" >
                                                                <div class="layer_filter-container">



                                                                    <div class="layer_filter-title hidden-xs hidden-sm">
                                                                        <h2 class="title_filter">
                                                                            <span class="icon_title"><svg viewBox="0 0 20 20">
                                                                                <path fill="none" stroke-width="2"
                                                                                      stroke-linejoin="round"
                                                                                      stroke-miterlimit="10"
                                                                                      d="M12 9v8l-4-4V9L2 3h16z"></path>
                                                                                </svg></span>
                                                                            <input type="submit" value="Bộ lọc">
                                                                        </h2>
                                                                    </div>
                                                                    <div class="layer_filter-group">
                                                                        <div class="row clearfix">
                                                                            <!-- ./filter brand -->

                                                                            <div class="col-md-3 ">
                                                                                <div class="group-filter">
                                                                                    <div
                                                                                        class="filter_group_title dropdown-filter">
                                                                                        <span>DANH MỤC</span>
                                                                                        <span class="icon-controls"><i
                                                                                                class="fa fa-chevron-down"></i></span>
                                                                                    </div>
                                                                                    <div
                                                                                        class="filter_group_content bl-filter filter-brand">
                                                                                        <ul class="">
                                                                                            <c:forEach items="${requestScope.categoryList}" var="category">
                                                                                                <li>
                                                                                                    <input type="radio" id="data-brand-p${category.id}" value="${category.category}" name="brand-filter">
                                                                                                    <label for="data-brand-p${category.id}">${category.category}</label>   
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
                                                                                    <div
                                                                                        class="filter_group_content bl-filter filter-price">
                                                                                        <ul class="check-box-list">
                                                                                            <li>
                                                                                                <input type="radio" id="p1"
                                                                                                       name="cc"
                                                                                                       value="<500" />
                                                                                                <label for="p1">
                                                                                                    <span>Dưới</span> 500,000₫
                                                                                                </label>
                                                                                            </li>
                                                                                            <li>
                                                                                                <input type="radio" id="p2"
                                                                                                       name="cc"
                                                                                                       value="500<x<1000"/>
                                                                                                <label for="p2">
                                                                                                    500,000₫ - 1,000,000₫
                                                                                                </label>
                                                                                            </li>
                                                                                            <li>
                                                                                                <input type="radio" id="p3"
                                                                                                       name="cc"
                                                                                                       value="1000<x<2000" />
                                                                                                <label for="p3">
                                                                                                    1,000,000₫ - 2,000,000₫
                                                                                                </label>
                                                                                            </li>
                                                                                            <li>
                                                                                                <input type="radio" id="p4"
                                                                                                       name="cc"
                                                                                                       value="2000<x<5000"/>
                                                                                                <label for="p4">
                                                                                                    2,000,000₫ - 5,000,000₫
                                                                                                </label>
                                                                                            </li>
                                                                                            <li>
                                                                                                <input type="radio" id="p5"
                                                                                                       name="cc"
                                                                                                       value=">5000" />
                                                                                                <label for="p5">
                                                                                                    <span>Trên</span> 5,000,000₫
                                                                                                </label>
                                                                                            </li>
                                                                                        </ul>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <!-- ./filter color -->

                                                                            <div class="col-md-3 ">
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
                                                                                            <li>
                                                                                                <input type="radio" id="data-color-p1" value="Black" name="color-filter" data-color="(variant:product contains Màu đen)" />
                                                                                                <label for="data-color-p1" style="background-color: #000000">Màu đen</label>
                                                                                            </li>
                                                                                            <li>
                                                                                                <input type="radio" id="data-color-p2" value="White" name="color-filter" data-color="(variant:product contains Màu trắng)" />
                                                                                                <label for="data-color-p2" style="background-color: #FFFFFF">Màu trắng</label>
                                                                                            </li>
                                                                                            <li>
                                                                                                <input type="radio" id="data-color-p3" value="Yellow" name="color-filter" data-color="(variant:product contains Màu vàng)" />
                                                                                                <label for="data-color-p3" style="background-color: #FFFF00">Màu vàng</label>
                                                                                            </li>
                                                                                            <li>
                                                                                                <input type="radio" id="data-color-p4" value="Red" name="color-filter" data-color="(variant:product contains Màu đỏ)" />
                                                                                                <label for="data-color-p4" style="background-color: #FF0000">Màu đỏ</label>
                                                                                            </li>
                                                                                            <li>
                                                                                                <input type="radio" id="data-color-p5" value="Blue" name="color-filter" data-color="(variant:product contains Màu xanh dương)" />
                                                                                                <label for="data-color-p5" style="background-color: #0000FF">Màu xanh dương</label>
                                                                                            </li>
                                                                                            <li>
                                                                                                <input type="radio" id="data-color-p6" value="Green" name="color-filter" data-color="(variant:product contains Màu xanh lá)" />
                                                                                                <label for="data-color-p6" style="background-color: #008000">Màu xanh lá</label>
                                                                                            </li>
                                                                                            <li>
                                                                                                <input type="radio" id="data-color-p7" value="Purple" name="color-filter" data-color="(variant:product contains Màu tím)" />
                                                                                                <label for="data-color-p7" style="background-color: #800080">Màu tím</label>
                                                                                            </li>
                                                                                            <li>
                                                                                                <input type="radio" id="data-color-p8" value="Orange" name="color-filter" data-color="(variant:product contains Màu cam)" />
                                                                                                <label for="data-color-p8" style="background-color: #FFA500">Màu cam</label>
                                                                                            </li>
                                                                                            <li>
                                                                                                <input type="radio" id="data-color-p9" value="Pink" name="color-filter" data-color="(variant:product contains Màu hồng)" />
                                                                                                <label for="data-color-p9" style="background-color: #FFC0CB">Màu hồng</label>
                                                                                            </li>

                                                                                        </ul>
                                                                                    </div>

                                                                                </div>
                                                                            </div>

                                                                            <!-- ./filter size -->

                                                                            <div class="col-md-3">
                                                                                <div class="group-filter">
                                                                                    <div
                                                                                        class="filter_group_title dropdown-filter">
                                                                                        <span>Kích thước</span><span
                                                                                            class="icon-controls"><i
                                                                                                class="fa fa-chevron-down"></i></span>
                                                                                    </div>
                                                                                    <div
                                                                                        class="filter_group_content filter-size s-filter">
                                                                                        <ul class="check-box-list clearfix">
                                                                                            <li>
                                                                                                <input type="radio"
                                                                                                       id="data-size-p1"
                                                                                                       value="90"
                                                                                                       name="size-filter"
                                                                                                       data-size="(variant:product=90cm)" />
                                                                                                <label
                                                                                                    for="data-size-p1">90cm</label>
                                                                                            </li>
                                                                                            <li>
                                                                                                <input type="radio"
                                                                                                       id="data-size-p2"
                                                                                                       value="120"
                                                                                                       name="size-filter"
                                                                                                       data-size="(variant:product=1m2)" />
                                                                                                <label
                                                                                                    for="data-size-p2">1m2</label>
                                                                                            </li>
                                                                                            <li>
                                                                                                <input type="radio"
                                                                                                       id="data-size-p3"
                                                                                                       value=" 140"
                                                                                                       name="size-filter"
                                                                                                       data-size="(variant:product= 1m4)" />
                                                                                                <label for="data-size-p3">
                                                                                                    1m4</label>
                                                                                            </li>
                                                                                            <li>
                                                                                                <input type="radio"
                                                                                                       id="data-size-p4"
                                                                                                       value=" 160"
                                                                                                       name="size-filter"
                                                                                                       data-size="(variant:product= 1m6)" />
                                                                                                <label for="data-size-p4">
                                                                                                    1m6</label>
                                                                                            </li>
                                                                                            <li>
                                                                                                <input type="radio"
                                                                                                       id="data-size-p5"
                                                                                                       value=" 180"
                                                                                                       name="size-filter"
                                                                                                       data-size="(variant:product= 1m8)" />
                                                                                                <label for="data-size-p5">
                                                                                                    1m8</label>
                                                                                            </li>
                                                                                            <li>
                                                                                                <input type="radio"
                                                                                                       id="data-size-p6"
                                                                                                       value=" 200"
                                                                                                       name="size-filter"
                                                                                                       data-size="(variant:product= 2m)" />
                                                                                                <label for="data-size-p5">
                                                                                                    2m</label>
                                                                                            </li>
                                                                                        </ul>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </form>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container">
                                        <div class="row filter-here">
                                            <div class="content-product-list product-list clearfix">
                                                <c:forEach items="${requestScope.productList}" var="product">
                                                    <div class="col-md-3 col-sm-6 col-xs-6 pro-loop col-4">
                                                        <div class="product-block product-resize site-animation single-product">
                                                            <div class="product-img fade-box">
                                                                <c:forEach items="${requestScope.saleList}" var="saleoff">
                                                                    <c:if test="${saleoff.product_id == product.id}">

                                                                        <c:choose>
                                                                            <c:when test="${saleoff.saleoffvalue ne 0}">
                                                                                <div class="product-sale"><span>-${saleoff.saleoffvalue}%</span></div>
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
                                                                             src="images/product/${product.image}" />
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
                                                                                        <c:when test="${saleoff.saleoffvalue == 0}">
                                                                                            <span style="color: black">${product.price}₫</span>
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            <span>${product.price - product.price * saleoff.saleoffvalue / 100}₫</span>
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
                                                                            <c:set var="totalRating" value="0" scope="page" />
                                                                            <c:set var="reviewCount" value="0" scope="page" />

                                                                            <c:forEach items="${requestScope.feedbackList}" var="feedback">
                                                                                <c:if test="${feedback.product_id == product.id}">
                                                                                    <c:set var="totalRating" value="${totalRating + feedback.votescore}" scope="page" />
                                                                                    <c:set var="reviewCount" value="${reviewCount + 1}" scope="page" />
                                                                                </c:if>
                                                                            </c:forEach>

                                                                            <c:set var="averageRating" value="${reviewCount != 0 ? totalRating / reviewCount : 0}" scope="page" />

                                                                            <div class="rating-container" data-rating="${averageRating}" data-num-reviews="${reviewCount}">
                                                                                <div class="rating"></div>
                                                                                <span class="num-reviews"></span>
                                                                            </div>
                                                                        </div>
                                                                        <c:set var="quantitySold" value="0" scope="page" /> 
                                                                        <c:forEach items="${requestScope.orderDetailList}" var="orderDetail">
                                                                            <c:if test="${orderDetail.product_id == product.id}">
                                                                                <c:set var="quantitySold" value="${quantitySold + orderDetail.quantity}" scope="page" />
                                                                            </c:if>
                                                                        </c:forEach>
                                                                        <div
                                                                            class="col-lg-4 col-md-4 col-sm-4 col-xs-12 custom_sold_qty">
                                                                            <div class="cmpText">Đã bán ${quantitySold}</div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product-quantity">
                                                                        <div>Số lượng: ${product.quantity}</div>
                                                                        <div class="product-addtocart">
                                                                            <a href="#" class="cart-button">
                                                                                <svg xmlns="http://www.w3.org/2000/svg"
                                                                                     width="20" height="20" fill="currentColor"
                                                                                     class="bi bi-cart" viewBox="0 0 16 16">
                                                                                <path
                                                                                    d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2" />
                                                                                </svg>Add to cart
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="sortpagibar pagi clearfix text-center">
                                        <div id="pagination" class="clearfix">

                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <c:forEach var="page" items="${pagenumber}">
                                                    <a class="page-node" href="ProductServlet?page=${page}" aria-label="Trang ${page}">${page}</a>
                                                </c:forEach>
                                                <span class="page-node ">&hellip;</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </
        </div>
        <!-- Banner dịch vụ -->
        <main>
            <div class="wrapper-home-banner-servce">
                <div class="container">
                    <div class="flex_content services-pd site-animation">

                        <div class="services">
                            <div class="img-outer">
                                <div class="service-img fade-box">
                                    <img loading="lazy" decoding="async" width="50" height="50"
                                         src="//theme.hstatic.net/200000065946/1001187274/14/vice_item_1_thumb.png?v=582"
                                         alt="Giao Hàng & Lắp Đặt">
                                </div>
                            </div>
                            <div class="text">
                                <div class="title">Giao Hàng & Lắp Đặt</div>
                                <div class="desc">Miễn Phí</div>
                            </div>
                        </div>

                        <div class="services">
                            <div class="img-outer">
                                <div class="service-img fade-box">
                                    <img loading="lazy" decoding="async" width="50" height="50"
                                         src="//theme.hstatic.net/200000065946/1001187274/14/vice_item_2_thumb.png?v=582"
                                         alt="Đổi Trả 1 - 1">
                                </div>
                            </div>
                            <div class="text">
                                <div class="title">Đổi Trả 1 - 1</div>
                                <div class="desc">Miễn Phí</div>
                            </div>
                        </div>

                        <div class="services">
                            <div class="img-outer">
                                <div class="service-img fade-box">
                                    <img loading="lazy" decoding="async" width="50" height="50"
                                         src="//theme.hstatic.net/200000065946/1001187274/14/vice_item_3_thumb.png?v=582"
                                         alt="Bảo Hành 2 Năm">
                                </div>
                            </div>
                            <div class="text">
                                <div class="title">Bảo Hành 2 Năm</div>
                                <div class="desc">Miễn Phí</div>
                            </div>
                        </div>
                        <div class="services">
                            <div class="img-outer">
                                <div class="service-img fade-box">
                                    <img loading="lazy" decoding="async" width="50" height="50"
                                         src="//theme.hstatic.net/200000065946/1001187274/14/vice_item_4_thumb.png?v=582"
                                         alt="Tư Vấn Thiết Kế">
                                </div>
                            </div>
                            <div class="text">
                                <div class="title">Tư Vấn Thiết Kế</div>
                                <div class="desc">Miễn Phí</div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="collection-desc">
                <div class="container">
                    <div class="collections-description">
                        <div class="description-content expandable-toggle opened">

                            <div class="description-productdetail" style="height: 220px; overflow: hidden;">
                                Nội Thất MOHO thân thiện môi trường, an toàn sức khỏe, chất lượng quốc tế với đa dạng đồ
                                nội thất hiện đại cho phòng khách, phòng ăn, phòng ngủ, phòng làm việc, văn phòng và tủ
                                bếp.
                            </div>
                            <div class="description-btn">
                                <button class="expandable-content_toggle js_expandable_content">
                                    <span class="expandable-content_toggle-icon"></span>
                                    <span class="expandable-content_toggle-text">Xem thêm nội dung</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <footer class="mainFooter mainfooter-toolbar">
            <div class="footer-container">
                <div class="container">
                    <div class="row footer-container--content">
                        <div class="col-xs-12 col-sm-6 col-md-3 col-bd">
                            <div class="widget-footer">
                                <h4 class="footer-title">Nội Thất MOHO</h4>
                                <div class="footer-content">
                                    <p>Nội Thất MOHO là thương hiệu đến từ Savimex với gần 40 năm kinh nghiệm trong việc
                                        sản xuất và xuất khẩu nội thất đạt chuẩn quốc tế.</p>
                                    <div class="fBlock-logo-bct">
                                        <a href="http://online.gov.vn/(X(1)S(x0oiui2u3epcjwy4z2xlko03))/Home/WebDetails/60567?AspxAutoDetectCookieSupport=1"
                                           class="fade-box" aria-label="Bộ Công Thương">
                                            <img class="lazyload"
                                                 data-src="//theme.hstatic.net/200000065946/1001187274/14/logo_bct.png?v=582"
                                                 src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg=="
                                                 alt="Bộ Công Thương">
                                        </a>
                                    </div>

                                    <a href="//www.dmca.com/Protection/Status.aspx?ID=c870a589-fd82-4c14-9e41-c3891ec42fb5"
                                       title="DMCA.com Protection Status" class="dmca-badge"> <img loading="lazy"
                                                                                                decoding="async"
                                                                                                src="https://images.dmca.com/Badges/dmca_protected_18_120.png?ID=c870a589-fd82-4c14-9e41-c3891ec42fb5"
                                                                                                alt="DMCA.com Protection Status" /></a>
                                </div>
                            </div>
                        </div>


                        <div class="col-xs-12 col-sm-6 col-md-3 col-bd">
                            <div class="widget-footer footer-linklist">
                                <h4 class="footer-title">
                                    Dịch Vụ
                                </h4>
                                <div class="footer-content">
                                    <ul class="menuFooter-list">

                                        <li class="item">
                                            <a href="/pages/chinh-sach-ban-hang" title="Chính Sách Bán Hàng">Chính Sách
                                                Bán Hàng</a>
                                        </li>

                                        <li class="item">
                                            <a href="/pages/giao-hang-va-lap-dat"
                                               title="Chính Sách Giao Hàng & Lắp Đặt">Chính Sách Giao Hàng & Lắp
                                                Đặt</a>
                                        </li>

                                        <li class="item">
                                            <a href="/pages/chinh-sach-doi-tra" title="Chính Sách Đổi Trả">Chính Sách
                                                Đổi Trả</a>
                                        </li>

                                        <li class="item">
                                            <a href="/pages/chinh-sach-bao-hanh" title="Chính Sách Bảo Hành & Bảo Trì">Chính
                                                Sách Bảo Hành & Bảo Trì</a>
                                        </li>

                                        <li class="item">
                                            <a href="/pages/khach-hang-than-thiet-mohomie"
                                               title="Khách Hàng Thân Thiết – MOHOmie">Khách Hàng Thân Thiết –
                                                MOHOmie</a>
                                        </li>

                                        <li class="item">
                                            <a href="/pages/chinh-sach-doi-tac-ban-hang"
                                               title="Chính Sách Đối Tác Bán Hàng">Chính Sách Đối Tác Bán Hàng</a>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>


                        <div class="col-xs-12 col-sm-6 col-md-3 col-bd clea-mean">
                            <div class="widget-footer footer-contact">
                                <h4 class="footer-title">
                                    Thông tin liên hệ
                                </h4>
                                <div class="footer-content">
                                    <ul class="contactList">
                                        <li class="contact-1"></i>Showroom: 162 HT17, P. Hiệp Thành, Q. 12, TP. HCM (Nằm
                                            trong khuôn viên công ty SAVIMEX phía sau bến xe buýt Hiệp Thành) | Hotline:
                                            0971 141 140</p>
                                            </i>Experience Store 1: S05.03-S18 phân khu The Rainbow | Vinhomes Grand
                                            Park, TP. Thủ Đức | Hotline: 0931 880 424</p>
                                            </i>Experience Store 2: S3.03-Sh15 phân khu Sapphire | Vinhomes Smart City,
                                            Hà Nội | Hotline: 0909 665 728</p>
                                            </i>Experience Store 3: S2.09-Sh19 phân khu Sapphire | Vinhomes Ocean Park,
                                            Hà Nội | Hotline: 0938 108 772</p>
                                        </li>
                                        <li class="contact-2"></i>097 114 1140 (Hotline/Zalo)</p></i> 0902 415 359 (Đội
                                            Giao Hàng)</p>
                                        </li>

                                        <li class="contact-4">cskh@moho.com.vn </p>Công Ty Cổ Phần Hợp Tác Kinh Tế Và
                                            Xuất Nhập Khẩu Savimex - STK: 0071001303667 - Vietcombank CN HCM</li>
                                    </ul>
                                </div>
                            </div>
                        </div>


                        <div class="col-xs-12 col-sm-6 col-md-3 col-bd">
                            <div class="widget-footer footer-facebook">
                                <h4 class="footer-title">
                                    Fanpage
                                </h4>
                                <div class="footer-content">
                                    <!-- Facebook widget -->
                                    <div class="footer-static-content">
                                        <div class="fb-page" data-href="https://www.facebook.com/mohofurniture/"
                                             data-height="300" data-small-header="false" data-adapt-container-width="true"
                                             data-hide-cover="false" data-show-facepile="true" data-show-posts="false">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="footer-bottom text-center">
                <div class="container">
                    <p>Copyright © 2024 <a href="https://moho.com.vn"> Nội Thất MOHO</a>.</p>
                </div>
            </div>
        </footer>
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

    </body>

</html>