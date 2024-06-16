<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Page Layout</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            #content *{
                max-width: 100%;
            }
        </style>
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
                            <input type="text" class="col-lg-9" placeholder="Nhập tên tác giả, nội dung..."name="keyword">
                            <button type="submit" class="col-lg-2 ms-2">🔍</button>
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
                <!-- hien thi Post detail -->         
                <div class="col-lg-9 mt-5 ps-5">
                    <!-- thumbnail -->
                    <div class="pb-5" style="width:800px;height:500px">
                        <img src="${post.getThumbnail()}"
                             alt="anhdep" style="width:100%;height:100%">
                    </div>

                    <!-- Title and sub -->
                    <div>
                        <h3 class="pb-2">${post.getTitle()}</h3>
                        <h6>${post.getSubtitle()}</h6>
                    </div>  

                    <!-- content -->
                    <div id="content">
                        ${post.getContent()}
                    </div>

                    <!-- author and updated date -->
                    <div class="float-end">
                        <p class="fw-bold font-monospace">Tác giả: ${author}</p>
                        <p class="font-monospace">Cập nhật: ${post.getUpdatedtime()}</p>
                    </div>
                </div>

            </div>
        </div>
        <%@ include file="HomeFooter.jsp" %>
    </body>

</html>