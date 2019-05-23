<%@page import="report.dao.MemberDao"%>
<%@page import="report.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String nickName = request.getParameter("nickName");
	System.out.println("!! " + nickName);
	Member member = new Member();

	member.setId(id);
	member.setPw(pw);
	member.setNickName(nickName);

	System.out.println(">> " + member);

	MemberDao.insertMember(member);
%>
<body>

</body>
</html>