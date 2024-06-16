<%-- 
    Document   : ProductFeedback
    Created on : Jun 16, 2024, 12:48:03 AM
    Author     : HELLO
--%>

<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <style>
            .rating-item {
                display: inline-block; /* Đặt các mục đánh giá vào cùng một hàng */
                text-align: center; /* Căn giữa nội dung */
                margin: 5px; /* Để lại khoảng cách giữa các mục đánh giá */
                cursor: pointer;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                transition: background-color 0.3s, transform 0.3s;
            }

            .rating-item:hover {
                background-color: #f0f0f0;
                transform: scale(1.05);
            }

            .stars {
                color: gold;
                margin-bottom: 5px;
                font-size: 20px;
            }
            .fit-image {
                width: 150px;
                height: 150px;
                object-fit: cover; /* cover, contain, fill, scale-down, none */
                object-position: center; /* Position of the image within the frame */
            }

            .rating {
                position: relative;
                display: inline-block;
                font-size: 24px;
                line-height: 1;
            }

            .rating::before {
                content: "★★★★★";
                color: #e3e3e3;
                /* Màu của sao không được đánh giá */
            }

            .rating::after {
                content: "★★★★★";
                color: #ffc107;
                /* Màu của sao được đánh giá */
                position: absolute;
                top: 0;
                left: 0;
                white-space: nowrap;
                overflow: hidden;
                width: 0;
            }
        </style>

    </head>
    <body>
        <c:set var="product" value="${requestScope.product}"/>
        <c:set var="numOfFive" value="0" scope="page"/>
        <c:set var="numOfFour" value="0" scope="page"/>
        <c:set var="numOfThree" value="0" scope="page"/>
        <c:set var="numOfTwo" value="0" scope="page"/>
        <c:set var="numOfOne" value="0" scope="page"/>

        <c:forEach items="${requestScope.feedbacksOfProduct}" var="feedbackProduct">
            <c:choose>
                <c:when test="${feedbackProduct.votescore == 5}">
                    <c:set var="numOfFive" value="${numOfFive + 1}" scope="page"/>
                </c:when>
                <c:when test="${feedbackProduct.votescore == 4}">
                    <c:set var="numOfFour" value="${numOfFour + 1}" scope="page"/>
                </c:when>
                <c:when test="${feedbackProduct.votescore == 3}">
                    <c:set var="numOfThree" value="${numOfThree + 1}" scope="page"/>
                </c:when>
                <c:when test="${feedbackProduct.votescore == 2}">
                    <c:set var="numOfTwo" value="${numOfTwo + 1}" scope="page"/>
                </c:when>
                <c:when test="${feedbackProduct.votescore == 1}">
                    <c:set var="numOfOne" value="${numOfOne + 1}" scope="page"/>
                </c:when>
            </c:choose>
        </c:forEach>

        <div class="container">
            <span><b style="font-size: 30px">Đánh giá: </b></span>
            <div class="rating-menu">
                <div class="rating-item">
                    <a href="javascript:void(0);" class="nav-link" onclick="showFeedbackSection('feedback-all')">
                        <span class="stars">Tất cả</span> ${numOfFive + numOfFour + numOfThree + numOfTwo + numOfOne} đánh giá
                    </a>
                </div>
                <div class="rating-item">
                    <a href="javascript:void(0);" class="nav-link" onclick="showFeedbackSection('feedback-five-star')">
                        <span class="stars">★★★★★</span> ${numOfFive} đánh giá
                    </a>
                </div>
                <div class="rating-item">
                    <a href="javascript:void(0);" class="nav-link" onclick="showFeedbackSection('feedback-four-star')">
                        <span class="stars">★★★★☆</span> ${numOfFour} đánh giá
                    </a>
                </div>
                <div class="rating-item">
                    <a href="javascript:void(0);" class="nav-link" onclick="showFeedbackSection('feedback-three-star')">
                        <span class="stars">★★★☆☆</span> ${numOfThree} đánh giá
                    </a>
                </div>
                <div class="rating-item">
                    <a href="javascript:void(0);" class="nav-link" onclick="showFeedbackSection('feedback-two-star')">
                        <span class="stars">★★☆☆☆</span> ${numOfTwo} đánh giá
                    </a>
                </div>
                <div class="rating-item">
                    <a href="javascript:void(0);" class="nav-link" onclick="showFeedbackSection('feedback-one-star')">
                        <span class="stars">★☆☆☆☆</span> ${numOfOne} đánh giá
                    </a>
                </div>
            </div>
            <c:set var="customer" value="${requestScope.customer}"/>

            <div style="border: solid 2px black">
                <div class="row">
                    <div id="feedback-all" style="display: block;">
                        <c:forEach items="${requestScope.feedbacksOfProduct}" var="feedbackProduct">
                            <c:forEach items="${requestScope.userList}" var="user">
                                <c:if test="${feedbackProduct.customer_id == user.id}">
                                    <div class="col-md-6">
                                        <div style="margin: 10px; border: solid; border-radius: 10px;">
                                            <div style="margin: 10px">
                                                <div class="d-flex" style="justify-content: space-between">
                                                    <b style="font-size: 15px">${user.fullname}</b>
                                                    <div>
                                                        <div>
                                                            <c:if test="${customer.id == user.id}">
                                                                <a style="margin-right: 10px;" href="#" data-toggle="modal" data-target="#editFeedbackModal">Edit</a>
                                                                <a href="#" data-toggle="modal" data-target="#deleteFeedbackModal" onclick="setFeedbackId(${feedbackProduct.id})">Delete</a>
                                                            </c:if>
                                                            <c:if test="${customer.role_id == 4}">
                                                                <a href="#" data-toggle="modal" data-target="#deleteFeedbackModal" onclick="setFeedbackId(${feedbackProduct.id})">Delete</a>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="feedback-rating" data-rating="${feedbackProduct.votescore}">
                                                    <div class="rating"></div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <p>${feedbackProduct.feedback}</p>
                                                    </div>
                                                    <c:forEach items="${requestScope.imageFeedbackList}" var="imageFeedback">
                                                        <c:if test="${imageFeedback.feedback_id == feedbackProduct.id}">
                                                            <div class="col-md-3">
                                                                <img class="fit-image" src="image/imagefeedback/${imageFeedback.image}" alt="image" width="150px" height="150px"/>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </div>

                    <!--5 sao-->
                    <div id="feedback-five-star" style="display: none;">
                        <c:forEach items="${requestScope.feedbacksOfProduct}" var="feedbackProduct">
                            <c:if test="${feedbackProduct.votescore == 5}">
                                <c:forEach items="${requestScope.userList}" var="user">
                                    <c:if test="${feedbackProduct.customer_id == user.id}">
                                        <div class="col-md-6">
                                            <div style="margin: 10px; border: solid; border-radius: 10px;">
                                                <div style="margin: 10px">
                                                    <div class="d-flex" style="justify-content: space-between">
                                                        <b style="font-size: 15px">${user.fullname}</b>
                                                        <div>
                                                            <div>
                                                                <c:if test="${customer.id == user.id}">
                                                                    <a style="margin-right: 10px;">Edit</a>
                                                                    <a href="#" data-toggle="modal" data-target="#deleteFeedbackModal" onclick="setFeedbackId(${feedbackProduct.id})">Delete</a>
                                                                </c:if>
                                                                <c:if test="${customer.role_id == 4}">
                                                                    <a href="#" data-toggle="modal" data-target="#deleteFeedbackModal" onclick="setFeedbackId(${feedbackProduct.id})">Delete</a>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="feedback-rating" data-rating="${feedbackProduct.votescore}">
                                                        <div class="rating"></div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <p>${feedbackProduct.feedback}</p>
                                                        </div>
                                                        <c:forEach items="${requestScope.imageFeedbackList}" var="imageFeedback">
                                                            <c:if test="${imageFeedback.feedback_id == feedbackProduct.id}">
                                                                <div class="col-md-3">
                                                                    <img class="fit-image" src="image/imagefeedback/${imageFeedback.image}" alt="image" width="150px" height="150px"/>
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                    </div>

                    <!--4 sao-->
                    <div id="feedback-four-star" style="display: none;">
                        <c:forEach items="${requestScope.feedbacksOfProduct}" var="feedbackProduct">
                            <c:if test="${feedbackProduct.votescore == 4}">
                                <c:forEach items="${requestScope.userList}" var="user">
                                    <c:if test="${feedbackProduct.customer_id == user.id}">
                                        <div class="col-md-6">
                                            <div style="margin: 10px; border: solid; border-radius: 10px;">
                                                <div style="margin: 10px">
                                                    <div class="d-flex" style="justify-content: space-between">
                                                        <b style="font-size: 15px">${user.fullname}</b>
                                                        <div>
                                                            <div>
                                                                <c:if test="${customer.id == user.id}">
                                                                    <a style="margin-right: 10px;">Edit</a>
                                                                    <a href="#" data-toggle="modal" data-target="#deleteFeedbackModal" onclick="setFeedbackId(${feedbackProduct.id})">Delete</a>
                                                                </c:if>
                                                                <c:if test="${customer.role_id == 4}">
                                                                    <a href="#" data-toggle="modal" data-target="#deleteFeedbackModal" onclick="setFeedbackId(${feedbackProduct.id})">Delete</a>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="feedback-rating" data-rating="${feedbackProduct.votescore}">
                                                        <div class="rating"></div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <p>${feedbackProduct.feedback}</p>
                                                        </div>
                                                        <c:forEach items="${requestScope.imageFeedbackList}" var="imageFeedback">
                                                            <c:if test="${imageFeedback.feedback_id == feedbackProduct.id}">
                                                                <div class="col-md-3">
                                                                    <img class="fit-image" src="image/imagefeedback/${imageFeedback.image}" alt="image" width="150px" height="150px"/>
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                    </div>
                    <!--3 sao-->

                    <div id="feedback-three-star" style="display: none;">
                        <c:forEach items="${requestScope.feedbacksOfProduct}" var="feedbackProduct">
                            <c:if test="${feedbackProduct.votescore == 3}">
                                <c:forEach items="${requestScope.userList}" var="user">
                                    <c:if test="${feedbackProduct.customer_id == user.id}">
                                        <div class="col-md-6">
                                            <div style="margin: 10px; border: solid; border-radius: 10px;">
                                                <div style="margin: 10px">
                                                    <div class="d-flex" style="justify-content: space-between">
                                                        <b style="font-size: 15px">${user.fullname}</b>
                                                        <div>
                                                            <div>
                                                                <c:if test="${customer.id == user.id}">
                                                                    <a style="margin-right: 10px;">Edit</a>
                                                                    <a href="#" data-toggle="modal" data-target="#deleteFeedbackModal" onclick="setFeedbackId(${feedbackProduct.id})">Delete</a>
                                                                </c:if>
                                                                <c:if test="${customer.role_id == 4}">
                                                                    <a href="#" data-toggle="modal" data-target="#deleteFeedbackModal" onclick="setFeedbackId(${feedbackProduct.id})">Delete</a>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="feedback-rating" data-rating="${feedbackProduct.votescore}">
                                                        <div class="rating"></div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <p>${feedbackProduct.feedback}</p>
                                                        </div>
                                                        <c:forEach items="${requestScope.imageFeedbackList}" var="imageFeedback">
                                                            <c:if test="${imageFeedback.feedback_id == feedbackProduct.id}">
                                                                <div class="col-md-3">
                                                                    <img class="fit-image" src="image/imagefeedback/${imageFeedback.image}" alt="image" width="150px" height="150px"/>
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                    </div>

                    <!--2 sao-->
                    <div id="feedback-two-star" style="display: none;">
                        <c:forEach items="${requestScope.feedbacksOfProduct}" var="feedbackProduct">
                            <c:if test="${feedbackProduct.votescore == 2}">
                                <c:forEach items="${requestScope.userList}" var="user">
                                    <c:if test="${feedbackProduct.customer_id == user.id}">
                                        <div class="col-md-6">
                                            <div style="margin: 10px; border: solid; border-radius: 10px;">
                                                <div style="margin: 10px">
                                                    <div class="d-flex" style="justify-content: space-between">
                                                        <b style="font-size: 15px">${user.fullname}</b>
                                                        <div>
                                                            <div>
                                                                <c:if test="${customer.id == user.id}">
                                                                    <a style="margin-right: 10px;">Edit</a>
                                                                    <a href="#" data-toggle="modal" data-target="#deleteFeedbackModal" onclick="setFeedbackId(${feedbackProduct.id})">Delete</a>
                                                                </c:if>
                                                                <c:if test="${customer.role_id == 4}">
                                                                    <a href="#" data-toggle="modal" data-target="#deleteFeedbackModal" onclick="setFeedbackId(${feedbackProduct.id})">Delete</a>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="feedback-rating" data-rating="${feedbackProduct.votescore}">
                                                        <div class="rating"></div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <p>${feedbackProduct.feedback}</p>
                                                        </div>
                                                        <c:forEach items="${requestScope.imageFeedbackList}" var="imageFeedback">
                                                            <c:if test="${imageFeedback.feedback_id == feedbackProduct.id}">
                                                                <div class="col-md-3">
                                                                    <img class="fit-image" src="image/imagefeedback/${imageFeedback.image}" alt="image" width="150px" height="150px"/>
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                    </div>

                    <!--1 sao-->
                    <div id="feedback-one-star" style="display: none;">
                        <c:forEach items="${requestScope.feedbacksOfProduct}" var="feedbackProduct">
                            <c:if test="${feedbackProduct.votescore == 1}">
                                <c:forEach items="${requestScope.userList}" var="user">
                                    <c:if test="${feedbackProduct.customer_id == user.id}">
                                        <div class="col-md-6">
                                            <div style="margin: 10px; border: solid; border-radius: 10px;">
                                                <div style="margin: 10px">
                                                    <div class="d-flex" style="justify-content: space-between">
                                                        <b style="font-size: 15px">${user.fullname}</b>
                                                        <div>
                                                            <div>
                                                                <c:if test="${customer.id == user.id}">
                                                                    <a style="margin-right: 10px;">Edit</a>
                                                                    <a href="#" data-toggle="modal" data-target="#deleteFeedbackModal" onclick="setFeedbackId(${feedbackProduct.id})">Delete</a>
                                                                </c:if>
                                                                <c:if test="${customer.role_id == 4}">
                                                                    <a href="#" data-toggle="modal" data-target="#deleteFeedbackModal" onclick="setFeedbackId(${feedbackProduct.id})">Delete</a>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="feedback-rating" data-rating="${feedbackProduct.votescore}">
                                                        <div class="rating"></div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <p>${feedbackProduct.feedback}</p>
                                                        </div>
                                                        <c:forEach items="${requestScope.imageFeedbackList}" var="imageFeedback">
                                                            <c:if test="${imageFeedback.feedback_id == feedbackProduct.id}">
                                                                <div class="col-md-3">
                                                                    <img class="fit-image" src="image/imagefeedback/${imageFeedback.image}" alt="image" width="150px" height="150px"/>
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </c:forEach>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="deleteFeedbackModal" data-backdrop="false" tabindex="-1" aria-labelledby="deleteFeedbackModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteFeedbackModalLabel">Confirm Delete</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete this feedback?</p>
                    <form id="deleteFeedbackForm" action="ProductDetailServlet" method="post"> <!-- Adjust action URL as needed -->
                        <input type="hidden" name="action" value="deleteFeedback">
                        <input type="hidden" id="deleteFeedbackId" name="deleteFeedbackId" value="">
                        <div class="d-flex justify-content-center">
                            <button type="submit" class="btn btn-danger mx-2" style="width: 70px;">Yes</button>
                            <button type="button" class="btn btn-secondary mx-2" data-dismiss="modal" style="width: 70px;">No</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>

        document.addEventListener('DOMContentLoaded', function () {
            var ratingContainers = document.querySelectorAll('.feedback-rating');
            ratingContainers.forEach(function (container) {
                var ratingValue = parseFloat(container.getAttribute('data-rating'));
                // Cập nhật chiều rộng của sao đã đánh giá
                var ratingElement = container.querySelector('.rating');
                var starPercentage = (ratingValue / 5) * 100;
                ratingElement.style.setProperty('--rating-width', starPercentage + '%');
            });
        });

        function setFeedbackId(feedbackId) {
            var feedbackIdInput = document.getElementById('deleteFeedbackId');
            if (feedbackIdInput) {
                feedbackIdInput.value = feedbackId;
            } else {
                console.error('Element with id "deleteFeedbackId" not found.');
            }
        }
        
        function showFeedbackSection(sectionId) {
        // Hide all sections except feedback-all
        document.getElementById('feedback-five-star').style.display = 'none';
        document.getElementById('feedback-four-star').style.display = 'none';
        document.getElementById('feedback-three-star').style.display = 'none';
        document.getElementById('feedback-two-star').style.display = 'none';
        document.getElementById('feedback-one-star').style.display = 'none';

        if (sectionId === 'feedback-all') {
            document.getElementById('feedback-all').style.display = 'block';
        } else {
            document.getElementById('feedback-all').style.display = 'none';
            document.getElementById(sectionId).style.display = 'block';
        }
    }
    </script>
    <style>
        .rating::after {
            content: "★★★★★";
            color: #ffc107;
            /* Màu của sao được đánh giá */
            position: absolute;
            top: 0;
            left: 0;
            white-space: nowrap;
            overflow: hidden;
            width: var(--rating-width);
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
