<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 정보수정 화면으로 가기전에
// 아이디 기준으로 회원정보를 조회해서 다음 화면으로 전달
// DB연결에 필요한 변수 선언
String dbURL = "jdbc:mysql://localhost:3306/place_project?serverTimezone=Asia/Seoul";
String dbID = "root";
//String dbID="inhatc";
String dbPassword = "inhatc";

String placeIDStr = (String) session.getAttribute("placeID");
int placeID = Integer.parseInt(placeIDStr);

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "select * from place where placeID = ?";

try {
	// 드라이버 호출
	Class.forName("com.mysql.cj.jdbc.Driver");

	// conn 생성
	conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

	// pstmt 생성
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, placeID);

	// sql실행
	rs = pstmt.executeQuery();

	if (rs.next()) {
		
		placeID = rs.getInt("placeID");
		String placeName = rs.getString("placeName");
		String category = rs.getString("category");
		String maxPeople = rs.getString("maxPeople");
		String address = rs.getString("address");
		String addressDetail = rs.getString("addressDetail");
		String infoDetail = rs.getString("infoDetail");
		String imgUpload = rs.getString("imgUpload");
		String hourPerCost = rs.getString("hourPerCost");
		String dayPerCost = rs.getString("dayPerCost");
		
		// 포워드로 전달하기 위해
		request.setAttribute("placeID", placeID);
		request.setAttribute("placeName", placeName);
		request.setAttribute("category", category);
		request.setAttribute("maxPeople", maxPeople);
		request.setAttribute("address", address);
		request.setAttribute("addressDetail", addressDetail);
		request.setAttribute("infoDetail", infoDetail);
		request.setAttribute("imgUpload", imgUpload);
		request.setAttribute("hourPerCost", hourPerCost);
		request.setAttribute("dayPerCost", dayPerCost);

		// 포워드 이동
		request.getRequestDispatcher("Listplace.jsp").forward(request, response);

	} else { // 세션이 만료된 경우
		response.sendRedirect("Index2.jsp");
	}
} catch (Exception e) {
	e.printStackTrace();
	response.sendRedirect("Index2.jsp");
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