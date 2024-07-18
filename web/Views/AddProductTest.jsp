<%-- 
    Document   : ProductListMKT
    Created on : Jun 5, 2024, 2:27:59 PM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Product</title>
        <link rel="stylesheet" href="css/main.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
        <style>
            th,
            td {
                padding: 10px;
                text-align: left;
                max-width: 120px; /* Set a maximum width as needed */
                word-break: break-word; /* Break long words to fit within the cell */
                text-align: center;
            }

            h6{
                text-align: center
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
                font-weight: 530;
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


            .actions a {
                margin: 0 5px;
                color: black;
                text-decoration: none;
            }
            .actions a:hover {
                color: blue;
            }
            .image {
                border-radius: 4px;
                overflow: hidden;
                margin-right: 15px;
                max-width: 50px;
                width: 100%;
                height: 50px;
            }
            .image img {
                width: 100%;
            }

            .custom-close-btn {
                position: absolute;
                right: 1.5rem; /* Adjust as needed */
                z-index: 1051; /* Ensure it appears above the modal content */
            }
        </style>
        <style>
            .sort-wrapper {
                position: relative;
            }

            .sort-header {
                position: relative;
                font-size: 14px;
                font-weight: 600;
                padding: 10px 15px;
                background: #fff;
                border: 1px solid #e7e7e7;
                text-transform: uppercase;
                cursor: pointer;
                display: flex;
                justify-content: space-between;
                width: 170px;
            }

            .sort-header .icon-chevron {
                position: relative;
                top: 5px;
                font-size: 8px;
            }

            .sort-content {
                position: absolute;
                left: 0;
                right: 0;
                padding: 5px 15px;
                background: #fff;
                z-index: 100;
                border: 1px solid #e7e7e7;
                border-top: 0;
                pointer-events: none;
                visibility: hidden;
                opacity: 0;
                transition: all 0.3s ease;
            }

            .sort-wrapper:hover .sort-content {
                pointer-events: auto;
                visibility: visible;
                opacity: 1;
            }

            .sort-list {
                padding: 0;
                list-style: none;
            }

            .sort-list li {
                margin-bottom: 5px;
            }

            .sort-list li label {
                width: 140px;
                border: none;
                font-size: 14px;
                text-align: start;
            }

            .sort-list li input[type="radio"]:checked + label {
                background-color: #007bff;
                color: #fff;
                border: 1px solid #0056b3;
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
                font-weight: bold;
            }

            .sort-list li label:hover {
                background-color: #e0e0e0;
            }

            .button-add button, input{
                height: 41px;
            }
        </style>
        <style>
            .filter_tags{
                position: relative;
                display: none;
                line-height: 22px;
                border-radius: 12px;
                margin: 0px 10px 0px 15px;
                color: #5d5d5d;
                background: #fff;
                border: 1px solid #dadada;
                font-size: 13px;
                padding: 0 8px 0 8px;
            }

            .opened{
                display: flex;
                align-items: baseline;
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="DashboardNavbar.jsp" %>
            <div class="main">
                <%@include file="DashboardHeader.jsp" %>
                <div class="container" style="margin-top: 20px; margin-bottom: 20px">
                    <section class="section">
                        <div class="container-fluid" style="padding-left: 13px">
                            <div class="title-wrapper pt-30">
                                <div class="row align-items-center">
                                    <div class="col-md-6">
                                        <div class="title">
                                            <h2><a href="AddProductServlet" style="text-decoration: none">Add Product</a></h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-1"></div>
                            <div class="col-md-9" style="border: groove">
                                <div class="modal-header">
                                    <h3 class="modal-title" id="addProductModalLabel"><b>Add New Product</b></h3>
                                </div>
                                <div class="modal-body">
                                    <form action="AddProductServlet" method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label for="productName"><b>Product Name:</b></label>
                                            <input type="text" class="form-control" id="productName" name="productName" required>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-7">
                                                <div class="form-group">
                                                    <label for="categoryId"><b>Category:</b></label>
                                                    <select class="form-control" id="categoryId" name="categoryId">
                                                        <c:forEach items="${requestScope.categoryList}" var="category">
                                                            <option value="${category.id}">${category.category}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="brandId"><b>Brand:</b></label>
                                                    <select class="form-control" id="brandId" name="brandId">
                                                        <c:forEach items="${requestScope.brandList}" var="brand">
                                                            <option value="${brand.id}">${brand.brandname}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="roomId"><b>Room:</b></label>
                                                    <select class="form-control" id="roomId" name="roomId">
                                                        <c:forEach items="${requestScope.roomList}" var="room">
                                                            <option value="${room.id}">${room.roomname}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="row" style="margin-bottom: 10px">
                                                    <div class="form-group col-md-6">
                                                        <label for="priceProduct"><b>Price:</b></label>
                                                        <input type="number" class="form-control" id="priceProduct" name="priceProduct" required>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label for="quantityProduct"><b>Quantity:</b></label>
                                                        <input type="number" class="form-control" id="quantityProduct" name="quantityProduct" required>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="imageProductInput"><b>Image:</b></label>
                                                    <input type="file" required class="form-control-file" id="imageProductInput" name="imageProduct" accept="image/*" onchange="previewImage(event, 'imageProduct')">
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <img id="imageProduct" src="" width="327px" height="327px" style="max-width: 100%; margin-top: 10px;">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="descriptionProduct"><b>Description:</b></label>
                                            <textarea class="form-control" id="descriptionProduct" name="descriptionProduct" rows="4" required></textarea>
                                        </div>
                                        <script>
                                            CKEDITOR.replace('descriptionProduct');
                                        </script>
                                        <div class="d-flex" style="justify-content: center; margin-top: 10px">
                                            <button id="submitFormAddNewProduct" type="submit" class="btn btn-primary">Save</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <%@include file="DashboardFooter.jsp" %>
    </main>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.bundle.min.js"></script>
    <script>
                                        function previewImage(event, imageId) {
                                            var input = event.target;
                                            var reader = new FileReader();

                                            reader.onload = function () {
                                                var dataURL = reader.result;
                                                var image = document.getElementById(imageId);
                                                image.src = dataURL;
                                            };

                                            reader.readAsDataURL(input.files[0]);
                                        }
    </script>
</body>
</html>
