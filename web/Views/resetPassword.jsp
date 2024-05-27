<%-- 
    Document   : resetPassword
    Created on : May 26, 2024, 12:27:02 AM
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
    </head>
    <style>
        .customerReset{
            padding-left: 5px;
            padding-right: 5px;

            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f2f2f2;
            }

            .container {
                width: 400px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .form-container {
                padding: 20px;
            }

            .form-group {
                margin-bottom: 20px;
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
        }

        /*        #signupForm {
                    display: none;
                }
        
                #signupLink, #loginLink {
                    color: #007bff;
                    text-decoration: none;
                }
        
                #signupLink:hover, #loginLink:hover {
                    text-decoration: underline;
                }*/

    </style>
    <body>
        <div class="container">
            <div class="form-container">
                <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal2">Open Modal</button>

                <!-- Modal -->
                <div class="modal fade" id="myModal2" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->

                        <div class="modal-content" style="width : 400px;">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h2>Quên mật khẩu</h2>
                            </div>
                            <%-- Form quên mật khẩu --%>
                            <div class="customerReset">
                                <form action="/FurnitureWebShop/VerifyEmail" method="post" id="forgotPasswordForm" style="display:block;">

                                    <div class="form-group">
                                        <label for="email">Nhập địa chỉ email</label>
                                        <input type="email" id="email" name="email" required>
                                    </div>
                                    <input type="hidden" name="action" value="forgotPassword">
                                    <button type="submit">Tiếp</button>
                                    <a href="LoginServlet" id="loginLinkForgot">Quay lại đăng nhập</a>
                                </form>
                            </div>

                           
                        </div>    
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
