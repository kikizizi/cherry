<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="https://fonts.googleapis.com/css?family=Varela+Round"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
	padding-left:10px;
	border-radius:3px;
}

#form {
	
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
button{
  margin-top: 60px;
  font-size: 17px;
  width: 400px;
  height: 50px;
  background-color: #ff4973;
  color: white;
  border: none;
  border-radius: 5px;
}
</style>
</head>
<body>
	<div id="main">
		<div id="brand">
			<a href="home.do"> <b>CHERRY</b><br /> <b>Market</b></a>
		</div>
		<form action="">
			<div>
				<label for="id"><b>아이디</b></label> <br /> <input type="text"
					id="id" name="id" maxlength='15'/>
			</div>
			<div>
				<label for="pwd"><b>비밀번호</b></label> <br /> <input type="password"
					id="pwd" name="pwd" />
			</div>
			<div>
				<label for="pwd2"><b>비밀번호 확인</b></label> <br /> <input
					type="password" id="pwd2" name="pwd2" />
			</div>
			<div>
				<label for="email"><b>이메일</b></label> <br /> <input type="email"
					id="email" name="email" />
			</div>
			<button id="submitBtn">SIGN UP</button>
		</form>
	</div>
</body>
</html>