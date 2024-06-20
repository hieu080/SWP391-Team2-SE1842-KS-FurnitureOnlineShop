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
        <title>Feedback</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            .feedback-rating {
                display: flex;
                flex-direction: row-reverse;
                justify-content: center;
            }
            .feedback-rating input {
                display: none;
            }
            .feedback-rating label {
                font-size: 2rem;
                color: #ccc;
                cursor: pointer;
                transition: color 0.2s;
            }
            .feedback-rating input:checked ~ label,
            .feedback-rating input:hover ~ label,
            .feedback-rating label:hover,
            .feedback-rating label:hover ~ label {
                color: #f5b301;
            }

            .avatar-preview {
                height: 100px;
                width: 100px;  /* Fixed height and width for images */
                object-fit: cover; /* Cover the div without stretching */
                margin-top: 10px;
            }
        </style>
    </head><!--/head-->

    <body>
        <div class="">
            <form action="Feedback" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="feedbackContent"><b>Đánh giá: </b></label>
                    <textarea class="form-control" name="feedback" id="feedbackContent" rows="7"></textarea>
                </div>
                <div class="form-group">
                    <label><b>Chất lượng sản phẩm: </b></label>
                    <div class="feedback-rating">
                        <input type="radio" id="star5" name="rating" value="5"><label for="star5">★</label>
                        <input type="radio" id="star4" name="rating" value="4"><label for="star4">★</label>
                        <input type="radio" id="star3" name="rating" value="3"><label for="star3">★</label>
                        <input type="radio" id="star2" name="rating" value="2"><label for="star2">★</label>
                        <input type="radio" id="star1" name="rating" value="1"><label for="star1">★</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="avatar"><b>Thêm hình ảnh </b></label>
                    <input type="file" class="form-control-file" id="avatar" multiple accept="image/*">
                </div>
                <div class="row" id="imageContainer"></div>
                <div class="form-group" style="margin-top: 15px; display: flex; justify-content: center">
                    <input type="submit" value="Đánh giá" class="btn btn-primary">
                </div>
            </form>
        </div>



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
                                                <c:forEach items="${productDetailList}" var="productDetail">
                                                    <c:if test="${productDetail.id == orderDetail.productdetail_id}">
                                                        <c:forEach items="${listP}" var="product">
                                                            <c:if test="${product.id == productDetail.product_id}">
                                                                <div>
                                                                    <img src="image/product/${product.image}" width="60px" height="70px" alt="${product.name}"/>
                                                                    <p>${product.name}</p>
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                </c:forEach>
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
                        const colDiv = document.createElement('div');
                        colDiv.className = 'col-md-3';
                        const img = document.createElement('img');
                        img.src = e.target.result;
                        img.className = 'avatar-preview';
                        colDiv.appendChild(img);
                        imageContainer.appendChild(colDiv);
                    };

                    reader.readAsDataURL(file);
                }
            }
        });
    </script>
    </body>
</html>