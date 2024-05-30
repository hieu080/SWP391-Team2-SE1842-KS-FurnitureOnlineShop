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
        <div class="fluid-container mt-5">
            <h1 class="mb-4">Sliders List</h1>
            <!-- Form để lọc và tìm kiếm sliders -->
            <div class="row mb-4">
                <!-- Form để lọc sliders -->
                <div class="col-md-12">
                    <form id="statusForm" action="SliderServlet" method="GET" class="row g-3">
                        <div class="col-4">
                            <select name="status" class="form-select" onchange="submitForm()">
                                <option value="all" ${st == 'all' ? 'selected' : ''}>All</option>
                                <option value="show" ${st == 'show' ? 'selected' : ''}>Visible</option>
                                <option value="hide" ${st == 'hide' ? 'selected' : ''}>Hidden</option>
                            </select>
                        </div>
                        <div class="col-5">
                            <input type="text" name="search" class="form-control" placeholder="Search by title or backlink" value="${search}" >
                        </div>
                        <div class="col-3">
                            <button type="submit" class="btn btn-primary">Filter Action+Search On Title Or BackLink</button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Bảng hiển thị danh sách sliders -->
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Image</th>
                        <th>Backlink</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Sử dụng JSTL để lặp qua danh sách sliders và hiển thị -->
                    <c:if test="${empty listslider}">
                        <tr>
                            <td colspan="6" class="text-center">
                                <h3 class="text-center">${listempty}</h3>
                            </td>
                        </tr>
                    </c:if>
                    <c:forEach items="${listslider}" var="slider">
                        <tr>
                            <td>${slider.id}</td>
                            <td>${slider.title}</td>
                            <td><img src="${slider.image}" alt="${slider.title}" class="img-fluid" style="max-height: 50px;"></td>
                            <td>${slider.backLink}</td>
                            <td>${slider.status}</td>
                            <td>
                                <!-- Các nút để ẩn, hiện và chỉnh sửa slider -->
                                <form action="SliderServlet" method="POST" style="display: inline-block;">
                                    <input type="hidden" name="sliderId" value="${slider.id}">
                                    <input type="hidden" name="action" value="hide">
                                    <button type="submit" class="btn btn-secondary btn-sm">Hide</button>
                                </form>
                                <form action="SliderServlet" method="POST" style="display: inline-block;">
                                    <input type="hidden" name="sliderId" value="${slider.id}">
                                    <input type="hidden" name="action" value="show">
                                    <button type="submit" class="btn btn-success btn-sm">Show</button>
                                </form>
                                <a href="EditSliderServlet?sliderId=${slider.id}" class="btn btn-primary btn-sm">Edit</a>
                                <a href="SliderDetailServlet?sliderId=${slider.id}" class="btn btn-primary btn-sm">View</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="mb-4">
                <a href="InsertSliderServlet" class="btn btn-primary">Insert New Slider</a>
            </div>
        </div>

        <script>
            function submitForm() {
                document.getElementById("statusForm").submit();
            }
        </script>
        <!-- Bootstrap JavaScript và các tệp script tùy chỉnh khác -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/scripts.js"></script>
    </body>
</html>
