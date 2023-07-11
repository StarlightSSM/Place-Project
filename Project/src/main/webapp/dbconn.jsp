<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.sql.*" %>
<%
Connection conn = null;
   try {
      String dbURL = "jdbc:mysql://localhost:3306/place_project?serverTimezone=Asia/Seoul";
      String dbID="root";
      String dbPassword="inhatc";
      Class.forName("com.mysql.cj.jdbc.Driver");
      conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
   }catch(SQLException ex) {
      out.print(ex.getMessage());
   
   }
   
%>