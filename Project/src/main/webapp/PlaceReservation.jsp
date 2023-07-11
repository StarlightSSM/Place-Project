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
<title>장소 예약 페이지</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<style>
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

* {
	margin: 0;
	padding: 0;
	text-decoration: none;
}

/* 스케줄 */
.reservation-page {
	display: flex;
	align-items: center;
}

.resort-info {
	flex: 1;
	padding: 20px;
}

.resort-info h1 {
	margin-top: 0;
	margin-bottom: 10px;
}

.resort-info img {
	max-width: 100%;
	height: auto;
	border-radius: 10px;
}

.reservation-form {
	flex: 1;
	padding: 20px;
}

.gray-box {
	background-color: #d9d9d9;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin: 100px; /*회색박스 줄이기*/
}

.gray-box h2 {
	margin-top: 0;
	margin-bottom: 10px;
	text-align: center;
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
	width: 100%;
	margin-top: 30px;
	font-size: 20px;
	text-align: center;
}
</style>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	%>
	<%!// PlaceDAO 인스턴스 생성
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
	}%>
	<%-- 클릭한 장소 ID를 받아옴 --%>
	<%
	String placeIDParam = request.getParameter("placeID");
	int placeID = Integer.parseInt(placeIDParam);
	%>
	<form action="./PlaceReservation_ok.jsp" method="post">
		<%-- 장소 정보 가져오기 --%>
		<%
		getPlaceInfo(placeID);
		%>
		<div class="reservation-page">
			<div class="resort-info"
				style="float: right; margin-right: -100px; text-align: center;">
				<%-- hidden 필드에 장소 정보 저장 --%>
				<input type="hidden" name="placeName" value="<%=place.getPlaceName()%>"> 
				<input type="hidden" name="placeID" value="<%=place.getPlaceID()%>">
				<input type="hidden" name="dayPerCost" value="<%=place.getDayPerCost()%>">
				<input type="hidden" name="hourPerCost" value="<%=place.getHourPerCost()%>">
					value="<%=place.getPlaceName()%>">
				<h1><%=place.getPlaceName()%></h1>
				<img src="./image/<%=place.getImgUpload()%>"
					alt="<%=place.getCategory()%>">
			</div>
			<div class="reservation-form">
				<div class="gray-box">
					<h2>스케줄</h2>
					<hr>
					<label for="start-date">시작일시</label> <br> <input type="text"
						id="start-date" class="datepicker" name="Check_in_Day"
						placeholder="스케줄을 선택하세요"> <br> <br> <label
						for="end-date">종료일시</label> <br> <input type="text"
						id="end-date" class="datepicker" name="Check_out_Day"
						placeholder="스케줄을 선택하세요">
					<hr>
					<div>
						총인원 <input type="number" id="total-people" name="people" min="1"
							max="20" step="1">
					</div>
					<hr>
					<label for="time">이용시간(선택)</label> <select id="hour" name="hour">
						<option value="0">0시간</option>
						<option value="1">1시간</option>
						<option value="2">2시간</option>
						<option value="3">3시간</option>
						<option value="4">4시간</option>
						<option value="5">5시간</option>
					</select>

					<hr>

					<button id="reserve-button">예약하기</button>
				</div>

			</div>
		</div>

	</form>
	<script>
		$(function() {
			$(".datepicker").datepicker();

			$("#reserve-button").click(function() {
				var startDate = $("#start-date").val();
				var endDate = $("#end-date").val();
				alert("시작일시: " + startDate + "\n종료일시: " + endDate);
			});
		});
	</script>



	<footer>
		<div class="container">
			<p>Copyright © 2023 Example Company. All rights reserved.</p>
		</div>
	</footer>
</body>
</html>