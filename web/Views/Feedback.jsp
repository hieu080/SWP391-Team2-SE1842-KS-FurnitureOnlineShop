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

            .img-preview {
                width: 100%;
                object-fit: cover;
                margin-bottom: 10px;
            }
        </style>
    </head><!--/head-->

    <body>
        <div class="container" style="margin-bottom: 20px; margin-top: 15px">
            <h1>Đánh Giá Sản Phẩm</h1>
            <hr/>
            <form action="FeedbackServlet" method="post" enctype="multipart/form-data">
                <c:set var="countProduct" value="0" scope="page"/>
                <c:set var="order" value="${order}"/>
                <input type="hidden" name="orderId" value="${order.id}"/>
                <c:forEach items="${listOrderDetails}" var="orderDetail">
                    <c:forEach items="${productDetailList}" var="productDetail">
                        <c:if test="${productDetail.id == orderDetail.productdetail_id}">
                            <c:forEach items="${listP}" var="product">
                                <c:if test="${product.id == productDetail.product_id}">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <img src="image/product/${product.image}" width="200px" height="200px" alt="${product.name}"/>
                                            <p>${product.name}</p>
                                            <input type="hidden" name="productId_${countProduct}" value="${product.id}"/>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <label for="feedbackContent"><b>Đánh giá: </b></label>
                                                <textarea class="form-control" name="feedback_${countProduct}" id="feedbackContent" rows="7"></textarea>
                                            </div>
                                            <div class="form-group" style="display: flex">
                                                <label><b>Chất lượng sản phẩm: </b></label>
                                                <div class="feedback-rating" style="margin-left: 15px">
                                                    <input type="radio" id="star5_${countProduct}" name="rating_${countProduct}" value="5"><label for="star5_${countProduct}">★</label>
                                                    <input type="radio" id="star4_${countProduct}" name="rating_${countProduct}" value="4"><label for="star4_${countProduct}">★</label>
                                                    <input type="radio" id="star3_${countProduct}" name="rating_${countProduct}" value="3"><label for="star3_${countProduct}">★</label>
                                                    <input type="radio" id="star2_${countProduct}" name="rating_${countProduct}" value="2"><label for="star2_${countProduct}">★</label>
                                                    <input type="radio" id="star1_${countProduct}" name="rating_${countProduct}" value="1"><label for="star1_${countProduct}">★</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="avatar"><b>Thêm hình ảnh </b></label>
                                                <input type="file" class="form-control-file" id="imgfeedback_${countProduct}" name="imgfeedback_${countProduct}" multiple accept="image/*" onchange="previewImages(this, ${countProduct})">
                                            </div>
                                            <div class="row" id="imageContainer_${countProduct}"></div>
                                            <input type="hidden" name="fileCount_${countProduct}" id="fileCount_${countProduct}" value="0"/>
                                        </div>
                                    </div>
                                    <c:set var="countProduct" value="${countProduct + 1}" scope="page"/>
                                    <hr/>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                </c:forEach>
                <div style="display: flex; justify-content: center"><button class="btn btn-warning" type="submit">Send Feedback</button></div>
            </form>
        </div>
        <script>
            function previewImages(input, countProduct) {
                const imageContainer = document.getElementById('imageContainer_' + countProduct);
                const fileCountInput = document.getElementById('fileCount_' + countProduct);

                imageContainer.innerHTML = '';  // Clear the container

                if (input.files) {
                    const files = Array.from(input.files);
                    fileCountInput.value = files.length;

                    files.forEach(file => {
                        const reader = new FileReader();

                        reader.onload = function (e) {
                            const colDiv = document.createElement('div');
                            colDiv.className = 'col-md-3';

                            const img = document.createElement('img');
                            img.src = e.target.result;
                            img.className = 'img-preview';

                            colDiv.appendChild(img);
                            imageContainer.appendChild(colDiv);
                        };

                        reader.readAsDataURL(file);
                    });
                }
            }
        </script>

    </body>
</html>