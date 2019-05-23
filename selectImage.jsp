<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<%
	request.setCharacterEncoding("utf-8");
	String getDate = request.getParameter("getDate");
%>
<head>
<meta charset="EUC-KR">
<title>WELCOME TO MY PL@YGROUND</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="style.css">
</head>
<script type="https://ajax.googleapis.com/ajax"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script type="text/javascript">
	function fromAlbum() {
		var selectedImg = window.open("fromAlbum.jsp?getDate=<%=getDate%>", "album",
				"width=400, height=50, left=400, top=100");
	}
	function fromWeb() {

	}
</script>
<body>
	
		<div>티켓 추가하기</div>
		<br>
		<h5 align="center">티켓에 사진을 추가할 방법을 선택하세요.</h5>
		<br>
		<form action="insertImage.jsp?getDate=<%=getDate%>" method="post"
			enctype="multipart/form-data" name="selectFrm">
			<div align="center">
				<input type="button" class="btn" value="앨범에서 불러오기"
					onclick="fromAlbum()"> <br> <br> <input
					type="submit" class="btn" value="웹에서 이미지 검색" onclick="fromWeb()">
				<br> <br> <input type="button" class="btn btn-danger"
					value="취소" onclick="history.go(-1)"> <input type="button"
					" class="btn btn-light" value="다음" onclick="goWrite()">
			</div>
		</form>
	
</body>
</html>