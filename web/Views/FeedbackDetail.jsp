<%-- Document : HomeSlider Created on : May 23, 2024, 12:46:07 AM Author : ADMIN --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Feedback Detail</title>
        <style>
            html,
            body {
                height: 100%;
                margin: 0;
                font-family: Arial, Helvetica, sans-serif;
            }

            .full-height {
                height: 100vh;
            }
            .table-container {
                width: 80%;
                margin: 10px ;
                background-color: #fff;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                overflow: hidden;
                height: 640px;
            }

            table {
                /* width: 100%; */
                border-collapse: collapse;
            }

            thead {
                background-color: #39435c;
                color: #ffffff;
            }

            th, td {
                padding: 12px 15px;
                text-align: left;
            }

            th {
                font-weight: bold;
            }

            tbody tr:nth-child(even) {
                background-color: #f4f4f9;
            }

            tbody tr:hover {
                background-color: #e0e0e0;
            }

            tbody td {
                border-bottom: 1px solid #dddddd;
            }
            .pagination{
                display: flex;
                justify-content: left;
                width: 100px;
                height: 30px;
            }
            .page-items{
                margin-right: 5px;
                margin-left: 5px;
                width: 20px;
                height: 100%;
                color: #dddddd;
            }
            .table-container {
                width: 80%;
                margin: 20px auto;
                background-color: #fff;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                overflow: hidden;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            thead {
                background-color: #39435c;
                color: #ffffff;
            }

            th,
            td {
                padding: 12px 15px;
                text-align: left;
            }

            th {
                font-weight: bold;
            }

            tbody tr:nth-child(even) {
                background-color: #f4f4f9;
            }

            tbody tr:hover {
                background-color: #e0e0e0;
            }

            tbody td {
                border-bottom: 1px solid #dddddd;
            }

            .button-link{
                display: inline-block;
                padding: 10px 20px;
                font-size: 16px;
                color: white;
                background-color: #39435c;
                border: none;
                border-radius: 5px;
                text-align: center;
                text-decoration: none;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }
            .button-link:hover{
                background-color: #000;

            }
            .btn{
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                text-align: center;
                font-size: 16px;
                background-color: #39435c;
                color: white;
            }

        </style>
    </head>

    <body>
        <div class="wrapper">
            <%@include file="DashboardNavbar.jsp" %>
            <div class="main">
                <%@include file="DashboardHeader.jsp" %>
                <div class="container" style="background-color: #ffffff; margin-top: 20px ">
                    <div class="row">
                        <div class="col-md-6">
                            <table>
                                <tr>
                                    <td>Customer Name:</td>
                                    <td>${feedback.getCustomer_Name()}</td>
                                </tr>
                                <tr>
                                    <td>Email:</td>
                                    <td>${feedback.getUser().getEmail()}</td>
                                </tr>
                                <tr>
                                    <td>Mobile:</td>
                                    <td>${feedback.getUser().getPhonenumber()}</td>
                                </tr>
                                <tr>
                                    <td>Product:</td>
                                    <td>${feedback.getProduct_Name()}</td>
                                </tr>
                                <tr>
                                    <td>Description:</td>
                                    <td>${feedback.getFeedback()}</td>
                                </tr>
                                <tr>
                                    <td>Feedback Status:</td>
                                    <td>${feedback.getStatus()}</td>
                                </tr>
                                <tr>
                                    <td><a class="button-link" href="FeedBackList">Back to list</a></td>
                                    <td><form method="get" action="ChangeStatusFeedback"><input type="text" hidden="" name="id" value="${feedback.getId()}"><button class="btn btn-warning" style="background-color: ">Change Status</button></form></td> 
                                </tr>
                            </table>
                        </div>
                        <div class="col-md-6 row">
                            <c:forEach var="img" items="${imgs}">
                                <div class="col-md-6"><img style="width: 260px; height: 260px; object-fit: cover" src="image/imagefeedback/${img.getImage()}" alt="alt"/></div>
                                </c:forEach>
                        </div>
                    </div>
                    
                </div>

            </div>
        </div>

    </div>

    <%@include file="DashboardFooter.jsp" %>
</body>

</html>
