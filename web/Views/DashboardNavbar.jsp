<%-- 
    Document   : DashboardNavber
    Created on : Jun 11, 2024, 9:30:14 PM
    Author     : HELLO
--%>

<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <link rel="icon" href="image/logoshop.png" type="image/png">
    </head>
    <body>
        <nav id="sidebar" class="sidebar js-sidebar">
            <div class="sidebar-content js-simplebar">
                <a class="sidebar-brand" href="index.html">
                    <span class="sidebar-brand-text align-middle">
                        Furniture Dashboard
                    </span>
                    
                </a>

              

                <ul class="sidebar-nav">
                    <li class="sidebar-header">
                        Pages
                    </li>
                    <li class="sidebar-item active">
                        <a data-bs-target="#dashboards" data-bs-toggle="collapse" class="sidebar-link">
                            <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Dashboards</span>
                        </a>
                        <ul id="dashboards" class="sidebar-dropdown list-unstyled collapse show" data-bs-parent="#sidebar">
                            <li class="sidebar-item active"><a class="sidebar-link" href="AdminDashboard">Admin Dashboard</a></li>
                            <li class="sidebar-item active"><a class="sidebar-link" href="MarketingDashboard">Marketing Dashboard</a></li>
                            <li class="sidebar-item active"><a class="sidebar-link" href="SaleDashboard">Sale Dashboard</a></li>
                        </ul>
                    </li>

                    <li class="sidebar-item">
                        <a data-bs-target="#pages" data-bs-toggle="collapse" class="sidebar-link collapsed">
                            <i class="align-middle" data-feather="layout"></i> <span class="align-middle">Pages</span>
                        </a>
                        <ul id="pages" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                            <li class="sidebar-item"><a class="sidebar-link" href="CustomersList">Customer List</a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="PostsList">Post List</a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="ProductListMKTServlet">Product List</a></li>
                            <c:choose >
                                <c:when test="${sessionScope.customer.role_id==3}">
                                    <li class="sidebar-item"><a class="sidebar-link" href="AssignToSale">Order List</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="sidebar-item"><a class="sidebar-link" href="OrderListServlet">Order List</a></li>
                                </c:otherwise>
                            </c:choose>
                            <li class="sidebar-item"><a class="sidebar-link" href="FeedBackList">Feedback List</a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="SliderList">Slider List</a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="UserListServlet">User List</a></li>
                            <li class="sidebar-item"><a class="sidebar-link" href="SettingServlet">Setting List</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </body>
</html>



