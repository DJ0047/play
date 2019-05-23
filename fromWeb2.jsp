<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 영화임 -->
<%
	request.setCharacterEncoding("utf-8");
	String getDate = request.getParameter("getDate");
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="style.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<script type="https://ajax.googleapis.com/ajax"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script charset="UTF-8">
	var obj = document.fromWebFrm;
	function searchImg() {
		//	obj.submit();
	}
	$(document).ready(function() {
		$("#btn").click(function() {

			//	  alert($("input[name='title']").val());
			/* $.ajax({
			url : 'fromWebProcess.jsp',
			type : "post",
			dataType : "text",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			data : 'title'=$("#title").val(),
			success : function(v) {
				alert(v);
				console.log(v);
			},
			error : function(e) {
				alert('e>> ' + e);
			} */
			//alet($("#title").val())
			/*  */

			$.ajax({
				url : 'fromWebProcess.jsp',
				type : "post",
				dataType : "json",
				data : {
					title : $("input[name='title']").val()
				},
				success : function(v) {
					//alert(v);
					//console.log(v.items)
					$.each(v.items, function(index, dom) {
						console.log(dom.image)
					});
					/* $.each(v,function(index,dom){
					console.log(v.items)
					}
					); */

				},
				error : function(e) {
					alert('e>> ' + e);
				}

			});

		});
	});
</script>
<body>
	<br>
	<form action="" method="post" name="fromWebFrm">
		<div class="searchHeader">
			<div class="searchBar">
				<input type="text" class="searchInput" name="title">
				<button type="button" class="searchBtn" id="btn"></button>
			</div>
		</div>
	</form>
	<div class="searchBody">
		<div class="searchResult"
			style="background-image: url(https://ssl.pstatic.net/imgmovie/mdi/mit110/1526/152632_P19_104759.jpg); background-size: auto 100%; background-repeat: no-repeat;"></div>
	</div>
</body>
</html>