<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@ include file="layout/db_connect.jsp" %>
<%
	String sql = "select teacher_code, teacher_name, class_name, "
	           + "       '₩ '||to_char(to_number(class_price),'999,999') c_price, "
	           + "       substr(teacher_resist_date,1,4)||'년'||"
	           + "       substr(teacher_resist_date,5,2)||'월'||"
	           + "       substr(teacher_resist_date,7,2)||'일' t_date "
	           + "	from tbl_teacher_202201";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>골프연습장 회원관리 프로그램</title>
	<link rel="stylesheet" href="css/style.css?ver1.3">
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	
	<main id="section">
		<h3 class="title">강사조회</h3>
			<table class="table_line">
				<tr>
					<th>강사코드</th>
					<th>강사명</th>
					<th>강의명</th>
					<th>수강료</th>
					<th>강사자격취득일</th>
				</tr>
			<%
				while(rs.next()) {
			%>
				<tr align = "center">
					<td><%= rs.getString("teacher_code") %></td>
					<td><%= rs.getString("teacher_name") %></td>
					<td><%= rs.getString("class_name") %></td>
					<td><%= rs.getString("c_price") %></td>
					<td><%= rs.getString("t_date") %></td>
				</tr>
			<%
				}
			%>
			</table>
	</main>
	
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>