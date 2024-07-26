<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>New Post</title>
        <link rel="icon" href="image/logoshop.png" type="image/png">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.all.min.js"></script>

        <style>
            body {
                margin: 20px;
            }
            .thumbnail img {
                max-width: 100px;
                max-height: 100px;
            }
            .edit-btn {
                margin-left: 10px;
            }
            .form-group {
                display: flex;
                align-items: center;
            }
            .form-group input, .form-group select, .form-group textarea {
                flex-grow: 1;
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="DashboardNavbar.jsp" %>
            <div class="main">
               <%@include file="DashboardHeader.jsp" %>
                <div class="container" style="margin-top: 20px">
                    <h1 class="mb-4 text-center">Tạo bài viết mới</h1>

                    <form id="postForm" action="NewPost" method="post" enctype="multipart/form-data">
                        <div class="form-group row">
                            <label for="category" class="col-sm-2 col-form-label">Thể loại</label>
                            <div class="col-sm-10 d-flex align-items-center">
                                <select id="category" name="category" class="form-select">
                                    <c:forEach items="${listCategory}" var="c">
                                        <option value="${c.getId()}">${c.getCategory()}</option>
                                    </c:forEach>                                                  
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="thumbnail" class="col-sm-2 col-form-label">Thumbnail:</label>
                            <div class="col-sm-10 d-flex align-items-center">
                                <div class="thumbnail">
                                    <img id="anh" src="image/post/${post.getThumbnail()}" alt="Thumbnail" class="img-thumbnail">
                                </div>
                                <input id="thumbnailInput" onchange="previewImage(event, 'anh')" name="thumbnail" type="file" class="form-control-file ml-3 mt-2" accept="image/*" required>

                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="title" class="col-sm-2 col-form-label">Tiêu đề</label>
                            <div class="col-sm-10 d-flex align-items-center">
                                <input id="title" type="text" class="form-control" name="title" required>

                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="subtitle" class="col-sm-2 col-form-label">Phụ đề</label>
                            <div class="col-sm-10 d-flex align-items-center">
                                <input id="subtitle" type="text" class="form-control" name="subtitle" required>

                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="status" class="col-sm-2 col-form-label">Trạng thái</label>
                            <div class="col-sm-10 d-flex align-items-center">
                                <select id="status" name="status" class="form-select">

                                    <option value="show" >
                                        Hiển thị
                                    </option>
                                    <option value="hide">
                                        Ẩn
                                    </option>
                                    <option value="featured">
                                        Nổi bật
                                    </option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="content" class="col-sm-2 col-form-label">Nội dung</label>
                            <div class="col-sm-10">
                                <textarea id="content" class="form-control" name="content" rows="5" required>${post.getContent()}</textarea>
                            </div>
                        </div>
                        <script>
                            CKEDITOR.replace('content');
                        </script>  



                        <div class="row mb-5">
                            <div class="col-sm-10 offset-sm-2" style="display: flex; justify-content: center">
                                <button id="saveBtn" type="submit" class="btn btn-primary">Tạo Bài</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
        <%@include file="DashboardFooter.jsp" %>
        <script>

            $(document).ready(function () {
                var result = '${result}';
                if (result === 'success') {
                    Swal.fire({
                        title: 'Tạo thành công',
                        icon: 'success',
                        confirmButtonText: 'Đóng'
                    });
                } else if (result === 'failure') {
                    Swal.fire({
                        title: 'Tạo thất bại',
                        icon: 'error',
                        confirmButtonText: 'Đóng'
                    });
                }
            });
            function previewImage(event, imageId) {
                var input = event.target;
                var reader = new FileReader();
                reader.onload = function () {
                    var dataURL = reader.result;
                    var image = document.getElementById(imageId);
                    image.src = dataURL;
                };
                reader.readAsDataURL(input.files[0]);
                document.getElementById('saveBtn').style.display = 'block';
            }
        </script>

    </body>
</html>