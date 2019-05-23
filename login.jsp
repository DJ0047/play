<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WELCOME TO MY PL@YGROUND</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="style.css">
</head>
<script type="https://ajax.googleapis.com/ajax"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script>
	function loginCheck() {
		var obj = document.login;
		if (!obj.id.value && !obj.pw.value) {
			alert('아이디와 비밀번호를 입력하세요.');
			obj.id.focus();
			return false;
		} else if (!obj.id.value) {
			alert('아이디를 입력하세요.');
			obj.id.focus();
			return false;
		} else if (!obj.pw.value) {
			alert('비밀번호를 입력하세요.');
			obj.pw.focus();
			return false;
		}
		obj.submit();
	}
</script>
<body class="loginBody">
	<form action="loginProcess.jsp" method="post" name="login">
		<div class="center">
			<div class="cover">
				<div class="loginInput">
					<input type="text" class="inputTxt" name="id"
						placeholder="아이디를 입력하세요."> <input type="password"
						class="inputTxt" name="pw" placeholder="비밀번호를 입력하세요.">
					<button type="button" class="loginBtn" onclick="loginCheck()">PL@YGROUND
						입장하기</button>
				</div>
				<div class="myInfoDiv">
					플레이그라운드 / 만든이 양다정 / 휴대전화 010-4227-0047 / 이메일 <a
						href="mailto:fromyour1nonly@gmail.com">fromyour1nonly@gmail.com</a>
					/ 주소 서울특별시 마포구 어울마당로2길 22 101
				</div>
			</div>
		</div>
	</form>
</body>
</html>