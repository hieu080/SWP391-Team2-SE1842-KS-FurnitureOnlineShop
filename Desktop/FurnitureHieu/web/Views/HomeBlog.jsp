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
        <div class="wrapper-home-latestblogs">
    <div class="container">
        <div class="wrapper-heading-home site-animation d-flex justify-content-between ">
            <h2>
                <a href="/blogs/media">
                    Tin tức mới nhất
                </a>
            </h2>
             <div class="d-flex align-items-center">
                <a class="" href="${pageContext.request.contextPath}/BlogListServlet">Xem thêm</a>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="overflow-auto" id="postWrapper">
                    <div class="d-flex">
                        <c:forEach items="${postList}" var="post">
                            <div class="col-3 flex-shrink-0" style="margin-right: 2%;">
                                <article class="article-item col-post site-animation">
                                    <div class="article-item--post">
                                        <div class="post-image fade-box">
                                            <a href="${pageContext.request.contextPath}/blogdetail?id=${post.id}" title="${post.title}">
                                                <picture>
                                                    <source srcset="${post.thumbnail}" media="(max-width: 500px)" />
                                                    <source srcset="${post.thumbnail}" />
                                                    <img loading="lazy" decoding="async" src="${post.thumbnail}" alt="${post.title}" />
                                                </picture>
                                            </a>
                                            <div class="post--date">
                                                <span class="date">${post.category_id}</span>
                                            </div>
                                        </div>
                                        <div class="post-body">
                                            <h3><a href="/blogs/media/ghe-sofa-don">${post.title}</a></h3>
                                            <div class="post--desc">${post.subtitle}</div>
                                            <p class="post--action text-right"><a class="link-more" href="${pageContext.request.contextPath}/BlogDetailServlet?id=${post.id}">Xem thêm</a></p>
                                        </div>
                                    </div>
                                </article>
                            </div>
                        </c:forEach>
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