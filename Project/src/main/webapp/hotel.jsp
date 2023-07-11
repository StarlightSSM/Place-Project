<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 페이지</title>
	<style>
		*{margin: 0; padding: 0; text-decoration: none;}
	
	.header-right {
		float: right;
    margin-top: 25px;
	}
	
	.Home,
	.Login {
	 margin-right:5px;
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
	  width: 50px;
	  height: 50px;
	  object-fit: cover;
	}
	
	.category-menu span {
	  margin-top: 10px;
	  font-size: 16px;
	  font-weight: bold;
	  font-size:20px;
	}
	
   .category-menu > a {
		margin-top:10px;
		float:left;
		width:5%;
		height: 50%;
		color: black; /* 초기 글씨 색상 */
		
	}
	
	 .category-menu a.selected {
      color: #CD837F; /* 선택된 글씨 색상 */
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
		
		h3 {
			font-size : 30px;
			margin-top : 30px;
			padding-left: 25px;
		}
		
		.Allplace {
			margin-top: 30px;
			padding-left: 20px;
			display: flex; /* 요소들을 가로로 나열 */
    		flex-wrap: wrap;
    		overflow: auto; /* 스크롤 적용 */
   			max-height: 500px; /* 최대 높이 설정 */
			
			
		}
		
		.Allplace a {
	    flex: 1 0 400px; /* 요소의 너비를 설정 (400px로 고정) */
	    margin: 10px;
  }
		
		.Allplace span {
			font-size : 25px;
		}
		
		.Allplace img {
			
			display: flex;
		  margin-right : 30px;
		  justify-content: space-evenly;
			   	 
		}
	.category-menu a.selected {
    color: #CD837F; /* 선택된 글씨 색상 */
  }
	</style>
	
	
	
</head>
<body>
	<div class= header-right>
			<a href ="UserIndex.jsp" class = "Home">HOME</a>
			<a href ="#" class = "i">| </a>
			<a href ="Login.jsp" class ="Login">로그인</a>
				</div>
			
		<a href="Index.jsp" class = "logo">
		<img src="image/logo.png" alt="로고 이미지" > </a>
		
		<div class="category-menu">
	  <a href="hotel.jsp" class="selected">
	    <img src="image/Hotel.png" alt="호텔">
	    <span>호텔</span>
	  </a>
	  <a href="Studio.jsp">
	    <img src="image/Studio.png" alt="스튜디오">
	    <span>스튜디오</span>
	  </a>
	  <a href="pension.jsp">
	    <img src="image/Pension.png" alt="펜션">
	    <span>펜션</span>
	  </a>
	  <a href="Shared_office.jsp">
	    <img src="image/Shared_office.png" alt="공유오피스">
	    <span>공유오피스</span>
	  </a>
	  
	  <a href="Camping.jsp">
	    <img src="image/Camping.png" alt="캠핑장">
	    <span>캠핑장</span>
	  </a>
	  <a href="Study.jsp">
	    <img src="image/Study.png" alt="스터디카페">
	    <span>스터디카페</span>
	  </a>
	  <a href="Resort.jsp">
	    <img src="image/Resort.png" alt="리조트">
	    <span>리조트</span>
	  </a>
	  <a href="Seminar.jsp">
	    <img src="image/Seminar.png" alt="세미나실">
	    <span>세미나실</span>
	  </a>
	</div>
		
		<h3>#장소 추천</h3>
		
		<div class = "Allplace"> 
			<a href = "">
			<img src = "https://images.trvl-media.com/lodging/16000000/15430000/15423200/15423136/b6222b18.jpg?impolicy=resizecrop&rw=500&ra=fit" alt="호텔" width="400" height="300">
			<span>호텔 스카이파크 킹스타운 동대문점 </span>
			<p>동대문역사문화공원역 14번출구 도보 5분</p>
			</a>
			
			<a href = "">
			<img src = "https://pix10.agoda.net/hotelImages/24335006/0/8e3de883dcfacd586ab7e949f45e03fd.jpg?ca=25&ce=0&s=1024x768" alt="호텔" width="400" height="300">
			<span>소피텔 앰배서더 서울 호텔 </span>
			<p>서울특별시 송파구 잠실로 209</p>
			</a>
			
			<a href = "">
			<img src = "https://cdn.imweb.me/thumbnail/20221026/06ed55364a658.jpg" alt="호텔" width="400" height="300">
			<span>강화도 힐링11번가펜션 </span>
			<p>인천광역시 강화군 화도면 해안남로2449번길 11</p>
			</a>
			
			
			<a href = "">
			<img src = "https://image.goodchoice.kr/resize_490x348/affiliate/2022/01/19/61e764c09f6d3.jpg" alt="호텔" width="400" height="300">
			<span>태안 바다풍경카라반펜션 </span>
			<p>충청남도 태안군 원북면 학암포길 21-75</p>
			</a>
			
			<a href = "">
			<img src = "https://img.einet.kr/P202010026/home/slides/08.jpg" alt="호텔" width="400" height="300">
			<span>강화도 에떼르모펜션(스파&풀) </span>
			<p>인천광역시 강화군 화도면 해안남로 2421-202</p>
			</a>
			
			<a href = "">
			<img src = "https://yaimg.yanolja.com/v5/2023/01/12/09/640/63bfd0e5b012f2.78584735.jpg" alt="호텔" width="400" height="300">
			<span>경주 산내하이원펜션</span>
			<p>경상북도 경주시 산내면 대현길 414</p>
			</a>
			
			<a href = "">
			<img src = "https://image.goodchoice.kr/resize_490x348/affiliate/2022/07/08/62c7b7e5df3e4.jpg" alt="호텔" width="400" height="300">
			<span>가평 아린글램핑 </span>
			<p>경기도 가평군 설악면 유명로 2150-14</p>
			</a>
			
			<a href = "">
			<img src = "https://image.goodchoice.kr/resize_490x348/affiliate/2023/01/31/11/1cOzvV5qlSYG.jpg" alt="호텔" width="400" height="300">
			<span>가평 해목글램핑</span>
			<p>경기도 가평군 조종면 운악청계로371번길 74-36</p>
			</a>
			
		</div>
		
		
		<footer>
		<div class = "container">
		<p>Copyright © 2023 Example Company. All rights reserved.</p>
		</div>
	</footer>
			
</body>
</html>