
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
        <style>
            #content *{
                max-width: 100%;
            }
        </style>
    <body>
         <%@ include file="HomeHeader.jsp" %>
        <div class="container">
            
            <div class="row">
                <!-- sider -->
                <div class="col-lg-3 mt-5  pt-2 border">

                    <!-- search bar -->
                    <div class="row mb-5" id="search">
                        <form action="${pageContext.request.contextPath}/BlogListSearchedServlet">
                            <input type="text" class="col-lg-9" placeholder="Nhập tên tác giả, nội dung..."name="keyword">
                            <button type="submit" class="col-lg-2 ms-2"><i class=" fas fa-search"></i></button>
                        </form>
                    </div>


                    <!-- dropdown to filter category -->
                    <div class="mb-5">
                        <form action="${pageContext.request.contextPath}/BlogListServlet">
                            <select class="form-select form-select-sm" name="category" id="categorySelect" onchange="this.form.submit()">
                                <option value="All">All</option>
                                <c:forEach items="${listCategory}" var="c">
                                    <option value="${c}"
                                            <c:if test="${c==param.category}">selected</c:if>>${c}</option>
                                </c:forEach>
                            </select>
                        </form>
                    </div>


                    <!-- hien thi new post (dung foreach) -->
                    <c:forEach items="${listPost}" var="p">
                        <a href="${pageContext.request.contextPath}/BlogDetailServlet?id=${p.id}" class="text-decoration-none text-black">
                            <div class="row border p-2">
                                <div class="col-lg-5 pt-3">
                                    <img src="${p.getThumbnail()}"
                                         alt="anhdep" class="img-fluid">
                                </div>
                                <div class="col-lg-7">  
                                    <p class="text-danger">|${p.getCategory()}</p>
                                    <h6>${p.getTitle()}</h6>
                                </div>
                            </div>
                        </a>
                    </c:forEach>

                </div>


                <!-- hien thi Post detail -->         
                <div class="col-lg-9 mt-5 ps-5">
                    <!-- thumbnail -->
                    <div class="pb-5">
                        <img src="${post.getThumbnail()}"
                             alt="anhdep" class="img-fluid">
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
                        <p class="fw-bold font-monospace">Tác giả: ${post.getAuthor()}</p>
                        <p class="font-monospace">Cập nhật: ${post.getUpdatedtime()}</p>
                    </div>
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