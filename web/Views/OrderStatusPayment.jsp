<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
        <title>Product List</title>
        <link rel="icon" href="image/logoshop.png" type="image/png">
        <style>
            .product-image1 {
                width: 80px;
                height: 80px;
                object-fit: cover;
            }
        </style>
    </head>

    <body class="bg-light">
        <section class="bg-light py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-5">
                        <a href="${pageContext.request.contextPath}/HomePage" class="d-flex align-items-center text-dark text-decoration-none">
                            <svg style="width: 50px;height: 35px" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">
                            <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4z" />
                            </svg>
                            <h2 class="text-success mb-0">Furniture</h2>
                            <div class="border-start border-3 mx-3"></div>
                            <h3 class="mb-0">Trang Thái Giao Dịch</h3>
                        </a>
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-5">
                        <form action="${pageContext.request.contextPath}/ProductServlet" method="post" class="input-group">
                            <input type="hidden" name="type" value="product" />
                            <input required id="inputSearchAuto" name="search" maxlength="40" autocomplete="off" type="text" class="form-control" placeholder="Tìm kiếm sản phẩm...">
                            <button type="submit" class="btn btn-primary" title="Tìm kiếm">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
                                </svg>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <div class="container ">
            <h2 class="text-center mb-4">Mã Đơn Hàng ${vnp_TxnRef} Của Bạn</h2>
            <main class="text-center mb-4">
                <h3>Trạng thái giao dịch ${vnp_TransactionStatus}</h3>
                <p>Đơn Hàng mã ${vnp_TxnRef} đến từ ${vnp_OrderInfo} với giá ${vnp_Amount}đ đã giao dịch ${vnp_TransactionStatus}</p>
            </main>
            <div class="text-center">
                <c:choose>
                    <c:when test="${vnp_TransactionStatus eq 'Thất Bại'}">
                        <a href="${pageContext.request.contextPath}/CartContact" class="btn btn-danger">Trở Lại Thanh Toán</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/HomePage" class="btn btn-success">Trang Chủ</a>
                    </c:otherwise>
                </c:choose>
                <a href="${pageContext.request.contextPath}/MyOrderInformationServlet?id=${vnp_TxnRef}" class="btn btn-info">Chi Tiết Đơn Hàng</a>
            </div>
        </div>

                <%@ include file="HomeFooter.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>
