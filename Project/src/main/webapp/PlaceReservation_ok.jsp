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
// DB���ῡ �ʿ��� ���� ����
String dbURL = "jdbc:mysql://localhost:3306/place_project?serverTimezone=Asia/Seoul";
String dbID = "root";
//String dbID="inhatc";
String dbPassword = "inhatc";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "select * from user where email = ?";

try {
	// ����̹� ȣ��
	Class.forName("com.mysql.cj.jdbc.Driver");

	// conn ����
	conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

	// pstmt ����
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, email);

	// sql ����
	rs = pstmt.executeQuery();

	if (rs.next()) {
		email = rs.getString("email");
		String name = rs.getString("name");
		String phone = rs.getString("phone");
		String pw = rs.getString("pw");

		// ������� �����ϱ� ����
		request.setAttribute("email", email);
		request.setAttribute("name", name);
		request.setAttribute("phone", phone);
		request.setAttribute("pw", pw);

		// ������ �̵�
		request.getRequestDispatcher("Registration.jsp").forward(request, response);
	} else {
		// ������ ����� ���
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
//������������ �������� ���� ����
//�̸��� �������� ȸ�������� ��ȸ�ؼ� ���� ȭ������ ����
PlaceDTO placeDTO = new PlaceDTO();
//PlaceDAO �ν��Ͻ� ����
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

//��¥�� �Ľ��Ͽ� Date ��ü�� ��ȯ
SimpleDateFormat sourceFormat = new SimpleDateFormat(sourcePattern);
String Check_in_DayStr = (String) request.getParameter("Check_in_Day");
Date Check_in_Day = sourceFormat.parse(Check_in_DayStr);
String Check_out_DayStr = (String) request.getParameter("Check_out_Day");
Date Check_out_Day = sourceFormat.parse(Check_out_DayStr);

//Date ��ü�� ���ϴ� �������� ������
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

//��¥ �� ���
long diffInMillies = Check_out_Day.getTime() - Check_in_Day.getTime();
long diffInDays = TimeUnit.MILLISECONDS.toDays(diffInMillies);
System.out.println(diffInDays);


//���� �ݾ� ���
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
//���÷� java.sql.Time ��ü ����
Time time = new Time(System.currentTimeMillis());
//��¥ ���� ����
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//java.sql.Time�� java.util.Date�� ��ȯ
Date date = new Date(time.getTime());
String Check_in_DayString = Check_in_DayStr + " 15:00:00"; // ����: �ð��� 12:00:00���� ����
String Check_out_DayString = Check_out_DayStr + " 12:00:00"; // ����: �ð��� 15:00:00���� ����
java.sql.Time Check_in_TimeT = new java.sql.Time(Check_in_Day.getTime());
java.sql.Time Check_out_TimeT = new java.sql.Time(Check_out_Day.getTime());
Date Check_in_Time = new Date(Check_in_TimeT.getTime());
Date Check_out_Time = new Date(Check_out_TimeT.getTime());
//Date�� String���� ��ȯ
String Check_in_TimeString = sdf.format(Check_in_Time);
String Check_out_TimeString = sdf.format(Check_out_Time);

//���� ��¥�� �ð� ��������
Date currentDate = new Date();
String currentDateString = sdf.format(currentDate);
ReservationDTO reservationDTO = new ReservationDTO();
reservationDTO.setReserveDate(currentDateString);

//���ǿ��� ���� ���� ���� ������� �̸����� ������
String reserverName = (String) session.getAttribute("email");
//�̸��� ���� ����Ͽ� reservationDTO ��ü ������Ʈ
reservationDTO.setReserverName(reserverName);

ReservationDAO reservationDAO = new ReservationDAO();
//���ǿ��� ���� ���� ���� �������� placeName�� ������
//placeName = (String) session.getAttribute("placeName");
//reservationDTO ��ü ������Ʈ
//reservationDTO.setPlaceName(placeName);

//���ǿ��� ���� ���� ���� �������� placeID�� ������
//placeID = (String) session.getAttribute("placeID");
//reservationDTO ��ü ������Ʈ
//reservationDTO.setPlaceID(placeID);

int result = reservationDAO.makeReserve(placeID, reserverName, placeName, currentDateString, payment, Check_in_DayString, Check_out_DayString, Check_in_TimeString, Check_out_TimeString, people);

// ���� ���� ���¸� üũ�Ѵ�.

//���� �κ��� ������ �о��� �ٽ� �� Ŭ������ ����(�������̱� ������ �迭�� �޾Ƽ� ������ ��� �Ѵ�.) 
/* String[] categories = request.getParameterValues("category");
//�迭�� �ִ� ������ �ϳ��� ��Ʈ������ ����
String emotion = new String();

for (int i = 0; i < categories.length; i++) {
	category += categories[i] + " ";
} */

// �����ͺ��̽� ������ ���
if (result == -1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	System.out.println("���� ����!!");
	script.println("history.back()");
	script.println("</script>");
} else {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	System.out.println("���� ����!!");
	script.println("location.href = 'Listplace.jsp'");	// �̰� �ٲ����
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