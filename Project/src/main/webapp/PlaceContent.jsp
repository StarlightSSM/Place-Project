<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="user.PlaceDAO"%>
<%@ page import="user.PlaceDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.UserDTO"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장소 내용 페이지</title>
<style>
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
}

.header-right {
	float: right;
	margin-top: 20px;
}

.Home, .Login {
	margin-right: 5px;
	display: inline-block;
	vertical-align: middle;
	color: black;
}

.Login {
	margin-right: 20px;
}

.Home {
	display: inline-block;
	vertical-align: middle;
}

.logo {
	margin-left: auto;
	cursor: pointer;
	text-decoration: none;
}

.logo img {
	width: 300px;
	height: 155px;
}

.photo {
	max-width: 100%;
	height: auto;
	border-radius: 10px;
	margin-left: 30%;
	margin-top: 40px;
	margin-bottom: -40px;
}

.reservation-form {
	flex: 1;
	padding: 20px;
}

.gray-box {
	background-color: #EEEEEE;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin: 100px; /*회색박스 줄이기*/
}

.gray-box h2 {
	margin-top: 0;
	margin-bottom: 10px;
}

.gray-box form {
	/* 예약 폼 스타일링 */
	
}

.datepicker {
	font-size: 14px;
	width: 95%;
	padding: 10px;
}

hr {
	margin-top: 10px;
	margin-bottom: 10px;
}

#reserve-button {
	font-size: 14px;
	background-color: #72C289;
	border: none;
	margin-bottom: 30px;
	padding: 10px;
	border-radius: 8px;
	width: 30%;
	margin-top: 30px;
	font-size: 20px;
	text-align: center;
	display: flex;
	justify-content: center;
	margin-left: 35%;
}

footer {
	background-color: #4A515B;
	padding: 8px;
	text-align: center;
	position: fixed;
	bottom: 0;
	left: 0;
	right: 0;
	height: 50px; /* 하단 프레임의 높이 설정 */
}
</style>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	<%!
        // PlaceDAO 인스턴스 생성
        PlaceDAO placeDAO = new PlaceDAO();
		PlaceDTO dto = new PlaceDTO();
        // 장소 정보를 담을 PlaceDTO 객체
        PlaceDTO place = null;

        // 장소 정보를 가져오는 메서드
        public void getPlaceInfo(int placeID) {
            try {
                // 장소 정보 가져오기
                place = placeDAO.getPlaceInfo(placeID);
            } catch (SQLException e) {
                e.printStackTrace();
                // 오류 처리
            }
        }
       
    %>
	<%-- 클릭한 장소 ID를 받아옴 --%>
	<% String placeIDParam = request.getParameter("placeID");
        int placeID = Integer.parseInt(placeIDParam); %>
	<div class=header-right>
		<a href="Index.jsp" class="Home">HOME</a> <a href="#" class="i">|
		</a> <a href="Login.jsp" class="Login">로그인</a>
	</div>
	<%-- 장소 정보 가져오기 --%>
	<% getPlaceInfo(placeID); %>
	<a href="UserIndex2.jsp" class="logo"> <img src="image/logo.png"
		alt="로고 이미지">
	</a>

	<div class="photo">
		<img src="./image/<%=place.getImgUpload() %>" alt="<%=place.getCategory() %>" width="760"
			height="500">
	</div>

	<div class="reservation-form">
		<div class="gray-box">

			<h2><%=place.getPlaceName()%></h2>
			<p><%=place.getAddress() %>
				<%=place.getAddressDetail() %></p>
			<br>
			<p>
				[등록 날짜]
				<%=place.getRegdate()%></p>
			<br>
			<p><%=place.getInfoDetail() %></p>
			<br>

			<hr>
			<h2>이용 금액</h2>
			<p>
				일별
				<%=place.getDayPerCost() %>원 / 일
			</p>
			<p>
				대여
				<%=place.getHourPerCost() %>원 / 시간
			</p>
			<hr>
			<h2>최근 리뷰</h2>
			<p>이메일명 / [작성날짜]</p>

			<p>시설이 너무 깨끗하고 좋았어요! 리뷰 이벤트 참여로 체크인 할때 데스크에서 수영장 1일 무료 이용권도 받아서
				친구랑 같이 수영장에서 힐링했습니다! 직원분들도 너무 친절하셔서 좋았어요~:) 다음에도 이용할게요~!</p>
			<br>
			<p>이메일명 / [작성날짜]</p>

			<p>굳굳~!</p>
			<hr>
			<button id="reserve-button"
				onclick="location.href='PlaceReservation.jsp?placeID=<%=place.getPlaceID()%>'">예약하러 가기</button>
		</div>

	</div>


	<footer>
		<div class="container">
			<p>Copyright © 2023 Example Company. All rights reserved.</p>
		</div>
	</footer>
</body>
</html>