<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("signup_id");
	String pwd = request.getParameter("signup_pwd");
	String name = request.getParameter("signup_name");
	String email = request.getParameter("signup_email");
	String phone = request.getParameter("signup_phone");
	
	SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String joinDate = f.format(new Date());
	Timestamp ts = new Timestamp(0).valueOf(joinDate);
	
	Connection conn=null;
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	Boolean connect=false;
	PreparedStatement pstmt=null;
	
	try{
	   Class.forName(driver);
	   conn=DriverManager.getConnection(url,"TRAVEL","travel");
	   connect=true;
	   
	    pstmt=conn.prepareStatement("INSERT INTO TRAVEL.member(ID, PWD, NAME, EMAIL, PHONE, JOINDATE) VALUES(?, ?, ?, ?, ?, ?)"); // 커넥션풀 방식
	    pstmt.setString(1, id);
	    pstmt.setString(2, pwd);
	    pstmt.setString(3, name);
	    pstmt.setString(4, email);
	    pstmt.setString(5, phone);
	    pstmt.setTimestamp(6, ts);
	    
	    System.out.println("---------------------result------------------");
	    
	    int result = pstmt.executeUpdate();
	    
	    if(result!=0){
	       System.out.println("회원가입에 성공했습니다.");
	       out.println("<script>");
	       out.println("location.href='index.jsp'"); // 회원가입 성공
	       out.println("</script>");
	    } else {
	       System.out.println("회원가입에 실패했습니다.");
	       out.println("<script>");
	       out.println("location.href='signup.jsp'"); // 회원가입 실패
	       out.println("</script>");
	    }
	    
	   // conn.close();
	}catch(Exception e){
	   connect=false;
	   e.printStackTrace();
	}
	
	if(connect){
		System.out.println("연결되었습니다");
	} else{
		System.out.println("연결에 실패했습니다");
	}
	
	response.sendRedirect("index.jsp"); 
%>

</body>
</html>