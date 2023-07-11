<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.Sign_upDTO"%>
<%@ page import="user.Sign_upDAO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.UserDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.regex.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function checkPw() {
		let pw = $("#pw").val();
		let number = pw.search(/[0-9]/g);
		let english = pw.search(/[a-z]/ig);
		let spece = pw.searh(/[`~!@@#$%^&*|\\\`\;:`/?]/gi);
		let reg = /^(?=.**?[A-Z])(?=.*?[a=z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		
		if (pw.length < 8 || pw.length > 16) {
			request.setAttribute("errorMessage", "8자리 ~ 16자리 이내로 입력해주세요.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("Sign_up.jsp");
		    dispatcher.forward(request, response);
			//alert("8자리 ~ 16자리 이내로 입력해주세요.");
			return false;
		}
		else if (pw.search(/\s/) != -1) {
			alert("비밀번호는 공백 없이 입력해주세요.")
			return false;
		}
		else if (number < 0 || english < 0 || spece < 0) {
			request.setAttribute("errorMessage", "영문 대 소문자, 숫자, 특수문자를 혼합하여 입력해주세요.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("Sign_up.jsp");
		    dispatcher.forward(request, response);
			//alert("영문 대 소문자, 숫자, 특수문자를 혼합하여 입력해주세요.");
			return false;
		}
		else if ((number < 0 && english < 0) || (english < 0 && spece < 0) || (spece < 0 && number < 0)) {
			request.setAttribute("errorMessage", "영문 대 소문자, 숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("Sign_up.jsp");
		    dispatcher.forward(request, response);
			//alert("영문 대 소문자, 숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
			return false;
		}
		else if (/(\w)\1\1\1/.test(pw)) {
			request.setAttribute("errorMessage", "같은 문자를 4번 이상 사용하실 수 없습니다.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("Sign_up.jsp");
		    dispatcher.forward(request, response);
			//alert("같은 문자를 4번 이상 사용하실 수 없습니다.");
			return false;
		}
		else {
			request.setAttribute("errorMessage", "비밀번호가 정상적으로 입력되었습니다.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("Sign_up.jsp");
		    dispatcher.forward(request, response);
			//alert("비밀번호가 정상적으로 입력되었습니다.");
			return true;
		}
		
		if (false === reg.test(pw)) {
			request.setAttribute("errorMessage", "비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("Sign_up.jsp");
		    dispatcher.forward(request, response);
			//alert("비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.");
			return false;
		} else {
			request.setAttribute("errorMessage", "비밀번호가 정상적으로 입력되었습니다.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("Sign_up.jsp");
		    dispatcher.forward(request, response);
			//alert("비밀번호가 정상적으로 입력되었습니다.");
			return true;
		}
	}
</script>
<body>
	<%
	//String email, String pw, String name, String phone, String w_intro, String u_img, String birth => join 매개변수에다 이걸로 고치기
	request.setCharacterEncoding("UTF-8");
	UserDAO userdao = new UserDAO();
	UserDTO userdto = new UserDTO();
	String name = null;
	String email = null;
	String phone = null;
	String pw = null;

	if (request.getParameter("name") != null) {
		name = (String) request.getParameter("name");
	}
	if (request.getParameter("email") != null) {
		email = (String) request.getParameter("email");
	}
	if (request.getParameter("phone") != null) {
		phone = (String) request.getParameter("phone");
	}
	if (request.getParameter("pw") != null) {
		pw = (String) request.getParameter("pw");
	}
	if (pw.length() < 8 || pw.length() > 16) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		request.setAttribute("errorMessage", "8 ~ 16자 이내로 입력해주세요.");
		RequestDispatcher dispatcher = request.getRequestDispatcher("Sign_up.jsp");
	    dispatcher.forward(request, response);
		//script.println("alert('8 ~ 16자 이내로 입력해주세요.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	//문자, 숫자, 특수문자의 조합인지 확인
	Pattern p = Pattern.compile("([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])");
	Matcher m = p.matcher(pw);
	if (m.find()) {
		System.out.println(pw + " 은 패턴에 해당함!!!");
	} else {
		System.out.println(pw + " 은 패턴에 어긋남!!!");
		PrintWriter script = response.getWriter();
		script.println("<script>");
		request.setAttribute("errorMessage", "영문 대 소문자, 숫자, 특수문자를 사용하세요.");
		RequestDispatcher dispatcher = request.getRequestDispatcher("Sign_up.jsp");
	    dispatcher.forward(request, response);
		//script.println("alert('영문 대 소문자, 숫자, 특수문자를 사용하세요.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	if (name == null || email == null || phone == null || pw == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		request.setAttribute("errorMessage", "입력이 안된 사항이 있습니다.");
		RequestDispatcher dispatcher = request.getRequestDispatcher("Sign_up.jsp");
	    dispatcher.forward(request, response);
		//script.println("alert('입력이 안된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}

	Sign_upDAO sign_upDAO = new Sign_upDAO();
	int result = sign_upDAO.join(name, email, phone, pw);
	// int result = sign_upDAO.join(email,pw,name,phone,w_intro,u_img,birth);로 고치기
	if (result == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입에 성공하셨습니다.');");
		script.println("location.href='Index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	%>
</body>
</html>
