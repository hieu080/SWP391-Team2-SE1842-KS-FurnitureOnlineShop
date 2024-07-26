<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Change Password</title>
    <link rel="icon" href="image/logoshop.png" type="image/png">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        .wrapper {
            width: 420px;
            background: transparent;
            border: 2px solid #444;
            backdrop-filter: blur(20px);
            box-shadow: 0 0 10px #444;
            color: black;
            border-radius: 10px;
            padding: 30px 40px;
            margin: 0 auto;
            position: relative;
            top: 50px;
        }

        .input-box input {
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

        .input-box input::placeholder {
            color: black;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-dialog {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 500px;
            border-radius: 8px;
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 10px;
        }

        .modal-title {
            font-size: 1.5em;
            margin: 0;
        }

        .close {
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close:hover,
        .close:focus {
            color: black;
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            border-top: 1px solid #ddd;
            padding-top: 10px;
            margin-top: 10px;
        }

        .modal-footer .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-check {
            margin: 10px 0;
        }

        .form-check-label {
            margin-left: 5px;
        }

        .text-danger {
            color: red;
        }
    </style>
</head>
<body>
   
<div id="exampleModal" class="modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thay Đổi Mật Khẩu</h5>
                <span class="close" id="closeModal">&times;</span>
            </div>
            <form id="changePasswordForm">
                <div class="modal-body">
                    <div class="form-group">
                        <input type="password" class="form-control" id="oldpass" placeholder="Mật khẩu cũ" name="oldpass" required>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="newpass" name="newpass" placeholder="Mật khẩu mới" required 
                               pattern="(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}"
                               title="Mật khẩu phải có ít nhất 8 ký tự, bao gồm ít nhất một chữ hoa, một số và một ký tự đặc biệt.">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="renewpass" name="renewpass" placeholder="Nhập lại mật khẩu mới" required 
                               pattern="(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}"
                               title="Mật khẩu phải có ít nhất 8 ký tự, bao gồm ít nhất một chữ hoa, một số và một ký tự đặc biệt.">
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="togglePasswords" onclick="togglePasswordVisibility()">
                        <label class="form-check-label" for="togglePasswords">Hiển thị mật khẩu</label>
                    </div>
                    <div class="form-group text-danger">
                        <p id="errorMessage">${mess}</p>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" id="closeModalFooter">Đóng</button>
                    <button type="submit" class="btn btn-primary">Lưu</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- JavaScript -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        $('#openModal').on('click', function () {
            $('#exampleModal').fadeIn();
        });

        $('#closeModal, #closeModalFooter').on('click', function () {
            $('#exampleModal').fadeOut();
        });

        $(window).on('click', function (event) {
            if ($(event.target).is('#exampleModal')) {
                $('#exampleModal').fadeOut();
            }
        });

        $('#changePasswordForm').on('submit', function (event) {
            event.preventDefault(); // Prevent the default form submission

            $.ajax({
                url: '${pageContext.request.contextPath}/ChangePassword',
                type: 'POST',
                data: $(this).serialize(), // Serialize form data

                success: function (data) {
                    if (data.status === 'error') {
                        $('#errorMessage').text(data.message);
                    } else {
                        $('#errorMessage').text(''); // Clear previous errors
                        alert(data.message); // Show success message or handle it as needed
                        $('#exampleModal').fadeOut();
                        location.reload();// Close the modal
                    }
                },
                error: function (xhr, status, error) {
                    console.error('Error:', error);
                    $('#errorMessage').text('Có lỗi xảy ra. Vui lòng thử lại.');
                }
            });
        });
    });

    function togglePasswordVisibility() {
        var passwordFields = $('input[type="password"]');
        passwordFields.each(function () {
            $(this).attr('type', $(this).attr('type') === 'password' ? 'text' : 'password');
        });
    }
</script>
</body>
</html>
