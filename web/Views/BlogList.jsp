<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Blogs List</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="HomeHeader.jsp" %>
        <div class="container">
            <div class="row">
                <!-- sider -->
                <div class="col-lg-3 mt-5  pt-2 border">

                    <!-- search bar -->
                    <div class="row mb-5" id="search">
                        <form action="BlogListServlet">
                            <div class="mt-3 d-flex justify-content-between mx-4">
                                <input type="text" class="col-9 form-control " placeholder="Nhập từ khoá" name="keyword">
                                <button type="submit" class="  btn btn-default">🔍</button>
                            </div>
                        </form>
                    </div>


                    <!-- dropdown to filter category -->
                    <div class="mb-5">
                        <form action="BlogListServlet">
                            <select class="form-select form-control" name="category" onchange="this.form.submit()">
                                <option value="0" >All</option>
                                <c:forEach items="${listCategory}" var="c">
                                    <option value="${c.getId()}"
                                            <c:if test="${c.getId()==param.category}">selected</c:if>>${c.getCategory()}</option>
                                </c:forEach>
                            </select>
                        </form>
                    </div>


                    <!-- hien thi new post (dung foreach) -->
                    <c:forEach items="${listNewPost}" var="p">
                        <a href="BlogDetailServlet?id=${p.getId()}" class="text-decoration-none text-dark">
                            <div class="row border p-2">
                                <div class="col-lg-5 pt-3" style="width:100px;height:60px">
                                    <img src="${p.getThumbnail()}"
                                         alt="anhdep" style="width:100%;height:100%">
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
                    <c:if test="${param.keyword!=null}">
                        <c:choose>
                            <c:when test="${listPost==null}">
                                <h3>Không tìm thấy kết quả cho "${param.keyword}"</h3>
                            </c:when>
                            <c:otherwise>
                                <h3>Kết quả tìm kiếm cho: "${param.keyword}"</h3>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                    <!-- category -->          
                    <div>
                        <h1>${catname}</h1>
                    </div>

                    <!-- list of post -->
                    <c:forEach items="${listPost}" var="p">
                        <a href="BlogDetailServlet?id=${p.getId()}" class="text-decoration-none text-dark">
                            <div class="row border-bottom p-2 post-item ${p.getCategory_id()}">
                                <div class="col-lg-5" style="width:350px;height:200px">
                                    <img src="image/post/${p.getThumbnail()}"
                                         alt="anhdep" style="width:100%;height:100%">
                                </div>
                                <div class="col-lg-7">
                                    <c:forEach items="${listCategory}" var="category">
                                        <c:if test="${category.getId() == p.getCategory_id()}">
                                            <p class="text-danger">|${category.getCategory()}</p>
                                        </c:if>
                                    </c:forEach>
                                    <h3>${p.getTitle()}</h3>
                                    <h6>${p.getSubtitle()}</h6>
                                </div>
                            </div>
                        </a>
                    </c:forEach>                  
                    <div>
                        <div id="pagination" class="clearfix">

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <c:forEach var="page" items="${pagenumber}">
                                    <a class="page-node" href="BlogListServlet?page=${page}" aria-label="Trang ${page}">${page}</a>
                                </c:forEach>
                                <span class="page-node ">&hellip;</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>


        </div>
        <%@include file="HomeFooter.jsp" %>
    </body>

</html>