<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="java.io.PrintWriter"%>

<%

// 로그아웃 후 리다이렉트할 페이지
String redirectUrl = "UserIndex.jsp"; // 로그아웃 후 이동할 페이지 URL

response.sendRedirect(redirectUrl);
%>
