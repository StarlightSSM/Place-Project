<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>

<style>
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
}

.header-right {
	float: right;
	margin-top: 25px;
}

.Home, .Logout {
	margin-right: 5px;
	display: inline-block;
	vertical-align: middle;
	color: black;
}

.Logout {
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

/* 메뉴바 */
.menu {
	background-color: #f1f1f1;
	list-style: none;
	width: 100%;
	height: 50px;
	text-align: center;
}

.menu>li {
	margin-top: 10px;
	float: left;
	width: 20%;
	height: 80%;
	font-size: 20px;
}

.menu>li>a {
	color: black;
}

.seoul {
	width: 100%;
	height: 520px;
	margin-top: 50px;
	margin-bottom: 70px;
}

/* 카테고리 메뉴 */
.category-menu {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.category-menu a {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 20px;
	text-decoration: none;
	color: #333;
}

.category-menu img {
	width: 100px;
	height: 100px;
	object-fit: cover;
}

.category-menu span {
	margin-top: 10px;
	font-size: 16px;
	font-weight: bold;
	font-size: 20px;
}

.category-menu>a {
	margin-top: 10px;
	float: left;
	width: 15%;
	height: 80%;
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

.popular-image {
	margin-top: 70px;
	display: flex;
	margin-right: 30px;
	justify-content: space-evenly;
}

h2 {
	margin-top: 70px;
	font-size: 40px;
	text-align: center;
}
</style>



</head>
<body>

	<div class=header-right>
		<a href="Index2.jsp" class="Home">HOME</a> <a href="#" class="i">|
		</a> <a href="LogoutAction.jsp" class="Logout">로그아웃</a>
	</div>

	<a href="Index2.jsp" class="logo"> <img src="image/logo.png"
		alt="로고 이미지">
	</a>

	<%
	HttpSession emailSession = request.getSession();
	//String email = (String) session.getAttribute("email");
	String email = request.getParameter("email");
	%>
	<ul class="menu">
		<li><a href="Registration.jsp?email=<%=email%>">장소등록하기</a></li>
		<li><a href="Correction.jsp">장소수정하기</a></li>
		<li><a href="ReservationList.jsp">예약 목록</a></li>
		<li><a href="ReviewsLk.jsp">리뷰보기</a></li>
		<li><a href="Mypage.jsp">마이페이지</a></li>

	</ul>
	<img class="seoul" src="image/seoul.jpeg">


	<div class="category-menu">
		<a href="hotel.jsp"> <img src="image/Hotel.png" alt="호텔"> <span>호텔</span>
		</a> <a href="Studio.jsp"> <img src="image/Studio.png" alt="스튜디오">
			<span>스튜디오</span>
		</a> <a href="pension.jsp"> <img src="image/Pension.png" alt="펜션">
			<span>펜션</span>
		</a> <a href="Shared_office.jsp"> <img src="image/Shared_office.png"
			alt="공유오피스"> <span>공유오피스</span>
		</a>
	</div>

	<div class="category-menu">
		<a href="Camping.jsp"> <img src="image/Camping.png" alt="캠핑장">
			<span>캠핑장</span>
		</a> <a href="Study.jsp"> <img src="image/Study.png" alt="스터디카페">
			<span>스터디카페</span>
		</a> <a href="Resort.jsp"> <img src="image/Resort.png" alt="리조트">
			<span>리조트</span>
		</a> <a href="Seminar.jsp"> <img src="image/Seminar.png" alt="세미나실">
			<span>세미나실</span>
		</a>
	</div>


	<h2>조회수 순</h2>
	<div class="popular-image">
		<img src="image/resort1.jpg" alt="리조트" width="550" height="400">
		<img src="image/resort4.jpg" alt="리조트2"  width="550" height="400">
	    <img src="image/Resort3.jpg" alt="리조트3"  width="550" height="400">
	</div>


	<footer>
		<div class="container">
			<p>Copyright © 2023 Example Company. All rights reserved.</p>
		</div>
	</footer>
</body>
</html>