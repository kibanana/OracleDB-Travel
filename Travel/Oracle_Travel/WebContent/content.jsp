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
	System.out.println("�α��� �Ǿ��ֽ��ϴ�");
	userid = (String) session.getAttribute("id"); //�α����� ���������� �����ϸ� ����â ����.
%>
<div>
	<form class="frm_sign" action="signoutProc.jsp" method="post">
		<input type="submit" class="btn btn-default" value="�α׾ƿ�">
	</form>
</div>
<% 
} else {
	System.out.println("�α��� ���ֽʽÿ�");
%>

<div class="sign_box">
	<form class="frm_sign" action="signinProc.jsp" method="post">
		<div class="wrap">
			<label>
				ID 
				<input type="text" name="signin_id">
			</label>
			
			<label>
				��й�ȣ 
				<input type="password" name="signin_pwd">
			</label>
			
			<input type="submit" class="btn btn-primary" value="�α���">
			
			<a href="signup.jsp" style="display:block;">
				<input type="button" class="btn btn-default" value="ȸ������" style="width: 100%; height: 40px; padding: 5px;">
			</a>
		</div>
	</form>
</div>
<%
}
%>
</body>
</html>