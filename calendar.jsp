<!-- http://blog.naver.com/PostView.nhn?blogId=javaking75&logNo=220145998991 -->
<%@page import="report.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="report.dao.PlayDao"%>
<%@page import="report.model.Play"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<html>
<%
	request.setCharacterEncoding("utf-8");
	Calendar calendar = Calendar.getInstance();
	int[] today = {calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DATE)};

	String id = request.getParameter("id");
	//String nickName = request.getParameter("nickName");
	String nickName = (String) session.getAttribute("nickName");
	String getDate = request.getParameter("getDate");
	String fileName = request.getParameter("fileName");

	System.out.println("calendar> " + id + " " + nickName);

	String getYear = request.getParameter("year");
	String getMonth = request.getParameter("month");

	if (getYear != null) {
		today[0] = Integer.parseInt(getYear);
		today[1] = Integer.parseInt(getMonth);
	}

	List<Play> list = null;
	Member member = new Member();
	member.setId(id);
	if (today[1] < 10) {
		String tmp = Integer.toString(today[0]) + "0" + Integer.toString(today[1] + 1);
		member.setRegdate(tmp);
		System.out.println("calendar member> " + member);
		list = PlayDao.searchDate(member);
	} else {
		String tmp = Integer.toString(today[0]) + Integer.toString(today[1] + 1);
		member.setRegdate(tmp);
		list = PlayDao.searchDate(member);
	}

	calendar.set(today[0], today[1], 1);

	int firstDay = calendar.getMinimum(java.util.Calendar.DATE);
	int lastDay = calendar.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	int start = calendar.get(java.util.Calendar.DAY_OF_WEEK);
	int date = 0;

	Calendar todayCal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
	int todayInt = Integer.parseInt(sdf.format(todayCal.getTime()));
%>

<head>
<meta charset="UTF-8">
<title>WELCOME TO MY PL@YGROUND</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="style.css">
</head>
<script type="https://ajax.googleapis.com/ajax"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script>
	function changeCal(btnName) {
		var obj = document.calendarFrm;
		if (btnName == 'pre') {
			if(<%=today[1]%> > 0) {
			obj.action = 'calendar.jsp?year=<%=today[0]%>&month=<%=(today[1] - 1)%>&nickName=<%=nickName%>&id=<%=id%>';
					obj.submit();
			} else {
				obj.action = 'calendar.jsp?year=<%=today[0] - 1%>&month=11&nickName=<%=nickName%>&id=<%=id%>';
				obj.submit();
			}
		} else if (btnName == 'next') {
			if(<%=today[1]%> < 11) {
				obj.action = 'calendar.jsp?year=<%=today[0]%>&month=<%=(today[1] + 1)%>&nickName=<%=nickName%>&id=<%=id%>';
						obj.submit();
				} else {
					obj.action = 'calendar.jsp?year=<%=today[0] + 1%>&month=0&nickName=<%=nickName%>&id=<%=id%>';
				obj.submit();
			}
		}
	}
</script>
<body>
	<form action="calendar.jsp?getDate=<%=getDate%>&id=<%=id%>"
		name="calendarFrm" method="post">
		<div class="calendar">
			<div class="calendarNavi">
				<button onclick="changeCal(this.name)" name="pre"
					class="calendarBtn"><</button>
				<button class="calendarBtn" disabled="disabled"><%=today[0] + "년 " + (today[1] + 1) + "월"%></button>
				<button onclick="changeCal(this.name)" name="next"
					class="calendarBtn">></button>
			</div>
			<table>
				<thead class="thead">
					<tr>
						<td>일</td>
						<td>월</td>
						<td>화</td>
						<td>수</td>
						<td>목</td>
						<td>금</td>
						<td>토</td>
					</tr>
				</thead>
				<tbody class="tbody">
					<tr>
						<%
							for (int i = 1; i < start; i++) {
						%>
						<td>&nbsp</td>
						<%
							date++;
							}
							int j = 0;
							for (int i = 1; i <= lastDay; i++) {
								String color = "";

								if (date == 0) {
									color = "#D65745";

								} else if (date == 6) {
									color = "#A2CFEE";

								} else {
									color = "#434343";
								}

								String innerDateStr = Integer.toString(today[0]);
								innerDateStr += Integer.toString(today[1] + 1).length() == 1 ? "0" + Integer.toString(today[1] + 1)
										: Integer.toString(today[1] + 1);
								innerDateStr += Integer.toString(i).length() == 1 ? "0" + Integer.toString(i) : Integer.toString(i);

								int innerDate = Integer.parseInt(innerDateStr);
								String backColor = "white";

								if (innerDate == todayInt) {
									backColor = "#D65745";
									color = "white";
								}

								if (list.size() == 0) {
						%>
						<td bgcolor='<%=backColor%>'><a
							href="write.jsp?getDate=<%=innerDateStr%>&id=<%=id%>&nickName=<%=nickName%>"><font
								color='<%=color%>'><%=i%></font></a></td>
						<%
							date++;
								} else if ((innerDate <= Integer.parseInt(list.get(list.size() - 1).getRegdate()))) {
									/* int j = 0; */
									for (; j < list.size();) {
										if (innerDate == Integer.parseInt(list.get(j).getRegdate())) {
						%>
						<td bgcolor='<%=backColor%>'><a
							href="modify.jsp?getDate=<%=innerDateStr%>&id=<%=id%>&fileName=<%=list.get(j).getFileName()%>"><img
								src='../upload/<%=list.get(j).getFileName()%>' class="posterImg"></a></td>
						<%
							j++;
											date++;
											break;
										} else {
						%>
						<td bgcolor='<%=backColor%>'><a
							href="write.jsp?getDate=<%=innerDateStr%>&id=<%=id%>&nickName=<%=nickName%>"><font
								color='<%=color%>'><%=i%></font></a></td>
						<%
							date++;
											break;
										} // else-날짜가 겹치지 않으면
									} // for-j
								} else if ((innerDate > Integer.parseInt(list.get(list.size() - 1).getRegdate()))) {
						%>
						<td bgcolor='<%=backColor%>'><a
							href="write.jsp?getDate=<%=innerDateStr%>&id=<%=id%>&nickName=<%=nickName%>"><font
								color='<%=color%>'><%=i%></font></a></td>
						<%
							date++;
								} // else if

								if (date == 7) {
						%>
					</tr>
					<%
						if (i <= lastDay) {
					%>
					<tr>
						<%
							}
									date = 0;
								} // if(date==7)
							} // for-i
							while (date > 0 && date < 7) {
						%>
						<td>&nbsp</td>
						<%
							date++;
							} // while
						%>

					</tr>
				</tbody>
			</table>
		</div>
		<div class="chart">
			<h1 class="welcomeH1">
				<a href="list.jsp?id=<%=id%>"> <%=nickName + "님의 PL@YGROUND"%></a>
			</h1>
			<div class="charBody">
				<div class="chartDiv">
					<div class="chartTitle">[ 영화를 제일 많이 본 달 ]</div>
				</div>
				<div class="chartDiv">
					<div class="chartTitle">[ ]</div>
				</div>
				<div class="chartDiv">
					<div class="chartTitle"></div>
				</div>
				<div class="chartDiv">
					<div class="chartTitle"></div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
