<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="user.PlaceDAO"%>
<%@ page import="user.PlaceDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.ReservationDAO"%>
<%@ page import="user.ReservationDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.Enumeration"%>
<%
   	// 이전화면에서 전달받은 데이터를 받습니다.
   	// 화면에 미리 보여지도록 처리를 하세요~
   	request.setCharacterEncoding("UTF-8");
   
    String email = (String) session.getAttribute("email");
   	String name = (String) session.getAttribute("name");
   	String phone = (String) session.getAttribute("phone");
   	String pw = (String) session.getAttribute("pw");
   	// email 값을 파라미터로 받아옴
    //email = request.getParameter("email");
   	
	UserDAO dao = new UserDAO();
	UserDTO dto = new UserDAO().getUser(email);
	if (!email.equals(dto.getEmail())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다..')");
		script.println("location.href='Login.jsp'");
		script.println("</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록 페이지</title>

<style>
	.menu {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #F1F1F1;
	font-size: 20px;
	margin-right: 50px;
	height: 50px;
	width: 100%;
}

.menu li {
	list-style-type: none;
	margin-right: 100px;
}

.menu li a {
	text-decoration: none;
	color: #333;
}

.menu li a: hover {
	color: #555;
}
	
	

	.container {
		  max-width: 960px;
		  margin: 0 auto;
		  height: 1000px; /* 콘텐츠의 높이를 높게 설정합니다. */
      	  margin-bottom: 50px;
      	  color:#ffffff;
		  
		}

	footer{
		  background-color: #4A515B;
		  padding: 8px;
		  text-align: center;
		  position:fixed;
		  bottom:0;
		  left:0;
		  right:0;
		  height:50px; /* 하단 프레임의 높이 설정 */
		  
		}

  
 
 	.gray-box {
 		width : 50%;
 		height: 100px;
 		margin: 0 auto;
 		background-color: #d9d9d9;
 		display: flex;
 		justify-content: flex-start;
 		align-items:center;
 		color: black;
 		font-size: 20px;
 		padding-left: 20px;
 		margin-top: 100px;
 	}
 	
 	.gray-box2 {
 		width : 50%;
 		height: 400px;
 		margin: 0 auto;
 		background-color: #d9d9d9;
 		display: flex;
 		justify-content: flex-start;
 		align-items:center;
 		color: black;
 		font-size: 20px;
 		padding-left: 20px;
 		margin-top: 100px;
 	}
 	
 	.white-box {
 		background-color: #fff;
 		padding: 20px;
 		width:45%;
 		border-radius: 10px;
 		box-shadow: 0 0 10px rgba(0,0,0,0.1); 	
 		display: inline-block;
 		position: absolute;
 		margin-right: 20px;
 		margin-top: 40px;
 		top: 50%;
 		left: 50%;
 		transform: translate(-50%, -50%);
 	}
 	
 	.white-box:last-child {
 		margin-right: 0;
 	}
 	
 	
 	.white-box p {
 		margin-top: 0;
 		margin-bottom: 0;
 	}
 	/* 박스 스타일 설정 User information 박스 .box 임*/
 	.box {
 		position: absolute;
 		margin-top : 35px;
 		left : 45%;
 		width: 200px;
 		height: 50px;
 		background-color : #ffffff;
 		box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
 		border: 2px solid black;
 		display: flex;
 		align-items: center;
 		justify-content: center;
 		font-size : 20px;
 		color : black;
 		display: flex;
 	}
 	
 	.line {
 		position: relative;
 		top: 50px;
 		width: 50%;
 		border-top: 1px solid black;
 		z-index : -1;
 	}
 	
 	.box1 {
 		width: 100px;
 		height: 50px;
 		left : 50%;
 		background-color : #d9d9d9;
 		display: flex;
 		justify-content: center;
 		align-items: center;
 		font-size: center;
 		margin: 40px;
 		
 	}
 	/*	display: flex;
  	flex-wrap: wrap;
  	justify-content: center;
  	align-items: center;
  	height: 100px;	 */
 
 button {
	font-size: 14px;
	background-color: #72C289;
	border: none;
	margin-bottom: 10px;
	margin-left: 780px;
	padding: 10px;
	border-radius: 8px;
	width: 23%;
	font-size: 20px;
}
 	
 	
</style>

</head>
<body>

	<ul class = "menu">
			<li><a href="Registration.jsp">장소등록하기</a></li>
			<li><a href="Correction.jsp">장소수정하기</a></li>
			<li><a href="ReservationList.jsp">예약 목록</a></li>
			<li><a href="ReviewsLk.jsp">리뷰보기</a></li>
			<li><a href="Mypage.jsp">마이페이지</a></li>
	
		</ul>
	
	<div class = "gray-box">
		Hello <%=dto.getName() %> !!!
	</div>
	
	<div class="box">
		예약 목록</div>
	<hr class = "line">
	<div class ="gray-box2">
		<%
				ReservationDAO reservationDAO = new ReservationDAO();
				String reserverName = dto.getEmail(); // Set the reserver name you want to retrieve reservations for
				try {
					ArrayList<ReservationDTO> reservationList = reservationDAO.getReservationList(reserverName);

					for (ReservationDTO reservation : reservationList) {
				%>
		<div class ="white-box">
			<h3><%= reservation.getPlaceName() %></h3>
			<p>결제일: <%= reservation.getReserveDate() %></p>
			<p>결제 금액: <%= reservation.getPayment() %> 원</p>
			<p>시작 일시: <%= reservation.getCheck_in_Day() %></p>
			<p>종료 일시: <%= reservation.getCheck_out_Day() %></p>
			<p>이용 인원: <%= reservation.getPeople() %> 명</p>
			<button class="review" onclick="location.href='writeReview.jsp?placeName=<%= reservation.getPlaceName() %>'">리뷰 쓰기</button>
		</div>
					<%
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				%>
		</div>
	<footer>
		<div class = "container">
		<p>Copyright © 2023 Example Company. All rights reserved.</p>
		</div>
	</footer>
	
</body>
</html>