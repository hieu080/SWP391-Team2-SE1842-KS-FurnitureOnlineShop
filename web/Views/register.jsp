<%-- 
    Document   : register
    Created on : May 20, 2024, 9:57:45 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!--        <style>
            .customerRegister{


                .registerForm {
                    font-family: Arial, sans-serif;
                    margin: 0;
                    padding: 0;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: 100vh;
                    background-color: #f2f2f2;
                }

                .registercontainer {
                    width: 400px;
                    background-color: #fff;
                    border-radius: 8px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                }

                .registerform-container {
                    padding: 20px;
                }

                .registerform-group {
                    margin-bottom: 20px;
                }
                .modal-content{
                    width: 400px;
                }

                label {
                    display: block;
                    margin-bottom: 5px;
                }

                input[type="text"],
                input[type="password"] {
                    width: 100%;
                    padding: 10px;
                    border: 1px solid #ccc;
                    border-radius: 5px;
                }

                button {
                    width: 100%;
                    padding: 10px;
                    background-color: #007bff;
                    color: #fff;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                }

                button:hover {
                    background-color: #0056b3;
                }

                p {
                    margin-top: 15px;
                }

                #signupForm {
                    display: none;
                }

                #signupLink, #loginLink {
                    color: #007bff;
                    text-decoration: none;
                }

                #signupLink:hover, #loginLink:hover {
                    text-decoration: underline;
                }
            }

        </style>-->
    </head>
    <body>
        <div class="registerForm">
            <div class="registe-container">

                <!--action="RegisterServlet"-->
                <div class="registerform-container">
                    <!-- Trigger the modal with a button -->
                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal1">Open Modal</button>

                    <!-- Modal -->
                    <div class="modal fade" id="myModal1" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->

                            <div class="modal-content" style="transform: scale(0.9); width: 400px;">

                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h2>Đăng kí</h2>
                                </div>
                                <div class="modal-body">
                                    <div class="customerRegister">
                                        <form  method="post"  id="signupForm" style="display:block;">
                                            <div class="registerform-group">
                                                <label for="fullname">Họ và tên</label>
                                                <input type="text" id="fullname" name="fullname" required>
                                            </div>
                                            <div class="registerform-group">
                                                <label for="gender">Giới tính</label>
                                                <input type="text" id="gender" name="gender" required>
                                            </div>
                                            <div class="registerform-group">
                                                <label for="phone">Số điện thoại</label>
                                                <input type="text" id="phone" name="phone" required>
                                            </div>
                                            <div class="registerform-group">
                                                <label for="address">Địa chỉ</label>
                                                <input type="text" id="address" name="address" required>
                                            </div>
                                            <div class="registerform-group">
                                                <label for="email">Email</label>
                                                <input type="email" id="email" name="email" required>
                                            </div>
                                            <div class="registerform-group">
                                                <label for="password">Mật khẩu</label>
                                                <input type="password" id="password" name="password" required
                                                       pattern="(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}"
                                                       title="Mật khẩu phải có ít nhất 8 ký tự, bao gồm ít nhất một chữ hoa, một số và một ký tự đặc biệt.">

                                            </div>
                                            <div class="registerform-group">
                                                <label for="pass">Nhập lại mật khẩu</label>
                                                <input type="password" id="pass" name="pass" required>       
                                            </div>

                                            <button type="submit">Đăng kí</button>
                                            <p>Bạn có muốn tạo 1 tài khoản?<a href="LoginServlet">Đăng nhập</a></p>
                                        </form>
                                        <c:if test="${not empty requestScope.error}">
                                            <div style="color: red;">
                                                <c:out value="${requestScope.error}" />
                                            </div>
                                        </c:if>

                                        <c:if test="${not empty requestScope.success}">
                                            <div style="color: green;">
                                                <c:out value="${requestScope.success}" />
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



                </div>
            </div>
        </div>


    </body>
</html>
