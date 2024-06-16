<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : register
    Created on : May 29, 2023, 11:36:04 PM
    Author     : DUCHIEUPC.COM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Feedback</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">    
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
        <style>
            /* Căn giữa và tạo khoảng cách */
            .container {
                max-width: 900px;
                margin: 0 auto;
                padding: 20px;
                background: #f9f9f9;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }

            /* Kiểu dáng tiêu đề */
            .feedback-content h1 {
                text-align: center;
                font-size: 2em;
                margin-bottom: 20px;
                color: #333;
            }

            /* Định dạng thông tin sản phẩm */
            .product-item {
                display: flex;
                align-items: center;
                margin-bottom: 15px;
            }

            .product-image {
                width: 60px;
                height: 70px;
                margin-right: 10px;
                border-radius: 4px;
            }

            .product-name {
                font-size: 1em;
                color: #555;
            }

            /* Kiểu dáng form */
            .feedback-form {
                display: flex;
                flex-direction: column;
            }

            .feedback-form label {
                margin-top: 10px;
                font-weight: bold;
                color: #333;
            }

            .feedback-textarea {
                width: 100%;
                height: 80px;
                padding: 10px;
                margin-top: 5px;
                border: 1px solid #ddd;
                border-radius: 4px;
                resize: vertical;
            }

            .rate-select {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }

            .file-input {
                margin-top: 5px;
            }

            .submit-btn {
                margin-top: 20px;
                padding: 10px;
                background: #5cb85c;
                border: none;
                color: white;
                border-radius: 4px;
                cursor: pointer;
                transition: background 0.3s;
            }

            .submit-btn:hover {
                background: #4cae4c;
            }

            @media (max-width: 768px) {
                .product-item, .feedback-form {
                    flex-direction: column;
                    align-items: flex-start;
                }
            }
            .avatar-preview {
            display: block;
            width: 200px; /* Adjust the width as needed */
            height: auto; /* Maintain aspect ratio */
            margin: 10px;
        }

        </style>
    </head><!--/head-->

    <body>


        <section style="margin-top: 100px;" id="form"><!--form-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-3 col-sm-offset-1">
                    </div>
                    <div class="col-sm-4">
                        <div class="feedback-content">
                            <h1>Đánh Giá Sản Phẩm</h1>
                            <div class="main-content">


                                <div class="product-info">
                                    <c:set var="order" value="${order}"/>
                                    <div class="row">
                                        <div class="col-md-6">                                                 
                                            <c:forEach items="${listOrderDetails}" var="orderDetail">
                                                <c:if test="${orderDetail.order_id == order.id}">
                                                    <c:set var="productdetail_id" value="${OrderDetail.productdetail_id}"/>
                                                    <c:set var="product_id" value="${ProductDetailDAO.getProductIdByProductDetailId(productdetail_id)}"/>
                                                    <c:forEach items="${listP}" var="product">
                                                        <c:if test="${product.id == product_id}">
                                                            <div>
                                                                <img src="images/product/${product.image}" width="60px" height="70px" alt="${product.name}"/>
                                                                <p>${product.name}</p>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                        <div class="col-md-6">
                                            <form action="Feedback" method="post" onsubmit="return checkInput();" enctype="multipart/form-data">
                                                <span><b>Đánh giá: </b></span>
                                                <textarea name="feedback" id="feedbackContent"></textarea>
                                                <input type="hidden" name="order_id" value="${order.id}">
                                                <span id="invalid" style="color: red;">${sessionScope['messc']}</span>
                                                <div><b>Chất lượng sản phẩm: </b></div>
                                                <div class="rate">
                                                    <select name="rating">
                                                        <option value="1">⭐</option>
                                                        <option value="2">⭐⭐</option>
                                                        <option value="3">⭐⭐⭐</option>
                                                        <option value="4">⭐⭐⭐⭐</option>
                                                        <option value="5">⭐⭐⭐⭐⭐</option>
                                                    </select>
                                                </div><br><br>
                                                <span><b>Thêm hình ảnh </b></span>
                                                <!--                                                <input type="file" id="fbimg" name="fbimg" accept="image/*" multiple><br>-->
                                                <input type="file" class="form-control-file" id="avatar" multiple accept="image/*">
                                                <div id="imageContainer"></div>

                                                <script>
                                                    document.getElementById('avatar').addEventListener('change', function (event) {
                                                        const imageContainer = document.getElementById('imageContainer');
                                                        imageContainer.innerHTML = ''; // Clear any previous images
                                                        const files = event.target.files;

                                                        for (let i = 0; i < files.length; i++) {
                                                            const file = files[i];

                                                            if (file.type.startsWith('image/')) {
                                                                const reader = new FileReader();

                                                                reader.onload = function (e) {
                                                                    const img = document.createElement('img');
                                                                    img.src = e.target.result;
                                                                    img.className = 'avatar-preview';
                                                                    imageContainer.appendChild(img);
                                                                };

                                                                reader.readAsDataURL(file);
                                                            }
                                                        }
                                                    });
                                                </script>
                                                <script>
                                                    function previewAvatar(event) {
                                                        const [file] = event.target.files;
                                                        if (file) {
                                                            document.getElementById('avatarPreview').src = URL.createObjectURL(file);
                                                        }
                                                    }
                                                </script>
                                                <span id="invalid1" style="color: red;"></span><br>
                                                <input name="img" id="sendimg" type="hidden">
                                                <input name="pid" value="${product.id}" type="hidden">
                                                <img id="curAvt" style="width: 100%;" src="">
                                                <input type="submit" value="Gửi" class="submit">
                                            </form>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">

                    </div>
                </div>
            </div>
        </section><!--/form-->




        <script>
            function checkInput() {
                var content = document.getElementById("feedbackContent");
                var img = document.getElementById("fbimg");
                console.log(1);
                var a = 0;
                if (content.value == "") {
                    document.getElementById("invalid").innerHTML = "Content of feedback not allow empty!"
                    a = 1;
                }
                if (content.value.length > 200) {
                    document.getElementById("invalid").innerHTML = "Content of feedback must less than 200 character!"
                    a = 1;
                }
                if (img.value == "") {
                    document.getElementById("invalid1").innerHTML = "Please choose 1 picture!"
                    a = 1;
                }
                console.log(1);
                if (a == 1) {
                    return false;
                } else {
                    return true;
                }

            }
            function changeFbimg() {
                var file = document.getElementById("fbimg").files[0];
                if (file.name.match(/.+\.(jpg|png|jpeg)/i)) {
                    if (file.size / (1024 * 1024) < 5) {
                        var fileReader = new FileReader();
                        fileReader.readAsDataURL(file);
                        fileReader.onload = function () {
                            document.getElementById("sendimg").value = (fileReader.result);
                            document.getElementById("curAvt").src = (fileReader.result);
                        }
                    } else {
                        uploadError();
                    }
                } else {
                    uploadError();
                }
            }
            function uploadError() {
                alert('Please upload photo file < 5MB')
                document.getElementById("fbimg").files[0].value = ''
                document.getElementById("fbimg").type = '';
                document.getElementById("fbimg").type = 'file';
            }
            function  checksubmit() {
                if (document.getElementById("feedbackContent").value.length > 200) {
                    document.getElementById('invalid').style.display = "block";
                    return false;
                }
                if (document.getElementById("fbimg").value == "") {
                    document.getElementById('invalid2').style.display = "block";
                    return false;
                }
                return true;
            }
        </script>

        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>