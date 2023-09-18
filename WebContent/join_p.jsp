<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@ include file="layout/db_connect.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String sql = "insert into tbl_class_202201 values(?, ?, ?, ?, ?)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, request.getParameter("resist_month"));
	pstmt.setString(2, request.getParameter("c_no"));
	pstmt.setString(3, request.getParameter("class_area"));
	pstmt.setString(4, request.getParameter("tuition"));
	pstmt.setString(5, request.getParameter("teacher_code"));
	
	pstmt.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>골프연습장 회원관리 프로그램</title>
</head>
<body>
	<jsp:forward page="join.jsp"></jsp:forward>
</body>
</html>