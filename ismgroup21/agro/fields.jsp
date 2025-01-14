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
%>

<!DOCTYPE html>
<html lang="en">
<%@ include file="header.jsp" %>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Agro - Fields Page</title>
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

        .page-header {
            margin-top: 50px auto;
            margin: 10px auto;
            max-width: 90%;
            overflow-y: auto;
        }
        
        .table-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 90%;
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
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
<div class="container">
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Agro-Wise</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="about.jsp">About</a></li>
                    <li class="active"><a href="<%= request.getContextPath() %>/agro/fields.jsp">Fields</a></li>
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
        <div class="container">
               <div class="page-header">
                    <h1>Here is a list of your fields, <code><%= user.getFirstname() %> <%= user.getLastname() %></code></h1>
                </div> 
                <div class="row">
                    <div class="col-xs-12">
                        <h2>Registered Fields <span class="badge"><%= (userFields != null) ? userFields.size() : 0 %></span></h2>
                        <table class="table table-bordered">
                            <thead class="alert alert-info">
                                <tr>
                                    <th>Field Name</th>
                                    <th>Location</th>
                                    <th>Acreage</th>
                                    <th>Number of Olive Trees</th>
                                    <th>Date</th>
                                    <th>Delete Field</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (userFields != null && !userFields.isEmpty()) { 
                                    for (Fields field : userFields) { %>
                                <tr>
                                    <td><%= field.getField_name() %></td>
                                    <td><%= field.getLocation() %></td>
                                    <td><%= field.getAcreage() %></td>
                                    <td><%= field.getOlive_trees() %></td> 
                                    <td><%= field.getReg_Date() %></td> 
                                    <td><a href="fieldDelete.jsp?fieldname=<%=field.getField_name()%>">Delete</a></td>
                                </tr>
                                <%   } 
                                } else { %>
                                <tr>
                                    <td colspan="6" class="text-center">No fields registered yet.</td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div style="height: 200px;"></div>
            <div class="text-center" style="margin: 20px 0;">
                <a href="field_registration.jsp" class="btn btn-primary btn-lg">Add New Field</a>
            </div>
    </div>


    <%@ include file="footer.jsp" %>
</body>
</html>


