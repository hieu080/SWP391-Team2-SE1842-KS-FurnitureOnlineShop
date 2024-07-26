<%-- 
    Document   : AdminDashboard
    Created on : Jul 15, 2024, 1:16:57 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <div class="wrapper">
            <%@include file="DashboardNavbar.jsp" %>
            <div class=" bg-light main">
                <%@include file="DashboardHeader.jsp" %>
                <div class="container">
                    <div class="row mb-3 mt-3">
                        <div class="col-auto">
                            <h1><strong>Admin </strong>Dashboard</h1>
                        </div>
                    </div>
                    <form action="AdminDashboard">
                        <div class="row mb-3 align-items-end">
                            <div class="col-sm-6 col-md-3 mb-2">
                                <label class="col-form-label">Ngày bắt đầu:</label>
                                <input type="date" class="form-control" name="start" required value="${param.start != null ? param.start : ''}">
                            </div>
                            <div class="col-sm-6 col-md-3 mb-2">
                                <label class="col-form-label">Ngày kết thúc:</label>
                                <input type="date" class="form-control" name="end" required value="${param.end != null ? param.end : ''}">
                            </div>
                            <div class="col-md-2 mb-2">
                                <input type="submit" class="btn btn-primary btn-block" value="Lọc"
                                       style="width:auto">
                            </div>
                        </div>
                    </form>

                    <div class="row mb-4 d-flex justify-content-center">
                        <div class="col-lg-4 mb-4">
                            <div class="card p-3 shadow-sm">
                                <h2 class="font-weight-bold text-center">Thống kê khách hàng</h2>
                                <div class="row">
                                    <div class="col-6 text-center border-right">
                                        <div class="py-2">
                                            <h5 class="text-secondary">Mới đăng ký:</h5>
                                            <strong class="h4 text-dark">${registerCounts}</strong>
                                        </div>
                                    </div>
                                    <div class="col-6 text-center">
                                        <div class="py-2">
                                            <h5 class="text-secondary">Mới mua:</h5>
                                            <strong class="h4 text-dark">${boughtCounts}</strong>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class=" p-3 shadow-sm">
                                <h2 class="font-weight-bold text-center bg-white">Thống kê theo danh mục sản phẩm</h2>
                                <div class="row">
                                    <div class="col-6 mb-3 text-center">
                                        <div class="card p-3 shadow-sm">
                                            <canvas id="Chart2"></canvas>
                                            <p style="display: none;font-size: 40px" id="nodata2">0</p>
                                        </div>
                                    </div>
                                    <div class="col-6 text-center">
                                        <div class="card p-3 shadow-sm">
                                            <canvas id="Chart3"></canvas>
                                            <p style="display: none;font-size: 40px" id="nodata3">0</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12 mb-4">
                            <div class="p-3 shadow-sm">
                                <h2 class="font-weight-bold text-center bg-white">Thống kê theo đơn hàng</h2>
                                <div class="row">
                                    <div class="col-4 text-center mb-3">
                                        <div class="card p-3 shadow-sm">
                                            <canvas id="orderStatusChart"></canvas>
                                            <p style="display: none; font-size: 40px" id="nodata">0</p>
                                        </div>
                                    </div>
                                    <div class="col-8  mb-4 text-center">
                                        <div class="card p-3 shadow">
                                            <canvas id="Chart4" style="height: 300px;"></canvas>
                                            <p style="display: none; font-size: 40px;" id="nodata4">0</p>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>


                    </div>



                    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                    <script>
                        <%  
                            Map<String, Integer> statusCounts = (Map<String, Integer>) request.getAttribute("statusCounts");
                            
                            // Định nghĩa màu sắc cho mỗi trạng thái
                            Map<String, String> statusColors = new HashMap<>();
                            statusColors.put("Thành công", "rgba(39, 245, 93, 0.8)");
                            statusColors.put("Đã đặt hàng", "rgba(241, 43, 226, 1)");
                            statusColors.put("Chưa thanh toán", "rgba(244, 223, 55, 1)");
                            statusColors.put("Đã xác nhận", "rgba(43, 123, 241, 1)");
                            statusColors.put("Đã hủy", "rgba(241, 43, 43, 1)");

                            if (statusCounts != null && !statusCounts.isEmpty()) {
                                StringBuilder status = new StringBuilder();
                                StringBuilder count = new StringBuilder();   
                                StringBuilder backgroundColors = new StringBuilder();
                                // Duyệt qua các key và lấy giá trị
                                for (String key : statusCounts.keySet()) {
                                    status.append("'").append(key).append("',");
                                    count.append(statusCounts.get(key)).append(",");   
                                    backgroundColors.append("'").append(statusColors.get(key)).append("',"); // Mặc định là màu đen nếu không tìm thấy màu
                                }
                                
                        %>
                            console.log(<%= status %>);
                            console.log(<%= backgroundColors %>);
                        var ctx = document.getElementById('orderStatusChart').getContext('2d');
                        var chart = new Chart(ctx, {              
                            type: 'pie',
                            data: {
                                labels: [<%= status.substring(0, status.length() - 1) %>], // Loại bỏ dấu phẩy cuối cùng
                                datasets: [{
                                        label: 'Số lượng đơn',
                                        data: [<%= count.substring(0, count.length() - 1) %>], // Loại bỏ dấu phẩy cuối cùng
                                        backgroundColor: [<%= backgroundColors.substring(0, backgroundColors.length() - 1) %>] // Loại bỏ dấu phẩy cuối cùng
                                    }]
                            },
                            options: {
                                plugins: {
                                    legend: {
                                        labels: {
                                            font: {
                                                size: 16 // Tăng kích thước chữ của legend
                                            }
                                        },
                                        onClick: (e) => e.stopPropagation() // Tắt chế độ click vào label để ẩn/hiện dữ liệu
                                    },
                                    title: {
                                        display: true,
                                        text: 'Biểu đồ tỉ lệ các đơn hàng theo trạng thái',
                                        font: {size: 20}
                                    }
                                }
                            }
                        });
                        <%  
                            } else {
                        %>
                        document.getElementById('nodata').style.display = 'block';
                        document.getElementById('nodata2').style.display = 'block';
                        document.getElementById('orderStatusChart').style.display = 'none';
                        document.getElementById('Chart2').style.display = 'none';
                        document.getElementById('nodata4').style.display = 'block';
                        document.getElementById('Chart4').style.display = 'none';
                        <%    
                            }
                        %>
                    </script> 



                    <script>

                        <%  
                            Map<String, Double> revenueMap = (Map<String, Double>) request.getAttribute("revenueMap");
                            StringBuilder category = new StringBuilder();
                            StringBuilder revenue = new StringBuilder();     
                            // Duyệt qua các key và lấy giá trị
                            for (String key : revenueMap.keySet()) {
                                category.append("'").append(key).append("',");
                                revenue.append(revenueMap.get(key)).append(",");                    
                            }
                        %>

                        var ctx2 = document.getElementById('Chart2').getContext('2d');
                        var chart2 = new Chart(ctx2, {
                            type: 'bar',
                            data: {
                                labels: [<%= category.substring(0, category.length() - 1) %>], // Loại bỏ dấu phẩy cuối cùng
                                datasets: [{
                                        label: 'Doanh thu',
                                        data: [<%= revenue.substring(0, revenue.length() - 1) %>], // Loại bỏ dấu phẩy cuối cùng
                                        backgroundColor: 'rgba(245, 123, 39, 0.8)'
                                    }]
                            },

                            options: {
                                indexAxis: 'y',
                                scales: {
                                    y: {
                                        grid: {
                                            display: false
                                        }
                                    }
                                },
                                plugins: {
                                    legend: {
                                        labels: {
                                            font: {
                                                size: 16 // Tăng kích thước chữ của legend
                                            }
                                        },
                                        onClick: (e) => e.stopPropagation() // Tắt chế độ click vào label để ẩn/hiện dữ liệu
                                    },
                                    title: {
                                        display: true,
                                        text: 'Biểu đồ doanh thu ',
                                        font: {size: 20}
                                    }
                                }
                            }

                        });
                    </script>   

                    <script>

                        <%  
                            Map<String, Double> starMap = (Map<String, Double>) request.getAttribute("starMap");
                        
                            if (starMap != null && !starMap.isEmpty()) {
                            StringBuilder category3 = new StringBuilder();
                            StringBuilder star = new StringBuilder();     
                            // Duyệt qua các key và lấy giá trị
                            for (String key : starMap.keySet()) {
                                category3.append("'").append(key).append("',");
                                star.append(starMap.get(key)).append(",");                    
                            }
                        %>

                        var ctx3 = document.getElementById('Chart3').getContext('2d');
                        var chart3 = new Chart(ctx3, {
                            type: 'bar',
                            data: {
                                labels: [<%= category3.substring(0, category3.length() - 1) %>], // Loại bỏ dấu phẩy cuối cùng
                                datasets: [{
                                        label: 'Sao trung bình',
                                        data: [<%= star.substring(0, star.length() - 1) %>], // Loại bỏ dấu phẩy cuối cùng
                                        backgroundColor: 'rgba(245, 226, 39, 0.8)'
                                    }]
                            },

                            options: {
                                indexAxis: 'y',
                                scales: {
                                    y: {
                                        grid: {
                                            display: false
                                        }
                                    },
                                    x: {
                                        max: 5
                                    }

                                },
                                plugins: {
                                    legend: {
                                        labels: {
                                            font: {
                                                size: 16 // Tăng kích thước chữ của legend
                                            }
                                        },
                                        onClick: (e) => e.stopPropagation() // Tắt chế độ click vào label để ẩn/hiện dữ liệu
                                    },
                                    title: {
                                        display: true,
                                        text: 'Biểu đồ phản hồi ',
                                        font: {size: 20}
                                    }
                                }
                            }

                        });

                        <% } else{ %>

                        document.getElementById('nodata3').style.display = 'block';
                        document.getElementById('Chart3').style.display = 'none';

                        <%  } %>
                    </script>   

                    <script>
                        <%  
                            List<Map<String, Object>> orderCounts = (List<Map<String, Object>>) request.getAttribute("orderCounts");
                            StringBuilder dates = new StringBuilder();
                            StringBuilder successOrders = new StringBuilder();
                            StringBuilder allOrders = new StringBuilder();

                            for (Map<String, Object> row : orderCounts) {
                                int successOrder = (int) row.get("successOrder");
                                int allOrder = (int) row.get("allOrder");

                                dates.append("'").append(row.get("date").toString()).append("',");
                                successOrders.append(successOrder).append(",");
                                allOrders.append(allOrder).append(",");
                            }
                        %>

                        var ctx4 = document.getElementById('Chart4').getContext('2d');
                        var chart4 = new Chart(ctx4, {
                            type: 'bar',
                            data: {
                                labels: [<%= dates.substring(0, dates.length() - 1) %>], // Loại bỏ dấu phẩy cuối cùng
                                datasets: [
                                    {
                                        label: 'Số đơn thành công',
                                        data: [<%= successOrders.substring(0, successOrders.length() - 1) %>], // Loại bỏ dấu phẩy cuối cùng
                                        backgroundColor: 'rgba(43, 241, 107, 1)'
                                    },
                                    {
                                        label: 'Tổng số đơn',
                                        data: [<%= allOrders.substring(0, allOrders.length() - 1) %>], // Loại bỏ dấu phẩy cuối cùng
                                        backgroundColor: 'rgba(43, 181, 241, 1)'
                                    }
                                ]
                            },
                            options: {
                                scales: {
                                    y: {
                                        beginAtZero: true
                                    },
                                    x: {
                                        grid: {
                                            display: false
                                        }
                                    }

                                },
                                plugins: {
                                    legend: {
                                        labels: {
                                            font: {
                                                size: 16 // Tăng kích thước chữ của legend
                                            }
                                        },
                                        onClick: (e) => e.stopPropagation() // Tắt chế độ click vào label để ẩn/hiện dữ liệu
                                    },
                                    title: {
                                        display: true,
                                        text: 'Biểu đồ số lượng đơn hàng thành công và tổng đơn theo ngày ',
                                        font: {size: 20}
                                    }
                                }
                            }
                        });

                    </script>
                </div>
            </div>
        </div>
        <%@include file="DashboardFooter.jsp" %>
    </body>
</html>