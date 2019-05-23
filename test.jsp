<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="">
		<input type="file" id="file">
		<div id="holder"></div>
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
				holder.innerHTML = '';
				holder.appendChild(img);
			};
			reader.readAsDataURL(file);

			return false;
		};
	</script>
</body>
</html>