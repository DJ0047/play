<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- 영화임 -->
 <%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	StringBuilder sb = null;
	String clientId = "oGyDCZ5S1Ff8R9bs97WM";// 애플리케이션 클라이언트 아이디값";
	String clientSecret = "uzTzsfjpcP";// 애플리케이션 클라이언트 시크릿값";
	int display = 100; // 검색결과갯수. 최대100개
	try {
		String text = URLEncoder.encode(title, "utf-8");
		String apiURL = "https://openapi.naver.com/v1/search/movie.json?query=" + text + "&display=" + display;

		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		con.setRequestProperty("X-Naver-Client-Id", clientId);
		con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if (responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		sb = new StringBuilder();
		String line;

		while ((line = br.readLine().trim()) != null) {			
			sb.append(line+"\n");			
		}
		br.close();
		con.disconnect();
		System.out.println(sb);
	} catch (Exception e) {
		System.out.println(e);
	}
%>

	<%=sb.toString().trim() %> 

	
	
	
	