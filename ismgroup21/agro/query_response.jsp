<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="agrowise.UserDAO, agrowise.User " %>
<!DOCTYPE html>
<html lang="en">
<%
    User user = (User) session.getAttribute("userObj2024");
    
%>
<%@ include file="header.jsp" %>
<head>
    <title>Query Response - AgroWise</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap-theme.min.css">
    <style>
        .response-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        p {
            font-size: 16px;
            margin-bottom: 20px;
        }
        .btn-back {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
        }
        .btn-back:hover {
            background-color: #218838;
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
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Agro-Wise</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="<%= request.getContextPath() %>/agro/index.jsp">Home</a></li>
                    <li><a href="<%= request.getContextPath() %>/agro/about.jsp">About</a></li>
                    <li class="active"><a href="<%= request.getContextPath() %>/agro/contact.jsp">Contact</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <% if (user == null) { %>
                    <li><a href="<%= request.getContextPath() %>/agro/register.jsp">Register</a></li>
                    <li><a href="<%= request.getContextPath() %>/agro/login.jsp">Sign in</a></li>
                    <%
                    } else { %>
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

    <div class="response-container">
        <h2>Your Query Response</h2>
        <p>
            <%= session.getAttribute("queryResponse") %>
        </p>
        <a href="query_insertion.jsp" class="btn-back">Ask Another Question</a>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
