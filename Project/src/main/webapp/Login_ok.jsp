<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.UserDTO" scope="page" />
<jsp:setProperty name="user" property="email" />
<jsp:setProperty name="user" property="password" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	<%
	// 로그인 처리 로직 (예시)
	String email = (String) request.getParameter("email"); // 로그인 성공시 사용자 이름을 변수에 저장
	String pw = (String) request.getParameter("password");
	String errorMessage = (String) request.getParameter("errorMessage");
	/* if (request.getParameter("email") != null) {
		email = (String) request.getParameter("email");
	}
	if (request.getParameter("pw") != null) {
		pw = (String) request.getParameter("password");
	} */
	UserDAO userDAO = new UserDAO(); // userDAO 인스턴스 생성
	int result = userDAO.login(email, pw);
	if (email == null || pw == null || (email == null && pw == null)) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		// script.println("alert('이메일이나 패스워드가 입력되지 않았습니다.')");
		// 잘못된 이메일이나 비밀번호인 경우 오류 메시지를 설정하여 Login.jsp 페이지로 전달
	    request.setAttribute("errorMessage", "이메일이나 패스워드가 입력되지 않았습니다.");
	    RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
	    dispatcher.forward(request, response);
		script.println("history.back()");
		script.println("</script>");
	}
	if (result == 1) {
		//session.setAttribute("email", user.getEmail());
		PrintWriter script = response.getWriter();
		System.out.println("로그인 성공!!");
		if (email.equals("admin@co.kr")) {
			session.setAttribute("email", email);
			response.sendRedirect("Index2.jsp");
		} else {
			session.setAttribute("email", email);
			response.sendRedirect("UserIndex2.jsp");
		}
	} else if (result == 0 || result == -1) {
		//request.setAttribute("errorMessage", "이메일(로그인 전용 이메일) 또는 비밀번호를 잘못 입력했습니다 입력하신 내용을 다시 확인해주세요");
		PrintWriter script = response.getWriter();
		script.println("<script>");
		// script.println("alert('이메일(로그인 전용 이메일) 또는 비밀번호를 잘못 입력했습니다 입력하신 내용을 다시 확인해주세요.')");
		request.setAttribute("errorMessage", "이메일(로그인 전용 이메일) 또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요.");
		RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
	    dispatcher.forward(request, response);
		script.println("history.back()");
		script.println("</script>");
	} else if (result == -2) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생헀습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	
	%>
</body>
</html>