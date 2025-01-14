<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="agrowise.*" %>

<%
    User user = (User) session.getAttribute("userObj2024");
    if (user == null) {
        request.setAttribute("message", "You are not authorized to access this resource. Please login.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }
    String username=user.getUsername();
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
    <meta name="description" content="Event calendar for olive tree field">
    <title>Event Calendar - Agro-Wise</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/calendar.css">
    <script src="<%= request.getContextPath() %>/js/calendar.js"></script>
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
        label, h1, h2 {
        color: green;
    }
        </style>
</head>

<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Agro-Wise</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="<%= request.getContextPath() %>/agro/index.jsp">Home</a></li>
                    <li><a href="<%= request.getContextPath() %>/agro/about.jsp">About</a></li>
                    <% if (user != null) { %>
                        <li><a href="<%= request.getContextPath() %>/agro/fields.jsp">Fields</a></li>
                    <% } %>
                    <% if (user != null) { %>
                        <li class="active"><a href="<%= request.getContextPath() %>/agro/calendar.jsp">Calendar</a></li>
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
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <h1 class="text-center">Event Calendar for Olive Tree Field</h1>
        <div id="calendar">
            <!-- Calendar rendering logic -->
        </div>

        <hr>

        <h2>Create New Event</h2>
        <form action="registerEvent.jsp" method="POST" >
            <div class="form-group">
                <label for="eventTitle">Event Title</label>
                <input type="text" class="form-control" id="eventTitle" name="eventTitle" required>
            </div>
            <div class="form-group">
                <label for="eventTitle">Field</label>
                    <select id="fieldsSelect" name="fieldsSelect" class="form-control" required>
                        <option value="">--Choose a field-- </option>
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
            <div class="form-group">
                <label for="eventDate">Event Date</label>
                <input type="date" class="form-control" id="eventDate" name="eventDate" required>
            </div>
            <div class="form-group">
                <label for="eventDescription">Event Description</label>
                <textarea class="form-control" id="eventDescription" name="eventDescription" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Add Event</button>
        </form>

        <hr>

        <h2>Upcoming Events</h2>
        <table class="table table-bordered">
            <thead class="alert alert-info">
                <tr>
                    <th>Title</th>
                    <th>field</th>
                    <th>Date</th>
                    <th>Description</th>
                    <th>Delete Field</th>
                    
                </tr>
            </thead>
            <tbody>
                <% 
                    EventDAO eventDAO = new EventDAO();
                    List<Event> events = eventDAO.getEventsForUser(user.getUsername());
                    for (Event event : events) {
                %>
                <tr>
                    <td><%= event.getEventName() %></td>
                    <td><%= event.getFieldName() %></td>
                    <td><%= event.getDate() %></td>
                    <td><%= event.getDescription() %></td>
                    <td><a href="eventDelete.jsp?eventname=<%=event.getEventName()%>">Delete</a></td>

                    
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>
