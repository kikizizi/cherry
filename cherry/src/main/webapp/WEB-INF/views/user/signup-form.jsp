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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/base.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/signup_form.css" />
</head>
<body>
	<div id="main">
		<div id="brand">
			<a href="home.do"> <b>CHERRY</b><br /> <b>Market</b></a>
		</div>
		<form action="signup.do" method='post'>
			<div>
				<label for="id"><b>아이디</b></label> <br /> <input type="text"
					class="form-control" id="id" name="id" maxlength='15' /> <small>영소문자로
					시작하고 숫자를 포함하는 5~15글자</small>
			</div>
			<div>
				<label for="pwd"><b>비밀번호</b></label> <br /> <input type="password"
					class="form-control" id="pwd" name="pwd" /> <small>특수문자,숫자,영문을
					최소 1회씩 포함한 8~16글자</small>
			</div>
			<div>
				<label for="pwd2"><b>비밀번호 확인</b></label> <br /> <input
					type="password" class="form-control" id="pwd2" name="pwd2" />
			</div>
			<!-- 
			<div>
				<label for="email"><b>이메일</b></label> <br /> <input type="email"
					class="form-control" id="email" name="email" />
			</div>
			 -->
			<button id="submitBtn">SIGN UP</button>
		</form>
	</div>
	<script
		src="${pageContext.request.contextPath }/resources/js/signup_form.js"></script>
</body>
</html>