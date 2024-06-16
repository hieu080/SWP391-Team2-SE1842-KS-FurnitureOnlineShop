<%-- 
    Document   : PostsList
    Created on : Jun 12, 2024, 3:37:09 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <title>Posts List</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    </head>

    <body>
        <div class="container">
            <h1>Posts List</h1>
            <form action="PostsList">
                Loại bài viết:
                <select name="category" >
                    <option value="" >All</option>
                    <c:forEach items="${listCategory}" var="c">
                        <option value="${c.getId()}"
                                <c:if test="${c.getId()==param.category}">selected</c:if>>${c.getCategory()}</option>
                    </c:forEach>
                </select>
                Tác giả:
                <select name="author" >
                    <option value="" >All</option>
                    <c:forEach items="${listMkt}" var="m">
                        <option value="${m.getId()}"
                                <c:if test="${m.getId()==param.author}">selected</c:if>>${m.getFullname()}</option>
                    </c:forEach>
                </select>
                Trạng thái:
                <select name="status" >
                    <option value="">All</option>
                    <c:forEach items="${listStatus}" var = "s">
                        <option value="${s}"
                                <c:if test="${s eq param.status}">selected
                                </c:if>>${s}
                        </option>
                    </c:forEach>
                </select>
                <button type="submit">Lọc</button>
            </form>
            <table id="table" class="display" style="width:100%">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Thumbnail</th>
                        <th>Tiêu đề</th>
                        <th>Loại bài viết</th>
                        <th>Tác giả</th>
                        <th>Trạng thái</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listPost}" var="p">
                        <tr>
                            <td>${p.getId()}</td>
                            <td>
                                <div style="width:80px;height:50px">
                                    <img src="image/post/${p.getThumbnail()}" alt="alt" style="width:100%;height: 100%"/>
                                </div></td>
                            <td>${p.getTitle()}</td>
                            <td><c:forEach items="${listCategory}" var="category">
                                    <c:if test="${category.getId() == p.getCategory_id()}">
                                        <p>${category.getCategory()}</p>
                                    </c:if>
                                </c:forEach></td>
                            <td><c:forEach items="${listMkt}" var="mkt">
                                    <c:if test="${mkt.getId() == p.getMkt_id()}">
                                        <p>${mkt.getFullname()}</p>
                                    </c:if>
                                </c:forEach></td>
                            <td>
                                <form action="PostsList" method="post">
                                    <input type="hidden" name="id" value="${p.getId()}">
                                    <select name="newstatus" onchange="this.form.submit()">
                                        <c:forEach items="${listStatus}" var = "s">
                                            <option value="${s}"
                                                    <c:if test="${s eq p.getStatus()}">selected
                                                    </c:if>>${s}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </form>
                            </td>

                            <td><a href="PostDetails?id=${p.getId()}" class="text-decoration-none text-black btn btn-info">Chi tiết</a></td>
                        </tr>  
                    </c:forEach>
                </tbody>
            </table>
            
            <a class="btn btn-primary" href="NewPost">Tạo bài viết mới</a>
        </div>

        <script>
            $(document).ready(function () {
                // Khôi phục lại trang từ localStorage trước khi khởi tạo DataTable
                var currentPage = localStorage.getItem('currentPage');
                currentPage = currentPage ? parseInt(currentPage) : 0;

                var table = $('#table').DataTable({
                    "columnDefs": [
                        {"targets": [0, 1, 3, 4, 5], "searchable": false}, // tắt tính năng tìm kiếm cho các cột khác
                        {"orderable": false, "targets": [0, 1, 6]} // Vô hiệu hóa sắp xếp cho các cột
                    ],
                    "language": {
                        "search": "Tìm kiếm theo tiêu đề:"
                    },
                    "pageLength": 5,
                    "dom": 'rftp',
                    "displayStart": currentPage * 5 // Hiển thị trang đã lưu
                });

                // Lưu trữ trang hiện tại vào localStorage khi thay đổi trang
                table.on('page.dt', function () {
                    var pageInfo = table.page.info();
                    localStorage.setItem('currentPage', pageInfo.page);
                });

            });
        </script>

    </body>

</html>
