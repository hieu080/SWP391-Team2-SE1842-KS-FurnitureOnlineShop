<%-- Document : HomeSlider Created on : May 23, 2024, 12:46:07 AM Author : ADMIN --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Feedback-list</title>
                <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            html,
            body {
                margin: 0;
                font-family: Arial, Helvetica, sans-serif;
            }

/*            .full-height {
                height: 100vh;
            }*/
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
                justify-content: center;
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
        </style>
    </head>

    <body>
        <div class="wrapper">
            <%@include file="DashboardNavbar.jsp" %>
            <div class="main">
                <%@include file="DashboardHeader.jsp" %>
                <div class="full-height" style="display: flex;">
                    <div class="container" style="background-color: #ffffff; margin-top: 20px ">

                        <div style="display: flex;font-size: 15px;">
                            <form method="get" action="FeedBackList" style="display: flex;">

                                <p>Status:</p>
                                <select name="status" style="width: 90px; height: 20px; margin-top: 13px; margin-left: 10px; margin-right: 10px;">
                                    <option value="Active" <c:if test="${status=='Active'}">selected=""</c:if>>
                                            Active
                                        </option>
                                        <option value="Deactive" <c:if test="${status=='Deactive'}">selected=""</c:if>>
                                            Deactive
                                        </option>
                                        <option value="all" <c:if test="${status!='Deactive'&&status!='Active'}">selected=""</c:if>>
                                            All
                                        </option>
                                    </select>
                                    <p>Product:</p><input type="text" name="productname" value="${productname}"
                                                      style="width: 90px; height: 17px; margin-top: 13px; margin-left: 10px;">
                                <p style="margin-left: 10px;">rated:</p><input type="number" name="rate" value="${rate}"
                                                                               style="width: 90px; height: 17px; margin-top: 13px; margin-left: 10px;" placeholder="1->5"
                                                                               max="5" min="0">
                                <p style="margin-left: 10px;">Customer Name:</p><input type="text" name="customername" value="${customername}"
                                                                                       style="width: 90px; height: 17px; margin-top: 13px; margin-left: 10px;">
                                <p style="margin-left: 10px;">Description:</p><input type="text" name="description" value="${description}"
                                                                                     style="width: 150px; height: 17px; margin-top: 13px; margin-left: 10px;">
                                <button
                                    style="border-radius: 10px ;width: 70px; height: 23px; margin-top: 13px; margin-left: 10px; border: 0px; background-color: #425164; color: aliceblue;">Search</button>
                            </form>
                        </div>
                                                                                     
                        <div style="">
                            <table class="table-container">
                                <thead>
                                    <tr>
                                        <td>
                                            Customer Name
                                        </td>
                                        <td>
                                            Product Name
                                        </td>
                                        <td>
                                            VoteRated
                                        </td>
                                        <td>
                                            Description
                                        </td>
                                        <td>
                                            Status
                                        </td>
                                        <td>
                                            View
                                        </td>
                                        <td>
                                            Action 
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="f" items="${fl}">
                                        <tr>
                                            <td>
                                                ${f.getCustomer_Name()}
                                            </td>
                                            <td>
                                                ${f.getProduct_Name()}
                                            </td>
                                            <td>
                                                ${f.getVotescore()}
                                            </td>
                                            <td>
                                                ${f.getFeedback()}
                                            </td>
                                            <td>
                                                ${f.getStatus()}
                                            </td>
                                            <td>
                                                <a href="/FurnitureHieu/FeedBackDetail?id=${f.getId()}">View</a>
                                            </td>
                                            <td>
                                                <c:if test="${f.getStatus()=='Active'}">
                                                    <form method="get" action="ChangeStatusFeedback"><input type="text" hidden="" name="id" value="${f.getId()}"><button style="background-color: green;border: 0px; border-radius: 4px;">Change Status</button></form>
                                                    </c:if>
                                                    <c:if test="${f.getStatus()!='Active'}">
                                                    <form method="get" action="ChangeStatusFeedback"><input type="text" hidden="" name="id" value="${f.getId()}"><button style="background-color: #c65d5a; border: 0px; border-radius: 4px;">Change Status</button></form>
                                                    </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div style="background-color: #ffffff; height: 30px; display: flex; justify-content: center">
                            <ul class="pagination" type="none">
                                <c:if test="${index-2>0}">
                                    <li class="page-items"><a href="./FeedBackList?status=${param['status']}&productname=${param['productname']}&rate=${param['rate']}&customername=${param['customername']}&description=${param['description']}&index=${index-2}&"><</a></li>
                                    </c:if>
                                    <c:if test="${index-1>0}">
                                    <li class="page-items"><a href="./FeedBackList?status=${param['status']}&productname=${param['productname']}&rate=${param['rate']}&customername=${param['customername']}&description=${param['description']}&index=${index-1}">${index-1}</a></li>
                                    </c:if>
                                <li class="page-items"><a href="./FeedBackList?status=${param['status']}&productname=${param['productname']}&rate=${param['rate']}&customername=${param['customername']}&description=${param['description']}&index=${index}">${index}</a></li>
                                    <c:if test="${index+1<=numberpage}">
                                    <li class="page-items"><a href="./FeedBackList?status=${param['status']}&productname=${param['productname']}&rate=${param['rate']}&customername=${param['customername']}&description=${param['description']}&index=${index+1}">${index+1}</a></li>
                                    </c:if>
                                    <c:if test="${index+2<=numberpage}">
                                    <li class="page-items"><a href="./FeedBackList?status=${param['status']}&productname=${param['productname']}&rate=${param['rate']}&customername=${param['customername']}&description=${param['description']}&index=${index+2}">></a></li>
                                    </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="DashboardFooter.jsp" %>
    </body>

</html>
