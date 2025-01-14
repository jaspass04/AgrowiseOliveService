<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="agrowise.*, java.util.*"%>

<%
    // Ensure the user is logged in
    User user = (User) session.getAttribute("userObj2024");
    if (user == null) {
        request.setAttribute("message", "You are not authorized to access this resource. Please login.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }

    // Retrieve form parameters
    String eventTitle = request.getParameter("eventTitle");
    eventTitle = new String(eventTitle.getBytes("ISO-8859-1"), "UTF-8");  
    String eventDate = request.getParameter("eventDate");
    String eventDescription = request.getParameter("eventDescription");
    String fieldName = request.getParameter("fieldsSelect"); // Corrected variable name
    eventDescription = new String(eventDescription.getBytes("ISO-8859-1"), "UTF-8"); 
    fieldName = new String(fieldName.getBytes("ISO-8859-1"), "UTF-8");
    

    // Validate input
    if (eventTitle == null || eventDate == null) {
        request.setAttribute("message", "All fields are required.");
        request.getRequestDispatcher("calendar.jsp").forward(request, response);
        return;
    }

    // Register the Event
    try {
        EventDAO eventDAO = new EventDAO(); // Fixed class name
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
        java.util.Date parsedDate = sdf.parse(eventDate);
        Event event = new Event(eventTitle, fieldName, new java.sql.Date(parsedDate.getTime()), eventDescription, user.getUsername()); // Fixed variable usage
        eventDAO.addEvent(event);
        request.setAttribute("message", "Event registered successfully!");
        request.getRequestDispatcher("calendar.jsp").forward(request, response);
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("message", "Error registering Event: " + e.getMessage());
        request.getRequestDispatcher("calendar.jsp").forward(request, response);
    }
%>
