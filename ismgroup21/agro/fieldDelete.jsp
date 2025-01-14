<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="agrowise.FieldsDAO"%>
<%@ page errorPage="error.jsp"%>

<%
    String name = request.getParameter("fieldname");
    FieldsDAO fieldsDAO = new FieldsDAO();
    try {
        fieldsDAO.deleteField(name);
        request.setAttribute("success_message", "Deleted field with name: " + name);
    } catch (Exception e) {
        request.setAttribute("error_message", "Error deleting field: " + e.getMessage());
    }
    request.getRequestDispatcher("fields.jsp").forward(request, response);
%>
