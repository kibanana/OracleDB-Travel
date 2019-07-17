<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String contentPage = request.getParameter("CONTENTPAGE");
	String title = request.getParameter("title");
%>

<jsp:useBean id="member" class="yewon.member" />
<jsp:setProperty name="member" property="*"/>

<!DOCTYPE html>
<html>

<head>
    <title>Travler : <%=URLDecoder.decode(title, "UTF-8") %></title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="style.css?after">
</head>

<body>

	<header>
	    	<jsp:include page="header.jsp" flush="false" />
	</header>
	
	<div id="content">
		<jsp:include page="<%=contentPage%>" flush="false" />
	</div>
	
	<footer>
		<jsp:include page="footer.jsp" flush="false" />
	</footer>
	
</body>

</html>