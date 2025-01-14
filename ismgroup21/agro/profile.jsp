<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="java.util.List, agrowise.UserDAO, agrowise.User" %>

<%
    UserDAO userDAO = new UserDAO();
    User user = (User) session.getAttribute("userObj2024");
    if (user == null) {
        request.setAttribute("message", "You are not authorized to access this resource. Please login.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }

    String uname = request.getParameter("uname");
    User profileUser = null;
    String errorMessage = null;

    try {
        profileUser = userDAO.findUser(uname);
        if (profileUser == null) {
            errorMessage = "User not found!";
        }
    } catch (Exception e) {
        errorMessage = "Error while retrieving user: " + e.getMessage();
    }
%>

<!DOCTYPE html>
<html lang="en">
<%@ include file="header.jsp" %>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Agro - Profile Page</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap-theme.min.css">
    <style>
        .profile-circle img {
            width: 30px; /* Adjust size as needed */
            height: 30px;
            border-radius: 40%; /* Makes the image circular */
            object-fit: cover; /* Ensures the image fits nicely */
            border: 2px solid #ffffff; /* Optional: border around the circle */
            transition: transform 0.2s ease, box-shadow 0.2s ease; /* Add hover effects */
        }

        .profile-circle img:hover {
            transform: scale(1.1); /* Slightly enlarge the image on hover */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Optional hover shadow */
        }
    </style>
</head>
<body>
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
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="about.jsp">About</a></li>
                    <li><a href="<%= request.getContextPath() %>/agro/fields.jsp">Fields</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><p class="navbar-text">Signed in as <%= user.getUsername() %></p></li>
                    <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Sign out</a></li>
                    <li>
                            <a href="<%= request.getContextPath() %>/agro/profile.jsp?uname=<%=user.getUsername()%>" class="profile-circle">
                                <img src="<%= request.getContextPath() %>/images/member1.png" alt="Profile" />
                            </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container theme-showcase" role="main">
        
        <% if (errorMessage != null) { %>
            <div class="alert alert-danger">
                <strong><%= errorMessage %></strong>
            </div>
        <% } else { %>
            <div class="page-header">
                <h1>Profile of: <code><%= profileUser.getUsername() %> <%= profileUser.getFirstname() %></code></h1>
            </div>
            <ul class="list-unstyled">
                <li><strong>First Name:</strong> <%= profileUser.getUsername() %></li>
                <li><strong>Last Name:</strong> <%= profileUser.getFirstname() %></li>
                <li><strong>Email:</strong> <%= profileUser.getLastname() %></li>
                <li><strong>Username:</strong> <%= profileUser.getEmail() %></li>
            </ul>
        <% } %>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
