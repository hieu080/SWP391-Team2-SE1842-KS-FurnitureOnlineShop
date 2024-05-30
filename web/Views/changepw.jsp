
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
        </style>
    </head>
    <body>
        <div class="wrapper">

            
            <form method="post">
                
                <p >${mess}</p>
                <h1>Thay Đổi Mật Khẩu</h1>
                <div class="input-box">
                    <input type="input" placeholder="Mật khẩu cũ" name="oldpass"
                           required><!-- comment -->

                </div>
                <div class="input-box">
                    <input type="input" name="newpass"
                           placeholder="Mật khẩu mới" required><!-- comment -->

                </div>
                <div class="input-box">
                    <input type="input" name="renewpass"
                           placeholder="Nhập lại mật khẩu mới" required>

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