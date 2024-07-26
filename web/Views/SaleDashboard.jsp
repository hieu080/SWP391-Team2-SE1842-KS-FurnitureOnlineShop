<%-- 
    Document   : SaleDashboard
    Created on : Jul 13, 2024, 5:52:52 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.HashMap, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sale Dashboard</title>
        <link rel="icon" href="image/logoshop.png" type="image/png">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <div class="wrapper">
            <%@include file="DashboardNavbar.jsp" %>
            <div class="main">
                <%@include file="DashboardHeader.jsp" %>

                <div class="container bg-light">
                    <div class="row mb-3 mt-3">
                        <div class="col-auto d-none d-sm-block">
                            <h1><strong>Sale</strong> Dashboard</h1>
                        </div>
                    </div>

                    <div class="container mt-4">
                        <form>
                            <table class="table table-borderless">
                                <tbody>
                                    <tr>
                                        <td class="align-middle">
                                            <label class="col-form-label">Ngày bắt đầu:</label>
                                        </td>
                                        <td>
                                            <input type="date" class="form-control" name="start" value="${param.start != null ? param.start : ''}">
                                        </td>
                                        <td class="align-middle">
                                            <label class="col-form-label">Ngày kết thúc:</label>
                                        </td>
                                        <td>
                                            <input type="date" class="form-control" name="end" value="${param.end != null ? param.end : ''}">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="align-middle">
                                            <label class="col-form-label">Sale:</label>
                                        </td>
                                        <td>
                                            <select class="form-control" name="sale">
                                                <option value="">Tất cả</option>
                                                <c:forEach items="${saleList}" var="sale">
                                                    <option value="${sale.getId()}" <c:if test="${sale.getId()==param.sale}">selected</c:if>>
                                                    ${sale.getFullname()} <small><i>(#${sale.getId()})</i></small>
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="align-middle">
                                            <label class="col-form-label">Trạng thái:</label>
                                        </td>
                                        <td>
                                            <select class="form-control" name="status">
                                                <option value="Done" <c:if test="${'Done' eq param.status}">selected</c:if>>Thành công</option>
                                                <option value="Canceled" <c:if test="${'Canceled' eq param.status}">selected</c:if>>Đã huỷ</option>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="d-flex justify-content-center">
                                    <input type="submit" class="btn btn-primary" value="Lọc">
                                </div>
                            </form>
                        </div>


                        <div class="row mt-4 d-flex justify-content-between">
                            <div class="col-12 d-flex justify-content-center mb-3">
                                <h3>Thống kê số liệu ${saleLabel}</h3>
                        </div>
                        <div class="col-6">
                            <div class="p-2 card">
                                <canvas id="myChart"></canvas>   
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="p-2 card">
                                <canvas id="myChart2"></canvas>   
                            </div>
                        </div>
                    </div>

                    <!--vẽ biểu đồ tỉ lệ đơn hàng-->      
                    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                    <script>
                        <% 
                            List<Map<String, Object>> orderStats = (List<Map<String, Object>>) request.getAttribute("orderStats");
                            StringBuilder dates = new StringBuilder();
                            StringBuilder rates = new StringBuilder();

                            for (Map<String, Object> row : orderStats) {
                                dates.append("'").append(row.get("date").toString()).append("',");
                                rates.append(row.get("rate")).append(",");
                            }
                        %>

                        const ctx = document.getElementById('myChart').getContext('2d');
                        const customerChart = new Chart(ctx, {
                            type: 'bar',
                            data: {
                                labels: [<%= dates.substring(0, dates.length() - 1) %>], // Loại bỏ dấu phẩy cuối cùng
                                datasets: [{

                                        label: 'Tỉ lệ đơn hàng ${statusLabel} ${saleLabel}',
                                        data: [<%= rates.substring(0, rates.length() - 1) %>], // Loại bỏ dấu phẩy cuối cùng
                                        backgroundColor: '${param.status eq 'Canceled' ?'rgba(255, 0, 0, 0.61)':'rgba(7, 255, 104, 0.61)'  }'
                                        
                                    }]
                            },
                            options: {
                                scales: {
                                    y: {
                                        max: 100
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
                                                size: 16 // Tăng kích thước chữ của legend
                                            }
                                        },
                                        onClick: (e) => e.stopPropagation() // Tắt chế độ click vào label để ẩn/hiện dữ liệu
                                    }
                                }
                            }
                        });


                    </script>

                    <!--vẽ biểu đồ doanh thu-->
                    <script>
                        <% 
                            List<Map<String, Object>> revenueStats = (List<Map<String, Object>>) request.getAttribute("revenueStats");
                            StringBuilder dates2 = new StringBuilder();
                            StringBuilder revenues = new StringBuilder();

                            for (Map<String, Object> row : revenueStats) {
                                dates2.append("'").append(row.get("date").toString()).append("',");
                                revenues.append(row.get("revenue")).append(",");
                            }
                        %>

                        const ctx2 = document.getElementById('myChart2').getContext('2d');
                        const Chart2 = new Chart(ctx2, {
                            type: 'bar',
                            data: {
                                labels: [<%= dates2.substring(0, dates2.length() - 1) %>], // Loại bỏ dấu phẩy cuối cùng
                                datasets: [{

                                        label: 'Doanh thu',
                                        data: [<%= revenues.substring(0, revenues.length() - 1) %>], // Loại bỏ dấu phẩy cuối cùng
                                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                        borderColor: 'rgba(75, 192, 192, 1)',
                                        borderWidth: 1
                                    }]
                            },
                            options: {
                                scales: {
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
                                                size: 16 // Tăng kích thước chữ của legend
                                            }
                                        },
                                        onClick: (e) => e.stopPropagation() // Tắt chế độ click vào label để ẩn/hiện dữ liệu
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