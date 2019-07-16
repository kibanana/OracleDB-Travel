<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    /* 한글 깨짐 방지 */
    request.setCharacterEncoding("UTF-8");

	Connection conn=null;
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	
	Boolean connect=false;
	
	try{
	   Class.forName(driver);
	   conn=DriverManager.getConnection(url,"TRAVEL","travel");
	   connect=true;
	   conn.close();
	}catch(Exception e){
	   connect=false;
	   e.printStackTrace();
	}
	
	if(connect){
		System.out.println("연결되었습니다");
	} else{
		System.out.println("연결에 실패했습니다");
	}
%>