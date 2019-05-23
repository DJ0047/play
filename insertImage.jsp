<!DOCTYPE html>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.apache.commons.fileupload.FileUpload"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.io.File"%>
<%@page import="report.model.Play"%>
<html>
<%
	request.setCharacterEncoding("utf-8");
	String getDate = request.getParameter("getDate");
%>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%-- <jsp:useBean id="bean" class="report.model.Play" scope="page" />
<jsp:setProperty property="*" name="bean" /> --%>
<link rel="stylesheet" href="../css/bootstrap.css">
</head>
<script type="https://ajax.googleapis.com/ajax"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>

<body>
	<%
		request.setCharacterEncoding("EUC-KR");

		String pathValue = request.getServletContext().getRealPath("/image");
		//String pathValue = "/Users/y/⁨eclipse/⁨jee-2018-09/⁨WORKSPACE/⁨PLAYGROUND/⁨PlayGround/⁨WebContent/⁨image⁩";
		int size = 5 * 1024 * 1024;

		MultipartRequest multi = new MultipartRequest(request, pathValue, size, "utf-8",
				new DefaultFileRenamePolicy());

		String orgfileName = multi.getOriginalFileName("fileName");
		String savefileName = multi.getFilesystemName("fileName");
		response.sendRedirect("write.jsp?getDate=" + getDate + "&fileName=" + orgfileName);
		request.getSession().setAttribute("fileImg", orgfileName);
		System.out.println("!! " + orgfileName);
		//	String pathValue = "/Users/y/⁨eclipse/⁨jee-2018-09/⁨WORKSPACE/⁨PLAYGROUND/⁨PlayGround/⁨WebContent/⁨image⁩/";
		//	int size = 5 * 1024 * 1024;
		//	String fileName = "";
		//	DiskFileUpload fileUpload = new DiskFileUpload();
		//	fileUpload.setRepositoryPath(pathValue);
		//	fileUpload.setSizeMax(size);
		//	List<FileItem> list = fileUpload.parseRequest(request);
		//	for (FileItem f : list) {
		//		if (!f.isFormField()) {
		//			if (f.getName() != null && f.getName().length() > 0) {
		//
		//					fileName += f.getName();
		//					File file = new File(pathValue + fileName);
		//					try {
		//						f.write(file);
		//					} catch (Exception e) {
		//
		//					} //catch
		//
		//				} //if
		//			}
		//		}
		//		response.sendRedirect("write.jsp?fileName=" + fileName + "&getDate=" + getDate);
	%>

</body>
</html>