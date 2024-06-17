<%-- 
    Document   : FeedbackDetail
    Created on : Jun 7, 2024, 4:13:06 AM
    Author     : admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Feedback-Detail</title>
        <style>
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
        <div style="margin: auto; height: 700px; width: 600px; background-color: #ffffff;padding-top: 40px;">
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
                    <td><textarea disabled>
                            ${feedback.getFeedback()}
                        </textarea></td>
                </tr>
                <tr>
                    <td>Feedback Image</td>
                </tr>
                <c:forEach var="img" items="${imgs}">
                <tr>
                    <td><img style="width: 200px;height: 150px" src="${img.getImage()}" alt="alt"/></td>    
                </tr>
                </c:forEach>
                <tr>
                    <td>Feedback Status:</td>
                    <td>${feedback.getStatus()}</td>
                </tr>
                <tr>
                    <td><a class="button-link" href="FeedBackList">Back to list</a></td>
                    <td><form method="get" action="ChangeStatusFeedback"><input type="text" hidden="" name="id" value="${feedback.getId()}"><button class="btn" style="background-color: ">Change Status</button></form></td>
                </tr>
            </table>
        </div>
    </body>

</html>