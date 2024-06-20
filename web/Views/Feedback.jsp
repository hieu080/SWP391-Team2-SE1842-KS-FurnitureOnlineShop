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
                height: 150px;
                width: 150px;  /* Fixed height and width for images */
                object-fit: cover; /* Cover the div without stretching */
                margin-top: 10px;
            }
        </style>
    </head><!--/head-->

    <body>
        <div class="container">
            <h1>Đánh Giá Sản Phẩm</h1>
            <hr/>
            <c:set var="countProduct" value="0" scope="page"/>
            <c:set var="order" value="${order}"/>
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
                                                <input type="radio" id="star5" name="rating_${countProduct}" value="5"><label for="star5">★</label>
                                                <input type="radio" id="star4" name="rating_${countProduct}" value="4"><label for="star4">★</label>
                                                <input type="radio" id="star3" name="rating_${countProduct}" value="3"><label for="star3">★</label>
                                                <input type="radio" id="star2" name="rating_${countProduct}" value="2"><label for="star2">★</label>
                                                <input type="radio" id="star1" name="rating_${countProduct}" value="1"><label for="star1">★</label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="avatar"><b>Thêm hình ảnh </b></label>
                                            <input type="file" class="form-control-file" id="imgfeedback_${countProduct}" name="imgfeedback_${countProduct}" multiple accept="image/*" onchange="previewImages(this, ${countProduct})">
                                        </div>
                                        <div class="row" id="imageContainer"></div>
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
        </div>
        <script>
            function previewImages(input, countProduct) {
                const imageContainer = document.getElementById(`imageContainer_` countProduct);
                const fileCountInput = document.getElementById(`fileCount_` + countProduct);

                imageContainer.innerHTML = '';  // Clear the container

                if (input.files) {
                    const files = Array.from(input.files);
                    fileCountInput.value = files.length;

                    files.forEach(file => {
                        const reader = new FileReader();

                        reader.onload = function (e) {
                            const img = document.createElement('img');
                            img.src = e.target.result;
                            img.className = 'img-preview';
                            imageContainer.appendChild(img);
                        };

                        reader.readAsDataURL(file);
                    });
                }
            }

            // This is an example to illustrate multiple products handling.
            // You can generate similar blocks for each product dynamically with unique countProduct values.
            const countProduct = 1;  // Example for second product
            const container = document.createElement('div');
            container.innerHTML = `
                    <input type="file" class="form-control-file" id="imgfeedback_${countProduct}" name="imgfeedback_${countProduct}" multiple accept="image/*" onchange="previewImages(this, ${countProduct})">
                    <div class="row" id="imageContainer_${countProduct}"></div>
                    <input type="hidden" name="fileCount_${countProduct}" id="fileCount_${countProduct}" value="0"/>
                `;
            document.body.appendChild(container);
        </script>


    </body>
</html>