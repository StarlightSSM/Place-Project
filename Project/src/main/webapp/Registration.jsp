<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="user.Sign_upDTO"%>
<%@ page import="user.Sign_upDAO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.UserDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.regex.*"%>
<%@ page
	import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장소 등록 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function openModal(event) {
		event.preventDefault(); // 기본 동작 중단 (페이지 전환 방지)
		document.getElementById('myModal').style.display = 'block';
	}

	function closeModal() {
		document.getElementById('myModal').style.display = 'none';
	}

	function uploadImage() {
		var fileInput = document.getElementById('imgUpload');
		var file = fileInput.files[0];

		// Perform your image upload logic here
		// You can use AJAX to send the file to the server
		var formData = new FormData();
		formData.append("imgUpload", file);

		$.ajax({
			type : "POST",
			url : "UploadImage.jsp",
			data : formData,
			processData : false,
			contentType : false,
			success : function(response) {
				// Upload completed
				console.log("Image uploaded successfully!");
				// Additional tasks
				// ...

				// Close the modal
				closeModal();
			},
			error : function(xhr, status, error) {
				// Upload failed
				console.error("Image upload failed: " + error);
				// Handle the failure
				// ...
			}
		});
	}

	function setImageFileName(fileName) {
		document.getElementById('imgUpload').value = request.getParameter("imgUpload");

	}

	// 이미지 업로드 폼 제출 막기
	function preventFormSubmit(event) {
		event.preventDefault(); // 폼 제출 막기
		// 필요한 이미지 업로드 로직 수행
		var fileInput = document.getElementById('imgUpload'); // 이미지 파일 선택 input 요소
		var file = fileInput.files[0]; // 선택한 이미지 파일 가져오기

		var formData = new FormData();
		formData.append("imgUpload", file);

		// Ajax를 사용하여 이미지 업로드 처리
		$.ajax({
			type : "POST",
			url : "UploadImage.jsp", // 이미지 업로드를 처리하는 서버 측 페이지 URL
			data : formData,
			processData : false,
			contentType : false,
			success : function(response) {
				// 업로드 완료 후 처리할 작업
				console.log("이미지 업로드 완료");
				// 추가 작업 수행
				// ...

				// 이미지 파일 이름 전달
				setImageFileName(response);
				String
				imgUpload = setImageFileName(response);
				// 모달창 닫기
				closeModal();
			},
			error : function(xhr, status, error) {
				// 업로드 실패 시 처리할 작업
				console.error("이미지 업로드 실패: " + error);
				// 실패 처리 작업 수행
				// ...
			}
		});
	}
	
	// 버튼 요소 선택
	var myButton = document.getElementById("submitBtn");

	// 버튼 활성화
	//myButton.disabled = false;

	// 클릭 이벤트 처리
	myButton.addEventListener('onclick', RegistrationAction.jsp);

</script>
<style>
/* 모달창 스타일 */
.modal {
	display: none; /* 초기에는 숨김 처리 */
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

.menu {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #F1F1F1;
	font-size: 20px;
	margin-right: 50px;
	height: 50px;
	width: 100%;
}

.menu li {
	list-style-type: none;
	margin-right: 100px;
}

.menu li a {
	text-decoration: none;
	color: #333;
}

.menu li a: hover {
	color: #555;
}

.gray-box {
	width: 50%;
	height: 50px;
	margin: 0 auto;
	background-color: #d9d9d9;
	display: flex;
	justify-content: flex-start;
	align-items: center;
	color: black;
	font-size: 20px;
	padding-left: 20px;
	margin-top: 30px;
	top: 50px;
}

input[type="text"] {
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
	padding-top: 8px;
	padding-bottom: 8px;
	margin-left: 20px;
	margin-right: 10px;
	background-color: white;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
	boder-bottom: 0px;
	padding-top: 8px;
	padding-bottom: 8px;
	margin-left: 20px;
	margin-right: 10px;
	background-color: white;
	border-top: 0px;
	padding-top: 8px;
	padding-bottom: 8px;
	margin-left: 20px;
	margin-right: 10px;
	background-color: white;
	border-top: 0px;
	padding-bottom: 8px;
	margin-left: 20px;
	margin-right: 10px;
	background-color: white;
	border-top: 0px;
	margin-left: 20px;
	margin-right: 10px;
	background-color: white;
	border-top: 0px;
}

.gray-bigbox {
	width: 50%;
	height: 70px;
	margin: 0 auto;
	background-color: #d9d9d9;
	display: flex;
	justify-content: flex-start;
	align-items: center;
	color: black;
	font-size: 20px;
	padding-left: 20px;
	margin-top: 30px;
	top: 50px;
}

.inner-box1 {
	width: 80px;
	height: 40px;
	background-color: white;
	margin: auto;
	margin-left: 10px;
}

.inner-box2 {
	width: 220px;
	height: 40px;
	background-color: white;
	margin: auto;
	margin-left: 10px;
	align-items: center;
	justify-content: center;
	font-size: 20px;
	display: flex;
	border-radius: 25px;
}

#imgUpload {
	margin-left: 15px;
}

