<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@page import="report.model.Play"%>
<html>
<%
	request.setCharacterEncoding("utf-8");
	String getDate = request.getParameter("getDate");
	String id = request.getParameter("id");
	System.out.println("write> " + id);
	//	String pathValue = "/Users/y/⁨eclipse/⁨jee-2018-09/⁨WORKSPACE/⁨PLAYGROUND/⁨PlayGround/⁨WebContent/⁨image⁩/";
	//String fileName = request.getParameter("fileName");
%>


<head>
<meta charset="EUC-KR">
<title>WELCOME TO MY PL@YGROUND</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
		var obj = document.writeFrm;
		if (btnValue == '그만쓰기') {
			obj.action = 'calendar.jsp?id=<%=id%>';
			obj.submit();
		} else if (btnValue == '저장하기') {
			obj.action = 'writeProcess.jsp?getDate=<%=getDate%>&id=<%=id%>';
			obj.submit();
		}
	}
	function fromWeb() {
		var selectedImg = window.open("fromWeb.jsp?getDate=<%=getDate%>&id=<%=id%>", "web",
				"width=620, height=800, left=400, top=100");
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".slideMenu").hide();
	});
</script>
<body>
	<form action="" method="post" name="writeFrm"
		enctype="multipart/form-data">
		<div class="slideMenu"></div>
		<div class="selectHeader" id="holder">
			<div class="headerBtnDiv">
				<button class="menuBtn"></button>
				<input type="button" class="menuBtnR" value="저장하기"
					onclick="saveReview(this.value)"> <input type="button"
					class="menuBtnR" value="그만쓰기" onclick="saveReview(this.value)">
			</div>
			<div class="bodyBtnDiv">
				<input type="file" class="imgFileInput" id="file" name="fileName"
					onchange="previewFiles()"> <input type="button"
					class="imgWebInput" id="web" onclick="fromWeb()">
			</div>
			<input type="text" name="title" class="titleInput"
				placeholder="제목을 입력해주세요.">
		</div>
		<div class="contentsDiv">
			<div class="itemSet">
				<div class="itemTitle">장소</div>
				<input type="text" class="itemContent" name="location">
			</div>
			<div class="itemSet">
				<div class="itemTitle">리뷰</div>
				<textarea name="review" rows="22" cols="50" class="itemContentR"></textarea>
			</div>
		</div>
	</form>
	<script>
		function previewFiles() {

			var holder = document.querySelector('#holder');
			var files = document.querySelector('input[type=file]').files;

			function readAndPreview(file) {

				// `file.name` 형태의 확장자 규칙에 주의하세요
				if (/\.(jpe?g|png|gif)$/i.test(file.name)) {
					var reader = new FileReader();

					reader.addEventListener("load", function() {
						var image = new Image();
						image.height = 100;
						image.title = file.name;
						image.src = this.result;
						holder.appendChild(image);
					}, false);

					reader.readAsDataURL(file);
				}

			}

			if (files) {
				[].forEach.call(files, readAndPreview);
			}

		}

		/*	var upload = document.getElementById('file'), holder = document
					.getElementById('holder');

			upload.onchange = function(e) {
				e.preventDefault();

				var file = upload.files[0], reader = new FileReader();
				reader.onload = function(event) {
					var img = new Image();
					img.src = event.target.result;
					holder.innerHTML = '<div class=\"headerBtnDiv\"><button class=\"menuBtn\"></button><input type=\"button\" class=\"menuBtnR\" value=\"저장하기\" onclick=\"saveReview(this.value)\"> <input type=\"button\" class=\"menuBtnR\" value=\"그만쓰기\" onclick=\"saveReview(this.value)\"></div><div class=\"bodyBtnDiv\"><input type=\"file\" class=\"imgFileInput\" id=\"file\" name=\"fileName\" onchange=\"previewFiles()\"><input type=\"button\" class=\"imgWebInput\" id=\"web\" onclick=\"fromWeb()\"></div><input type=\"text\" name=\"title\" class=\"titleInput\" placeholder=\"제목을 입력해주세요.\">';
					holder.appendChild(img);
				};
				reader.readAsDataURL(file);

				return false;
			};*/
	</script>
</body>
</html>