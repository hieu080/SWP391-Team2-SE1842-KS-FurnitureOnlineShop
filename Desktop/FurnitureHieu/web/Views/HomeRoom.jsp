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


        <!-- Nhóm banner -->

        <div class="wrapper-home-banner-img">
            <div class="container site-animation">
                <div class="wrapper-heading-home">
                    <h2>
                        Không Gian Sống Với MOHO
                    </h2>
                </div>
                <div class="row">
                    <div class="col-md-4 col-xs-12 col-sm-4 padding-img">
                        <div class="row">
                            <div class="col-md-12 col-xs-6 col-sm-12 no_pdr fade-box">
                                <div class="fade-out">
                                    <a href="${pageContext.request.contextPath}/ProductListServlet" class="fadeoutcenter">
                                        <img width="403" height="390" loading="lazy" decoding="async"
                                             srcset="//theme.hstatic.net/200000065946/1001187274/14/imgaView1_large.jpg?v=582 412w, //theme.hstatic.net/200000065946/1001187274/14/imgaView1.jpg?v=582"
                                             alt="nội thất phòng khách">
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-6 col-sm-12 no_pdr padding-img fade-box">
                                <div class="fade-out">
                                    <a href="${pageContext.request.contextPath}/ProductListServlet" class="fadeoutcenter">
                                        <img width="403" height="390" loading="lazy" decoding="async"
                                             srcset="//theme.hstatic.net/200000065946/1001187274/14/imgaView2_large.jpg?v=582 412w, //theme.hstatic.net/200000065946/1001187274/14/imgaView2.jpg?v=582"
                                             alt="nội thất phòng ngủ">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 col-xs-12 col-sm-8 padding-img fade-box">
                        <div class="fade-out">
                            <a href="${pageContext.request.contextPath}/ProductListServlet" class="fadeoutcenter">
                                <img width="840" height="430" loading="lazy" decoding="async"
                                     srcset="//theme.hstatic.net/200000065946/1001187274/14/imgaView3_large.jpg?v=582 412w, //theme.hstatic.net/200000065946/1001187274/14/imgaView3.jpg?v=582"
                                     alt="Trọn bộ nội thất">
                            </a>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-xs-6 col-sm-6 padding-img pd_lr fade-box">
                                <div class="fade-out">
                                    <a href="${pageContext.request.contextPath}/ProductListServlet" class="fadeoutcenter">
                                        <img width="400" height="314" loading="lazy" decoding="async"
                                             srcset="//theme.hstatic.net/200000065946/1001187274/14/imgaView4_large.jpg?v=582 412w, //theme.hstatic.net/200000065946/1001187274/14/imgaView4.jpg?v=582"
                                             alt="nội thất phòng ăn">
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-6 col-xs-6 col-sm-6 padding-img pd_lr fade-box">
                                <div class="fade-out">
                                    <a href="${pageContext.request.contextPath}/ProductListServlet" class="fadeoutcenter">
                                        <img width="400" height="314" loading="lazy" decoding="async"
                                             srcset="//theme.hstatic.net/200000065946/1001187274/14/imgaView5_large.jpg?v=582 412w, //theme.hstatic.net/200000065946/1001187274/14/imgaView5.jpg?v=582"
                                             alt="tủ bếp moho">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>

</html>