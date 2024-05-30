<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Insert Slider</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="resources/styles.css">
    </head>
    <body>
        <div class="container mt-5">
            <h1 class="mb-4">Insert Slider</h1>
            <div class="card">
                <div class="card-header">
                    <h2>Insert Slider</h2>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/InsertSliderServlet" method="post" enctype="multipart/form-data">
                        <span id="error-message" style="color: red">${error}</span>
                        <div class="mb-3">
                            <label for="title" class="form-label">Title:</label>
                            <input type="text" class="form-control" id="title" name="title" required>
                        </div>
                        <div class="mb-3">
                            <label for="image" class="form-label">Image:</label>
                            <input type="file" class="form-control" id="image" name="imageslider" accept="image/*" required>
                        </div>
                        <div class="mb-3">
                            <img id="preview" src="" alt="$" class="img-fluid" style="display: none; max-height: 300px;">
                            <input type="hidden" name="sliderimage">
                        </div>
                        <div class="mb-3">
                            <label for="backLink" class="form-label">Backlink:</label>
                            <input type="text" class="form-control" id="backLink" name="backLink" required>
                        </div>
                        <div class="mb-3">
                            <label for="status" class="form-label">Status:</label>
                            <select class="form-select" id="status" name="status">
                                <option value="show">Show</option>
                                <option value="hide">Hide</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="notes" class="form-label">Notes:</label>
                            <textarea class="form-control" id="notes" name="notes" rows="3"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Insert Slider</button>
                        <a href="SliderServlet" class="btn btn-secondary">Cancel</a>
                    </form>
                </div>
            </div>
        </div>

        <!-- Bootstrap JavaScript và các tệp script tùy chỉnh khác -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/scripts.js"></script>
        <script>
            document.getElementById('image').addEventListener('change', function (event) {
                var file = event.target.files[0];
                if (file) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        document.getElementById('preview').src = e.target.result;
                        document.getElementById('preview').style.display = 'block';
                    };
                    reader.readAsDataURL(file);
                }
            });

            window.onload = function() {
                var errorMessage = document.getElementById('error-message');
                if (errorMessage.innerHTML.trim() !== '') {
                    setTimeout(function() {
                        errorMessage.style.display = 'none';
                    }, 3000); // 3000 milliseconds = 3 giây
                }
            };
        </script>
    </body>
</html>
