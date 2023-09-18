<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@ include file="layout/db_connect.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>골프연습장 회원관리 프로그램</title>
	<link rel="stylesheet" href="css/style.css?ver1.3">
	<script type="text/javascript">
	function fn_submit(){
		var fn = document.data;
		
		if(fn.regist_month.value === ""){
			alert("수강월을 입력해주세요!");
			fn.regist_month.focus();
			return false;
		}
		if(fn.c_no.value === ""){
			alert("회원명을 선택해주세요!");
			fn.c_name.focus();
			return false;
		}
		if(fn.class_area.value === ""){
			alert("강의장소를 선택해주세요!");
			fn.class_area.focus();
			return false;
		}
		if(fn.tuition.value === ""){
			alert("강의명을 선택해주세요!");
			fn.teacher_code.focus();
			return false;
		}
		
		alert("수강신청이 정상적으로 완료되었습니다!")
		
	}
	function fn_reset(){
		
		if(confirm("정보를 지우고 처음부터 다시 입력합니다!")){
			location="join.jsp";
		}
	}
	function fn_change1(){ 
		var fn = document.data;
		
		
		fn.tuition.value = ""; //회원별 할인률을 적용해야하므로 수강료 초기화
		fn.teacher_code.options[0].selected = true; //셀렉트박스 초기화
		
		
		fn.c_no.value = fn.c_name.value; //회원번호 넣어주기
		
	}
	function fn_change2(){ 
		var fn = document.data;
		var price = fn.teacher_code.value * 1000; //수강료
		var c_no = fn.c_no.value; // 회원번호 20000이상 50%할인
		
		if(c_no >= 20000) price *= 0.5; //50% 할인
		
		fn.tuition.value = price; //수강료 넣어주기
	}
	function fn_teacher() {
		
		location.href="t_search.jsp";
	}
	</script>
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	
	<main id="section">
		<h3 class="title">수강신청</h3>
			<form name="data" method="post" action="join_p.jsp" >
				<table class="table_line">
					<tr>
						<th>수강월</th>
						<td>
							<input type="text" name="resist_month" maxlength="6">2022년03월 예)202203</td>
					</tr>
					<tr>
						<th>회원명</th>
						<td>
							<select name="c_name" onchange="fn_change1();">
								<option value="">회원명</option>
								<option value="10001">홍길동</option>			
								<option value="10002">장발장</option>			
								<option value="10003">임꺽정</option>			
								<option value="20001">성춘향</option>			
								<option value="20002">이몽룡</option>			
							</select>		
						</td>
					</tr>
					<tr>
						<th>회원번호</th>
						<td><input type="text" name="c_no" readonly>예)10001</td> 
					</tr>
					<tr>
						<th>강의장소</th>
						<td>
							<select name="class_area">
								<option value="">강의장소</option>
								<option value="서울본원">서울본원</option>
								<option value="성남분원">성남분원</option>
								<option value="대전분원">대전분원</option>
								<option value="부산분원">부산분원</option>
								<option value="대구분원">대구분원</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>강의명</th>
						<td>
							<select name="teacher_code" onchange="fn_change2();">
								<option value="">강의신청</option>
								<option value="100">초급반</option>
								<option value="200">중급반</option>
								<option value="300">고급반</option>
								<option value="400">심화반</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>수강료</th>
						<td><input type="text" name="tuition" readonly>원</td>
					</tr>
					<tr>
						<td style="text-align:center;" colspan="2">
							<input type="submit" value="수강신청">
							<input type="button" value="다시쓰기" onclick="fn_reset();">
							<input type="button" value="강사조회" onclick="fn_teacher();">
						</td>			
					</tr>		
				</table>
			</form>
	</main>
	
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>