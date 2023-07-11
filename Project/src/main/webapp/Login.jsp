<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>

<style>
body {
	margin: 0;
	background-color: #FFFFFF;
	padding-top: 50px;
}

.Login-form {
	width: 500px;
	border: 10;
	background-color: #FFFFFF;
	padding: 20px;
	margin: 0 auto;
	border-radius: 5px;
}

.text-field {
	font-size: 14px;
	margin-bottom: 10px;
	border-radius: 5px;
	padding: 15px;
	background-color: #F3F3F3;
	width: 20%;
	border: 1px solid black;
}

button[class="submit_btn"] {
	font-size: 14px;
	background-color: #72C289;
	border: none;
	margin-bottom: 30px;
	padding: 10px;
	border-radius: 8px;
	width: 23%;
	margin-top: 30px;
	font-size: 20px;
}

.signup_submit {
	margin-left: 1110px;
	margin-top: 10px;
	border-color: #72C289;
	width: 7%;
	padding: 10px;
	background-color: #FFFFFF;
	border-radius: 25px;
}

.err {
	margin-left: -370px;
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
	background-color: white;
	font-size: 14px;
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

.container {
	max-width: 960px;
	margin: 0 auto;
	height: 1000px; /* 콘텐츠의 높이를 높게 설정합니다. */
	margin-bottom: 50px;
	color: #ffffff;
}

#label {
	font-size: 40px;
}

#errlabel{
	font-size: 14px;
}
</style>

<body>
	<form action="Login_ok.jsp" method="post">
		<div id="label"
			style="width: 100%; text-align: center; color: #72C289; font-weight: bold">
			Login
			<p style="text-align: left; margin-left: 45px;"></p>
			<input type="text" name="email" class="text-field"
				placeholder="Email" required>
			<p style="text-align: left; margin-left: 45px;"></p>
			<input type="password" name="password" class="text-field"
				placeholder="Password" required>
			<%-- 오류 메시지 표시를 위한 조건문 --%>
			<%
			if (request.getAttribute("errorMessage") != null) {
			%>
			<div id="errlabel" style="color: red; margin-left: 350px;">
				<input type="text" name="errorMessage" class="err">
				<%=request.getAttribute("errorMessage")%>
			</div>
			<%
			}
			%>
			<br>
			<button class="submit_btn" onclick="location.href='Login_ok.jsp'">LOGIN</button>
			<br>
		</div>

	</form>
	<button class="signup_submit" onclick="location.href='Sign_up.jsp'">회원가입
		하기</button>
	<footer>
		<div class="container">
			<p>Copyright © 2023 Example Company. All rights reserved.</p>
		</div>
	</footer>
</body>
</html>