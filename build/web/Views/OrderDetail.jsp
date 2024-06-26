<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyOrderInformation</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <style>
        body {
            background: #eee;
        }

        .card {
            box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
        }

        .card {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 0 solid rgba(0, 0, 0, .125);
            border-radius: 1rem;
        }

        .text-reset {
            --bs-text-opacity: 1;
            color: inherit !important;
        }

        a {
            color: #5465ff;
            text-decoration: none;
        }
        .button-order {
            text-align: center; /* Căn giữa nội dung bên trong .button-order */
            margin-top: 10px; /* Khoảng cách giữa địa chỉ và nút button */
        }

        .button-order button {
            width: auto; /* Để chiều rộng nút button tự động theo nội dung */
            padding: 5px 10px; /* Tạo khoảng đệm nhỏ hơn cho nút button */
            font-size: 14px; /* Điều chỉnh kích thước chữ cho nhỏ gọn */
        }
    </style>
</head>

<body>
    <div class="container-fluid">
        <div class="container">
            <!-- Title -->


            <!-- Main content -->
            <div class="row">
                <div class="col-lg-8">
                    <!-- Details -->
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="mb-3 d-flex justify-content-between">
                                <c:set var="order" value="${requestScope.order}"/>
                                <input type="hidden" name="order_id" value="${order.id}">
                                <div class="me-auto">
                                    <span>OrderID: #${order.id}</span>
                                </div>
                                <div class="ms-auto">
                                    <span>OrderTime: ${order.orderDate}</span>
                                </div>
                            </div>
                            <table class="table table-borderless">
                                <tbody>
                                    <c:forEach var="orderDetail" items="${orderDetailList}">
                                        <c:if test="${orderDetail.order_id == order.id}">
                                            <c:forEach var="productDetail" items="${productDetailList}">
                                                <c:if test="${productDetail.id == orderDetail.productdetail_id}">
                                                    <c:forEach var="product" items="${productList}">
                                                        <c:if test="${product.id == productDetail.product_id}">
                                                            <c:forEach var="user" items="${userList}"> 
                                                                <c:if test="${user.id == order.customer_id}">

                                                                </c:if>
                                                            </c:forEach>   
                                                            <tr>
                                                                <td>
                                                                    <div class="d-flex mb-2">
                                                                        <div class="flex-shrink-0">
                                                                            <img src="image/product/${product.image}"
                                                                                 alt="" width="35" class="img-fluid">
                                                                        </div>
                                                                        <div class="flex-lg-grow-1 ms-3">
                                                                            <h6 class="small mb-0">${product.name}</h6>
                                                                            <c:forEach var="color" items="${colorList}">
                                                                                <c:if test="${productDetail.color_id == color.id}">
                                                                                    <span class="small">${color.colorname}</span>
                                                                                </c:if>
                                                                            </c:forEach>
                                                                            <c:forEach var="category" items="${categoryList}">
                                                                                <c:if test="${product.category_id == category.id}">
                                                                                    <span class="small">(Phân loại: ${category.category})</span> <!-- Thêm dấu ngoặc đơn ở đây -->
                                                                                </c:if>
                                                                            </c:forEach>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td>${orderDetail.quantity}</td>
                                                                <td class="text-end" style="text-decoration: line-through;">${product.price} </td>
                                                                <td class="text-end">${orderDetail.price}</td>
                                                            </tr>

                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr class="fw-bold">
                                        <td colspan="4" style="text-align: right; padding-right: 50px">TOTAL: ${order.totalcost}</td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                    <!-- Payment -->
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="row">

                                <c:set var="order" value="${requestScope.order}"/>
                                <input type="hidden" name="order_id" value="${order.id}">
                                <c:forEach items="${address}" var="address">
                                    <c:if test="${address.id == order.address_id}">
                                        <c:forEach items="${userList}" var="user">
                                            <c:if test="${user.id == address.customer_id}">


                                                <address>
                                                    <h3 class="h6">Thông tin người nhận</h3>
                                                    <strong>Full name: ${user.fullname}</strong><br>
                                                    Gender: ${user.gender}<br>
                                                    Email: ${user.email}<br>
                                                    Phone: ${address.phonenumber}<br>
                                                    Address: ${address.address}<br>
                                                    <!--                                                        <abbr title="Phone">P:</abbr> (123) 456-7890-->
                                                </address>
                                                <!--                                                        <div class="col-lg-6">
                                                                                                                        <h3 class="h6">Payment Method</h3>
                                                                                                                        <p>Visa -1234 <br>
                                                                                                                            Total: $169,98 <span class="badge bg-success rounded-pill">PAID</span></p>
                                                                                    <div style="height: 200px;"></div>
                                                                                     Thêm link quay lại trang myorder 
                                                                                                                        <div class="mt-4">
                                                                                                                            <a href="myorder" class="btn btn-primary">Back to My Orders</a>
                                                                                                                        </div>
                                                
                                                                                </div>-->
                                                <!--                                <div class="col-lg-6">-->
                                                <div class="col-lg-6">
                                                    <div class="button-order d-flex flex-column align-items-end">
                                                        <c:choose>
                                                            <c:when test="${order.status == 'Order'}">
                                                                <div class="mb-3">
                                                                    <button class="btn btn-secondary">${order.status}</button>
                                                                    <!-- Button "Cancel Order" với sự kiện onclick -->
                                                                    <button class="btn btn-success ml-2" onclick="confirmConfirmedOrder()">Confirmed</button>
                                                                    <button class="btn btn-danger ml-2" onclick="confirmCancelOrder()">Cancel Order</button>
                                                                </div>
                                                            </c:when>
                                                            <c:when test="${order.status == 'Cancel'}">
                                                                <button class="btn btn-danger">${order.status}</button>
                                                            </c:when>
                                                            <c:when test="${order.status == 'Done'}">
                                                                <a href="link-to-your-page" class="btn btn-success">${order.status}</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <button class="btn btn-secondary">${order.status}</button>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <div class="mt-3">
                                                            <a href="MyOrderServlet" class="btn btn-info">Back to My Orders</a>
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
        </div>
    </div>
