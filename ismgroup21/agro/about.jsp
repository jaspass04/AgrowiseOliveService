<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="error.jsp"%>
<%@ page import="agrowise.UserDAO, agrowise.User" %>


<%
    UserDAO userDAO = new UserDAO();
    User user = (User) session.getAttribute("userObj2024");
    
%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="header.jsp" %>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Agro About page</title>

    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap-theme.min.css">
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
            color: #333;
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
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Agro-Wise</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                 <ul class="nav navbar-nav">
                    <li><a href="<%= request.getContextPath() %>/agro/index.jsp">Home</a></li>
                    <li class="active"><a href="<%= request.getContextPath() %>/agro/about.jsp">About</a></li>
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
            <h1>Group Members</h1>
        </div>
        
        <div class="media">
            <div class="col-md-2">
                <img src="<%= request.getContextPath() %>/images/member1.png" class="img-responsive" alt="Member Avatar">
            </div>
            <div class="media-body">
                <h3>George Flourakis <span class="text-muted">8220161</span></h3>
                <p><a href="mailto:t8220161@aueb.com">t8220161@aueb.com</a></p>
            </div>
        </div>
        
        <div class="media">
            <div class="col-md-2">
                <img src="<%= request.getContextPath() %>/images/member1.png" class="img-responsive" alt="Member Avatar">
            </div>
            <div class="media-body">
                <h3>Jason Passam <span class="text-muted">8220122</span></h3>
                <p><a href="mailto:t8220122@aueb.com">t8220122@aueb.com</a></p>
            </div>
        </div>

        <div class="media">
            <div class="col-md-2">
                <img src="<%= request.getContextPath() %>/images/member1.png" class="img-responsive" alt="Member Avatar">
            </div>
            <div class="media-body">
                <h3>Theofanis Orfanoudakis <span class="text-muted">8220111</span></h3>
                <p><a href="mailto:t8220111@aueb.com">t8220111@aueb.com</a></p>
            </div>
        </div>

        <div class="media">
            <div class="col-md-2">
                <img src="<%= request.getContextPath() %>/images/member1.png" class="img-responsive" alt="Member Avatar">
            </div>
            <div class="media-body">
                <h3>Aggelos Kouros <span class="text-muted">8220070</span></h3>
                <p><a href="mailto:t8220070@aueb.com">t8220070@aueb.com</a></p>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>