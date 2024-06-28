<%-- 
    Document   : Setting
    Created on : Jun 28, 2024, 7:32:50 PM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link class="js-stylesheet" href="../css/light.css" rel="stylesheet">
        <style>

        </style>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="DashboardNavbar.jsp" %>
            <div class="main">
                <%@include file="DashboardHeader.jsp" %>
                <main class="content">
                    <div class="container-fluid p-0">
                        <div class="row mb-2 mb-xl-3">
                            <div class="col-auto d-none d-sm-block">
                                <h3><strong>Setting</strong> Page</h3>
                            </div>
                        </div>
                        <h3>Pagination Page</h3>
                        <div class="row">
                            <div class="col-md-3">
                                <div style="background-color: white; margin: 0px 10px 20px">
                                    <div style="display: flex; justify-content: space-between">
                                        <strong style="margin-left: 10px; margin-top: 10px">Home Products List</strong>
                                        <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#editHomeProductsListModal">
                                            <i class="fas fa-edit"></i></button>
                                    </div>
                                    <div style="display: flex; justify-content: center; align-items: baseline">
                                        <b style="font-size: 60px">8</b><span>items/Page</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div style="background-color: white; margin: 0px 10px 20px">
                                    <div style="display: flex; justify-content: space-between">
                                        <strong style="margin-left: 10px; margin-top: 10px">Products List</strong>
                                        <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#editProductsListModal">
                                            <i class="fas fa-edit"></i></button>
                                    </div>
                                    <div style="display: flex; justify-content: center; align-items: baseline">
                                        <b style="font-size: 60px">8</b><span>items/Page</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div style="background-color: white; margin: 0px 10px 20px">
                                    <div style="display: flex; justify-content: space-between">
                                        <strong style="margin-left: 10px; margin-top: 10px">Feedbacks List</strong>
                                        <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#editFeedbacksListModal">
                                            <i class="fas fa-edit"></i></button>
                                    </div>
                                    <div style="display: flex; justify-content: center; align-items: baseline">
                                        <b style="font-size: 60px">8</b><span>items/Page</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div style="background-color: white; margin: 0px 10px 20px">
                                    <div style="display: flex; justify-content: space-between">
                                        <strong style="margin-left: 10px; margin-top: 10px">Customers List</strong>
                                        <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#editCustomersListModal">
                                            <i class="fas fa-edit"></i></button>
                                    </div>
                                    <div style="display: flex; justify-content: center; align-items: baseline">
                                        <b style="font-size: 60px">8</b><span>items/Page</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div style="background-color: white; margin: 0px 10px 20px">
                                    <div style="display: flex; justify-content: space-between">
                                        <strong style="margin-left: 10px; margin-top: 10px">Posts List</strong>
                                        <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#editPostsListModal">
                                            <i class="fas fa-edit"></i></button>
                                    </div>
                                    <div style="display: flex; justify-content: center; align-items: baseline">
                                        <b style="font-size: 60px">8</b><span>items/Page</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div style="background-color: white; margin: 0px 10px 20px">
                                    <div style="display: flex; justify-content: space-between">
                                        <strong style="margin-left: 10px; margin-top: 10px">Sliders List</strong>
                                        <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#editSlidersListModal">
                                            <i class="fas fa-edit"></i></button>
                                    </div>
                                    <div style="display: flex; justify-content: center; align-items: baseline">
                                        <b style="font-size: 60px">8</b><span>items/Page</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div style="background-color: white; margin: 0px 10px 20px">
                                    <div style="display: flex; justify-content: space-between">
                                        <strong style="margin-left: 10px; margin-top: 10px">Orders List</strong>
                                        <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#editOrdersListModal">
                                            <i class="fas fa-edit"></i></button>
                                    </div>
                                    <div style="display: flex; justify-content: center; align-items: baseline">
                                        <b style="font-size: 60px">8</b><span>items/Page</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div style="background-color: white; margin: 0px 10px 20px">
                                    <div style="display: flex; justify-content: space-between">
                                        <strong style="margin-left: 10px; margin-top: 10px">Shopping Carts List</strong>
                                        <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#editShoppingCartsListModal">
                                            <i class="fas fa-edit"></i></button>
                                    </div>
                                    <div style="display: flex; justify-content: center; align-items: baseline">
                                        <b style="font-size: 60px">8</b><span>items/Page</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="container mt-5">
                            <h3>Setting List</h3>
                            <div class="d-flex" style="justify-content: flex-start; align-items: center">
                                <div style="background-color: white; width: 120px; height: 30px; display: flex; justify-content: center; align-items: center; border: groove">
                                    <a class="nav-link active" data-toggle="tab" href="#userRole">
                                        <div>User Role</div>
                                    </a>
                                </div>
                                <div style="background-color: white; width: 100px; height: 30px; display: flex; justify-content: center; align-items: center; border: groove">
                                    <a class="nav-link" data-toggle="tab" href="#category">
                                        <div>Category</div>
                                    </a>
                                </div>
                                <div style="background-color: white; width: 100px; height: 30px; display: flex; justify-content: center; align-items: center; border: groove">
                                    <a class="nav-link" data-toggle="tab" href="#brand">
                                        <div>Brand</div>
                                    </a>
                                </div>
                                <div style="background-color: white; width: 100px; height: 30px; display: flex; justify-content: center; align-items: center; border: groove">
                                    <a class="nav-link" data-toggle="tab" href="#room">
                                        <div>Room</div>
                                    </a>
                                </div>
                                <div style="background-color: white; width: 100px; height: 30px; display: flex; justify-content: center; align-items: center; border: groove">
                                    <a class="nav-link" data-toggle="tab" href="#color">
                                        <div>Color</div>
                                    </a>
                                </div>
                                <div style="background-color: white; width: 100px; height: 30px; display: flex; justify-content: center; align-items: center; border: groove">
                                    <a class="nav-link" data-toggle="tab" href="#saleOff">
                                        <div>Sale Off</div>
                                    </a>
                                </div>
                                <div style="background-color: white; width: 150px; height: 30px; display: flex; justify-content: center; align-items: center; border: groove">
                                    <a class="nav-link" data-toggle="tab" href="#categoryOfPost">
                                        <div>Category of Post</div>
                                    </a>
                                </div>  
                            </div>

                            <!-- Tab content -->
                            <div class="tab-content">
                                <div id="userRole" class="tab-pane fade show active">
                                    <h3>User Role</h3>
                                    <p>Content for User Role.</p>
                                </div>
                                <div id="category" class="tab-pane fade">
                                    <h3>Category</h3>
                                    <p>Content for Category.</p>
                                </div>
                                <div id="brand" class="tab-pane fade">
                                    <h3>Brand</h3>
                                    <p>Content for Brand.</p>
                                </div>
                                <div id="room" class="tab-pane fade">
                                    <h3>Room</h3>
                                    <p>Content for Room.</p>
                                </div>
                                <div id="color" class="tab-pane fade">
                                    <h3>Color</h3>
                                    <p>Content for Color.</p>
                                </div>
                                <div id="saleOff" class="tab-pane fade">
                                    <h3>Sale Off</h3>
                                    <p>Content for Sale Off.</p>
                                </div>
                                <div id="categoryOfPost" class="tab-pane fade">
                                    <h3>Category of Post</h3>
                                    <p>Content for Category of Post.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>

        <!--Modal Home Products List-->
        <div class="modal fade" id="editHomeProductsListModal" tabindex="-1" aria-labelledby="editHomeProductsListModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="editHomeProductsListModalLabel">Setting Home Products List</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Do you want to change pagination of Page?</h4>
                        <form action="SettingServlet" method="post">
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <label for="old-content">Old number of items</label>
                                    <input id="old-content" class="form-control" value="8" style="height: 50px; font-size: 30px" readonly/>
                                </div>
                                <div class="col-md-4 d-flex align-items-center justify-content-center">
                                    <i class="fas fa-arrow-right" style="font-size: 30px"></i>
                                </div>
                                <div class="col-md-4">
                                    <label for="new-content">New number of items</label>
                                    <input id="new-content" name="itemsPerHomeProductsList" class="form-control" style="height: 50px; font-size: 30px"/>
                                </div>
                            </div>
                            <div style="display: flex; justify-content: center; margin: 20px 0px 0px">
                                <button type="submit" class="btn btn-primary">Save</button> 
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--Modal Products List-->
        <div class="modal fade" id="editProductsListModal" tabindex="-1" aria-labelledby="editProductsListModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="editroductsListModalLabel">Setting Products List</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Do you want to change pagination of Page?</h4>
                        <form action="SettingServlet" method="post">
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <label for="old-content">Old number of items</label>
                                    <input id="old-content" class="form-control" value="8" style="height: 50px; font-size: 30px" readonly/>
                                </div>
                                <div class="col-md-4 d-flex align-items-center justify-content-center">
                                    <i class="fas fa-arrow-right" style="font-size: 30px"></i>
                                </div>
                                <div class="col-md-4">
                                    <label for="new-content">New number of items</label>
                                    <input id="new-content" name="itemsPerProductsList" class="form-control" style="height: 50px; font-size: 30px"/>
                                </div>
                            </div>
                            <div style="display: flex; justify-content: center; margin: 20px 0px 0px">
                                <button type="submit" class="btn btn-primary">Save</button> 
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--Modal Feedbacks List-->
        <div class="modal fade" id="editFeedbacksListModal" tabindex="-1" aria-labelledby="editFeedbacksListModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="editFeedbacksListModalLabel">Setting Feedbacks List</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Do you want to change pagination of Page?</h4>
                        <form action="SettingServlet" method="post">
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <label for="old-content">Old number of items</label>
                                    <input id="old-content" class="form-control" value="8" style="height: 50px; font-size: 30px" readonly/>
                                </div>
                                <div class="col-md-4 d-flex align-items-center justify-content-center">
                                    <i class="fas fa-arrow-right" style="font-size: 30px"></i>
                                </div>
                                <div class="col-md-4">
                                    <label for="new-content">New number of items</label>
                                    <input id="new-content" name="itemsPerFeedbacksList" class="form-control" style="height: 50px; font-size: 30px"/>
                                </div>
                            </div>
                            <div style="display: flex; justify-content: center; margin: 20px 0px 0px">
                                <button type="submit" class="btn btn-primary">Save</button> 
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--Modal Customers List-->
        <div class="modal fade" id="editCustomersListModal" tabindex="-1" aria-labelledby="editCustomersListModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="editCustomersListModalLabel">Setting Customers List</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Do you want to change pagination of Page?</h4>
                        <form action="SettingServlet" method="post">
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <label for="old-content">Old number of items</label>
                                    <input id="old-content" class="form-control" value="8" style="height: 50px; font-size: 30px" readonly/>
                                </div>
                                <div class="col-md-4 d-flex align-items-center justify-content-center">
                                    <i class="fas fa-arrow-right" style="font-size: 30px"></i>
                                </div>
                                <div class="col-md-4">
                                    <label for="new-content">New number of items</label>
                                    <input id="new-content" name="itemsPerCustomersList" class="form-control" style="height: 50px; font-size: 30px"/>
                                </div>
                            </div>
                            <div style="display: flex; justify-content: center; margin: 20px 0px 0px">
                                <button type="submit" class="btn btn-primary">Save</button> 
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--Modal Posts List-->
        <div class="modal fade" id="editPostsListModal" tabindex="-1" aria-labelledby="editPostsListModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="editPostsListModalLabel">Setting Posts List</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Do you want to change pagination of Page?</h4>
                        <form action="SettingServlet" method="post">
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <label for="old-content">Old number of items</label>
                                    <input id="old-content" class="form-control" value="8" style="height: 50px; font-size: 30px" readonly/>
                                </div>
                                <div class="col-md-4 d-flex align-items-center justify-content-center">
                                    <i class="fas fa-arrow-right" style="font-size: 30px"></i>
                                </div>
                                <div class="col-md-4">
                                    <label for="new-content">New number of items</label>
                                    <input id="new-content" name="itemsPerPostsList" class="form-control" style="height: 50px; font-size: 30px"/>
                                </div>
                            </div>
                            <div style="display: flex; justify-content: center; margin: 20px 0px 0px">
                                <button type="submit" class="btn btn-primary">Save</button> 
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--Modal Sliders List-->
        <div class="modal fade" id="editSlidersListModal" tabindex="-1" aria-labelledby="editSlidersListModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="editSlidersListModalLabel">Setting Sliders List</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Do you want to change pagination of Page?</h4>
                        <form action="SettingServlet" method="post">
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <label for="old-content">Old number of items</label>
                                    <input id="old-content" class="form-control" value="8" style="height: 50px; font-size: 30px" readonly/>
                                </div>
                                <div class="col-md-4 d-flex align-items-center justify-content-center">
                                    <i class="fas fa-arrow-right" style="font-size: 30px"></i>
                                </div>
                                <div class="col-md-4">
                                    <label for="new-content">New number of items</label>
                                    <input id="new-content" name="itemsPerSlidersList" class="form-control" style="height: 50px; font-size: 30px"/>
                                </div>
                            </div>
                            <div style="display: flex; justify-content: center; margin: 20px 0px 0px">
                                <button type="submit" class="btn btn-primary">Save</button> 
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--Modal Orders List-->
        <div class="modal fade" id="editOrdersListModal" tabindex="-1" aria-labelledby="editOrdersListModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="editOrdersListModalLabel">Setting Orders List</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Do you want to change pagination of Page?</h4>
                        <form action="SettingServlet" method="post">
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <label for="old-content">Old number of items</label>
                                    <input id="old-content" class="form-control" value="8" style="height: 50px; font-size: 30px" readonly/>
                                </div>
                                <div class="col-md-4 d-flex align-items-center justify-content-center">
                                    <i class="fas fa-arrow-right" style="font-size: 30px"></i>
                                </div>
                                <div class="col-md-4">
                                    <label for="new-content">New number of items</label>
                                    <input id="new-content" name="itemsPerOrdersList" class="form-control" style="height: 50px; font-size: 30px"/>
                                </div>
                            </div>
                            <div style="display: flex; justify-content: center; margin: 20px 0px 0px">
                                <button type="submit" class="btn btn-primary">Save</button> 
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--Modal Shopping Carts List-->
        <div class="modal fade" id="editShoppingCartsListModal" tabindex="-1" aria-labelledby="editShoppingCartsListModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="editShoppingCartsListModalLabel">Setting Shopping Carts List</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Do you want to change pagination of Page?</h4>
                        <form action="SettingServlet" method="post">
                            <div class="form-group row">
                                <div class="col-md-4">
                                    <label for="old-content">Old number of items</label>
                                    <input id="old-content" class="form-control" value="8" style="height: 50px; font-size: 30px" readonly/>
                                </div>
                                <div class="col-md-4 d-flex align-items-center justify-content-center">
                                    <i class="fas fa-arrow-right" style="font-size: 30px"></i>
                                </div>
                                <div class="col-md-4">
                                    <label for="new-content">New number of items</label>
                                    <input id="new-content" name="itemsPerShoppingCartsList" class="form-control" style="height: 50px; font-size: 30px"/>
                                </div>
                            </div>
                            <div style="display: flex; justify-content: center; margin: 20px 0px 0px">
                                <button type="submit" class="btn btn-primary">Save</button> 
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="DashboardFooter.jsp" %>   
        <script src="../js/app.js"></script>
        <script>
            $(document).ready(function () {
                $('a[data-toggle="tab"]').on('click', function (e) {
                    e.preventDefault();
                    var target = $(this).attr("href"); // Get the target tab pane
                    $('.tab-pane').removeClass('show active'); // Hide all tab panes
                    $(target).addClass('show active'); // Show the target tab pane

                    $('a[data-toggle="tab"]').removeClass('active'); // Remove 'active' class from all tabs
                    $(this).addClass('active'); // Add 'active' class to the clicked tab
                });
            });
        </script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
