<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sliders List</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="resources/styles.css">
    </head>
    <body>
        <div class="wrapper">
            <%@include file="DashboardNavbar.jsp" %>
            <div class="main">
                <%@include file="DashboardHeader.jsp" %>



                <div class="container-fluid mt-5">
                    <h1 class="mb-4">Sliders List</h1>
                    <!-- Form to filter and search sliders -->
                    <div class="row mb-4">
                        <div class="col-md-12">
                            <form id="statusForm" action="${pageContext.request.contextPath}/SliderList" method="GET" class="row g-3">
                                <div class="col-2">
                                    <select name="status" class="form-select" onchange="submitForm()">
                                        <option value="all" ${st == 'all' ? 'selected' : ''}>All</option>
                                        <option value="show" ${st == 'show' ? 'selected' : ''}>Visible</option>
                                        <option value="hide" ${st == 'hide' ? 'selected' : ''}>Hidden</option>
                                    </select>
                                </div>
                                <div class="col-2">
                                    <select name="sort" class="form-select" onchange="submitForm()">
                                        <option value="all" ${sort == 'all' ? 'selected' : ''}>Unsorted list</option>
                                        <optgroup label="Sort By ID">
                                            <option value="id" ${sort == 'id' ? 'selected' : ''}>Sort By ID Ascending</option>
                                            <option value="id_desc" ${sort == 'id_desc' ? 'selected' : ''}>Sort By ID Descending</option>
                                        </optgroup>
                                        <optgroup label="Sort By Title">
                                            <option value="title" ${sort == 'title' ? 'selected' : ''}>Sort By Title A-Z</option>
                                            <option value="title_desc" ${sort == 'title_desc' ? 'selected' : ''}>Sort By Title Z-A</option>
                                        </optgroup>
                                        <optgroup label="Sort By Link">
                                            <option value="backlink" ${sort == 'backlink' ? 'selected' : ''}>Sort By Backlink</option>
                                            <option value="backlink" ${sort == 'backlink_desc' ? 'selected' : ''}>Sort By Backlink Descending</option>
                                        </optgroup>
                                        <optgroup label="Sort By Author ID">
                                            <option value="author_id" ${sort == 'author_id' ? 'selected' : ''}>Sort By Author ID</option>
                                            <option value="author_id" ${sort == 'author_id_desc' ? 'selected' : ''}>Sort By Author ID Descending</option>
                                        </optgroup>
                                    </select>
                                </div>
                                <div class="col-5">
                                    <input type="text" name="search" class="form-control" placeholder="Search by title or backlink" value="${search}" >
                                </div>
                                <input type="hidden" id="pageInput" name="page" value="">
                                <div class="col-3">
                                    <button type="submit" class="btn btn-primary">Search On Title Or BackLink</button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- Table to display sliders list -->
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Image</th>
                                <th>Backlink</th>
                                <th>Status</th>

                                <th>Author ID</th>

                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${empty listslider}">
                                <tr>
                                    <td colspan="7" class="text-center">
                                        <h3 class="text-center">${listempty}</h3>
                                    </td>
                                </tr>
                            </c:if>
                            <c:forEach items="${listslider}" var="slider">
                                <tr>
                                    <td>${slider.id}</td>
                                    <td>${slider.title}</td>
                                    <td><img src="${slider.image}" alt="${slider.title}" class="img-fluid" style="max-height: 50px;"></td>
                                    <td>${slider.link}</td>
                                    <td>${slider.status}</td>

                                    <c:choose>
                                        <c:when test="${not empty slider.author_id}"><td>${slider.author_id}</td></c:when>
                                        <c:otherwise>${cutomer.id}</c:otherwise>
                                    </c:choose>
                                    <td>
                                        <!-- Buttons to hide, show, and edit slider -->
                                        <form action="${pageContext.request.contextPath}/SliderList" method="POST" style="display: inline-block;">
                                            <input type="hidden" name="sliderId" value="${slider.id}">
                                            <input type="hidden" name="action" value="hide">
                                            <button type="submit" class="btn btn-secondary btn-sm">Hide</button>
                                        </form>
                                        <form action="${pageContext.request.contextPath}/SliderList" method="POST" style="display: inline-block;">
                                            <input type="hidden" name="sliderId" value="${slider.id}">
                                            <input type="hidden" name="action" value="show">
                                            <button type="submit" class="btn btn-success btn-sm">Show</button>
                                        </form>
                                        <a href="${pageContext.request.contextPath}/SliderEdit?sliderId=${slider.id}" class="btn btn-primary btn-sm">Edit</a>
                                        <a href="${pageContext.request.contextPath}/SliderDetail?sliderId=${slider.id}" class="btn btn-primary btn-sm">View</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="mb-4">
                        <a href="SliderInsert" class="btn btn-primary">Insert New Slider</a>
                        <div class="sortpagibar pagi clearfix text-center">
                            <div id="pagination" class="clearfix">

                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <c:forEach var="page" items="${pagenumber}">
                                        <a class="page-node" href="#" data-page="${page}" onclick="submitPage(this); return false;" aria-label="Trang ${page}">${page}</a>
                                    </c:forEach>
                                    <span class="page-node ">&hellip;</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <%@include file="DashboardFooter.jsp" %>


    <script>
        function submitForm() {
            document.getElementById("statusForm").submit();
        }
        function submitPage(element) {
            var page = element.getAttribute("data-page");
            document.getElementById("pageInput").value = page;
            document.getElementById("statusForm").submit();
        }
    </script>
    <!-- Bootstrap JavaScript and other custom scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="resources/scripts.js"></script>
</body>
</html>


