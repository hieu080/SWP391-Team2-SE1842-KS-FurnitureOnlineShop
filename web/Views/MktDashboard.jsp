<%-- 
    Document   : MktDashboard
    Created on : Jul 9, 2024, 3:21:50 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <title>Dashboard</title>
    </head>
    <body>
        <div class="container-fluid p-5 bg-light">

            <div class="row mb-2 mb-xl-3">
                <div class="col-auto d-none d-sm-block">
                    <h3><strong>Marketing</strong> Dashboard</h3>
                </div>


            </div>

            <form action="MarketingDashboard">
                <div class="mb-3 row">

                    <div class="col-3 row d-flex align-items-center">
                        <label class="col-5">Ngày bắt đầu:</label>
                        <input type="date" class="col-7" name="start" required value="${param.start != null ? param.start : ''}">
                    </div>
                    <div class="col-3 row d-flex align-items-center">
                        <label class="col-5">Ngày kết thúc:</label>
                        <input type="date" class="col-7" name="end" required value="${param.end != null ? param.end : ''}">
                    </div>
                    <div class="col-3 ">
                        <input type="submit" class="btn btn-primary" value="Lọc">
                    </div>

                </div>
            </form>

            <div class="row">
                <div class="col-sm-6 col-xl-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col mt-0">
                                    <h5 class="card-title">Bài viết mới</h5>
                                </div>

                                <div class="col-auto">
                                    <div class="stat text-primary">
                                        <i class="bi bi-newspaper"></i>
                                    </div>
                                </div>
                            </div>
                            <h1 class="mt-1 mb-3">${post}</h1>       
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xl-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col mt-0">
                                    <h5 class="card-title">Sản phẩm mới</h5>
                                </div>

                                <div class="col-auto">
                                    <div class="stat text-primary">
                                        <i class="bi bi-cart4"></i>
                                    </div>
                                </div>
                            </div>
                            <h1 class="mt-1 mb-3">${product}</h1>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xl-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col mt-0">
                                    <h5 class="card-title">Khách hàng mới</h5>
                                </div>

                                <div class="col-auto">
                                    <div class="stat text-primary">
                                        <i class="bi bi-people"></i>
                                    </div>
                                </div>
                            </div>
                            <h1 class="mt-1 mb-3">${customer}</h1>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-xl-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col mt-0">
                                    <h5 class="card-title">Phản hồi mới</h5>
                                </div>

                                <div class="col-auto">
                                    <div class="stat text-primary">
                                        <i class="bi bi-chat-left-text"></i>
                                    </div>
                                </div>
                            </div>
                            <h1 class="mt-1 mb-3">${feedback}</h1>
                        </div>
                    </div>
                </div>
            </div>   

            <div class="row justify-content-center d-flex mt-5">
                <div class="col-6 card">
                    <canvas id="myChart"></canvas>   
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

            <script>
                <% 
                                    List<Map<String, Object>> customerCounts = (List<Map<String, Object>>) request.getAttribute("customerCounts");
                                    StringBuilder dates = new StringBuilder();
                                    StringBuilder counts = new StringBuilder();
            
                                    for (Map<String, Object> row : customerCounts) {
                                        dates.append("'").append(row.get("date").toString()).append("',");
                                        counts.append(row.get("customer_count")).append(",");
                                    }
                %>

                const ctx = document.getElementById('myChart').getContext('2d');
                const customerChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: [<%= dates.substring(0, dates.length() - 1) %>], // Loại bỏ dấu phẩy cuối cùng
                        datasets: [{
                                label: 'Số lượng khách hàng mới',
                                data: [<%= counts.substring(0, counts.length() - 1) %>], // Loại bỏ dấu phẩy cuối cùng
                                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                borderColor: 'rgba(75, 192, 192, 1)',
                                borderWidth: 1
                            }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    stepSize: 1 // Đảm bảo các giá trị trên trục tung là số nguyên
                                }
                            },
                            x: {
                                grid: {
                                    display: false // Bỏ lưới trục X
                                }
                            }
                        },
                        plugins: {
                            legend: {
                                labels: {
                                    font: {
                                        size: 20 // Tăng kích thước chữ của legend
                                    }
                                }
                            }
                        }
                    }
                });
            </script>
        </div>
    </body>
</html>
