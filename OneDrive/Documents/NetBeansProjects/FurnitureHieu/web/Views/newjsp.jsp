
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Page Layout</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="preload stylesheet" as="style" fetchpriority="low"
              href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
        <link rel="preload stylesheet" as="style" fetchpriority="low"
              href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />

        <link rel="preload stylesheet" as="style" fetchpriority="low" href="css/style-theme.scss.css">
        <link rel="stylesheet" href="css/style.css">
        <!--+++++++++++++++++++++++++  JS ++++++++++++++++++++++++-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script defer fetchpriority="low"
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"></script>

        <script defer fetchpriority="low"
        src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <script>
            function filterCategory() {
                var selectElement = document.getElementById("categorySelect");
                var selectedCategory = "${cat != null ? cat:'All'}";
                document.getElementById("categoryTitle").innerText = selectedCategory;
                var posts = document.querySelectorAll(".post-item");
                posts.forEach(function (post) {
                    if (selectedCategory === "All" || post.classList.contains(selectedCategory)) {
                        post.classList.remove("d-none");
                    } else {
                        post.classList.add("d-none");
                    }
                });

            }
            // Call filterCategory() function when the page is loaded
            window.onload = function () {
                filterCategory();
            };
        </script>
    <body>
        <%@ include file="HomeHeader.jsp" %>
        <div class="container">
            <div class="row">
                <!-- sidebar -->
                <div class="col-lg-3 mt-5 pt-2 border">
                    <!-- search bar -->
                    <div class="row mb-5" id="search">
                        <form action="${pageContext.request.contextPath}/BlogListSearchedServlet">
                            <input type="text" class="col-lg-9" placeholder="Nhập tên tác giả, nội dung..." name="keyword">
                            <button type="submit" class="col-lg-2 ms-2"><i class="fas fa-search"></i></button>
                        </form>
                    </div>

                    <!-- dropdown to filter category -->
                    <div class="mb-5">
                        <form action="${pageContext.request.contextPath}/BlogListServlet">
                            <select class="form-select form-select-sm" name="category" id="categorySelect" onchange="this.form.submit(); filterCategory();">
                                <option value="All">All</option>
                                <c:forEach items="${categoryOfPostList}" var="categoryOfPost">
                                    <option value="${categoryOfPost}"
                                            ${categoryOfPost == param.category ? 'selected' : ''}>${categoryOfPost.category}</option>
                                </c:forEach>
                            </select>
                        </form>
                    </div>
                    <!-- display new posts (using foreach) -->
                    <c:forEach items="${postList}" var="p">
                        <a href="${pageContext.request.contextPath}/BlogDetailServlet?id=${p.id}" class="text-decoration-none text-black">
                            <div class="row border p-2">
                                <div class="col-lg-5 pt-3">
                                    <img src="${p.getThumbnail()}" alt="anhdep" class="img-fluid">
                                </div>
                                <div class="col-lg-7">
                                    <p class="text-danger">|
                                        <c:forEach items="${categoryOfPostList}" var="category">
                                            <c:if test="${category.id == p.getCategory_id()}">
                                                ${category.category}
                                            </c:if>
                                        </c:forEach>
                                    </p>
                                    <h6>${p.getTitle()}</h6>
                                </div>
                            </div>
                        </a>
                    </c:forEach>
                </div>

                <div class="col-lg-9 mt-5 ps-5">
                    <!-- category -->
                    <div>
                        <h2 id="categoryTitle"></h2>
                    </div>

                    <!-- list of post -->
                    <c:forEach items="${postList}" var="p">
                        <a href="${pageContext.request.contextPath}/BlogDetailServlet?id=${p.id}" class="text-decoration-none text-black">
                            <div class="row border-bottom p-2 post-item p.getCategory_id()}">
                                <div class="col-lg-5">
                                    <img src="${p.getThumbnail()}"
                                         alt="anhdep" class="img-fluid">
                                </div>
                                <div class="col-lg-7">
                                    <p class="text-danger">|
                                        <c:forEach items="${categoryOfPostList}" var="category">
                                            <c:if test="${category.id == p.getCategory_id()}">
                                                ${category.category}
                                            </c:if>
                                        </c:forEach>
                                    </p>
                                    <h5>${p.getTitle()}</h5>
                                    <h6>${p.getSubtitle()}</h6>
                                </div>
                            </div>
                        </a>
                    </c:forEach>                  

                </div>
                
            </div>
        </div>

        <%@ include file="HomeFooter.jsp" %>
        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>

</html>