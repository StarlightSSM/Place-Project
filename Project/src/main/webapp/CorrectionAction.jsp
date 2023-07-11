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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	// 개인정보수정 페이지로 가기 전에
	// 이메일 기준으로 회원정보를 조회해서 다음 화면으로 전달
	UserDAO dao = new UserDAO();
	String email = (String) request.getParameter("email");
	String name = (String) request.getParameter("name");
	String phone = (String) request.getParameter("phone");
	String pw = (String) request.getParameter("pw");
	PlaceDTO placeDTO = new PlaceDTO();
	
	String placeIDString = request.getParameter("placeID");
	//장소 ID를 정수로 변환합니다
	int placeID = Integer.parseInt(placeIDString);
	String placeName = (String) request.getParameter("placeName");
	String category = (String) request.getParameter("category");
	String maxPeople = (String) request.getParameter("maxPeople");
	String address = (String) request.getParameter("address");
	String addressDetail = (String) request.getParameter("addressDetail");
	String infoDetail = (String) request.getParameter("infoDetail");
	String imgUpload = request.getParameter("imgUpload");
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

	String sql = "select * from place where placeID = ?";

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
			name = rs.getString("name");
			phone = rs.getString("phone");
			pw = rs.getString("pw");
			placeName = rs.getString("placeName");
			category = rs.getString("category");
			maxPeople = rs.getString("maxPeople");
			address = rs.getString("address");
			addressDetail = rs.getString("addressDetail");
			infoDetail = rs.getString("infoDetail");
			imgUpload = rs.getString("imgUpload");
			hourPerCost = rs.getString("hourPerCost");
			dayPerCost = rs.getString("dayPerCost");

			// 포워드로 전달하기 위해
			request.setAttribute("email", email);
			request.setAttribute("name", name);
			request.setAttribute("phone", phone);
			request.setAttribute("pw", pw);
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
			request.getRequestDispatcher("Correction.jsp").forward(request, response);
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

	//장소를 검색하여 수정합니다
	PlaceDAO placeDAO = new PlaceDAO();
	PlaceDTO existingPlace = placeDAO.getPlaceByID(placeID);
	if (existingPlace != null) {
	 placeDAO.updatePlace(existingPlace);
	 out.println("장소가 수정되었습니다.");
	} else {
	 out.println("장소를 찾을 수 없습니다.");
	}
	
	// 로그인을 한 사람만 글을 볼 수 있도록 코드를 수정한다.
	/* int result = placeDAO.updatePlace(placeDTO.getPlaceID(), placeName, category, maxPeople, address, addressDetail, infoDetail, imgUpload, hourPerCost, dayPerCost);
	// 데이터베이스 오류인 경우
	/*
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		System.out.println("장소 수정 실패!!");
		script.println("history.back()");
		script.println("</script>");
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		System.out.println("장소 수정 성공!!");
		script.println("location.href = 'Index2.jsp'");
		script.println("</script>");
	}*/
	%>
