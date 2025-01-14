<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="agrowise.UserDAO, agrowise.User " %>
<%@ page errorPage="error.jsp" %>
<%
    User user = (User) session.getAttribute("userObj2024");
    
%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="header.jsp" %>
<head>
    <meta name="description" content="Agro-Wise Query Insertion">
    <meta name="author" content="Agro-Wise AI">
    <title>Ask Agro-Wise</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap-theme.min.css">
    <style>
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-container input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-container button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
        }
        .form-container button:hover {
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

    <div class="container theme-showcase" role="main">
        <div class="form-container">
            <h2>Ask Agro-Wise</h2>
            <form method="post" action="query_controller.jsp">
                <label for="query">Enter your question about olives:</label>
                <input type="text" id="query" name="query" placeholder="Type your question here..." required>
                <button type="submit">Ask</button>
            </form>
            <div class="faq-section">
                <h4>FAQs:</h4>
                <ul>
                    <li>What is the global olive oil production?</li>
                    <li>How much olive oil do 1000 kg of olives produce?</li>
                    <li>What are the best season, weather, and time conditions for olive harvesting?</li>
                    <li>What is the difference between extra virgin olive oil and regular olive oil?</li>
                    <li>How long can olive oil be stored, and how should it be stored?</li>
                    <li>What health benefits does olive oil provide?</li>
                    <li>Can olive oil be used for cooking, or is it best for dressings?</li>
                    <li>How do I recognize quality olive oil?</li>
                    <li>Is olive oil good for skincare?</li>
                    <li>How is olive oil made from olives?</li>
                    <li>What is the ideal temperature for storing olive oil?</li>
                    <li>What is the shelf life of olive oil after opening?</li>
                    <li>Why do some olive oils have a bitter taste?</li>
                    <li>Can olive oil be used for frying?</li>
                </ul>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
