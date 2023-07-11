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
    
    h2 {
    	margin-left: 15px;
    }
</style>
	

</head>
<body>
	<div>
		<h2>리뷰 작성하기</h2>
		<form action="writeReview_ok.jsp" method="POST">
			<br>
			내용 :
			<textarea rows="20" cols="90" name="content" placeholder = "해당 장소를 이용해 본 후기를 작성해주세요."></textarea><br>
			<button type="submit">확 인</button>
		</form>
	</div>
</body>
</html>