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
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.css">
</head>
<script type="https://ajax.googleapis.com/ajax"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script>
	function selectImage() {
		window.opener.name = "insertImg";
		document.fromAlbumFrm.target = "insertImg";
		document.fromAlbumFrm.action = "insertImage.jsp?getDate=<%=getDate%>";
		document.fromAlbumFrm.submit();
		self.close();
	}
</script>
<body>
	<br>
	<form action="insertImage.jsp" method="post" name="fromAlbumFrm" enctype="multipart/form-data">
		<div class="fromA" align="center">
			<input type="file" name="fileName" id="selectedFile"> <input
				type="button" class="btn btn-danger" value="선택"
				onclick="selectImage()">
		</div>
	</form>
</body>
</html>