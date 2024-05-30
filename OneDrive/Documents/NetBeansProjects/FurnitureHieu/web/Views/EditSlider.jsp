<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Slider</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="resources/styles.css">
    </head>
    <body>
        <div class="container mt-5">
            <h1 class="mb-4">Edit Slider</h1>
            <div class="card">
                <div class="card-header">
                    <h2>Edit Slider</h2>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/UpdateSliderServlet" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="sliderid" value="${slider.id}">
                        <div class="mb-3">
                            <label for="title" class="form-label">Title:</label>
                            <input type="text" class="form-control" id="title" name="title" value="${slider.title}">
                        </div>
                        <div class="mb-3">
                            <label for="image" class="form-label">Image:</label>
                            <input type="file" class="form-control" id="image" name="imageslider" accept="image/*">
                        </div>
                        <div class="mb-3">
                            <img id="preview" src="${slider.image}" alt="${slider.title}" class="img-fluid" style="max-height: 300px;">
                            <input type="hidden" name="sliderimage" value="${slider.image}">
                        </div>
                        <div class="mb-3">
                            <label for="backLink" class="form-label">Backlink:</label>
                            <input type="text" class="form-control" id="backLink" name="backLink" value="${slider.backLink}">
                        </div>
                        <div class="mb-3">
                            <label for="status" class="form-label">Status:</label>
                            <select class="form-select" id="status" name="status">
                                <option value="show" <c:if test="${slider.status eq 'show'}">selected</c:if>>Show</option>
                                <option value="hide" <c:if test="${slider.status eq 'hide'}">selected</c:if>>Hide</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="notes" class="form-label">Notes:</label>
                                <textarea class="form-control" id="notes" name="notes" rows="3">${slider.notes}</textarea>
                        </div>

                        <button type="submit" class="btn btn-primary">Update Slider</button>
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
                    };
                    reader.readAsDataURL(file);
                }
            });
        </script>
    </body>
</html>
