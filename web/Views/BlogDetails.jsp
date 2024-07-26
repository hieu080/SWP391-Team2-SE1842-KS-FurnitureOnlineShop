<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Chi tiết bài đăng</title>    
        <link rel="icon" href="image/logoshop.png" type="image/png">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <style>
            body {
                background-color: white;
            }
            .post-item:hover {
                background-color: #f1f1f1;
            }
            .post-thumbnail {
                width: 100%;
                height: 100%;
            }
            .sidebar-thumbnail {
                width: 100%;
                height: 100%;
            }

            .fixed-size {
                width: 100%;
                height: auto;
            }
            .fixed-size-lg {
                width: 100%;
                height: 600px;
            }
            .content {
                background-color: #fff;
                padding: 20px;
            }

            .content .noidung img{
                width: 100%;
                height:auto;
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
                    <div class="mb-5" id="search">
                        <form action="BlogListServlet">
                            <div class="input-group mt-3">
                                <input type="text" class="form-control" placeholder="Nhập từ khoá" name="keyword">
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

                    <div class="border-bottom text-center"><h4>Bài viết nổi bật</h4></div>

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
                    <!-- Thumbnail -->
                    <div class="mb-5 border">
                        <img src="image/post/${post.getThumbnail()}" alt="Thumbnail" class="fixed-size-lg">
                    </div>

                    <!-- Title and subtitle -->
                    <div class="content border mb-3">
                        <h3 class="pb-2">${post.getTitle()}</h3>
                        <h6 class="pb-5">${post.getSubtitle()}</h6>
                        <div class="noidung">${post.getContent()}</div>
                    </div>

                    <!-- Author and updated date -->
                    <div class="text-right">
                        <p class="fw-bold font-monospace">Tác giả: ${author}</p>
                        <p class="font-monospace">Cập nhật: ${post.getUpdatedtime()}</p>
                    </div>
                </div>
            </div>
        </div>
        
            <%@include file="HomeFooter.jsp" %>
        
    </body>
</html>