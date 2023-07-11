<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>

<style>
/* 상단 카테고리(Home / 마이페이지 / 장소 등록하기 / 장소 수정하기 / 예약 목록 / 리뷰 보기) */
  hr {
    
    border: none;
    height: 2px;
    background: linear-gradient(to right, red, orange, yellow, green, blue, indigo, violet);
    margin-top: 40px;
   	margin-bottom: 40px; 
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
	
	.container {
		  max-width: 960px;
		  margin: 0 auto;
		  height: 1000px; /* 콘텐츠의 높이를 높게 설정합니다. */
      	  margin-bottom: 50px;
      	  color:#ffffff;
		  
		}
		
	.Login_click {
		
		border-color : #FFFFF;
		width: 5%;
		padding: 5px;
		background-color:#FFFFFF;
		border-radius: 25px;
		position : fixed;
		right : 5px;
		Top : 5px;
		
	}
	
	 img{
	 width: 100%;
	 height : 500px;
	 margin-top: 50px;
   	 margin-bottom: 70px;
  }
  
  /* 상단 메뉴 스타일 */
  .menu {
  	display:flex;
  	justify-content : space-between;
  	align-items: center;
  	background-color: #ffffff;
  	font-size:20px;
  	margin-left: 100px;
  	margin-right: 100px;
  	
  }
  
  .menu li{
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
  
  .button-container {
  	display: flex;
  	flex-wrap: wrap;
  	justify-content: center;
  	align-items: center;
  	height: 100px;	
  	
  	}
  	
  	button {
  		margin:10px;
  		width:100px;
  		height:50px;
  	}
  	
  	button:nth-child(n+5) {
  		margin-top:100px;
  	}
 
  .button-container1 {
  	display: flex;
  	flex-wrap: wrap;
  	justify-content: center;
  	align-items: center;
  	height: 100px;	
  	
  }
</style>



</head>
<body>
<button class = "Login_click" onclick = "location.href='Login.jsp'">로그인</button>
<hr>
<ul class = "menu">
		<li><a href="#">Home</a></li>
		<li><a href="#">장소등록하기</a></li>
		<li><a href="#">장소수정하기</a></li>
		<li><a href="#">예약 목록</a></li>
		<li><a href="#">리뷰보기</a></li>
		<li><a href="Mypage.jsp">마이페이지</a></li>
	
	</ul>
<img src ="image/seoul.jpeg">

	<footer>
		<div class = "container">
		<p>Copyright © 2023 Example Company. All rights reserved.</p>
		</div>
	</footer>
	
	<div class = "button-container">
	<button onclick = "location.href='Hotel.jsp'">호텔</button>
	<button onclick = "location.href='Hotel.jsp'">스튜디오</button>
	<button onclick = "location.href='Hotel.jsp'">멘션</button>
	<button onclick = "location.href='Hotel.jsp'">공유오피스</button>
	</div>
	
	<div class = "button-container1">
	<button onclick = "location.href='Hotel.jsp'">캠핑장</button>
	<button onclick = "location.href='Hotel.jsp'">스터디카페</button>
	<button onclick = "location.href='Hotel.jsp'">리조트</button>
	<button onclick = "location.href='Hotel.jsp'">세미나실</button>
	</div>
	
</body>
</html>