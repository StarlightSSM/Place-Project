<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 개인정보수정 페이지로 가기 전에
// 이메일 기준으로 회원정보를 조회해서 다음 화면으로 전달

String email = (String) session.getAttribute("email");
// DB연결에 필요한 변수 선언
String dbURL = "jdbc:mysql://localhost:3306/place_project?serverTimezone=Asia/Seoul";
String dbID="root";
String dbPassword = "inhatc";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "select * from user where email = ?";

try {
	// 드라이버 호출
	Class.forName("com.mysql.cj.jdbc.Driver");

	// conn 생성
	conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

	// pstmt 생성
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, email);

	// sql 실행
	rs = pstmt.executeQuery();

	if (rs.next()) {
		email = rs.getString("email");
		String name = rs.getString("name");
		String phone = rs.getString("phone");
		String pw = rs.getString("pw");

		// 포워드로 전달하기 위해
		request.setAttribute("email", email);
		request.setAttribute("name", name);
		request.setAttribute("phone", phone);
		request.setAttribute("pw", pw);

		// 포워드 이동
		request.getRequestDispatcher("Mypage.jsp").forward(request, response);
	} else {
		// 세션이 만료된 경우
		response.sendRedirect("Login.jsp");
	}
} catch (Exception e) {
	e.printStackTrace();
	response.sendRedirect("Login.jsp");
} finally {
	try {
		if (conn != null)
	conn.close();
		if (pstmt != null)
	pstmt.close();
		if (rs != null)
	rs.close();
	} catch (Exception e) {
		e.printStackTrace();
		;
	}
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>