<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file = "dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>

	<style>
    /* CSS 스타일을 여기에 작성합니다 */
    body {
        font-size: 16px;
        text-align: center;
        padding-top: 20px;
    }
    
    label {
        font-size: 18px;
        margin-bottom: 10px;
        display: flex;
        align-items: center;
        justify-content: flex-end;
        width: 100px;
    }
    
    input[type="text"] {
        width: 300px;
        height: 30px;
        font-size: 18px;
        margin-bottom: 10px;
    }
    
    button {
        background-color: #72C289;
        color: white;
        padding: 10px 20px;
        font-size: 18px;
        border: none;
        cursor: pointer;
        margin-top: 10px;
        border-radius: 8px;
    }
    
    .form-row {
        margin-bottom: 10px;
        display: flex;
        align-items: center;
        justify-content: flex-start;
    }
    
    .form-row label {
        margin-right: 10px;
        width: auto;
        text-align: left;
    }
</style>
	

</head>
<body>
	<%
		String email = (String)session.getAttribute("email");
		PreparedStatement pstmt = null;
		String sql = "select * from user where email = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div>
		<h2>회원 수정을 원치않으면 이 창을 닫아주세요</h2>
		<form method="POST" action = "pwchange_success.jsp">
			이메일 : <%=rs.getString("email") %> <br>
			이름 : <input name = "name" type = "text" value = '<%=rs.getString("name")%>'><br>
			새 비밀번호 : <input name = "pw" type = "text" value = '<%=rs.getString("pw")%>'><br>
			연락처 : <input name = "phone" type = "text" value = '<%=rs.getString("phone")%>'><br>
			<button>수정하기</button>
		</form>
	</div>
	<%} %>
</body>
</html>