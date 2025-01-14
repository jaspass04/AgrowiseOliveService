<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="agrowise.FieldsDAO, agrowise.Fields, agrowise.User, java.util.*"%>

<%
    // Ensure the user is logged in
    User user = (User) session.getAttribute("userObj2024");
    if (user == null) {
        request.setAttribute("message", "You are not authorized to access this resource. Please login.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
        return;
    }

    // Retrieve form parameters
    String fieldName = request.getParameter("fieldName");
    fieldName = new String(fieldName.getBytes("ISO-8859-1"), "UTF-8");  
    String location = request.getParameter("area");
    String acreageStr = request.getParameter("acreage");
    String username = user.getUsername();
    String date = request.getParameter("eventDate");

    // Validate input
    if (fieldName == null || location == null || acreageStr == null || fieldName.trim().isEmpty() || location.trim().isEmpty() || acreageStr.trim().isEmpty()||date.isEmpty()) {
        request.setAttribute("message", "All fields are required.");
        request.getRequestDispatcher("field_registration.jsp").forward(request, response);
        return;
    }

    double acreage = 0;
    try {
        acreage = Double.parseDouble(acreageStr);
    } catch (NumberFormatException e) {
        request.setAttribute("message", "Invalid acreage value.");
        request.getRequestDispatcher("field_registration.jsp").forward(request, response);
        return;
    }

    String oliveTreesStr = request.getParameter("oliveTrees");
    int oliveTrees = 0;

    try {
        oliveTrees = Integer.parseInt(oliveTreesStr);
    } catch (NumberFormatException e) {
        request.setAttribute("message", "Invalid number of olive trees.");
        request.getRequestDispatcher("field_registration.jsp").forward(request, response);
        return;
    }


    // Register the field
    try {
        FieldsDAO fieldsDAO = new FieldsDAO();
        Fields field = new Fields(fieldName, location, acreage, username, oliveTrees, date);
        fieldsDAO.register(field, username);
        request.setAttribute("message", "Field registered successfully!");
        request.getRequestDispatcher("fields.jsp").forward(request, response);
    } catch (Exception e) {
        request.setAttribute("message", "Error registering field: " + e.getMessage());
        request.getRequestDispatcher("field_registration.jsp").forward(request, response);
    }
%>
