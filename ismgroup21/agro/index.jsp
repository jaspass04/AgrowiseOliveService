<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="agrowise.UserDAO, agrowise.User " %>


<%
    User user = (User) session.getAttribute("userObj2024");
    
%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="header.jsp" %>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Lab exercise template 2019-2020">

    <title>Agro Index Page</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap-theme.min.css">
    <style>

        .page-header {
            color: #fff !important;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.7);
        }

        #background-video {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1;
        }

        .info-par {
            font-family: "Dancing Script", "Lucida Handwriting", cursive;
            font-size: 2.5rem;
            font-weight: bold;
            color: #fff !important;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.7);
            text-align: center;
        }

        .custom-button {
            display: inline-block;
            padding: 15px 30px;
            font-size: 18px;
            font-weight: bold;
            text-transform: uppercase;
            color: #fff !important;
            background-color: #6a994e;
            border-color: #6a994e;
            border-radius: 8px;
            text-decoration: none;
            text-align: center;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        .custom-button:hover {
            background-color: #45a049;
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.3);
        }

        .custom-button:active {
            background-color: #3e8e41;
            box-shadow: inset 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        .button-container {
            display: flex;
            flex-direction: row;
            gap: 15px;
            justify-content: center;
            margin: 20px auto;
            align-items: center;
        }

        .profile-circle img {
            width: 30px;
            height: 30px;
            border-radius: 40%;
            object-fit: cover;
            border: 2px solid #ffffff;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .profile-circle img:hover {
            transform: scale(1.1);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
    </style>
    
    

</head>

<body>

    <video autoplay muted loop id="background-video" preload="auto">
        <source src="<%= request.getContextPath() %>/images/fieldVideo.mp4" type="video/mp4" >
        Your browser does not support the video tag.
    </video>
     

    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span> <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Agro-Wise</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="<%= request.getContextPath() %>/agro/index.jsp">Home</a></li>
                    <li><a href="<%= request.getContextPath() %>/agro/about.jsp">About</a></li>
                    <% if (user != null) { %>
                        <li><a href="<%= request.getContextPath() %>/agro/fields.jsp">Fields</a></li>
                    <% } %>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <% if (user == null) { %>
                        <li><a href="<%= request.getContextPath() %>/agro/register.jsp">Register</a></li>
                        <li><a href="<%= request.getContextPath() %>/agro/login.jsp">Sign in</a></li>
                    <% } else { %>
                        <li>
                            <p class="navbar-text">Signed in as <%= user.getUsername() %></p>
                        </li>
                        <li>
                            <a href="<%= request.getContextPath() %>/agro/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Sign out</a>
                        </li>
                        <li>
                            <a href="<%= request.getContextPath() %>/agro/profile.jsp?uname=<%=user.getUsername()%>" class="profile-circle">
                                <img src="<%= request.getContextPath() %>/images/member1.png" alt="Profile" />
                            </a>
                        </li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container theme-showcase" role="main">
       
       <div class="page-header">
            <h1>About Agro-Wise</h1>
        </div>
        <div class="info-par">
            <p style="line-height: 1.8;">
            <b>
                Agro-Wise is a revolutionary platform built to support olive farmers.<br>
                It helps manage tasks such as planting, watering, and harvesting.<br>
                The integrated calendar ensures no task is ever missed.<br>
                With AI-powered insights, farmers can maximize crop yield.
            </b>
            </p>
        </div>

        <div class="page-header">
            <h1>Featuring</h1>
        </div>
        <div class="button-container">
            <a href="query_insertion.jsp" class="custom-button">FAQ Guide</a>
            <a href="calendar.jsp" class="custom-button">Calendar</a>
            <a href="predictor.jsp" class="custom-button">Predictor</a>
            <a href="forecast.jsp" class="custom-button">Forecast</a>

        </div> 
    </div>
    

    <%@ include file="footer.jsp" %>

</body>
</html>