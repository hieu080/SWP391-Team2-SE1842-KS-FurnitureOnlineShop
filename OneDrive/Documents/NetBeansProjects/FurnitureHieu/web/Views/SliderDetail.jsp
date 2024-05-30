<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Slider Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="resources/styles.css">
    <style>
        /* style slider detail*/
/* resources/styles.css */

/* Body Styling */
body {
    background-color: #f8f9fa;
    font-family: 'Arial', sans-serif;
}

/* Card Styling */
.card {
    border-radius: 10px;
    overflow: hidden;
}

/* Card Header Styling */
.card-header {
    background-color: #007bff;
    color: white;
    padding: 20px;
}

/* Card Body Styling */
.card-body {
    padding: 20px;
}

/* Image Styling */
.img-fluid {
    max-height: 300px;
    object-fit: cover;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* Button Styling */
.btn-primary {
    background-color: #007bff;
    border-color: #007bff;
}

.btn-primary:hover {
    background-color: #0056b3;
    border-color: #0056b3;
}

/* Badge Styling */
.badge {
    font-size: 1rem;
}

/* Margin Top for Container */
.container {
    margin-top: 50px;
}

    </style>
</head>

<body>
    <div class="container mt-5">
        <div class="card shadow-sm">
            <div class="card-header text-center bg-primary text-white">
                <h2>${slider.title}</h2>
            </div>
            <div class="card-body">
                <div class="d-flex justify-content-center mb-3">
                    <img src="${slider.image}" alt="${slider.title}" class="img-fluid" style="max-height: 300px;">
                </div>
                <p><strong>Backlink:</strong> <a href="${slider.backLink}" target="_blank">${slider.backLink}</a></p>
                <p><strong>Status:</strong> <span class="badge ${slider.status == 'visible' ? 'bg-success' : 'bg-secondary'}">${slider.status}</span></p>
                <p><strong>Notes:</strong> ${slider.notes}</p>
                <div class="d-flex justify-content-center mt-4">
                    <a href="SliderServlet" class="btn btn-primary">Back to List</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JavaScript và các tệp script tùy chỉnh khác -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="resources/scripts.js"></script>
</body>
</html>
