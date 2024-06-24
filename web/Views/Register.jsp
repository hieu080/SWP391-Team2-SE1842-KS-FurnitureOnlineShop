<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            .register-container {
                max-width: 400px;
                margin: 50px auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #f9f9f9;
            }
        </style>
    </head>
    <body>
        <div class="box" id="box2" style="display:${requestScope.showregister} " >
            <div style="width: 400px;" aria-labelledby="dropdownMenuButton">
                <div class="container register-container">
                    <h2>Đăng kí</h2>
                    <form method="post" action="${pageContext.request.contextPath}/RegisterServlet" id="signupForm">
                        <div class="form-group">
                            <label for="fullname">Họ và tên</label>
                            <input type="text" class="form-control" id="fullname" name="fullname" required value="${param.fullname}">
                        </div>
                        <div class="form-group">
                            <label for="gender">Giới tính</label>
                            <input type="text" class="form-control" id="gender" name="gender" required value="${param.gender}">
                        </div>
                        <div class="form-group">
                            <label for="phone">Số điện thoại</label>
                            <input type="text" class="form-control" id="phone" name="phone" required value="${param.phone}">
                        </div>
                        <div class="form-group">
                            <label for="address">Địa chỉ</label>
                            <input type="text" class="form-control" id="address" name="address" required value="${param.address}">
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required value="${param.email}">
                        </div>
                        <div class="form-group">
                            <label for="password">Mật khẩu</label>
                            <input type="password" class="form-control" id="password" name="password" required
                                   pattern="(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}"
                                   title="Mật khẩu phải có ít nhất 8 ký tự, bao gồm ít nhất một chữ hoa, một số và một ký tự đặc biệt."
                                   value="${param.password}">
                        </div>
                        <div class="form-group">
                            <label for="pass">Nhập lại mật khẩu</label>
                            <input type="password" class="form-control" id="pass" name="pass" required value="${param.pass}">
                        </div>
                        <div>
                            <input type="checkbox" id="togglePasswords" onclick="togglePasswordVisibility()"> Hiển thị mật khẩu
                        </div>
                        <button type="submit" class="btn btn-primary">Đăng kí</button>
                        <p>Bạn có muốn tạo 1 tài khoản? <a href="#" onclick="toggleDiv('box1', 'box2')">Đăng nhập</a></p>
                        
                    </form>
                    <c:if test="${not empty requestScope.error}">
                        <div class="alert alert-danger" role="alert">
                            <c:out value="${requestScope.error}" />
                        </div>
                    </c:if>
                    <c:if test="${not empty requestScope.success}">
                        <div class="alert alert-success" role="alert">
                            <c:out value="${requestScope.success}" />
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <script>
            function togglePasswordVisibility() {
                var passwordFields = document.querySelectorAll('input[type="password"]');
                passwordFields.forEach(function (passwordField) {
                    if (passwordField.type === "password") {
                        passwordField.type = "text";
                    } else {
                        passwordField.type = "password";
                    }
                });
            }
        </script>
    </body>
</html>