.container {
	max-width: 960px;
	margin: 0 auto;
	height: 1000px; /* 콘텐츠의 높이를 높게 설정합니다. */
	margin-bottom: 50px;
	color: #ffffff;
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

.Regist-btn {
	position: absolute;
	margin-top: 100px;
	left: 45%;
	width: 200px;
	height: 50px;
	background-color: #ffffff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	border: 2px solid black;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 20px;
	color: black;
	display: flex;
}

}
.checkbox-area {
	background-color: #fff;
	padding: 20px;
}

.row {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	margin-bottom: 10px;
	margin-top: 10px;
}

.checkbox-item {
	display: flex;
	align-items: center;
}

input[type="checkbox"] {
	margin-right: 10px;
	margin-left: 10px;
	zoom: 1.5;
}

label {
	font-size: 18px;
}

.tab {e
	white-space: pre;
}
</style>

</head>
<body>
	<ul class="menu">
		<li><a href="Registration.jsp">장소등록하기</a></li>
		<li><a href="Correction.jsp">장소수정하기</a></li>
		<li><a href="#">예약 목록</a></li>
		<li><a href="#">리뷰보기</a></li>
		<li><a href="Mypage.jsp">마이페이지</a></li>
	</ul>

	<!-- enctype="multipart/form-data" -->
	<!-- action="RegistrationAction.jsp" -->
	<form action="RegistrationAction.jsp" method="post">
		<div class=gray-box>
			장소명 : <input type="text" name="placeName">
		</div>
		<div class=gray-bigbox>
			카테고리 :
			<div class=inner-box>
				<div class="checkbox-area">
					<div class="row">
						<div class="checkbox-item">
							<input type="checkbox" name="category" value="호텔" id="hotel" />
							<label for="hotel">호텔</label>
						</div>
						<div class="checkbox-item">
							<input type="checkbox" name="category" value="펜션" id="pension" />
							<label for="pension">펜션</label>
						</div>
						<div class="checkbox-item">
							<input type="checkbox" name="category" value="리조트" id="resort" />
							<label for="resort">리조트</label>
						</div>
						<div class="checkbox-item">
							<input type="checkbox" name="category" value="캠핑장" id="camping" />
							<label for="camping">캠핑장</label>
						</div>
						<div class="checkbox-item">
							<input type="checkbox" name="category" value="공유오피스"
								id="coworking" /> <label for="coworking">공유오피스</label>
						</div>
					</div>
					<div class="row">
						<div class="checkbox-item">
							<input type="checkbox" name="category" value="파티룸" id="party" />
							<label for="party">파티룸</label>
						</div>
						<div class="checkbox-item">
							<input type="checkbox" name="category" value="스튜디오" id="studio" />
							<label for="studio">스튜디오</label>
						</div>
						<div class="checkbox-item">
							<input type="checkbox" name="category" value="스터디카페" id="study" />
							<label for="study">스터디카페</label>
						</div>
						<div class="checkbox-item">
							<input type="checkbox" name="category" value="세미나실" id="seminar" />
							<label for="seminar">세미나실</label>
						</div>
						<div class="checkbox-item"></div>
					</div>
				</div>
			</div>
		</div>
		<div class=gray-box>
			최대 인원 : <input type="text" name="maxPeople">
		</div>
		<div class=gray-box>
			주소 : <input type="text" name="address" size="50">
		</div>
		<div class=gray-box>
			상세 주소 : <input type="text" name="addressDetail" size="100">
		</div>
		<div class=gray-box>
			상세 정보 : <input type="text" name="infoDetail">
		</div>
		<div class=gray-box>
			사진 업로드 :
			<div class=inner-box2>
				 <input type="file" id="imgUpload" name="imgUpload" onclick="openModal()">
				<!-- <button type="button" onclick="openModal(event)">이미지 업로드하기</button>
				<div id="myModal" class="modal">
					<div class="modal-content">
						<form id="uploadForm" enctype="multipart/form-data" method="post">
							...
							<input type="file" id="imgUpload" name="imgUpload" />
							<button onclick="uploadImage()">업로드하기</button>
							<button type="button" onclick="uploadImage()">업로드</button>
						</form>
						<button type="button" onclick="closeModal()">취소하기</button>
					</div>
				</div> -->
			</div>
		</div>
		<div class=gray-box>
			금액 설정 : <input type="text" name="hourPerCost">
			<p>원 / 1시간</p>
			<span class="tab">&#9;</span> <input type="text" name="dayPerCost">
			<p>원 / 1일</p>
		</div>
		<input type="submit" id="submitBtn" class="Regist-btn" onclick="location.href='RegistrationAction.jsp'" value="등록">
	</form>
	<footer>
		<div class="container">
			<p>Copyright © 2023 Example Company. All rights reserved.</p>
		</div>
	</footer>
</body>
</html>