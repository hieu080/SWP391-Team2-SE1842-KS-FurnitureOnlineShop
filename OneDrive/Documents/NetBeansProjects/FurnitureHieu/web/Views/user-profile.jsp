<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>User Profile</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head><!--/head-->
    <style>
        /* General styles */
        body {
            font-family: Arial, sans-serif;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }

        h2 {
            color: #FE980F;
        }

        a {
            color: #FE980F;
            text-decoration: none;
        }

        a:hover {
            color: #333;
        }

        /* Header styles */
        #header {
            border-bottom: 1px solid #f2f2f2;
        }

        .header_top {
            background: #F0F0E9;
            padding: 10px 0;
        }

        .header_top .contactinfo ul li,
        .header_top .social-icons ul li {
            display: inline-block;
            margin-right: 15px;
        }

        .header_top .contactinfo ul li a,
        .header_top .social-icons ul li a {
            color: #696763;
            font-size: 14px;
        }

        .header-middle {
            padding: 20px 0;
            background: #F0F0E9;
        }

        .header-middle .logo a img {
            width: 150px;
            height: auto;
        }

        .header-middle ul.navbar-nav > li > a {
            color: #696763;
            font-size: 16px;
        }

        .header-bottom {
            background: #FFFFFF;
            padding: 10px 0;
        }

        .header-bottom .mainmenu ul.nav > li > a {
            color: #696763;
            font-size: 16px;
        }

        .header-bottom .mainmenu ul.nav > li > a:hover,
        .header-bottom .mainmenu ul.nav > li.active > a {
            color: #FE980F;
        }

        /* Form styles */
        #form {
            margin-top: 10px;
        }

        .signup-form {
            background: #f7f7f7;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .signup-form h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .signup-form input[type="text"],
        .signup-form input[type="file"],
        .signup-form input[type="radio"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .signup-form button {
            background: #FE980F;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .signup-form button:hover {
            background: #f2a211;
        }
        .btn btn-default{
            color: blue;
        }

    </style>
    <body>


        <section style="margin-top: 10px;" id="form"><!--form-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-3 col-sm-offset-1">
                    </div>
                    <div class="col-sm-4">
                        <div class="signup-form" style="display: flex; flex-direction: column; align-items: center; justify-content: center;"><!--sign up form-->
                            <h2>Thông tin tài khoản</h2>
                            <div style="border-radius: 50%; width: 150px; height: 150px;">
                                <img id="curAvt" style="width: 100%;"  src="${sessionScope.customer.avatar}">
                            </div>
                            <form action="${pageContext.request.contextPath}/UserProfileServlet" method="post">
                                <label>Ảnh đại diện</label>   <input type="file" style="background-color: white;" id="fbimg" name="fbimg" onchange="changeFbimg()" accept=".jpg, .jpeg, .png"><br>
                                <span  id="invalid1" style="color: red;" > </span>
                                <input name="img" id="sendimg" type="hidden" >
                                <label>Họ tên</label>  <input style=" width: 300px;" type="text" placeholder="" value="${sessionScope.customer.fullname}" name="fullname" required="" maxlength="50"/><br>
                                <label>Số điện thoại</label>      <input type="text" placeholder="" value="${sessionScope.customer.phonenumber}" name="phone"required="" maxlength="11"/>
                                <label>Địa chỉ</label>     <input type="text" placeholder="" value="${sessionScope.customer.address}" name="address" required="" maxlength="100"/>
                                <label>Giới tính: </label>      <input type="radio" value="Male" ${sessionScope.customer.gender=="Male"?"checked":""}  style="display: inline-block; width: auto;margin: 0; padding: 0; height: auto;" checked="" name="gender"/> Nam 
                                <input style="display: inline-block; width: auto;margin: 0; padding: 0; height: auto;"  ${sessionScope.customer.gender=="Female"?"checked":""} type="radio" value="Female" name="gender"/> Nữ
                                <p style="color: greenyellow;">${success}</p>
                                <p style="color: red;">${mess}</p>
                                <p style="color: red;">${msg}</p>
                                <button type="submit" class="btn btn-default">Lưu</button>
                            </form>
                        </div><!--/sign up form-->
                    </div>
                    <div class="col-sm-3">

                    </div>
                </div>
            </div>
        </section><!--/form-->





        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
        <script> 
            function checkInput() {
                                        var content = document.getElementById("feedbackContent");
                                        var img = document.getElementById("fbimg");
                                        console.log(1);
                                        var a = 0;
                                        if (content.value == "") {
                                            document.getElementById("invalid").innerHTML = "Content of feedback not allow empty!"
                                            a = 1;
                                        }
                                        if (content.value.length > 200) {
                                            document.getElementById("invalid").innerHTML = "Content of feedback must less than 200 character!"
                                            a = 1;
                                        }
                                        if (img.value == "") {
                                            document.getElementById("invalid1").innerHTML = "Please choose 1 picture!"
                                            a = 1;
                                        }
                                        console.log(1);
                                        if (a == 1) {
                                            return false;
                                        } else {
                                            return true;
                                        }

                                    }
                                    function changeFbimg() {
                                        var file = document.getElementById("fbimg").files[0];
                                        if (file.name.match(/.+\.(jpg|png|jpeg)/i)) {
                                            if (file.size / (1024 * 1024) < 5) {
                                                var fileReader = new FileReader();
                                                fileReader.readAsDataURL(file);
                                                fileReader.onload = function () {
                                                    document.getElementById("sendimg").value = (fileReader.result);
                                                    document.getElementById("curAvt").src = (fileReader.result);
                                                }
                                            } else {
                                                uploadError();
                                            }
                                        } else {
                                            uploadError();
                                        }
                                    }
                                    function uploadError() {
                                        alert('Please upload photo file < 5MB')
                                        document.getElementById("fbimg").files[0].value = ''
                                        document.getElementById("fbimg").type = '';
                                        document.getElementById("fbimg").type = 'file';
                                    }
                                    function  checksubmit() {
                                        if (document.getElementById("feedbackContent").value.length > 200) {
                                            document.getElementById('invalid').style.display = "block";
                                            return false;
                                        }
                                        if (document.getElementById("fbimg").value == "") {
                                            document.getElementById('invalid2').style.display = "block";
                                            return false;
                                        }
                                        return true;
                                    }
        </script>
    </body>
</html>