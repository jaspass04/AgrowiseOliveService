<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="agrowise.*" %>
<%
    // Ensure the user is logged in
    User user = (User) session.getAttribute("userObj2024");
    if (user == null) {
        request.setAttribute("message", "You are not authorized to access this resource. Please login.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }
    String eventname = request.getParameter("eventname");
    eventname = new String(eventname.getBytes("ISO-8859-1"), "UTF-8");  
    EventDAO eventDAO = new EventDAO();
    try{
        eventDAO.deleteEvent(eventname, user.getUsername());
        request.setAttribute("message", "Event deleted successfully!");
        request.getRequestDispatcher("calendar.jsp").forward(request, response);
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("message", "Error deleting Event: " + e.getMessage());
        request.getRequestDispatcher("calendar.jsp").forward(request, response);
    }
%>