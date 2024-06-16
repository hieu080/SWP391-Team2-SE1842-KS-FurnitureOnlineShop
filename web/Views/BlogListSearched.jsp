
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Page Layout</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <%@ include file="HomeHeader.jsp" %>
        <div class="container">
            <div class="row">
                <!-- sider -->
                <div class="col-lg-3 mt-5  pt-2 border">

                    <!-- search bar -->
                    <div class="row mb-5" id="search">
                        <form action="BlogListSearchedServlet">
                            <input type="text" class="col-lg-9" 
                                   value="${param.keyword}"
                                   placeholder="Nhập tên tác giả, nội dung..."name="keyword">
                            <button type="submit" class="col-lg-2 ms-2"><i class=" fas fa-search"></i></button>
                        </form>
                    </div>


                    <!-- dropdown to filter category -->
                    <div class="mb-5">
                        <form action="BlogListServlet">
                            <select class="form-select form-select-sm" name="category" onchange="this.form.submit()">
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
                <!-- hien thi list post theo ket qua tim kiem -->         
                <div class="col-lg-9 mt-5 ps-5">
                    <!--thong bao ket qua tim kiem cho tu khoa-->
                    <c:choose>
                        <c:when test="${listsearch == null || listsearch.isEmpty()}">
                            <h3>Không tìm thấy kết quả cho "${param.keyword}"</h3>
                        </c:when>
                        <c:otherwise>
                            <h3>Kết quả tìm kiếm cho: "${param.keyword}"</h3>
                        </c:otherwise>
                    </c:choose>

                    <!--list post-->
                    <c:forEach items="${listsearch}" var="p">
                        <a href="BlogDetailServlet?id=${p.getId()}" class="text-decoration-none text-black">
                            <div class="row border-bottom p-2 post-item">
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
                    <div>
                        <div id="pagination" class="clearfix">

                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <c:forEach var="page" items="${pagenumber}">
                                    <a class="page-node" href="BlogListSearchedServlet?page=${page}&&keyword=${param.keyword}" aria-label="Trang ${page}">${page}</a>
                                </c:forEach>
                                <span class="page-node ">&hellip;</span>
                            </div>
                        </div>
                    </div>
                </div>

            </div>


        </div>
        <%@ include file="HomeFooter.jsp" %>
    </body>

</html>