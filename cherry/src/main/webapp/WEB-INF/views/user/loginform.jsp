<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<form action="login.do" method="post">
		<div>
			<input type="text" id="id" name="id" placeholder="ID"/>
		</div>
		<div>
			<input type="password" id="pwd" name="pwd" placeholder="PASSWORD"/>
		</div>
		<button id="submitBtn">LOG IN</button>
	</form>
</div>
</body>
</html>