<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@page import="report.model.Play"%>
<%@page import="report.dao.PlayDao"%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.css">
</head>
<script type="https://ajax.googleapis.com/ajax"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<%
	request.setCharacterEncoding("utf-8");

	String getDate = request.getParameter("getDate");
	String id = request.getParameter("id");
	String fileName = request.getParameter("fileName");

	String title = request.getParameter("title");
	String regdate = request.getParameter("getDate");
	String location = request.getParameter("location");
	String review = request.getParameter("review");

	System.out.println("modifyProcess> " + getDate + " " + id + " " + fileName);
	System.out.println("넘어오니...? " + title + " " + regdate + " " + location + " " + review);

	if (request.getParameter("fileName") == null) {
		System.out.println("제발");
		Play play = new Play();

		play.setFileName(fileName);
		play.setTitle(title);
		play.setLocation(location);
		play.setReview(review);

		System.out.println("playModify> " + play);

		//	PlayDao.updatePlay(play);

		response.sendRedirect("calendar.jsp?getDate=" + getDate + "&fileName=" + fileName + "&id=" + id);
	} else {
		System.out.println("제발 여긴아냐");
		String pathValue = request.getRealPath("upload");
		int size = 5 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, pathValue, size, "utf-8",
				new DefaultFileRenamePolicy());
		String orgfileName = multi.getOriginalFileName("fileName");
		String savefileName = multi.getFilesystemName("fileName");

		Play play = new Play();

		play.setFileName(orgfileName);
		play.setTitle(title);
		play.setLocation(location);
		play.setReview(review);

		PlayDao.updatePlay(play);

		response.sendRedirect("calendar.jsp?getDate=" + getDate + "&fileName=" + orgfileName + "&id=" + id);
	}
%>
<body>

</body>
</html>