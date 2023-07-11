<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page
	import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="user.PlaceDAO"%>
<%@ page import="user.PlaceDTO"%>
<%@ page import="user.ReservationDAO"%>
<%@ page import="user.ReservationDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.UserDTO"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.Time"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.util.concurrent.TimeUnit"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%
UserDAO dao = new UserDAO();
String email = (String) request.getParameter("email");
// DB연결에 필요한 변수 선언
String dbURL = "jdbc:mysql://localhost:3306/place_project?serverTimezone=Asia/Seoul";
String dbID = "root";
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
		response.sendRedirect("Listplace.jsp");
	}
} catch (Exception e) {
	e.printStackTrace();
	response.sendRedirect("Listplace.jsp");
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
//개인정보수정 페이지로 가기 전에
//이메일 기준으로 회원정보를 조회해서 다음 화면으로 전달
PlaceDTO placeDTO = new PlaceDTO();
//PlaceDAO 인스턴스 생성
String placeID = request.getParameter("placeID");
//int placeID = Integer.parseInt(placeIDParam);
//placeDAO.getPlaceInfo(placeID); 
//int placeID = Integer.parseInt(placeIDParam);
String placeName = (String) request.getParameter("placeName");
System.out.println(placeName);
String hourPerCost = "";
if ((String) request.getParameter("hourPerCost") != null) {
	hourPerCost = (String) request.getParameter("hourPerCost");
}
System.out.println(hourPerCost);
String dayPerCost = "";
if ((String) request.getParameter("dayPerCost") != null) {
	dayPerCost = (String) request.getParameter("dayPerCost");
}
System.out.println(dayPerCost);

String sourcePattern = "MM/dd/yyyy";
String targetPattern = "yyyy-MM-dd HH:mm:ss";

//날짜를 파싱하여 Date 객체로 변환
SimpleDateFormat sourceFormat = new SimpleDateFormat(sourcePattern);
String Check_in_DayStr = (String) request.getParameter("Check_in_Day");
Date Check_in_Day = sourceFormat.parse(Check_in_DayStr);
String Check_out_DayStr = (String) request.getParameter("Check_out_Day");
Date Check_out_Day = sourceFormat.parse(Check_out_DayStr);

//Date 객체를 원하는 형식으로 포맷팅
SimpleDateFormat targetFormat = new SimpleDateFormat(targetPattern);
String formattedInDate = targetFormat.format(Check_in_Day);
Check_in_Day = targetFormat.parse(formattedInDate);
String formattedOutDate = targetFormat.format(Check_out_Day);
Check_out_Day = targetFormat.parse(formattedOutDate);
System.out.println("Formatted Check_in_Day date: " + formattedInDate);
System.out.println("Formatted Check_out_Day date: " + formattedOutDate);

//SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//String Check_in_DayStr = (String) request.getParameter("Check_in_Day");
//Date Check_in_Day = dateFormat.parse(Check_in_DayStr);
//String Check_out_DayStr = (String) request.getParameter("Check_out_Day");
//Date Check_out_Day = dateFormat.parse(Check_out_DayStr);

String people = (String) request.getParameter("people");

//날짜 수 계산
long diffInMillies = Check_out_Day.getTime() - Check_in_Day.getTime();
long diffInDays = TimeUnit.MILLISECONDS.toDays(diffInMillies);
System.out.println(diffInDays);


//결제 금액 계산
int payment = 0;

//String hourStr = (String) request.getParameter("hour");
//System.out.println(hourStr);
//int hour = Integer.parseInt(hourStr);
//int hourPerCostInt = Integer.parseInt(hourPerCost);
//payment = hourPerCostInt * hour;

long day = diffInDays;
int dayPerCostInt = Integer.parseInt(dayPerCost);
payment = dayPerCostInt * (int) day;

System.out.println(payment);
// payment = dayPerCostInt * day;
//예시로 java.sql.Time 객체 생성
Time time = new Time(System.currentTimeMillis());
//날짜 포맷 지정
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//java.sql.Time을 java.util.Date로 변환
Date date = new Date(time.getTime());
String Check_in_DayString = Check_in_DayStr + " 15:00:00"; // 예시: 시간을 12:00:00으로 가정
String Check_out_DayString = Check_out_DayStr + " 12:00:00"; // 예시: 시간을 15:00:00으로 가정
java.sql.Time Check_in_TimeT = new java.sql.Time(Check_in_Day.getTime());
java.sql.Time Check_out_TimeT = new java.sql.Time(Check_out_Day.getTime());
Date Check_in_Time = new Date(Check_in_TimeT.getTime());
Date Check_out_Time = new Date(Check_out_TimeT.getTime());
//Date를 String으로 변환
String Check_in_TimeString = sdf.format(Check_in_Time);
String Check_out_TimeString = sdf.format(Check_out_Time);

//현재 날짜와 시간 가져오기
Date currentDate = new Date();
String currentDateString = sdf.format(currentDate);
ReservationDTO reservationDTO = new ReservationDTO();
reservationDTO.setReserveDate(currentDateString);

//세션에서 현재 접속 중인 사용자의 이메일을 가져옴
String reserverName = (String) session.getAttribute("email");
//이메일 값을 사용하여 reservationDTO 객체 업데이트
reservationDTO.setReserverName(reserverName);

ReservationDAO reservationDAO = new ReservationDAO();
//세션에서 현재 접속 중인 페이지의 placeName을 가져옴
//placeName = (String) session.getAttribute("placeName");
//reservationDTO 객체 업데이트
//reservationDTO.setPlaceName(placeName);

//세션에서 현재 접속 중인 페이지의 placeID를 가져옴
//placeID = (String) session.getAttribute("placeID");
//reservationDTO 객체 업데이트
//reservationDTO.setPlaceID(placeID);

int result = reservationDAO.makeReserve(placeID, reserverName, placeName, currentDateString, payment, Check_in_DayString, Check_out_DayString, Check_in_TimeString, Check_out_TimeString, people);

// 현재 세션 상태를 체크한다.

//감정 부분은 별도로 읽어드려 다시 빈 클래스에 저장(여러개이기 때문에 배열로 받아서 저장해 줘야 한다.) 
/* String[] categories = request.getParameterValues("category");
//배열에 있는 내용을 하나의 스트링으로 저장
String emotion = new String();

for (int i = 0; i < categories.length; i++) {
	category += categories[i] + " ";
} */

// 데이터베이스 오류인 경우
if (result == -1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	System.out.println("예약 실패!!");
	script.println("history.back()");
	script.println("</script>");
} else {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	System.out.println("예약 성공!!");
	script.println("location.href = 'Listplace.jsp'");	// 이거 바꿔야함
	script.println("</script>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>