<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="https://fonts.googleapis.com/css?family=Varela+Round"
	rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
/* 기본 효과 없앰 */
a:visited {
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

a:link {
	text-decoration: none;
}

input:focus {
	outline: none;
}

body {
	background-color: #ff003b1a;
	font-family: 'Varela Round', sans-serif;
}

#main {
	width: 400px;
	margin: auto;
	margin-top: 120px;
}

#main div {
	margin-top: 30px;
}

input {
	margin-top: 10px;
	width: 390px;
	height: 40px;
	font-size: 18px;
	border: solid 0.5px #808080bf;
	padding-left: 10px;
	border-radius: 3px;
}

#brand {
	text-align: center;
}

#brand a {
	line-height: 0.9;
	font-weight: bold;
	color: #ff003b;
	font-size: 36px;
}

button {
	margin-top: 30px;
	font-size: 17px;
	width: 400px;
	height: 50px;
	background-color: #ff4973;
	color: white;
	border: none;
	border-radius: 5px;
}

p {
	color: red;
	font-size: 12px;
}
</style>
</head>
<body>
	<div id="main">
		<div id="brand">
			<a href="home.do"> <b>CHERRY</b><br /> <b>Market</b></a>
		</div>
		<c:choose>
			<c:when test="${param.url eq null }">
				<form action="home.do" method="post" id="mainform">
			</c:when>
			<c:otherwise>
				<form action="${param.url }" method="post" id="mainform">
			</c:otherwise>
		</c:choose>
		
			<div>
				<input type="text" id="id" name="id" placeholder="아이디" />
			</div>
			<div>
				<input type="password" id="pwd" name="pwd" placeholder="비밀번호" />
			</div>
			<p id="fail"></p>
			<button id="submitBtn">LOG IN</button>
		</form>
	</div>
	<script>
		$("#submitBtn").click(function(e) {
			e.preventDefault();
			$.ajax({
				url : "login.do",
				data : {
					"id" : $('#id').val(),
					"pwd" : $('#pwd').val()
				},
				method : "POST",
				dataType : "json"
			}).done(function(data) {
				if (data) {
					$("#mainform").submit();
				} else {
					$("#fail").html("아이디나 비밀번호가 올바르지 않습니다.");
				}
			})
		})
	</script>
</body>
</html>