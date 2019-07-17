<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>

<%
	String title = "회원가입";
%>

<body>
	<jsp:forward page="template.jsp">
	  	<jsp:param name="title" value='<%=URLEncoder.encode(title, "UTF-8") %>' />
	  	<jsp:param name="CONTENTPAGE" value="signupForm.jsp"/>
	</jsp:forward>
</body>
</html>