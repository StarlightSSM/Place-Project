<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="user.PlaceDAO"%>
<%@ page import="user.PlaceDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.UserDTO"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	// 개인정보수정 페이지로 가기 전에
	// 이메일 기준으로 회원정보를 조회해서 다음 화면으로 전달
	//request.setCharacterEncoding("UTF-8");
	UserDAO dao = new UserDAO();
	String email = (String) request.getParameter("email");
	String placeName = (String) request.getParameter("placeName");
	PlaceDTO placeDTO = new PlaceDTO();
	String category = (String) request.getParameter("category");
	String maxPeople = (String) request.getParameter("maxPeople");
	System.out.println(category);
	System.out.println(maxPeople);
	String address = (String) request.getParameter("address");
	String addressDetail = (String) request.getParameter("addressDetail");
	String infoDetail = (String) request.getParameter("infoDetail");
	String imgUpload = request.getParameter("imgUpload");
	System.out.println(imgUpload);
	String hourPerCost = (String) request.getParameter("hourPerCost");
	String dayPerCost = (String) request.getParameter("dayPerCost");
	
	
	// DB연결에 필요한 변수 선언
	String dbURL = "jdbc:mysql://localhost:3306/place_project?serverTimezone=Asia/Seoul";
   String dbID="root";
   //String dbID="inhatc";
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
			request.getRequestDispatcher("Registration.jsp").forward(request, response);
		} else {
			// 세션이 만료된 경우
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
			;
		}
	}

	UserDTO dto = new UserDTO();
	if (session.getAttribute("email") != null) {
		dto.setEmail((String) session.getAttribute("email"));
		email = (String) session.getAttribute("email");
	}
	// 현재 세션 상태를 체크한다.

	//감정 부분은 별도로 읽어드려 다시 빈 클래스에 저장(여러개이기 때문에 배열로 받아서 저장해 줘야 한다.) 
	/* String[] categories = request.getParameterValues("category");
	//배열에 있는 내용을 하나의 스트링으로 저장
	String emotion = new String();

	for (int i = 0; i < categories.length; i++) {
		category += categories[i] + " ";
	} */
	
	String emotion = request.getParameter("category");
	placeDTO.setCategory(category);
	
	// 로그인을 한 사람만 글을 볼 수 있도록 코드를 수정한다.
	PlaceDAO placeDAO = new PlaceDAO();
	int result = placeDAO.regist(placeDTO.getPlaceID(), placeName, category, maxPeople, address, addressDetail, infoDetail, imgUpload, hourPerCost, dayPerCost);
	response.setCharacterEncoding("UTF-8");
	// 데이터베이스 오류인 경우
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		System.out.println("장소 등록 실패!!");
		script.println("history.back()");
		script.println("</script>");
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		System.out.println("장소 등록 성공!!");
		script.println("location.href = 'Index2.jsp'");
		script.println("</script>");
	}
	
	%>
