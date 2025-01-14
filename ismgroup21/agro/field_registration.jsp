<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="java.util.List, agrowise.UserDAO, agrowise.User" %>

<%
    UserDAO userDAO = new UserDAO();
    List<User> usersTotal = userDAO.getUsers();

    User user = (User) session.getAttribute("userObj2024");
    if (user == null) {
        request.setAttribute("message", "You are not authorized to access this resource. Please login.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<%@ include file="header.jsp" %>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Lab exercise template 2019-2020">

    <title>Agro Field Registration Page</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/agro.css">
    <style>
        .hero-section {
            margin-top: 10px;
            text-align: center;
            padding: 40px 0px;
            color: #333;
            font-weight: bold;
        }

        .field-register {
            height: auto;
            margin-bottom: 6%; 
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
        
        input[type="date"] {
            height: 40px;
            padding: 6px 10px;
            line-height: normal;
            font-size: 16px;
            box-sizing: border-box;
        }

       
        input[type="date"]::-webkit-inner-spin-button,
        input[type="date"]::-webkit-calendar-picker-indicator {
            margin: 0;
            padding: 0;
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
                    <li><a href="<%= request.getContextPath() %>/agro/index.jsp">Home</a></li>
                    <li><a href="<%= request.getContextPath() %>/agro/about.jsp">About</a></li>
                    <% if (user != null) { %>
                        <li><a href="<%= request.getContextPath() %>/agro/fields.jsp">Fields</a></li>
                        <li class="active"><a href="<%= request.getContextPath() %>/agro/field_registration.jsp">Field Registration</a></li>
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
        <div class="hero-section">
            <h1>Manage your olive tree fields efficiently and effectively.</h1>
        </div>
        <div class="field-register">
            <h2>Register Your Field</h2>
            
            <form action="processFieldRegistration.jsp" method="POST">
                <div class="form-group">
                    <label for="fieldName">Field Name:</label>
                    <input type="text" id="fieldName" name="fieldName" placeholder="Enter the field name" required>
                </div>
                <div class="form-group">
                    <label for="area">Field Location:</label>
                    <select id="area" name="area" required>
                        <option value="Kalamata">Kalamata</option>
                        <option value="Heraklion">Heraklion</option>
                        <option value="Chania">Chania</option>
                        <option value="Fthiotida">Fthiotida</option>
                        <option value="Sparti">Sparti</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="eventDate">Event Date</label>
                    <input type="date" class="form-control" id="eventDate" name="eventDate" required>
                </div>
                
                <div class="form-group">
                    <label for="acreage">Acreage of Olive Groves:</label>
                    <input type="number" id="acreage" name="acreage" min="0" step="0.1" required>
                </div>
                <div class="form-group">
                    <label for="oliveTrees">Number of Olive Trees:</label>
                    <input type="number" id="oliveTrees" name="oliveTrees" min="1" placeholder="Enter the number of olive trees" required>
                </div>
                <div style="text-align: center; margin-top: 20px;">
                        <button type="submit" class="btn btn-success">
                            <span class="glyphicon glyphicon-ok"></span> Submit
                        </button>
                        <button type="reset" class="btn btn-danger">
                            <span class="glyphicon glyphicon-remove"></span> Cancel
                        </button>
                </div>
            </form>
        </div>

    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>