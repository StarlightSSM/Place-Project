<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.UserDTO"%>
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
<title>마이페이지</title>
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

.gray-box {
	width: 50%;
	height: 100px;
	margin: 0 auto;
	background-color: #d9d9d9;
	display: flex;
	justify-content: flex-start;
	align-items: center;
	color: black;
	font-size: 20px;
	padding-left: 20px;
	margin-top: 50px;
}

/* 박스 스타일 설정 User information 박스 .box 임*/
.box {
	position: absolute;
	margin-top: 20px;
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

.line {
	position: relative;
	top: 50px;
	width: 50%;
	border-top: 1px solid black;
	z-index: -1;
	margin: auto;
}

.box1 {
	width: 100px;
	height: 50px;
	left: 50%;
	background-color: #d9d9d9;
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
.pwchange {
	background-color: #72C289;
	border-radius: 25px;
	width: 100px;
	height: 40px;
	border: none;
	margin-left: 1100px;
	position: relative;
	top: 135px;
	font-size: 15px;
}

.bigbox {
	width: 100px;
	height: 40px;
	align-items: center;
	justify-content: center;
	position: relative;
	margin-left: 600px;
	top: 80px;
}

.bigbox p {
	margin-left: 180px;
	margin-top: -70px;
	width: 200px;
	position: relative;
}
</style>

</head>
<script type="text/javascript">
		function changepwd() {
			window.open("pwchange.jsp","_blank","width=600,height=400");
		}
</script>
<body>
	<div class=header-right>
		<a href="UserIndex2.jsp" class="Home">HOME</a> <a href="#" class="i">|
		</a> <a href="Logout.jsp" class="Logout">로그아웃</a>
	</div>

	<a href="UserIndex2.jsp" class="logo"> <img src="image/logo.png"
		alt="로고 이미지">
	</a>




	<div class="gray-box">
		Hello
		<%=dto.getName() %>!
	</div>

	<div class="box">User Information</div>
	<hr class="line">


	<div class="bigbox">
		<div class="box1" id="name" name="name">이름</div>
		<p><%=dto.getName() %></p>
		<div class="box1" id="password" name="pw">비밀번호</div>
		<p><%= dao.getHiddenPassword(dto.getPassword()) %></p>
		<div class="box1" id="이메일" name="email">이메일</div>
		<p><%=dto.getEmail() %></p>
		<div class="box1" id="연락처" name="phone">연락처</div>
		<p><%=dto.getPhone() %></p>
	</div>
	<button class="pwchange" onclick="changepwd()">변경</button>


	<footer>
		<div class="container">
			<p>Copyright © 2023 Example Company. All rights reserved.</p>
		</div>
	</footer>

</body>
</html>