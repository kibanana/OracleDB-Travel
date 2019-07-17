<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<form class="frm_sign" action="signupProc.jsp" method="post" style="margin-left: auto; margin-right: auto; width: 40%;">
		<div class="wrap">
			<label>
				ID 
				<input type="text" name="signup_id">
			</label>
			
			<label>
				비밀번호 
				<input type="password" name="signup_pwd">
			</label>
			
			<label>
				이름
				<input type="text" name="signup_name">
			</label>
			
			<label>
				이메일
				<input type="email" name="signup_email">
			</label>
			
			<label>
				전화번호
				<input type="text" name="signup_phone" placeholder="'-' 를 제외하고 입력해주세요">
			</label>
			
			<input type="submit" class="btn btn-primary" value="회원가입">
		</div>
	</form>
</body>
</html>