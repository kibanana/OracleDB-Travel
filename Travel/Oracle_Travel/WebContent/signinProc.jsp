<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	String id = request.getParameter("signin_id");
	String pwd = request.getParameter("signin_pwd");
	
	Connection conn=null;
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	Boolean connect=false;
	PreparedStatement pstmt=null;

    ResultSet rs = null;
	 
	try{
	    Class.forName(driver);
	    conn=DriverManager.getConnection(url,"TRAVEL","travel");
	    connect=true;
	   
	    pstmt=conn.prepareStatement("SELECT COUNT(*) as CNT FROM TRAVEL.member WHERE ID=? and PWD=?"); //prepareStatement는 Statement와 다르게 ?로 지정된 값을 필요 할 때 마다 이용할수있다.
	    pstmt.setString(1, id);
	    pstmt.setString(2, pwd);
	    
	    rs=pstmt.executeQuery();
	    
	    rs.next();
	    
	    if(rs.getString("CNT").equals("1")) {
    		System.out.println("로그인 성공!");
	    	session.setAttribute("id", id);
	    	response.sendRedirect("index.jsp"); 
    	} else {
    		System.out.println("로그인 실패!");
    	}

	    out.println("<script>");
	    out.println("location.href='loginForm.jsp'"); 
	    out.println("</script>");
	    
	   }catch(Exception e){
	    	e.printStackTrace();
	   }
	
	if(connect){
		System.out.println("연결되었습니다");
	} else{
		System.out.println("연결에 실패했습니다");
	}
	
	 
%>
</body>
</html>