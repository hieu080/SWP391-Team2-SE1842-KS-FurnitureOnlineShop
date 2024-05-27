<%-- 
    Document   : login
    Created on : May 20, 2024, 12:16:13 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login/Sign Up</title>
        <!--        <link rel="stylesheet" href="css/style.css">-->
        
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    </head>
    <body>

        <div class="container">

            <!-- Trigger the modal with a button -->
            <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->

                    <div class="modal-content" style="width : 400px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h2>Đăng nhập</h2>
                        </div>
                        <div class="modal-body">
                            <div class="customLogin">
                                <form action="/FurnitureWebShop/LoginServlet" method="post" id="loginForm">
                                    <div class="loginform-group">
                                        <label for="email">Email</label>
                                        <input type="text" id="email" name="email" required>
                                    </div>
                                    <div class="loginform-group">
                                        <label for="password">Mật khẩu</label>
                                        <input type="password" id="password" name="password" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Đăng nhập</button>
                                    <a href="ResetPasswordServlet">Quên mật khẩu</a>
                                    <p>Bạn chưa có tài khoản ? <a href="RegisterServlet">Đăng kí</a></p>
                                </form>
                                <c:if test="${not empty requestScope.error}">
                                    <div style="color: red;">
                                        <c:out value="${requestScope.error}" />
                                    </div>
                                </c:if>

                            </div>
                        </div>                       
                    </div>  

                </div>
            </div>

        </div>


    </body>
</html>
