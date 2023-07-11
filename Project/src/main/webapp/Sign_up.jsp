<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<style>
body {
	margin: 0;
	background-color: #FFFFFF;
	padding-top: 50px;
	padding: 5px;
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
	top: 5px;
	border-radius: 5px;
	padding: 15px;
	background-color: #F3F3F3;
	width: 20%;
	border: 1px solid black;
	margin-bottom: -15px;
}

.submit-btn {
	font-size: 14px;
	background-color: #72C289;
	border: none;
	margin-bottom: 30px;
	padding: 10px;
	border-radius: 8px;
	width: 23%;
	margin-top: 15px;
	font-size: 20px;
}

.err {
	margin-left: -1000px;
	font-size: 10px;
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
	background-color: white;
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

#errlabel {
	font-size: 14px;
	margin-top: -20px;
}
</style>
</head>
<body>

	<form action="./SignUp_ok.jsp" method="post">
		<div
			style="width: 100%; text-align: center; font-size: 40px; color: #72C289; margin-top: 10px; font-weight: bold">
			Sign up

			<p style="text-align: left; margin-left: 45px;"></p>
			<input type="text" name="name" class="text-field" placeholder="Name">
			<p style="text-align: left; margin-left: 45px;"></p>
			<input type="text" name="email" class="text-field"
				placeholder="Email">
			<p style="text-align: left; margin-left: 45px;"></p>
			<input type="text" name="phone" class="text-field"
				placeholder="Phone">
			<p style="text-align: left; margin-left: 45px;"></p>
			<input type="password" name="pw" class="text-field"
				placeholder="Password">
			<p style="text-align: left; margin-left: 45px;"></p>

			<%-- 오류 메시지 표시를 위한 조건문 --%>
			<% if (request.getAttribute("errorMessage") != null) { %>
			<div id="errlabel" style="color: red; margin-left: 760px;">
				<input type="text" name="errorMessage" class="err">
				<%= request.getAttribute("errorMessage") %>
			</div>
			<% } %>
			<input type="password" name="passcheck" class="text-field"
				placeholder="Passcheck">
			<p style="text-align: left; margin-left: 45px;"></p>
			<input type="submit" value="SIGN UP" class="submit-btn"
				onclick="location.href='SignUp_ok.jsp'"><br>


		</div>
	</form>
	<footer>
		<div class="container">
			<p>Copyright © 2023 Example Company. All rights reserved.</p>
		</div>
	</footer>
</body>
</html>