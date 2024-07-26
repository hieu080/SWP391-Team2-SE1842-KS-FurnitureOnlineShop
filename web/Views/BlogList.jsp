<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Danh sách bài đăng</title>
        <link rel="icon" href="image/logoshop.png" type="image/png">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <style>

            body {
                background-color: white;
            }
            .post-item:hover {
                background-color: #f8f9fa;
            }
            .sidebar {
                background-color: #f8f9fa;
                padding: 20px;
            }
            .post-thumbnail {
                width: 100%;
                height: 100%;

            }
            .post-title {
                color: #343a40;
            }
            .pagination a {
                color: #007bff;
                margin: 0 5px;
                padding: 8px 16px;
                border: 1px solid #dee2e6;
                border-radius: 5px;
                text-decoration: none;
            }
            .pagination a:hover {
                background-color: #007bff;
                color: #fff;
            }
        </style>
    </head>
    <body>
        <div class="d-flex justify-content-center">
            <%@include file="HomeHeader.jsp" %>
        </div>
        <div class="bg-light" style="width:100%; height: 30px"></div>
        <div class="container">
            <div class="row">
                <!-- Sidebar -->
                <div class="col-lg-3 pt-2 border bg-white rounded">
                    <!-- Search bar -->
                    
                    <div class="mb-4" >
                        <form action="BlogListServlet">
                            <div class="input-group mt-3">
                                <input type="text" class="form-control" placeholder="Nhập từ khoá" name="keyword"
                                       value="<c:if test="${param.keyword != null}">${param.keyword}</c:if>">
                                       <div class="input-group-append">
                                           <button type="submit" class="btn btn-outline-secondary">🔍</button>
                                       </div>
                                </div>
                            </form>
                        </div>

                        <!-- Dropdown to filter category -->
                        <div class="mb-3">
                            <form action="BlogListServlet">
                                <select class="form-control" name="category" onchange="this.form.submit()">
                                    <option value="0">All</option>
                                <c:forEach items="${listCategory}" var="c">
                                    <option value="${c.getId()}" <c:if test="${c.getId()==param.category}">selected</c:if>>${c.getCategory()}</option>
                                </c:forEach>
                            </select>
                        </form>
                    </div>

                    <div class="border-bottom text-center"><h3>Bài viết nổi bật</h3></div>

                    <!-- Display new posts (using forEach) -->
                    <c:forEach items="${listNewPost}" var="p">
                        <a href="BlogDetailServlet?id=${p.getId()}" class="text-decoration-none text-dark">
                            <div class="row p-3 border-bottom post-item">
                                <div class="col-lg-5">
                                    <div style="width:100%;height:70px">
                                        <img src="image/post/${p.getThumbnail()}" alt="Thumbnail" class="post-thumbnail">
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <c:forEach items="${listCategory}" var="category">
                                        <c:if test="${category.getId() == p.getCategory_id()}">
                                            <p class="text-danger mb-1">|${category.getCategory()}</p>
                                        </c:if>
                                    </c:forEach>
                                    <h6>${p.getTitle()}</h6>
                                </div>
                            </div>
                        </a>
                    </c:forEach>
                </div>

                <!-- Main content -->
                <div class="col-lg-9 ps-5">
                    <div class="bg-white border">
                        <c:if test="${param.keyword!=null && !param.keyword.isEmpty()}">
                            <c:choose>
                                <c:when test="${listPost.isEmpty()}">
                                    <h3 class="p-4">Không tìm thấy kết quả cho "${param.keyword}"</h3>
                                </c:when>
                                <c:otherwise>
                                    <h3 class="p-4">Kết quả tìm kiếm cho: "${param.keyword}"</h3>
                                </c:otherwise>
                            </c:choose>
                        </c:if>

                        <!-- Category title -->       
                        <c:if test="${!catname.isBlank()}">
                            <h1 class="p-4  border-bottom">${catname}</h1>
                        </c:if>
                        <!-- List of posts -->
                        <c:forEach items="${listPost}" var="p">
                            <a href="BlogDetailServlet?id=${p.getId()}" class="text-decoration-none text-dark">
                                <div class="row  p-3 post-item">
                                    <div class="col-lg-5">
                                        <div style="width:100%;height: 250px">
                                            <img src="image/post/${p.getThumbnail()}" alt="Thumbnail" class="post-thumbnail">
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <c:forEach items="${listCategory}" var="category">
                                            <c:if test="${category.getId() == p.getCategory_id()}">
                                                <p class="text-danger mb-1">|${category.getCategory()}</p>
                                            </c:if>
                                        </c:forEach>
                                        <h3 class="post-title">${p.getTitle()}</h3>
                                        <h6>${p.getSubtitle()}</h6>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>

                        <!-- Pagination -->
                        <div id="pagination" class="pagination d-flex justify-content-center mt-4">
                            <c:forEach var="page" items="${pagenumber}">
                                <a class="page-node" href="BlogListServlet?page=${page}&&category=${param.category}&&keyword=${param.keyword}" aria-label="Trang ${page}">${page}</a>
                            </c:forEach>
                            <span class="page-node">&hellip;</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                       
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2LcFfuDZiAR4hPbgb0P8nzg5VxynzhEdvGfCJo6v2b" crossorigin="anonymous"></script>
        
        
            <%@include file="HomeFooter.jsp" %>
       
    </body>
</html>