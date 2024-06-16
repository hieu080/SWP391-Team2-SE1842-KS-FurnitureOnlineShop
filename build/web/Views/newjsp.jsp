<%-- 
    Document   : newjsp
    Created on : Jun 17, 2024, 1:35:37 AM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .feedback-rating {
            display: flex;
            flex-direction: row-reverse;
            justify-content: center;
        }
        .feedback-rating input {
            display: none;
        }
        .feedback-rating label {
            font-size: 2rem;
            color: #ccc;
            cursor: pointer;
            transition: color 0.2s;
        }
        .feedback-rating input:checked ~ label,
        .feedback-rating input:hover ~ label,
        .feedback-rating label:hover,
        .feedback-rating label:hover ~ label {
            color: #f5b301;
        }
        
        .avatar-preview {
            height: 100px;
            width: 100px;  /* Fixed height and width for images */
            object-fit: cover; /* Cover the div without stretching */
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#feedbackModal">
        Đánh giá sản phẩm
    </button>

    <!-- The Modal -->
    <div class="modal" id="feedbackModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Đánh giá sản phẩm</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal Body -->
                <div class="modal-body">
                    <form action="Feedback" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="feedbackContent"><b>Đánh giá: </b></label>
                            <textarea class="form-control" name="feedback" id="feedbackContent" rows="7"></textarea>
                        </div>
                        <div class="form-group">
                            <label><b>Chất lượng sản phẩm: </b></label>
                            <div class="feedback-rating">
                                <input type="radio" id="star5" name="rating" value="5"><label for="star5">★</label>
                                <input type="radio" id="star4" name="rating" value="4"><label for="star4">★</label>
                                <input type="radio" id="star3" name="rating" value="3"><label for="star3">★</label>
                                <input type="radio" id="star2" name="rating" value="2"><label for="star2">★</label>
                                <input type="radio" id="star1" name="rating" value="1"><label for="star1">★</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="avatar"><b>Thêm hình ảnh </b></label>
                            <input type="file" class="form-control-file" id="avatar" multiple accept="image/*">
                        </div>
                        <div class="row" id="imageContainer"></div>
                        <div class="form-group" style="margin-top: 15px; display: flex; justify-content: center">
                            <input type="submit" value="Đánh giá" class="btn btn-primary">
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        document.getElementById('avatar').addEventListener('change', function (event) {
            const imageContainer = document.getElementById('imageContainer');
            imageContainer.innerHTML = ''; // Clear any previous images
            const files = event.target.files;

            for (let i = 0; i < files.length; i++) {
                const file = files[i];

                if (file.type.startsWith('image/')) {
                    const reader = new FileReader();

                    reader.onload = function (e) {
                        const colDiv = document.createElement('div');
                        colDiv.className = 'col-md-3';
                        const img = document.createElement('img');
                        img.src = e.target.result;
                        img.className = 'avatar-preview';
                        colDiv.appendChild(img);
                        imageContainer.appendChild(colDiv);
                    };

                    reader.readAsDataURL(file);
                }
            }
        });
    </script>
</body>
</html>
