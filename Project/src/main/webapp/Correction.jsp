<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="user.PlaceDAO"%>
<%@ page import="user.PlaceDTO"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%
request.setCharacterEncoding("utf-8");

UserDAO dao = new UserDAO();

PlaceDAO placeDAO = new PlaceDAO();
PlaceDTO placeDTO = new PlaceDTO();
String placeName = (String) session.getAttribute("placeName");
String category = (String) session.getAttribute("category");
String maxPeople = (String) session.getAttribute("maxPeople");
String address = (String) session.getAttribute("address");
String addressDetail = (String) session.getAttribute("addressDetail");
String infoDetail = (String) session.getAttribute("infoDetail");
String imgUpload = (String) session.getAttribute("imgUpload");
String hourPerCost = (String) session.getAttribute("hourPerCost");
String dayPerCost = (String) session.getAttribute("dayPerCost");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장소 수정 페이지</title>

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

.gray-box {
	width: 50%;
	height: 50px;
	margin: 0 auto;
	background-color: #d9d9d9;
	display: flex;
	justify-content: flex-start;
	align-items: center;
	color: black;
	font-size: 20px;
	padding-left: 20px;
	margin-top: 30px;
	top: 50px;
}

input[type="text"] {
	border: none;
	border-right:0px; 
	border-top:0px; 
	boder-left:0px; 
	boder-bottom:0px;
	padding-top: 8px;
	padding-bottom: 8px;
	margin-left: 20px;
	margin-right: 10px;
	background-color: white;
}

.gray-bigbox {
	width: 50%;
	height: 70px;
	margin: 0 auto;
	background-color: #d9d9d9;
	display: flex;
	justify-content: flex-start;
	align-items: center;
	color: black;
	font-size: 20px;
	padding-left: 20px;
	margin-top: 30px;
	top: 50px;
}

.inner-box1 {
	width: 80px;
	height: 40px;
	background-color: white;
	margin: auto;
	margin-left: 10px;
}

.inner-box2 {
	width: 220px;
	height: 40px;
	background-color: white;
	margin: auto;
	margin-left: 10px;
	align-items: center;
	justify-content: center;
	font-size: 20px;
	display: flex;
	border-radius: 25px;
}

#imgUpload {
	margin-left: 15px;
}

.container {
	max-width: 960px;
	margin: 0 auto;
	height: 1000px; /* 콘텐츠의 높이를 높게 설정합니다. */
	margin-bottom: 50px;
	color: #ffffff;
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

.Regist-btn {
	position: absolute;
	margin-top: 50px;
	left: 45%;
	width: 200px;
	height: 50px;
	background-color: #ffffff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	border: 2px solid black;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 20px;
	color: black;
	display: flex;
}

}
.checkbox-area {
	background-color: #fff;
	padding: 20px;
}

.row {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	margin-bottom: 10px;
	margin-top: 10px;
}

.checkbox-item {
	display: flex;
	align-items: center;
}

input[type="checkbox"] {
	margin-right: 10px;
	margin-left: 10px;
	zoom: 1.5;
}

label {
	font-size: 18px;
}

.tab {
	white-space: pre;
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

	<form action="CorrectionAction.jsp" method="post">
		<div class=gray-box>
			장소명 : <input type="text" name="placeName" value="<%=placeDTO.getPlaceName()%>">
		</div>
		<div class=gray-bigbox>
			카테고리 :
			<div class=inner-box>
				<div class="checkbox-area">
					<div class="row">
						<div class="checkbox-item">
							<input type="checkbox" name="category" id="hotel" /> <label
								for="hotel">호텔</label>
						</div>
						<div class="checkbox-item">
							<input type="checkbox" name="category" id="pension" /> <label
								for="pension">펜션</label>
						</div>
						<div class="checkbox-item">
							<input type="checkbox" name="category" id="resort" /> <label
								for="resort">리조트</label>
						</div>
						<div class="checkbox-item">
							<input type="checkbox" name="category" id="camping" /> <label
								for="camping">캠핑장</label>
						</div>
						<div class="checkbox-item">
							<input type="checkbox" name="category" id="coworking" /> <label
								for="coworking">공유오피스</label>
						</div>
					</div>
					<div class="row">
						<div class="checkbox-item">
							<input type="checkbox" name="category" id="party" /> <label
								for="party">파티룸</label>
						</div>
						<div class="checkbox-item">
							<input type="checkbox" name="category" id="studio" /> <label
								for="studio">스튜디오</label>
						</div>
						<div class="checkbox-item">
							<input type="checkbox" name="category" id="study" /> <label
								for="study">스터디카페</label>
						</div>
						<div class="checkbox-item">
							<input type="checkbox" name="category" id="seminar" /> <label
								for="seminar">세미나실</label>
						</div>
						<div class="checkbox-item"></div>
					</div>
				</div>
			</div>

		</div>
		<div class=gray-box>
			최대 인원 : <input type="text" name="maxPeople" value="<%=placeDTO.getMaxPeople()%>">
		</div>
		<div class=gray-box>
			주소 : <input type="text" name="address" size="50" value="<%=placeDTO.getAddress()%>">
		</div>
		<div class=gray-box>
			상세 주소 : <input type="text" name="addressDetail" size="100" value="<%=placeDTO.getAddressDetail()%>">
		</div>
		<div class=gray-box>
			상세 정보 : <input type="text" name="infoDetail" value="<%=placeDTO.getInfoDetail()%>">
		</div>
		<div class=gray-box>
			사진 업로드 :
			<div class=inner-box2>
				<input type="file" id="imgUpload" name="imgUpload" value="<%=placeDTO.getImgUpload()%>">
			</div>
		</div>
		<div class=gray-box>
			금액 설정 : <input type="text" name="hourPerCost" value="<%=placeDTO.getHourPerCost()%>">
			<p>원 / 1시간</p>
			<span class="tab">&#9;</span> <input type="text" name="dayPerCost" value="<%=placeDTO.getDayPerCost()%>">
			<p>원 / 1일</p>
		</div>


		<div class="Regist-btn" onclick="location.href='CorrectionAction.jsp'">수정</div>
	</form>
	<footer>
		<div class="container">
			<p>Copyright © 2023 Example Company. All rights reserved.</p>
		</div>
	</footer>
</body>
</html>