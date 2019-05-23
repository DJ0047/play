<%@page import="report.dao.PlayDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@page import="report.model.Play"%>
<html>
<%
	request.setCharacterEncoding("utf-8");
	String getDate = request.getParameter("getDate");
	String id = request.getParameter("id");
	//	String pathValue = "/Users/y/⁨eclipse/⁨jee-2018-09/⁨WORKSPACE/⁨PLAYGROUND/⁨PlayGround/⁨WebContent/⁨image⁩/";
	String fileName = request.getParameter("fileName");
	Play play = PlayDao.searchPlay(getDate);
%>


<head>
<meta charset="EUC-KR">
<title>WELCOME TO MY PL@YGROUND</title>
<link rel="stylesheet" href="style.css">
<style type="text/css">
.headerBtnDiv {
	width: 70%;
	left: 50%;
	margin-left: -35%;
	position: absolute;
	margin-top: 50px;
}
</style>
</head>
<script>
	
	function saveReview(btnValue) {
		var obj = document.modifyFrm;
		if (btnValue == '그만쓰기') {
			obj.action = 'calendar.jsp?id=<%=id%>';
			obj.submit();
		} else if (btnValue =='수정하기') {
			obj.action = 'modifyProcess.jsp?getDate=<%=getDate%>&id=<%=id%>';
			obj.submit();
		} else if(btnValue =='삭제하기') {
			obj.action = 'deleteProcess.jsp?getDate=<%=getDate%>&id=<%=id%>';
			obj.submit();
		}
	}
</script>

<body>
	<form action="" method="post" name="modifyFrm"
		enctype="multipart/form-data">
		<div class="selectHeader" id="holder">
			<div class="headerBtnDiv">
				<button class="menuBtn"></button>
				<input type="button" class="menuBtnR" value="수정하기"
					onclick="saveReview(this.value)"> 
					<input type="button" class="menuBtnR" value="삭제하기"
					onclick="saveReview(this.value)">
					<input type="button"
					class="menuBtnR" value="그만쓰기" onclick="saveReview(this.value)">
			</div>
			<div class="bodyBtnDiv">
				<input type="file" class="imgFileInput" id="file" name="fileName">
				<input type="button" class="imgWebInput">
			</div>
			<input type="text" name="title" class="titleInput"
				placeholder="제목을 입력해주세요." value="<%=play.getTitle()%>">
				<img src="../upload/<%=play.getFileName()%>"/>
		</div>
		<div class="contentsDiv">
			<div class="itemSet">
				<div class="itemTitle">장소</div>
				<input type="text" class="itemContent" name="location" value="<%=play.getLocation()%>">
			</div>
			<div class="itemSet">
				<div class="itemTitle">리뷰</div>
				<textarea name="review" rows="22" cols="50" class="itemContentR"><%=play.getReview()%></textarea>
			</div>
		</div>
	</form>
	<script>
		var upload = document.getElementById('file'), holder = document
				.getElementById('holder');

		upload.onchange = function(e) {
			e.preventDefault();

			var file = upload.files[0], reader = new FileReader();
			reader.onload = function(event) {
				var img = new Image();
				img.src = event.target.result;

				holder.innerHTML = '<div class=\"headerBtnDiv\"><button class=\"menuBtn\"></button><input type=\"button\" class=\"menuBtnR\" value=\"저장하기\" onclick=\"saveReview(this.value)\"> <input type=\"button\" class=\"menuBtnR\" value=\"그만쓰기\" onclick=\"saveReview(this.value)\"></div><div class=\"bodyBtnDiv\"><input type=\"file\" class=\"imgFileInput\" id=\"file\"> <input type=\"button\" class=\"imgWebInput\"></div><input type=\"text\" name=\"title\" class=\"titleInput\" placeholder=\"제목을 입력해주세요.\">';
				holder.appendChild(img);
			};
			reader.readAsDataURL(file);

			return false;
		};
	</script>
</body>
</html>