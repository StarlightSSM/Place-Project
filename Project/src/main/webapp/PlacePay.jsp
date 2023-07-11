<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장소 결제 페이지</title>
<style>

*{margin: 0; padding: 0; text-decoration: none;}

.header-right {
		float: right;
    margin-top: 20px;
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
  margin-top: 20px;
  margin-bottom: 10px;
  margin-right: 400px;
  
}


.resort-info h3 {
	margin-right: 450px;
    margin-top: 20px;
}

.resort-info p {
	margin-left: 155px;    
	margin-top: 10px;
    text-align: left;
    
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
  margin: 100px;  /*회색박스 줄이기*/
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
        padding:10px;
      }
      
   hr {
   	margin-top: 10px;
   	margin-bottom:10px;
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


		<div class= header-right>
			<a href ="Index.jsp" class = "Home">HOME</a>
			<a href ="#" class = "i">| </a>
			<a href ="Login.jsp" class ="Login">로그인</a>
				</div>
			
		<a href="Index.jsp" class = "logo">
		<img src="image/logo.png" alt="로고 이미지" > </a>
		
	
	<div class="reservation-page">
  <div class="resort-info" style="float: right; margin-right: -100px; text-align: center;" >
    <img src="image/Resort.jpg" alt="리조트 이미지" >
     <h1>XX 리조트</h1>
     <h3> 주문자정보 </h3>
     <p>이름 : 홍길동</p>
	<p>이메일 : aaaa@naver.com</p>
     
  </div>
  <div class="reservation-form">
    <div class="gray-box">
      <h2>결제 요약</h2>
       <hr>
      <p>XX,XXX원 / 시간 </p>
      <p>이용시간 : X시간 (시간 단위로 선택 시) </p>
      <hr>
      <p>100,000원 / 일</p>
       <p>이용시간 : XXXX.XX.XX ~ XXXX.XX.XX (일 단위로 선택 시)</p>
        <p>총인원 :  X명</p>
      <hr> 
      <p>총 금액 : 100,000원</p>
      <hr>
      <p>추가 안내 사항, 취소 및 환불<p><br>
		<p>1.이용 중 물품 분실, 파손 등의 사고가 발생한 경우에는 
     책임지지 않습니다. 필요 시 반드시 개인 보험 가입을 권장드립니다.</p>
	<p>2. 흡연은 해당 장소 전체에서 엄격히 금지되며, 
     주변 환경과 건강을 위해 꼭 지켜주시기 바랍니다.</p>
 	<p>3. 취소 및 환불은 예약일 5일 전까지 취소하시면 100% 환불, 3일 전까지는 50%, 하루 전에는 30%까지 환불됩니다.</p>
      
      <hr>
      
        <button id="reserve-button">결제하기</button>
    </div>
    
    </div>
  </div>

	<footer>
			<div class = "container">
			<p>Copyright © 2023 Example Company. All rights reserved.</p>
			</div>
		</footer>
</body>
</html>