</div>
</div>

<script>
    function confirmConfirmedOrder() {
        var confirmUpdate = confirm("Bạn có muốn xác nhận đơn hàng của mình ?");
        if (confirmUpdate) {
            var order_id = ${order.id}; // Lấy orderId từ biến JSP
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "OrderDetailServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // Xử lý phản hồi thành công (nếu cần)
                        alert("Đã xác nhận đơn hàng thành công!");
                        // Có thể làm gì đó sau khi xác nhận thành công
                    } else {
                        // Xử lý lỗi nếu cần
                        alert("Có lỗi xảy ra khi xác nhận đơn hàng.");
                    }
                }
            };
            xhr.send("order_id=" + order_id + "&action=confirm"); // Gửi thêm thông tin hành động
        } else {
            // Người dùng chọn No, không làm gì cả
        }
    }

    function confirmCancelOrder() {
        var confirmCancel = confirm("Bạn có muốn hủy đơn hàng của mình không?");
        if (confirmCancel) {
            var order_id = ${order.id}; // Lấy orderId từ biến JSP
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "OrderDetailServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // Xử lý phản hồi thành công (nếu cần)
                        alert("Đã hủy đơn hàng thành công!");
                        // Có thể làm gì đó sau khi hủy đơn hàng thành công
                    } else {
                        // Xử lý lỗi nếu cần
                        alert("Có lỗi xảy ra khi hủy đơn hàng.");
                    }
                }
            };
            xhr.send("order_id=" + order_id + "&action=cancel");
        } else {
            // Người dùng chọn No, không làm gì cả
        }
    }

</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>




</html>