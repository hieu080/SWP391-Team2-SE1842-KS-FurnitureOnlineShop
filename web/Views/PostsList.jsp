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

        <style>
            .dataTable th::before,
            .dataTable th::after {
                content: none !important;
                display: none !important;
            }

            .dropdown {
                position: relative;
                display: inline-block;
                font-family: Arial, sans-serif;
                margin: 10px 5px;
                width: 150px;
            }

            .dropbtn {
                background-color: white;
                color: black;
                padding: 10px;
                /*                font-size: 16px;*/
                border: 1px solid #ccc;
                cursor: pointer;
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 100%;
                text-transform: uppercase;

            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                z-index: 1;
                min-width: 100%;
                left: 0;
                right: 0;
                border: 1px solid #e7e7e7;
                border-top: 0;
                padding: 5px 0;
                visibility: hidden;
                opacity: 0;
                transition: all 0.3s ease;
            }

            .dropdown-content li {
                padding: 5px 10px;
                list-style: none;
                font-size: 14px;
                border-bottom: 1px solid #e7e7e7;
                display: flex;
                align-items: center;
            }

            .dropdown-content li:last-child {
                border-bottom: none;
            }

            .dropdown-content li input[type="checkbox"] {
                margin-right: 10px;
            }

            .dropdown-content li:hover {
                background-color: #f1f1f1;
            }

            .dropdown:hover .dropdown-content {
                display: block;
                visibility: visible;
                opacity: 1;
            }

            .dropdown:hover .dropbtn {
                background-color: #f1f1f1;
            }

            .group_filter_tags {
                margin-top: 10px;
                padding-bottom: 20px;
                display: flex;
                align-items: center;
                flex-wrap: wrap;
            }

            .filter_tags {
                display: none; /* Ẩn mặc định, chỉ hiển thị khi có checkbox được tick */
                margin-right: 10px;
                background-color: white;
                padding: 5px 10px;
                border-radius: 20px;
                border: 1px solid #ccc;
                font-size: 14px;
                font-weight: 500;
            }

            .filter_tags .filter-label {
                margin-right: 5px;
            }

            .filter_tags .remove-filter {
                margin-left: 5px;
                cursor: pointer;
            }

            .filter_tags.filter_tags_remove_all {
                background-color: white;
                border: 1px solid #ccc;
                padding: 5px 10px;
            }

            .filter_tags.filter_tags_remove_all a {
                color: #007bff;
                text-decoration: none;
                font-size: 14px;
                font-weight: 500;
                cursor: pointer;
            }

            .filter_tags.filter_tags_remove_all a:hover {
                text-decoration: underline;
            }




        </style>
    </head>

    <body>
        <div class="wrapper">
            <%@include file="DashboardNavbar.jsp" %>
            <div class="main">
                <div>
                    <%@include file="DashboardHeader.jsp" %>
                </div>
                <div class="container card" style="margin-top: 20px; margin-bottom: 20px">
                    <h1 class="mt-3">Posts List</h1>

                    <!-- filter-->

                    <!--========================================================================================================================================-->

                    <div>
                        <div class="ml-15 mb-15 d-flex" style="align-items: center">
                            <div style="font-weight: 600; font-size: 16px; text-transform: uppercase;">
                                <span class="icon_title"><i class="fa fa-filter"></i></span>
                                <span>Bộ Lọc</span>
                            </div>
                            <div class="dropdown" style="margin-left: 15px; width: 160px">
                                <div class="dropbtn">
                                    Danh mục
                                    <span><i class="fa fa-chevron-down"></i></span>
                                </div>
                                <ul class="dropdown-content">
                                    <c:forEach items="${listCategory}" var="c">
                                        <li>
                                            <label><input type="checkbox" value="${c.getCategory()}" class="filter-checkbox" data-column="3"/> 
                                                ${c.getCategory()}</label>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="dropdown" style="width: 170px">
                                <div class="dropbtn">
                                    Tác giả
                                    <span><i class="fa fa-chevron-down"></i></span>
                                </div>
                                <ul class="dropdown-content">
                                    <c:forEach items="${listMkt}" var="m">
                                        <li>
                                            <label><input type="checkbox" value="${m.getFullname()}" class="filter-checkbox" data-column="4"/>
                                                ${m.getFullname()}</label>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>

                            <div class="dropdown">
                                <div class="dropbtn">
                                    Trạng thái
                                    <span><i class="fa fa-chevron-down"></i></span>
                                </div>
                                <ul class="dropdown-content">
                                    <li>
                                        <label><input type="checkbox" value="show" data-column="5" class="filter-checkbox"/>
                                            Hiển thị</label>
                                    </li>
                                    <li>
                                        <label><input type="checkbox" value="hide" data-column="5" class="filter-checkbox" />
                                            Ẩn</label>
                                    </li>
                                    <li>
                                        <label><input type="checkbox" value="featured" data-column="5" class="filter-checkbox"/>
                                            Nổi bật</label>
                                    </li>
                                </ul>
                            </div>
                        </div>            

                        <div class="group_filter_tags">
                            <div class="filter_tags" id="category-tag-wrapper">
                                Danh mục: <span id="category-tag"></span>
                            </div>
                            <div class="filter_tags" id="author-tag-wrapper">
                                Tác giả: <span id="author-tag"></span>
                            </div>
                            <div class="filter_tags" id="status-tag-wrapper">
                                Trạng thái: <span id="status-tag"></span>
                            </div>
                            <div id="clear-all-filters" class="filter_tags filter_tags_remove_all opened">
                                <a href="javascript:void(0)">Xóa hết</a>
                            </div>
                        </div>

                    </div>


                    <!--                    datatable hiển thị các post-->
                    <table id="table" class="display" style="width:100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Thumbnail</th>
                                <th>Tiêu đề</th>
                                <th>Danh mục</th>
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
                                                ${category.getCategory()}
                                            </c:if>
                                        </c:forEach></td>
                                    <td><c:forEach items="${listMkt}" var="mkt">
                                            <c:if test="${mkt.getId() == p.getMkt_id()}">
                                                ${mkt.getFullname()}
                                            </c:if>
                                        </c:forEach></td>
                                    <td>
                                        <form id="statusForm-${p.getId()}" onsubmit="return false;">
                                            <input type="hidden" name="id" value="${p.getId()}">
                                            <select name="newstatus" onchange="sendStatusUpdate(${p.getId()})" class="form-select">
                                                <option value="show" <c:if test="${'show' eq p.getStatus()}">selected</c:if>>Hiển thị</option>
                                                <option value="hide" <c:if test="${'hide' eq p.getStatus()}">selected</c:if>>Ẩn</option>
                                                <option value="featured" <c:if test="${'featured' eq p.getStatus()}">selected</c:if>>Nổi bật</option>
                                                </select>
                                            </form>
                                            <p class="d-none">${p.getStatus()}</p>
                                    </td>

                                    <td><a href="PostDetails?id=${p.getId()}" class="text-decoration-none text-black btn btn-info">Chi tiết</a></td>
                                </tr>  
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="mb-3">
                        <a style="margin-top: 20px" class="btn btn-primary" href="NewPost">Tạo bài viết mới</a>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function sendStatusUpdate(postId) {
                var form = $('#statusForm-' + postId);
                var newStatus = form.find('select[name="newstatus"]').val();

                $.ajax({
                    type: "POST",
                    url: "PostsList", // URL servlet của bạn
                    data: {
                        id: postId,
                        newstatus: newStatus
                    },
                    success: function () {
                        alert("Bài viết #" + postId + ": Cập nhật trạng thái thành công!");
                    },
                    error: function (xhr, status) {
                        alert("Bài viết #" + postId + ":Cập nhật trạng thái thất bại! ");
                    }
                });
            }

            $(document).ready(function () {
                var currentPage = localStorage.getItem('currentPage');
                currentPage = currentPage ? parseInt(currentPage) : 0;

                var table = $('#table').DataTable({
                    "columnDefs": [
                        {"orderable": false, "targets": [0, 1, 5, 6]}
                    ],
                    "language": {
                        "search": "Tìm kiếm:"
                    },
                    "pageLength": 5,
                    "dom": 'rftp',
                    "displayStart": currentPage * 5
                });

                function updateFilterLabels() {
                    var filterTags = {
                        3: [],
                        4: [],
                        5: []
                    };

                    $('.filter-checkbox:checked').each(function () {
                        var column = $(this).data('column');
                        var label = $(this).parent().text().trim();
                        filterTags[column].push('<span class="filter-label" data-value="' + $(this).val() + '" data-column="' + column + '">' + label + ' <i class="fa fa-times-circle remove-filter"></i></span>');
                    });

                    $('#category-tag').html(filterTags[3].join(', '));
                    $('#author-tag').html(filterTags[4].join(', '));
                    $('#status-tag').html(filterTags[5].join(', '));

                    $('#category-tag-wrapper').toggle(filterTags[3].length > 0);
                    $('#author-tag-wrapper').toggle(filterTags[4].length > 0);
                    $('#status-tag-wrapper').toggle(filterTags[5].length > 0);

                    if ($('.filter-checkbox:checked').length > 0) {
                        $('#clear-all-filters').show();
                    } else {
                        $('#clear-all-filters').hide();
                    }
                }

                function applyFilters() {
                    var filters = {};

                    $('.filter-checkbox:checked').each(function () {
                        var column = $(this).data('column');
                        var value = $(this).val();

                        if (!filters[column]) {
                            filters[column] = [];
                        }
                        filters[column].push(value);
                    });

                    table.columns().every(function () {
                        var column = this.index();
                        if (filters[column]) {
                            this.search(filters[column].join('|'), true, false).draw();
                        } else {
                            this.search('').draw();
                        }
                    });

                    if ($('.filter-checkbox:checked').length === 0) {
                        table.search('').columns().search('').draw();
                    }
                }

                $('.filter-checkbox').on('change', function () {
                    applyFilters();
                    updateFilterLabels();
                });

                // Đảm bảo rằng sự kiện click được gắn đúng
                $(document).on('click', '.remove-filter', function () {
                    var value = $(this).parent().data('value');
                    var column = $(this).parent().data('column');
                    $('.filter-checkbox[data-column="' + column + '"][value="' + value + '"]').prop('checked', false).trigger('change');
                });

                table.on('page.dt', function () {
                    var pageInfo = table.page.info();
                    localStorage.setItem('currentPage', pageInfo.page);
                });

                $('#clear-all-filters').on('click', function () {
                    $('.filter-checkbox').prop('checked', false).trigger('change');
                });

                updateFilterLabels();
            });
        </script>
        <%@include file="DashboardFooter.jsp" %>
    </body>

</html>