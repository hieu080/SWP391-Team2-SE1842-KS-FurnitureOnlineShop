<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="css/main.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            th,
            td {
                padding: 10px;
                text-align: left;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                max-width: 150px;
                /* Set a maximum width as needed */
                text-align: center;
            }

            .dropdown {
                position: relative;
                display: inline-block;
                font-family: Arial, sans-serif;
                margin: 10px 5px;
            }

            .dropbtn {
                background-color: white;
                color: black;
                padding: 10px;
                font-size: 16px;
                border: 1px solid #ccc;
                cursor: pointer;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                z-index: 1;
                padding-left: 0px;
            }

            .dropdown-content a {
                color: black;
                padding: 5px 10px;
                text-decoration: none;
                display: block;
            }

            .dropdown-content a:hover {
                background-color: #f1f1f1;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }

            .dropdown:hover .dropbtn {
                background-color: #f1f1f1;
            }

            .actions {
                /*                display: flex;
                                    justify-content: center;
                                    align-items: center;*/
            }

            .actions a {
                margin: 0 5px;
                color: black;
                text-decoration: none;
            }

            .actions a:hover {
                color: blue;
            }

            .add-new-product-btn {
                display: flex;
                align-items: center;
                justify-content: center;
                height: 40px;
                width: 155px;
                background-color: #fff;
                border: 1px solid #ccc;
                font-size: 16px;
                cursor: pointer;
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
        </style>
    </head>

    <body style="background-color:#f1f5f9;">
        <aside class="sidebar-nav-wrapper">
            <div class="navbar-logo">
                <a href="AdminServlet">
                    <img src="" alt="logo" />
                </a>
            </div>
            <nav class="sidebar-nav">
                <ul>
                    <li class="nav-item nav-item-has-children">
                        <a href="#0" class="collapsed" data-bs-toggle="collapse" data-bs-target="#ddmenu_1"
                           aria-controls="ddmenu_1" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon">
                                <svg width="20" height="20" viewBox="0 0 20 20" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M8.74999 18.3333C12.2376 18.3333 15.1364 15.8128 15.7244 12.4941C15.8448 11.8143 15.2737 11.25 14.5833 11.25H9.99999C9.30966 11.25 8.74999 10.6903 8.74999 10V5.41666C8.74999 4.7263 8.18563 4.15512 7.50586 4.27556C4.18711 4.86357 1.66666 7.76243 1.66666 11.25C1.66666 15.162 4.83797 18.3333 8.74999 18.3333Z" />
                                <path
                                    d="M17.0833 10C17.7737 10 18.3432 9.43708 18.2408 8.75433C17.7005 5.14918 14.8508 2.29947 11.2457 1.75912C10.5629 1.6568 10 2.2263 10 2.91665V9.16666C10 9.62691 10.3731 10 10.8333 10H17.0833Z" />
                                </svg>
                            </span>
                            <span class="text">Dashboard</span>
                        </a>
                        <ul id="ddmenu_1" class="collapse dropdown-nav">
                            <li>
                                <a href="AdminServlet"> Admin </a>
                            </li>
                            <li>
                                <a href="HomeServlet" class="active"> Shop Page </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item nav-item-has-children">
                        <a href="#0" class="" data-bs-toggle="collapse" data-bs-target="#ddmenu_2" aria-controls="ddmenu_2"
                           aria-expanded="true" aria-label="Toggle navigation">
                            <span class="icon">
                                <svg width="20" height="20" viewBox="0 0 20 20" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M11.8097 1.66667C11.8315 1.66667 11.8533 1.6671 11.875 1.66796V4.16667C11.875 5.43232 12.901 6.45834 14.1667 6.45834H16.6654C16.6663 6.48007 16.6667 6.50186 16.6667 6.5237V16.6667C16.6667 17.5872 15.9205 18.3333 15 18.3333H5.00001C4.07954 18.3333 3.33334 17.5872 3.33334 16.6667V3.33334C3.33334 2.41286 4.07954 1.66667 5.00001 1.66667H11.8097ZM6.66668 7.70834C6.3215 7.70834 6.04168 7.98816 6.04168 8.33334C6.04168 8.67851 6.3215 8.95834 6.66668 8.95834H10C10.3452 8.95834 10.625 8.67851 10.625 8.33334C10.625 7.98816 10.3452 7.70834 10 7.70834H6.66668ZM6.04168 11.6667C6.04168 12.0118 6.3215 12.2917 6.66668 12.2917H13.3333C13.6785 12.2917 13.9583 12.0118 13.9583 11.6667C13.9583 11.3215 13.6785 11.0417 13.3333 11.0417H6.66668C6.3215 11.0417 6.04168 11.3215 6.04168 11.6667ZM6.66668 14.375C6.3215 14.375 6.04168 14.6548 6.04168 15C6.04168 15.3452 6.3215 15.625 6.66668 15.625H13.3333C13.6785 15.625 13.9583 15.3452 13.9583 15C13.9583 14.6548 13.6785 14.375 13.3333 14.375H6.66668Z" />
                                <path
                                    d="M13.125 2.29167L16.0417 5.20834H14.1667C13.5913 5.20834 13.125 4.74197 13.125 4.16667V2.29167Z" />
                                </svg>
                            </span>
                            <span class="text">Pages</span>
                        </a>
                        <ul id="ddmenu_2" class="collapsed show dropdown-nav">
                            <li>
                                <a href="CRUDServlet" class="active"> Settings </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </aside>
        <main class="main-wrapper">
            <header class="header">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-5 col-md-5 col-6">
                        </div>
                        <div class="col-lg-7 col-md-7 col-6">
                            <div class="header-right">
                                <!-- profile start -->
                                <div class="profile-box ml-15">
                                    <button class="dropdown-toggle bg-transparent border-0" type="button" id="profile"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                        <div class="profile-info">
                                            <div class="info">
                                                <div class="image">
                                                    <img src="" alt="" />
                                                </div>
                                                <div>
                                                    <h6 class="fw-500">Adam Joe</h6>
                                                    <p>Admin</p>
                                                </div>
                                            </div>
                                        </div>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profile">
                                        <li>
                                            <div class="author-info flex items-center">
                                                <div class="image">
                                                    <img src="" alt="image">
                                                </div>
                                                <div class="content">
                                                    <h4 class="text-sm">Adam Joe</h4>
                                                    <a class="text-black/40 dark:text-white/40 hover:text-black dark:hover:text-white text-xs"
                                                       href="#">Email@gmail.com</a>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="divider"></li>
                                        <li>
                                            <a href="#0">
                                                <i class="lni lni-user"></i> View Profile
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#0">
                                                <i class="lni lni-alarm"></i> Notifications
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#0"> <i class="lni lni-inbox"></i> Messages </a>
                                        </li>
                                        <li>
                                            <a href="#0"> <i class="lni lni-cog"></i> Settings </a>
                                        </li>
                                        <li class="divider"></li>
                                        <li>
                                            <a href="#0"> <i class="lni lni-exit"></i> Sign Out </a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- profile end -->
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <section class="section">
                <div class="row" style="margin-left: 15px">
                    <div class="col-md-5 row" style="background-color: white; border-radius: 5px; margin: 15px 15px;">
                        <h3>New Product</h3>
                        <form method="get" enctype="multipart/form-data">
                            <div class="col-md-12">
                                <b>Product Name:</b><input type="text" name=""
                                                           style=" margin-bottom: 5px; margin-left: 15px; width: 346px;" />
                            </div>
                            <div class="row">
                                <div class="col-md-7">
                                    <b>Category:</b><select name="categoryId"
                                                            style="margin-left: 53px; width: 136px; margin-bottom: 5px;">
                                        <option value="">NEKO</option>
                                    </select><br />
                                    <b>Brand:</b><select name="brandId"
                                                         style="margin-left: 80px; width: 136px; margin-bottom: 5px;">
                                        <option value="">NEKO</option>
                                    </select><br />
                                    <b>Room:</b><select name="roomId"
                                                        style="margin-left: 81px; width: 136px; margin-bottom: 5px;">
                                        <option value="">NEKO</option>
                                    </select><br />
                                    <b>Price:</b><input type="text" name=""
                                                        style="margin-left: 87px; width: 136px; margin-bottom: 5px;" />
                                    <b>Quantity:</b><input type="text" name=""
                                                           style="margin-left: 58px; width: 136px; margin-bottom: 5px;" />
                                </div>
                                <div class="col-md-5">
                                    <img src="" width="140px" height="140px" style="margin-left: 46px;" id="imageProduct"><br />
                                </div>
                                <div>
                                    <b>Image:</b><input type="file" name="" accept="image/*"
                                                        style="margin-left: 78px; margin-bottom: 5px; width: 310px;" id="imageProductInput" onchange="previewImage(event, 'imageProduct')"/>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <b>Description</b><br />
                                <textarea name="" id="" cols="58" rows="10"></textarea>
                            </div>
                            <div style="display: flex; justify-content: center;">
                                <input type="submit" value="Save"
                                       style="margin-top: 5px; margin-bottom: 10px; width: 65px;" />
                            </div>
                        </form>
                    </div>

                    <div class="col-md-6 row" style="background-color: white; border-radius: 5px; margin: 15px 15px;">
                        <h3>New Product Detail</h3>
                        <form method="post" enctype="multipart/form-data">
                            <div class="col-md-12" style="margin-top: 15px;">
                                <b>Product Name:</b>
                                <select name="" id="" style=" margin-left: 10px; width: 454px; margin-bottom: 5px;">
                                    <option value="">Sản phẩm aaaaaaaaaaaaaaaaaaaaaaaaaaaa</option>
                                </select>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <b>Color:</b>
                                    <select name="colorId" style="margin-left: 79px; width: 149px; margin-bottom: 5px;">
                                        <option value="">Cam</option>
                                    </select><br />
                                </div>
                                <div class="col-md-6">
                                    <b>Quantity:</b><input type="text" name=""
                                                           style="margin-left: 35px; width: 170px; margin-bottom: 5px;" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <img id="imagePreview1" src="" width="170px" height="170px"
                                         style="margin-bottom: 5px; margin-left: 60px;" />
                                    <b>Image:</b><input type="file" style="margin-bottom: 5px; width: 290px;"
                                                        name="imageProductDetail1" id="imageProductDetailInput1"
                                                        onchange="previewImage(event, 'imagePreview1')" accept="image/*"/>
                                </div>
                                <div class="col-md-6">
                                    <img id="imagePreview2" src="" width="170px" height="170px"
                                         style="margin-bottom: 5px; margin-left: 60px;" />
                                    <b>Image:</b><input type="file" style="margin-bottom: 5px; width: 290px;" name="
                                                        imageProductDetail2" id="imageProductDetailInput2"
                                                        onchange="previewImage(event, 'imagePreview2')" accept="image/*"/>
                                </div>
                                <div class=" col-md-6">
                                    <img id="imagePreview3" src="" width="170px" height="170px"
                                         style="margin-bottom: 5px; margin-left: 60px;" />
                                    <b>Image:</b><input type="file" style="margin-bottom: 5px; width: 290px;" name="
                                                        imageProductDetail3" id="imageProductDetailInput3"
                                                        onchange="previewImage(event, 'imagePreview3')" accept="image/*"/>
                                </div>
                                <div class=" col-md-6">
                                    <img id="imagePreview4" src="" width="170px" height="170px"
                                         style="margin-bottom: 5px; margin-left: 60px;" />
                                    <b>Image:</b><input type="file" style="margin-bottom: 5px; width: 290px;" name="
                                                        imageProductDetail4" id="imageProductDetailInput4"
                                                        onchange="previewImage(event, 'imagePreview4')" accept="image/*"/>
                                </div>
                            </div>
                            <div style=" display: flex; justify-content: center;">
                                <input type="submit" value="Save"
                                       style="margin-bottom: 10px; margin-top: 10px; width: 65px;" />
                            </div>
                        </form>
                    </div>
                </div>
            </section>
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