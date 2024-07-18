<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="css/main.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <!--<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>-->

        <style>
            .avatar-container{
                border-radius: 50%;
                border: solid 2px;
                width: 200px;
                height: 200px;
                overflow: hidden;
            }
            .infor div{
                background-color: #f8f5f5;
                border: groove;

            }
            .profile div{
                height: 40px;
                margin-bottom: 10px;
                display: flex;
                align-items: center;
                padding-left: 10px;
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="DashboardNavbar.jsp" %>
            <div class="main">
                <%@include file="DashboardHeader.jsp" %>
                <div class="container" style="margin-top: 20px; margin-bottom: 20px">
                    <section class="section">
                        <a href="UserListServlet" class="btn btn-primary"><i class="fas fa-arrow-left"></i> Back to list</a>
                        <div class="container-fluid" >
                            <div class="title-wrapper pt-30">
                                <div class="row align-items-center">
                                    <div class="col-md-10">
                                        <div class="title">
                                            <h2>User Detail</h2>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div style="display: flex; justify-content: flex-end">
                                            <!-- Edit Product Modal Trigger -->
                                            <button id="edit-button" type="button" style="width: 80px; height: 41px" class="btn btn-primary">
                                                <i class="fas fa-edit"></i> Edit
                                            </button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <hr/>
                            <c:set value="${requestScope.user}" var="user"/>
                            <div id="user-container" style="display: block">
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="col-md-8 row" style="border: groove; background-color: white">
                                        <div style="display: flex; justify-content: center">
                                            <div class="avatar-container mt-15 mb-25">
                                                <img src="image/avatar/${user.avatar}" alt="" style="width: 100%">
                                            </div>
                                        </div>
                                        <hr/>
                                        <div class="col-md-5 row mb-25">
                                            <div class="col-md-4 profile">
                                                <div><b>User ID:</b></div>
                                                <div><b>Gender:</b></div>
                                                <div><b>Role:</b></div>
                                                <div><b>Status:</b></div>
                                            </div>
                                            <div class="col-md-8 infor profile">
                                                <div><span>#${user.id}</span></div>
                                                <div><span>${user.gender}</span></div>
                                                <div>
                                                    <span>
                                                        <c:forEach items="${requestScope.userRole}" var="userRole">
                                                            <c:if test="${user.role_id == userRole.id}">${userRole.rolename}</c:if>
                                                        </c:forEach>
                                                    </span>
                                                </div>
                                                <div><span>${user.status}</span></div>
                                            </div>
                                        </div>
                                        <div class="col-md-7 row">
                                            <div class="col-md-5 profile">
                                                <div><b>Full Name:</b></div>
                                                <div><b>Email:</b></div>
                                                <div><b>Address:</b></div>
                                                <div><b>Phone Number:</b></div>
                                            </div>
                                            <div class="col-md-7 infor profile">
                                                <div><span>${user.fullname}</span></div>
                                                <div><span>${user.email}</span></div>
                                                <div><span>${user.address}</span></div>
                                                <div><span>${user.phonenumber}</span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="edit-container" style="display: none">
                                <form action="ManageUserServlet" method="post">
                                    <input type="hidden" name="action" value="editUser"/>
                                    <input type="hidden" name="editUserId" value="${user.id}"/>
                                    <div class="row">
                                        <div class="col-md-2"></div>
                                        <div class="col-md-8 row" style="border: groove; background-color: white">
                                            <div style="display: flex; justify-content: center">
                                                <div class="avatar-container mt-15 mb-25">
                                                    <img src="image/avatar/${user.avatar}" alt="" style="width: 100%">
                                                </div>
                                            </div>
                                            <hr/>
                                            <div class="col-md-5 row mb-25">
                                                <div class="col-md-4 profile">
                                                    <div><b>User ID:</b></div>
                                                    <div><b>Gender:</b></div>
                                                    <div><b>Role:</b></div>
                                                    <div><b>Status:</b></div>
                                                </div>
                                                <div class="col-md-8 infor profile">
                                                    <div><span>#${user.id}</span></div>
                                                    <div><span>${user.gender}</span></div>
                                                    <select name="roleID" style="height: 40px; width: 100%; margin-bottom: 10px; border: groove">
                                                        <c:forEach items="${requestScope.userRole}" var="userRole">
                                                            <option value="${userRole.id}" <c:if test="${user.role_id == userRole.id}">selected</c:if>>${userRole.rolename}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <select name="statusUser" style="height: 40px; width: 100%; margin-bottom: 10px; border: groove">
                                                        <c:choose>
                                                                <c:when test="${user.status == 'Active'}">
                                                                    <option value="Active" selected>Active</option>
                                                                    <option value="Inactive">Inactive</option>
                                                                    <option value="Block">Block</option>
                                                                </c:when>
                                                                <c:when test="${user.status == 'Block'}">
                                                                    <option value="Active" >Active</option>
                                                                    <option value="Inactive">Inactive</option>
                                                                    <option value="Block" selected>Block</option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="Active">Active</option>
                                                                    <option value="Inactive" selected>Inactive</option>
                                                                    <option value="Block">Block</option>
                                                                </c:otherwise>
                                                            </c:choose>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-7 row">
                                                <div class="col-md-5 profile">
                                                    <div><b>Full Name:</b></div>
                                                    <div><b>Email:</b></div>
                                                    <div><b>Address:</b></div>
                                                    <div><b>Phone Number:</b></div>
                                                </div>
                                                <div class="col-md-7 infor profile">
                                                    <div><span>${user.fullname}</span></div>
                                                    <div><span>${user.email}</span></div>
                                                    <div><span>${user.address}</span></div>
                                                    <div><span>${user.phonenumber}</span></div>
                                                </div>
                                            </div>
                                            <div style="display: flex; justify-content: center; margin-top: 5px; margin-bottom: 15px">
                                                <div>
                                                    <button id="cancel-button" type="button" class="btn btn-warning" style="margin-right: 50px">Cancel</button>
                                                    <button type="submit" class="btn btn-primary">Update</button>
                                                </div>
                                            </div>
                                        </div>  
                                    </div>                    
                                </form>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>


        <!--Modal Delete--> 
        <div class="modal fade" id="deleteProductModal" tabindex="-1" aria-labelledby="deleteProductModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteProductModalLabel">Confirm Delete</h5>
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you want to delete this product ?</p>
                        <form id="deleteProductForm" action="ManageProductServlet" method="post">
                            <input type="hidden" name="action" value="deleteProduct">
                            <input type="hidden" name="deleteProductId" id="deleteProductId" value="${product.id}">
                            <div class="d-flex justify-content-center">
                                <button type="submit" class="btn btn-danger mx-2" style="width: 70px;">Yes</button>
                                <button type="button" class="btn btn-secondary mx-2" data-bs-dismiss="modal" style="width: 70px;">No</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="DashboardFooter.jsp" %>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.bundle.min.js"></script>
        <script>
            function previewImage(event, imageId) {
                var input = event.target;
                var reader = new FileReader();
                reader.onload = function () {
                    var dataURL = reader.result;
                    var image = document.getElementById(imageId);
                    image.src = dataURL;
                };
                reader.readAsDataURL(input.files[0]);
            }
        </script>
        <script>

            $(document).ready(function () {
                $('#cancel-button').click(function () {
                    $('#edit-container').hide();
                    $('#user-container').show();
                });
                $('#edit-button').click(function () {
                    $('#user-container').hide();
                    $('#edit-container').show();
                });
            });
        </script>
    </body>
</html>
