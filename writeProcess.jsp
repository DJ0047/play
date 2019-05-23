<%@ page
	import="java.io.File, java.io.IOException, com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@page import="report.dao.PlayDao"%>
<%@page import="report.model.Play"%>
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

	String pathValue = request.getRealPath("upload");
	//	String pathValue = request.getServletContext().getRealPath("/image");
	//	 	String pathValue = "/Users/y/⁨eclipse/⁨jee-2018-09/⁨WORKSPACE/⁨PLAYGROUND/⁨PlayGround/⁨⁨image⁩"; 
	int size = 5 * 1024 * 1024;
	MultipartRequest multi = new MultipartRequest(request, pathValue, size, "utf-8",
			new DefaultFileRenamePolicy());
	String orgfileName = multi.getOriginalFileName("fileName");
	String savefileName = multi.getFilesystemName("fileName");

	String getDate = request.getParameter("getDate");
	String id = request.getParameter("id");
	String nickName = request.getParameter("nickName");

	System.out.println("writeProcess> " + id + " " + nickName);
	System.out.println(">>path " + pathValue + " //// " + request + " ?? " + multi.getFileNames());

	Play play = new Play();

	System.out.println(">>orgfileName " + orgfileName + " " + savefileName);

	//String fileName = request.getParameter("fileName");
	String title = multi.getParameter("title");
	String regdate = request.getParameter("getDate");
	String location = multi.getParameter("location");
	String review = multi.getParameter("review");

	play.setId(id);
	play.setFileName(orgfileName);
	play.setTitle(title);
	play.setRegdate(regdate);
	play.setLocation(location);
	play.setReview(review);

	System.out.println(">>>>> " + play);
	PlayDao.insertReview(play);

	response.sendRedirect("calendar.jsp?getDate=" + getDate + "&fileName=" + orgfileName + "&id=" + id);
%>
<body>
</body>
</html>