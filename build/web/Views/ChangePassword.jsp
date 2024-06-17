
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link rel="stylesheet" type="text/css" media="screen" href="/NoiThat/assets/css/changepw.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'> 
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: "Poppins", sans-serif;
            }
            body{
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                background: url("/NoiThat/assets/img/banner-phong-khach.jpg")no-repeat;
                background-size: cover;
                background-position: center;
            }
            .wrapper{
                width: 420px;
                background: transparent;
                border: 2px solid #444;
                backdrop-filter: blur(20px);
                box-shadow: 0 0 10px #444;
                color: black;
                border-radius: 10px;
                padding: 30px 40px;
            }
            .wrapper h1{
                font-size: 36px;
                text-align: center;
            }
            .wrapper .input-box{
                width: 100%;
                height: 50px;
                margin: 30px 0;
            }

            .input-box input{
                width: 100%;
                height: 100%;
                background: transparent;
                border: none;
                outline: none;
                border: 2px solid royalblue;
                border-radius: 40px;
                font-size: 16px;
                padding: 20px 45px 20px 20px;
            }
            .input-box input::placeholder{
                color: black;
            }
            .wrapper .btn{
                width: 100%;
                height: 45px;
                background: #fff;
                border: none;
                outline: none;
                border-radius: 40px;
                box-shadow: 0 0 10px #444;
                cursor: pointer;
                font-size: 16px;
                color: #444;
                font-weight: 600;
            }
            .col-md-12 {
                padding: 2px;
                margin-bottom: 20px; /* Điều chỉnh khoảng cách phía dưới */
            }

            .d-flex {
                display: flex;
                gap: 30px; /* Điều chỉnh khoảng cách giữa các phần tử con */
            }



        </style>
    </head>
    <body>
        <div class="wrapper">


            <form action="${pageContext.request.contextPath}/ChangePassword" method="post">
                <h1>Thay Đổi Mật Khẩu</h1>
                <div class="input-box">
                    <input type="password" placeholder="Mật khẩu cũ" name="oldpass"
                           required> 

                </div>
                <div class="input-box">
                    <input type="password" name="newpass"
                           placeholder="Mật khẩu mới" required 
                           pattern="(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}"
                           title="Mật khẩu phải có ít nhất 8 ký tự, bao gồm ít nhất một chữ hoa, một số và một ký tự đặc biệt."> 

                </div>
                <div class="input-box">
                    <input type="password" name="renewpass"
                           placeholder="Nhập lại mật khẩu mới" required>
                </div>
                <div  class="col-md-12" style="padding: 2px;">           
                    <p style="color: red;">${mess}</p>
                </div>
                <div class="d-flex">
                    <button class="btn" ><a href="HomePage" target="target">Trang chủ</a></button>
                    <button type="submit" class="btn">Lưu</button>
                </div>
                
            </form>
                
        </div>
    </div>
</body>
</html>