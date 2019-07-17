<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
String userid = null;

if (session.getAttribute("id") != null) {
	System.out.println("로그인 되어있습니다");
	userid = (String) session.getAttribute("id"); //로그인을 성공적으로 수행하면 메인창 입장.
%>
<div>
	<form class="frm_sign" action="signoutProc.jsp" method="post">
		<input type="submit" class="btn btn-default" value="로그아웃">
	</form>
</div>
<% 
} else {
	System.out.println("로그인 해주십시오");
%>

<div class="sign_box">
	<form class="frm_sign" action="signinProc.jsp" method="post">
		<div class="wrap">
			<label>
				ID 
				<input type="text" name="signin_id">
			</label>
			
			<label>
				비밀번호 
				<input type="password" name="signin_pwd">
			</label>
			
			<input type="submit" class="btn btn-primary" value="로그인">
			
			<a href="signup.jsp" style="display:block;">
				<input type="button" class="btn btn-default" value="회원가입" style="width: 100%; height: 40px; padding: 5px;">
			</a>
		</div>
	</form>
</div>
<%
}
%>
</body>
</html>