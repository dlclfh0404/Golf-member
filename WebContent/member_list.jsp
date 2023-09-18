<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@ include file="layout/db_connect.jsp" %>
<%
	String sql = "select substr(a.resist_month,1,4)||'년'|| "
	           + "       substr(a.resist_month,5,2)||'월' t_date, "
	           + "       b.c_no, b.c_name, c.class_name, a.class_area, "
	           + "       '₩ '||to_char(to_number(c.class_price),'999,999') c_price, b.grade "
	           + "	from tbl_class_202201 a, tbl_member_202201 b, tbl_teacher_202201 c "
	           + "  	where a.c_no = b.c_no and a.teacher_code = c.teacher_code "
	           + "      	order by b.c_no , a.resist_month asc";
	
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
		<h3 class="title">회원정보조회</h3>
			<table class="table_line">
				<tr>
					<th>수강월</th>
					<th>회원번호</th>
					<th>회원명</th>
					<th>강의명</th>
					<th>강의장소</th>
					<th>수강료</th>
					<th>등급</th>
				</tr>
			<%
				while(rs.next()) {
			%>
				<tr align = "center">
					<td><%= rs.getString("t_date") %></td>
					<td><%= rs.getString("c_no") %></td>
					<td><%= rs.getString("c_name") %></td>
					<td><%= rs.getString("class_name") %></td>
					<td><%= rs.getString("class_area") %></td>
					<td><%= rs.getString("c_price") %></td>
					<td><%= rs.getString("grade") %></td>
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