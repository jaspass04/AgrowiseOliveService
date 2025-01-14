<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="java.util.List, agrowise.FieldsDAO, agrowise.Fields, agrowise.User" %>

<%
    User user = (User) session.getAttribute("userObj2024");
    if (user == null) {
        request.setAttribute("message", "You are not authorized to access this resource. Please login.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }

    FieldsDAO fieldsDAO = new FieldsDAO();
    List<Fields> userFields = null;
    try {
        userFields = fieldsDAO.getFieldsByUsername(user.getUsername());
    } catch (Exception e) {
        request.setAttribute("message", "Error fetching fields: " + e.getMessage());
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }

    String selectedField = request.getParameter("fieldsSelect");
    Fields selected = null;

    if (selectedField != null && !selectedField.isEmpty()) {
        for (Fields field : userFields) {
            if (field.getField_name().equals(selectedField)) {
                selected = field;
                break;
            }
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="header.jsp" %>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Agro - Predictor Page</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap-theme.min.css">
    <style>
        body {
            color: #333;
            background-image: url('<%= request.getContextPath() %>/images/backImg.jpeg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            background-attachment: fixed;
        }

        label {
            font-size: 20px;
            font-weight: bold;
            color: #333 !important;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            margin-top: 70px;
        }

        .center-content {
            text-align: center;
            margin-top: 230px;
        }

        select.form-control {
            width: 50%;
            font-size: 16px;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: left;
        }

        select.form-control:hover {
            border-color: #007bff;
            box-shadow: 0 2px 6px rgba(0, 123, 255, 0.2);
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

        .estimation {
            position: fixed;
            align-items : left;
            bottom: 20%;
            left: 50%;
            transform: translateX(-50%);
            background-color: #f9f9f9;
            border-left: 10px solid #4CAF50;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 40%;
        }

        .estimation p {
            margin: 0;
            font-size: 16px;
            color: #333;
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
                        <li class="active"><a href="<%= request.getContextPath() %>/agro/predictor.jsp">Predictor</a></li>
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
            <h1>Select one of your fields 🌲</h1>
        </div>
        <form method="post" action="">
            <div class="form-group">
                <label for="fieldsSelect">Choose a Field:</label>
                <select id="fieldsSelect" name="fieldsSelect" class="form-control" onchange="this.form.submit()">
                    <option value="">-- Select a field --</option>
                    <% if (userFields != null && !userFields.isEmpty()) { %>
                        <% for (Fields field : userFields) { %>
                            <option value="<%= field.getField_name() %>" <%= (selectedField != null && selectedField.equals(field.getField_name())) ? "selected" : "" %>>
                                <%= field.getField_name() %>
                            </option>
                        <% } %>
                    <% } else { %>
                        <option disabled>No fields available</option>
                    <% } %>
                </select>
            </div>
        </form>
        <% if (selected != null) { %>
            <div class="center-content">
                <h3>Our estimation for <code><%= selected.getField_name() %></code></h3>
            </div>
            <div class="estimation">
                <p>Estimated olives: <%= selected.getOlive_trees() * 20 %> - <%= selected.getOlive_trees() * 40 %> kg</p>
                <p>Estimated olive oil: <%= (selected.getOlive_trees() * 20) * 0.2 %> - <%= (selected.getOlive_trees() * 40) * 0.2%> liters</p>
                <p>Estimated revenue: <%= ((selected.getOlive_trees() * 20) * 0.2) * 6%> - <%= ((selected.getOlive_trees() * 40) * 0.2) * 6%> € </p>
            </div>
        <% } %>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>

