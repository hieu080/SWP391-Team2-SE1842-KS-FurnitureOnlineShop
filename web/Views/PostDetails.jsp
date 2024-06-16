<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Post Details</title>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
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
        <div class="container">
            <h1 class="mb-4">Chi tiết bài viết: #${post.getId()}</h1>
            <div class="row justify-content-between">
                <div class="d-flex col-4 justify-content-between">
                    <h5 class="">Thể loại:
                        <c:forEach items="${listCategory}" var="category">
                            <c:if test="${category.getId() == post.getCategory_id()}">
                                <span class="text-info">${category.getCategory()}</span>
                            </c:if>
                        </c:forEach>
                    </h5>
                    <h5 class="">Tác giả: <span class="text-info">${author}</span></h5>
                </div>
<!--                <button class="btn btn-secondary col-2">Lịch sử chỉnh sửa</button>-->
            </div>

            <form id="postForm" action="PostDetails?id=${post.getId()}" method="post" enctype="multipart/form-data">
                <div class="form-group row">
                    <label for="thumbnail" class="col-sm-2 col-form-label">Thumbnail:</label>
                    <div class="col-sm-10 d-flex align-items-center">
                        <div class="thumbnail">
                            <img id="anh" src="image/post/${post.getThumbnail()}" alt="Thumbnail" class="img-thumbnail">
                        </div>
                        <input id="thumbnailInput" onchange="previewImage(event, 'anh')" name="thumbnail" type="file" class="form-control-file ml-3 mt-2" accept="image/*" style="display: none;">
                        <button type="button" class="btn btn-secondary btn-sm edit-btn" onclick="editField('thumbnailInput')">
                            <i class="fas fa-edit"></i>
                        </button>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="title" class="col-sm-2 col-form-label">Tiêu đề</label>
                    <div class="col-sm-10 d-flex align-items-center">
                        <input id="title" type="text" class="form-control" name="title" value="${post.getTitle()}" readonly>
                        <button type="button" class="btn btn-secondary btn-sm edit-btn" onclick="editField('title')">
                            <i class="fas fa-edit"></i>
                        </button>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="subtitle" class="col-sm-2 col-form-label">Phụ đề</label>
                    <div class="col-sm-10 d-flex align-items-center">
                        <input id="subtitle" type="text" class="form-control" name="subtitle" value="${post.getSubtitle()}" readonly>
                        <button type="button" class="btn btn-secondary btn-sm edit-btn" onclick="editField('subtitle')">
                            <i class="fas fa-edit"></i>
                        </button>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="status" class="col-sm-2 col-form-label">Trạng thái</label>
                    <div class="col-sm-10 d-flex align-items-center">
                        <input id="stt" type="text" class="form-control" value="${post.getStatus()}" readonly>
                        <select id="status" name="status" class="form-control" style="display: none;">
                            <c:forEach items="${listStatus}" var="s">
                                <option value="${s}" <c:if test="${s eq post.getStatus()}">selected</c:if>>${s}</option>
                            </c:forEach>
                        </select>
                        <button type="button" class="btn btn-secondary btn-sm edit-btn" onclick="editField('status')">
                            <i class="fas fa-edit"></i>
                        </button>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="content" class="col-sm-2 col-form-label">Nội dung</label>
                    <div class="col-sm-10 d-flex align-items-center">
                        <textarea id="content" class="form-control" name="content" rows="5" readonly>${post.getContent()}</textarea>
                        <button type="button" class="btn btn-secondary btn-sm edit-btn" onclick="editField('content')">
                            <i class="fas fa-edit"></i>
                        </button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-10 offset-sm-2">
                        <button id="saveBtn" type="submit" class="btn btn-primary" style="display:none;">Lưu</button>
                    </div>
                </div>
            </form>

            <!-- Modal -->
            <div class="modal fade" id="resultModal" tabindex="-1" aria-labelledby="resultModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="resultModalLabel">Thông báo</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p id="modalMessage"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function editField(fieldId) {
                var field = document.getElementById(fieldId);
                if (field.type === 'file') {
                    field.style.display = 'block';
                } else {
                    field.readOnly = false;
                    if (field.tagName.toLowerCase() === 'select') {
                        field.style.display = 'block';
                        document.getElementById('stt').style.display = 'none';
                    }
                }
                document.getElementById('saveBtn').style.display = 'block';
            }

            $(document).ready(function () {
                var result = '${result}';
                if (result === 'success') {
                    $('#modalMessage').text('Lưu thành công.');
                    $('#resultModal').modal('show');
                } else if (result === 'failure') {
                    $('#modalMessage').text('Lưu thất bại.');
                    $('#resultModal').modal('show');
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

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.5.4/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
