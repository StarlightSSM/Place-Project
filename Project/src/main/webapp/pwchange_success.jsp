<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "dbconn.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");

	String email = (String)session.getAttribute("email");
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String phone = request.getParameter("phone");
	String sql = "update user set name = ? , pw = ?, phone = ? where email = ?";
	PreparedStatement pstmt = null;
	try{
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, pw);
		pstmt.setString(3, phone);
		pstmt.setString(4, email);
		pstmt.executeUpdate();
	}catch (Exception e) {
		PrintWriter script = response.getWriter();
		script.print("<script>");
		script.print("alert('수정에 실패하였습니다')");
		script.print("loction.href = 'pwchange.jsp'");
		script.print("</script>");
	}
%>
<script>
	opener.location.reload();
	window.close();
</script>