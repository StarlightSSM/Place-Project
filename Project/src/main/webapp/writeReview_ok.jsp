<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "dbconn.jsp" %>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="user.PlaceDAO"%>
<%@ page import="user.PlaceDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.ReviewDAO"%>
<%@ page import="user.ReviewDTO"%>
<%@ page import="user.ReservationDAO"%>
<%@ page import="user.ReservationDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>

	<style>
    /* CSS 스타일을 여기에 작성합니다 */
    body {
        font-size: 16px;
        text-align: center;
        padding-top: 20px;
    }
    
    label {
        font-size: 18px;
        margin-bottom: 10px;
        display: flex;
        align-items: center;
        justify-content: flex-end;
        width: 100px;
    }
    
    input[type="text"] {
        width: 300px;
        height: 30px;
        font-size: 18px;
        margin-bottom: 10px;
    }
    
    button {
        background-color: #72C289;
        color: white;
        padding: 10px 20px;
        font-size: 18px;
        border: none;
        cursor: pointer;
        margin-top: 10px;
        border-radius: 8px;
    }
    
    .form-row {
        margin-bottom: 10px;
        display: flex;
        align-items: center;
        justify-content: flex-start;
    }
    
    .form-row label {
        margin-right: 10px;
        width: auto;
        text-align: left;
    }
</style>
	

</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	//request.setCharacterEncoding("UTF-8");
	ReviewDAO reviewDAO = new ReviewDAO();
	ReviewDTO reviewDTO = new ReviewDTO();
    String email = (String) session.getAttribute("email");
    PreparedStatement pstmt = null;
    String sql = "SELECT * FROM user WHERE email = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, email);
    ResultSet rs = pstmt.executeQuery();
    String content = (String) request.getParameter("content");
    
    int result = reviewDAO.insertReview(reviewDTO.getReviewID(), email, content);
    if (result == -1) {
    	PrintWriter script = response.getWriter();
    	script.println("<script>");
    	System.out.println("리뷰작성 성공!!");
    	script.println("location.href = 'UserIndex2.jsp'");
    	script.println("</script>");
    } else {
    	PrintWriter script = response.getWriter();
    	script.println("<script>");
    	System.out.println("리뷰작성 실패!!");
    	script.println("history.back()");
    	script.println("</script>");
    }
%>
	<div>
	</div>
</body>
</html>