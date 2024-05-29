
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <body>
        <div class="container">
            <div class="row text-center bg-primary">
                <h1>Header</h1>
            </div>
            <div class="row">
                <!-- sider -->
                <div class="col-lg-3 mt-5  pt-2 border">

                    <!-- search bar -->
                    <div class="row mb-5" id="search">
                        <form action="search">
                            <input type="text" class="col-lg-9" placeholder="Nhập tên tác giả, nội dung..."name="keyword">
                            <button type="submit" class="col-lg-2 ms-2"><i class=" fas fa-search"></i></button>
                        </form>
                    </div>


                    <!-- dropdown to filter category -->
                    <div class="mb-5">
                        <form action="bloglist">
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
                        <a href="blogdetail?id=${p.getId()}" class="text-decoration-none text-black">
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

            <!-- footer -->
            <div class="row text-center bg-primary">
                <h1>footer</h1>
            </div>

        </div>
    </body>

</html>





