<%-- 
    Document   : ProductListMKT
    Created on : Jun 5, 2024, 2:27:59 PM
    Author     : HELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Feedback List</title>
        <link rel="icon" href="image/logoshop.png" type="image/png">
        <link rel="stylesheet" href="css/main.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
        <style>
            th,
            td {
                padding: 10px;
                text-align: left;
                max-width: 120px; /* Set a maximum width as needed */
                word-break: break-word; /* Break long words to fit within the cell */
                text-align: center;
            }

            h6{
                text-align: center
            }

            .dropdown {
                position: relative;
                display: inline-block;
                font-family: Arial, sans-serif;
                margin: 10px 5px;
                width: 150px;
            }

            .dropbtn {
                background-color: white;
                color: black;
                padding: 10px;
                /*                font-size: 16px;*/
                border: 1px solid #ccc;
                cursor: pointer;
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 100%;
                text-transform: uppercase;
                font-weight: 530;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                z-index: 1;
                min-width: 100%;
                left: 0;
                right: 0;
                border: 1px solid #e7e7e7;
                border-top: 0;
                padding: 5px 0;
                visibility: hidden;
                opacity: 0;
                transition: all 0.3s ease;
            }

            .dropdown-content li {
                padding: 5px 10px;
                list-style: none;
                font-size: 14px;
                border-bottom: 1px solid #e7e7e7;
                display: flex;
                align-items: center;
            }

            .dropdown-content li:last-child {
                border-bottom: none;
            }

            .dropdown-content li input[type="checkbox"] {
                margin-right: 10px;
            }

            .dropdown-content li:hover {
                background-color: #f1f1f1;
            }

            .dropdown:hover .dropdown-content {
                display: block;
                visibility: visible;
                opacity: 1;
            }

            .dropdown:hover .dropbtn {
                background-color: #f1f1f1;
            }


            .actions a {
                margin: 0 5px;
                color: black;
                text-decoration: none;
            }
            .actions a:hover {
                color: blue;
            }
            .image {
                border-radius: 4px;
                overflow: hidden;
                margin-right: 15px;
                max-width: 50px;
                width: 100%;
                height: 50px;
            }
            .image img {
                width: 100%;
            }

            .custom-close-btn {
                position: absolute;
                right: 1.5rem; /* Adjust as needed */
                z-index: 1051; /* Ensure it appears above the modal content */
            }
        </style>
        <style>
            .sort-wrapper {
                position: relative;
            }

            .sort-header {
                position: relative;
                font-size: 14px;
                font-weight: 600;
                padding: 10px 15px;
                background: #fff;
                border: 1px solid #e7e7e7;
                text-transform: uppercase;
                cursor: pointer;
                display: flex;
                justify-content: space-between;
                width: 170px;
            }

            .sort-header .icon-chevron {
                position: relative;
                top: 5px;
                font-size: 8px;
            }

            .sort-content {
                position: absolute;
                left: 0;
                right: 0;
                padding: 5px 15px;
                background: #fff;
                z-index: 100;
                border: 1px solid #e7e7e7;
                border-top: 0;
                pointer-events: none;
                visibility: hidden;
                opacity: 0;
                transition: all 0.3s ease;
            }

            .sort-wrapper:hover .sort-content {
                pointer-events: auto;
                visibility: visible;
                opacity: 1;
            }

            .sort-list {
                padding: 0;
                list-style: none;
            }

            .sort-list li {
                margin-bottom: 5px;
            }

            .sort-list li label {
                width: 140px;
                border: none;
                font-size: 14px;
                text-align: start;
            }

            .sort-list li input[type="radio"]:checked + label {
                background-color: #007bff;
                color: #fff;
                border: 1px solid #0056b3;
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
                font-weight: bold;
            }

            .sort-list li label:hover {
                background-color: #e0e0e0;
            }

            .button-add button, input{
                height: 41px;
            }
        </style>
        <style>
            .filter_tags{
                position: relative;
                display: none;
                line-height: 22px;
                border-radius: 12px;
                margin: 0px 10px 0px 15px;
                color: #5d5d5d;
                background: #fff;
                border: 1px solid #dadada;
                font-size: 13px;
                padding: 0 8px 0 8px;
            }

            .opened{
                display: flex;
                align-items: baseline;
            }
            .btn {
                display: inline-block;
                padding: 10px 20px;
                font-size: 16px;
                color: #fff;
                background-color: #007bff;
                border: 1px solid #007bff;
                border-radius: 5px;
                text-align: center;
                text-decoration: none;
                cursor: pointer;
                transition: background-color 0.3s, border-color 0.3s;
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
                        <div class="container-fluid" style="padding-left: 13px">
                            <div class="title-wrapper pt-30">
                                <div class="row align-items-center">
                                    <div class="col-md-6">
                                        <div class="title">
                                            <h2><a href="FeedBackList" style="text-decoration: none">Danh sách Đánh giá</a></h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div>
                            <form id="filterForm" action="FeedBackList" method="get">
                                <input id="sang" value="" name="sort" hidden="">
                                <div class="ml-15 mb-15">
                                    <input type="hidden" name="action" value="search"/>
                                    <div class="d-flex button-add" style="justify-content: space-between">
                                        <input type="text" class="form-control" value="${searchproduct}" name="searchproduct" placeholder="Tên sản phẩm" style="width: 300px;" />
                                        <input type="text" class="form-control" value="${searchcustomer}" name="searchcustomer" placeholder="Tên khách hàng" style="width: 300px;" />
                                        <input type="text" class="form-control" value="${searchfeedback}" name="searchfeedback" placeholder="Đánh giá" style="width: 350px;" />
                                        <button class="btn btn-primary" style="margin-right: 12px" type="submit">Tìm kiếm</button>
                                    </div>
                                </div>
                                <input type="hidden" name="action" value="filter" />
                                <div class="ml-15 mb-15 d-flex" style="align-items: center">
                                    <div style="font-weight: 600; font-size: 16px; text-transform: uppercase;">
                                        <span class="icon_title"><i class="fa fa-filter"></i></span>
                                        <span>Bộ Lọc</span>
                                    </div>
                                    <div class="dropdown" style="margin-left: 15px; width: 160px">
                                        <div class="dropbtn">
                                            Điểm đánh giá
                                            <span><i class="fa fa-chevron-down"></i></span>
                                        </div>

                                        <%
                                            int[] ratings = {1, 2, 3, 4, 5};
                                            request.setAttribute("ratings", ratings);

                                            // Kiểm tra và khởi tạo `rate` nếu cần thiết
                                            int[] rate = (int[]) request.getAttribute("rate");
                                            if (rate == null) {
                                                rate = new int[] {}; // hoặc giá trị mặc định khác nếu cần
                                            }
                                            request.setAttribute("rate", rate);
                                        %>

                                        <ul class="dropdown-content">
                                            <%for(int j = 0;j<ratings.length;j++){ %>
                                            <%
                                            boolean check = false;
                                            for(int i = 0;i<rate.length;i++){
                                                if(rate[i]==ratings[j]){
                                                    check = true;
                                                    }
                                                }
                                            %>

                                            <li>
                                                <input onclick="filterFeedback()" type="checkbox" value="<%=ratings[j]%>"
                                                       name="rate-filter"
                                                       <% if (check) { %> checked <% } %> />
                                                <span style="margin-left: 5px"><%=ratings[j]%></span>
                                            </li>
                                            <%}%>
                                        </ul>
                                    </div>
                                    <div class="dropdown">
                                        <div class="dropbtn">
                                            Trạng thái
                                            <span><i class="fa fa-chevron-down"></i></span>
                                        </div>
                                        <%
                                        String[] stating = {"Hide", "None"};
                                        request.setAttribute("stating", stating);
                                        
                                            
                                        String[] status = (String[]) request.getAttribute("statusfilter");
                                            if (status == null) {
                                                status = new String[] {}; // hoặc giá trị mặc định khác nếu cần
                                            }
                                        %>
                                        <ul class="dropdown-content">
                                            <% for (int j=0;j<stating.length;j++){%>
                                            <%
                                            boolean check1 = false;
                                            for(int i = 0;i<status.length;i++){
                                                if(stating[j].equals(status[i])){
                                                    check1 = true;
                                                    }
                                                }
                                            %>
                                            <li>
                                                <input onclick="filterFeedback()" <% if (check1) { %> checked <% } %> type="checkbox" value="<%=stating[j]%>" data-status="<%=stating[j]%>" name="status-filter" /><span> <%=stating[j]%> </span>
                                            </li>
                                            <%}%>
                                        </ul>
                                    </div>
                                    <div class="group_filter_tags" style="margin-top: 10px; padding-bottom: 20px; display: flex">
                                        <div class="filter_tags filter_tags_remove_all opened"><span><a href="FeedBackList">Xóa hết</a></span></div>
                                    </div>
                                </div>            
                            </form>

                        </div>

                        <div class="ml-15 mr-15" style="display: flex; justify-content: flex-end; position: relative; bottom: 68px">
                            <!--Sort form-->
                            <div class="sort-wrapper">
                                <div class="sort-header">
                                    <span>Sắp xếp</span>
                                    <span class="icon-chevron">
                                        <i class="fa fa-chevron-down"></i>
                                    </span>
                                </div>
                                <div class="sort-content">
                                    <form id="sortForm" action="FeedBackList" method="post">
                                        <input type="hidden" name="action" value="sort" />
                                        <ul class="sort-list">
                                            <li style="margin-top: 10px">
                                                <input onclick="sort('rate')" type="radio" name="sortby" value="rate" id="priceAsc" style="display: none;">
                                                <label  onclick="sort('rate')" for="priceAsc">Đánh giá tăng dần</label>
                                            </li>
                                            <li>
                                                <input onclick="sort('rate_desc')" type="radio" name="sortby" value="rate_desc" id="priceDesc" style="display: none;">
                                                <label  onclick="sort('rate_desc')" for="priceDesc">Đánh giá giảm dần</label>
                                            </li>
                                        </ul>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="card-style ml-15 mr-15">
                                <div class="table-responsive">
                                    <table class="table top-selling-table">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <h6 class="text-sm text-medium">ID</h6>
                                                </th>
                                                <th>
                                                    <h6 class="text-sm text-medium">Khách hàng</h6>
                                                </th>
                                                <th>
                                                    <h6 class="text-sm text-medium">Sản phẩm</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium">Sao</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium">Status</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium">Xem</h6>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody id="product-container">
                                            <c:forEach items="${fl}" var="f">
                                                <tr>
                                                    <td>
                                                        <h6 class="text-sm text-medium">${f.getId()}</h6>
                                                    </td>
                                                    <td>
                                                        <h6 class="text-sm text-medium">${f.getCustomer_Name()}</h6>
                                                    </td>
                                                    <td>
                                                        <h6 class="text-sm text-medium">${f.getProduct_Name()}</h6>
                                                    </td>
                                                    <td class="min-width">
                                                        <h6 class="text-sm text-medium">${f.getVotescore()}</h6>
                                                    </td>

                                                    <td class="min-width">
                                                        <c:if test="${f.getStatus()=='Hide'}">
                                                            <a class="btn" href="/FurnitureHieu/ChangeStatusFeedback?id=${f.getId()}">Hide</a>
                                                        </c:if>
                                                        <c:if test="${f.getStatus()=='None'}">
                                                            <a class="btn" href="/FurnitureHieu/ChangeStatusFeedback?id=${f.getId()}">None</a>
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <a href="/FurnitureHieu/FeedBackDetail?id=${f.getId()}">Chi tiết</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="sortpagibar pagi clearfix text-center" style="margin-top: 15px">
                            <div id="pagination" class="clearfix">

                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <form id="paginationForm" action="ProductListMKTServlet" method="post">
                                        <input type="hidden" name="action" value="pagination">
                                        <div id="page-pagination">
                                            <input hidden="" id="page_index" value="${index}">
                                            <c:forEach begin="1" end="${numberpage}" var="i">
                                                <c:if test="${index==i}">
                                                    <a onclick="navigateToPage(${i})"  class="page-node" style="border: 1px;border: groove;background-color: yellow; width: 25px">${i}</a>
                                                </c:if>
                                                <c:if test="${index!=i}">
                                                    <a onclick="navigateToPage(${i})"  class="page-node" style="border: 1px;border: groove; width: 25px">${i}</a>
                                                </c:if>
                                            </c:forEach>
                                            <span class="page-node">&hellip;</span>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <%@include file="DashboardFooter.jsp" %>
    </main>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.bundle.min.js"></script>
    <script>
                                                        function sort(a) {
                                                            var sang = document.getElementById("sang");
                                                            sang.value = a;
                                                            sang = document.getElementById("sang");
                                                            console.log("value:" + sang.value);

                                                            var index = document.getElementById("page_index").value;
                                                            navigateToPage(index);
                                                        }

                                                        function navigateToPage(pageIndex) {
                                                            var form = document.getElementById('filterForm');
                                                            var action = form.action;
                                                            var params = new URLSearchParams(new FormData(form)).toString();
                                                            window.location.href = "/FurnitureHieu/FeedBackList" + '?' + params + '&index=' + pageIndex;
                                                        }

                                                        function filterFeedback() {
                                                            var index = document.getElementById("page_index").value;
                                                            navigateToPage(index);
                                                        }

//                                                        $(document).ready(function () {
//                                                            var filterForm = $('#filterForm');
//                                                            var clearButton = $('#clearButton');
//                                                            var checkboxes = filterForm.find('input[type="checkbox"]');
//
//                                                            // Bắt sự kiện thay đổi của checkbox
//                                                            checkboxes.on('change', function () {
//                                                                clearButton.show(); // Hiển thị nút Clear khi có thay đổi
//                                                            });
//
//                                                            // Bắt sự kiện click nút Clear
//                                                            clearButton.on('click', function () {
//                                                                checkboxes.prop('checked', false); // Bỏ chọn tất cả các checkbox
//                                                                clearButton.hide(); // Ẩn nút Clear
//                                                            });
//                                                        });
    </script>
</body>
</html>
