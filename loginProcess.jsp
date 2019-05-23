<!DOCTYPE html>
<%@page import="report.dao.MemberDao"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.css">
</head>
<script type="https://ajax.googleapis.com/ajax"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	if (MemberDao.searchId(id) == true && MemberDao.pwCheck(id, pw)) {
		String nickName = MemberDao.searchNickName(id);
		session.setAttribute("nickName", nickName);
		response.sendRedirect("calendar.jsp?id=" + id);
		//response.sendRedirect("calendar.jsp?id=" + id + "&nickName=" + nickName);
	} else {
		response.sendRedirect("login.jsp");
	}
%>
<body>
</body>
</html>