
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Page Layout</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script>
            function filterCategory() {
                var selectedCategory = "${catId != null ? catId:'0'}";
                document.getElementById("categoryTitle").innerText = "${catname != null? catname:'All'}";
                var posts = document.querySelectorAll(".post-item");
                posts.forEach(function (post) {
                    if (selectedCategory === "0" || post.classList.contains(selectedCategory)) {
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
                <!-- sider -->
                <div class="col-lg-3 mt-5  pt-2 border">

                    <!-- search bar -->
                    <div class="row mb-5" id="search">
                        <form action="BlogListSearchedServlet">
                            <input type="text" class="col-lg-9" placeholder="Nhập tên tác giả, nội dung..." name="keyword">
                            <button type="submit" class="col-lg-2 ms-2"><i class=" fas fa-search"></i></button>
                        </form>
                    </div>


                    <!-- dropdown to filter category -->
                    <div class="mb-5">
                        <form action="BlogListServlet">
                            <select class="form-select form-select-sm" name="category" onchange="this.form.submit(), filterCategory()">
                                <option value="0" >All</option>
                                <c:forEach items="${listCategory}" var="c">
                                    <option value="${c.getId()}"
                                            <c:if test="${c.getId()==param.category}">selected</c:if>>${c.getCategory()}</option>
                                </c:forEach>
                            </select>
                        </form>
                    </div>


                    <!-- hien thi new post (dung foreach) -->
                    <c:forEach items="${listPost}" var="p">
                        <a href="BlogDetailServlet?id=${p.getId()}" class="text-decoration-none text-black">
                            <div class="row border p-2">
                                <div class="col-lg-5 pt-3">
                                    <img src="${p.getThumbnail()}"
                                         alt="anhdep" class="img-fluid">
                                </div>
                                <div class="col-lg-7">  
                                    <c:forEach items="${listCategory}" var="category">
                                        <c:if test="${category.getId() == p.getCategory_id()}">
                                            <p class="text-danger">|${category.getCategory()}</p>
                                        </c:if>
                                    </c:forEach>
                                    <h6>${p.getTitle()}</h6>
                                </div>
                            </div>
                        </a>
                    </c:forEach>

                </div>


                <!-- hien thi list post theo category -->         

                <div class="col-lg-9 mt-5 ps-5">
                    <!-- category -->
                    <div>
                        <h2 id="categoryTitle"></h2>
                    </div>

                    <!-- list of post -->
                    <c:forEach items="${listPost}" var="p">
                        <a href="blogdetail?id=${p.getId()}" class="text-decoration-none text-black">
                            <div class="row border-bottom p-2 post-item ${p.getCategory_id()}">
                                <div class="col-lg-5">
                                    <img src="${p.getThumbnail()}"
                                         alt="anhdep" class="img-fluid">
                                </div>
                                <div class="col-lg-7">
                                    <c:forEach items="${listCategory}" var="category">
                                        <c:if test="${category.getId() == p.getCategory_id()}">
                                            <p class="text-danger">|${category.getCategory()}</p>
                                        </c:if>
                                    </c:forEach>
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
    </body>

</html>