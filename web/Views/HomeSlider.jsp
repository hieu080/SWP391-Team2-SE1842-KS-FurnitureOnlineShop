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
        <div class="wrapper-slider-banner" id="homeCarousel-banner">
            <div id="homeCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#homeCarousel" data-slide-to="0" class="active"></li>
                        <c:forEach var="i" begin="1" end="${listsliderSize}">
                        <li data-target="#homeCarousel" data-slide-to="${i}"></li>
                        </c:forEach>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <!-- Hiển thị phần tử đầu tiên của listslider -->
                    <c:if test="${not empty listslider}">
                        <div class="carousel-item active">
                            <a href="${listslider[0].link}" alt="${listslider[0].title}">
                                <picture>
                                    <source media="(max-width: 480px)" srcset="${listslider[0].image}">
                                    <source media="(min-width: 481px) and (max-width: 767px)" srcset="${listslider[0].image}">
                                    <source media="(min-width: 768px)" srcset="${listslider[0].image}">
                                    <img class="d-block w-100" src="${listslider[0].image}" alt="${listslider[0].title}">
                                </picture>
                            </a>
                        </div>
                    </c:if>

                    <!-- Duyệt từ phần tử thứ hai trở đi -->
                    <c:forEach var="slider" items="${listslider}" varStatus="status">
                        <c:if test="${status.index > 0}">
                            <div class="carousel-item">
                                <a href="${slider.link}" alt="${slider.title}">
                                    <picture>
                                        <source media="(max-width: 480px)" srcset="${slider.image}">
                                        <source media="(min-width: 481px) and (max-width: 767px)" srcset="${slider.image}">
                                        <source media="(min-width: 768px)" srcset="${slider.image}">
                                        <img class="d-block w-100" src="${slider.image}" alt="${slider.title}">
                                    </picture>
                                </a>
                            </div>
                        </c:if>
                    </c:forEach>


                </div>

                <!-- Left and right controls -->
                <a class="carousel-control-prev" href="#homeCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#homeCarousel" role="button" data-slide="next">
                    <span class="sr-only">Next</span>
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>

                </a>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>

</html>