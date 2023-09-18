<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@ include file="layout/db_connect.jsp" %>
<%
	String sql = "select a.teacher_code, a.class_name, "
	           + "	     a.teacher_name, '₩ '||substr(sum(b.tuition),1,3)||','||substr(sum(b.tuition),4,6) t_sales "
	           + "       from tbl_teacher_202201 a, tbl_class_202201 b "
	           + "       	where a.teacher_code = b.teacher_code "
	           + "       		group by a.teacher_code, a.class_name, a.teacher_name "
	           + "				 order by a.teacher_code";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>골프연습장 회원관리 프로그램</title>
	<link rel="stylesheet" href="css/style.css?ver1.6">
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	
	<main id="section">
		<h3 class="title">강사매출현황</h3>
			<table class="table_line">
				<tr>
					<th>강사코드</th>
					<th>강의명</th>
					<th>강사명</th>
					<th>총매출</th>
				</tr>
			<%
				while(rs.next()) {
			%>
				<tr align="center">
					<td><%= rs.getString("teacher_code") %></td>
					<td><%= rs.getString("class_name") %></td>
					<td class="table_td"><%= rs.getString("teacher_name") %></td>
					<td class="table_td"><%= rs.getString("t_sales") %></td>
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