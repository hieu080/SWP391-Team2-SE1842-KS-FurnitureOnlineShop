<%-- Document : HomeSlider Created on : May 23, 2024, 12:46:07 AM Author : ADMIN --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Feedback-list</title>
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
                <div style="display: flex;">
                    <div class="container" style="background-color: #ffffff; margin-top: 20px ">
                        <div style="display: flex;">
                            <!--            <div style="width: 18%; height: 100%; background-color: #39435c; padding-top: 0px;">
                                            <div
                                                style="width: 100%; height: 50px; background-color: #283744; color: aliceblue; font-family: Arial, Helvetica, sans-serif; margin-top: 0px;">
                                                <p style="display: flex; justify-content: center; padding-top: 15px; margin: 0px;">Director</p>
                                            </div>
                                            <div style="display: flex; width: 100%; color: white; margin: 10px;">
                                                <div style="width: 20%;">
                                                    <img style="border-radius: 50%;" width="100%" , height="100%"
                                                         src="data:image/jpeg;base64,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"
                                                         alt="">
                                                </div>
                                                <p style="margin-left: 10px;">Hello, thuhang</p><br>
                                            </div>
                                            <div style="color: white; display: flex; margin-left: 40px;">
                                                <div
                                                    style="background-color: greenyellow; width: 6px; height: 6px; margin-top: 10%; margin-right: 3%; border-radius: 100%;">
                                                </div>
                                                <p>Online</p>
                                            </div>
                                            <div style="width: 100%; height: max-content; background-color: #425164; padding-bottom: 2px;">
                                                <p style="color: white; margin-left: 70px; padding-top: 10px;"><a style="color: aliceblue;"
                                                                                                                  href="">Feedback list</a></p>
                                                <p style="color: white; margin-left: 70px; padding-top: 10px;"><a style="color: aliceblue;"
                                                                                                                  href="">Product list</a></p>
                                                <p style="color: white; margin-left: 70px; padding-top: 10px;"><a style="color: aliceblue;"
                                                                                                                  href="">Customer list</a></p>
                                            </div>
                                        </div>-->
                            <div style="background-color: #ffffff; padding-top: 0px;">
                                <div style="margin: auto; width: 600px; background-color: #ffffff;padding-top: 40px;">
                                    <table class="table-container" style="margin: auto;">
                                        <tr>
                                            <td>Customer Name:</td>
                                            <td>${feedback.getCustomer_Name()}</td>
                                        </tr>
                                        <tr>
                                            <td>Customer Email:</td>
                                            <td>${feedback.getUser().getEmail()}</td>
                                        </tr>
                                        <tr>
                                            <td>Customer Mobile:</td>
                                            <td>${feedback.getUser().getPhonenumber()}</td>
                                        </tr>
                                        <tr>
                                            <td>Product Name:</td>
                                            <td>${feedback.getProduct_Name()}</td>
                                        </tr>
                                        <tr>
                                            <td>Feedback Description:</td>
                                            <td>${feedback.getFeedback()}</td>
                                            <!--                            <td><textarea disabled>
                                            ${feedback.getFeedback()}
                                        </textarea></td>-->
                                        </tr>
                                        <tr>
                                            <td>Feedback Image</td>
                                            <td></td>
                                        </tr>
                                        <c:forEach var="img" items="${imgs}">
                                            <tr>
                                                <td><img style="width: 200px;height: auto" src="image/imagefeedback/${img.getImage()}" alt="alt"/></td>
                                                <td></td>
                                            </tr>
                                        </c:forEach>
                                        <tr>
                                            <td>Feedback Status:</td>
                                            <td>${feedback.getStatus()}</td>
                                        </tr>
                                        <tr>
                                            <td><a class="button-link" href="FeedBackList">Back to list</a></td>
                                            <!--<td><form method="get" action="ChangeStatusFeedback"><input type="text" hidden="" name="id" value="${feedback.getId()}"><button class="btn" style="background-color: ">Change Status</button></form></td>--> 
                                            <td><form method="get" action="ChangeStatusFeedback"><input type="text" hidden="" name="id" value="${feedback.getId()}"><button class="btn" style="background-color: ">Change Status</button></form></td>
                                        </tr>
                                    </table>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="DashboardFooter.jsp" %>
    </body>

</html>
