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
                            <!--                            <label for="gender">Giới tính</label>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="gender" value="Male" id="genderMale" ${param.gender == 'Male' ? 'checked' : ''} required value="${param.gender}">
                                                            <label class="form-check-label" for="genderMale">Male</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="gender" value="Female" id="genderFemale" ${param.gender == 'Female' ? 'checked' : ''} required value="${param.gender}">
                                                            <label class="form-check-label" for="genderFemale">Female</label>
                                                        </div>-->
                            <label for="gender">Giới tính</label>
                            <input type="text" class="form-control" id="gender" name="gender" required value="${param.gender}">
                        </div>
                        <div class="form-group">
                            <label for="phone">Số điện thoại <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="phone" name="phone" required 
                                   pattern="0\d{9,}"
                                   title="Vui lòng nhập số điện thoại có ít nhất 10 số và bắt đầu bằng số 0."
                                   value="${param.phone}">
                        </div>
                        <div class="form-group">
                            <label for="address">Địa chỉ</label>
                            <input type="text" class="form-control" id="address" name="address" required value="${param.address}">
                        </div>
                        <div class="form-group">
                            <label for="email">Email <span class="text-danger">*</span></label>
                            <input type="email" class="form-control" id="email" name="email" required value="${param.email}"
                                   pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                                   title="Vui lòng nhập địa chỉ email hợp lệ (ví dụ: example@example.com)">
                        </div>
                        <div>           
                            <label for="password">Mật khẩu</label>
                            <input id="password" type="password" class="form-control password2" name="password" required
                                   pattern="(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}"
                                   title="Mật khẩu phải có ít nhất 8 ký tự, bao gồm ít nhất một chữ hoa, một số và một ký tự đặc biệt."
                                   value="${param.password}">
                        </div>
                        <div class="form-group">
                            <label for="pass">Nhập lại mật khẩu</label>
                            <input id="rePassword" type="password" class="form-control password2" name="pass" required value="${param.pass}">
                        </div>
                        <input type="hidden" name="role_id" value="1"/>
                        <input type="hidden" name="status" value="Inactive"/>
                        <div>
                            <input type="checkbox" id="togglePasswords" onclick="togglePasswordVisibility2()"> Hiển thị mật khẩu
                        </div>
                        <button id="submitForm" type="submit" class="btn btn-primary">Đăng kí</button>
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
            function togglePasswordVisibility2() {
                const passwordFields = document.querySelectorAll('.password2'); // Lấy tất cả phần tử input bằng class
                console.log(passwordFields);

                passwordFields.forEach(function (passwordField) {
                    console.log(passwordField.type);
                    if (passwordField.type === "password") {
                        passwordField.type = 'text';
                        console.log(passwordField.type);
                    } else {
                        passwordField.type = 'password';
                        console.log(passwordField.type);
                    }
                });
            }
        </script>
    </body>
</html>
