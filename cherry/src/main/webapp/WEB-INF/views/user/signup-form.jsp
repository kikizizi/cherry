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
small{
	font-size:11px;
}
</style>
</head>
<body>
	<div id="main">
		<div id="brand">
			<a href="home.do"> <b>CHERRY</b><br /> <b>Market</b></a>
		</div>
		<form action="signup.do" method='post' >
			<div>
				<label for="id"><b>아이디</b></label> <br /> <input type="text" class="form-control"
					id="id" name="id" maxlength='15' />
				<small>영소문자로 시작하고 숫자를 포함하는 5~15글자</small>
			</div>
			<div>
				<label for="pwd"><b>비밀번호</b></label> <br /> <input type="password" class="form-control"
					id="pwd" name="pwd" />
				<small>특수문자,숫자,영문을 최소 1회씩 포함한 8~16글자</small>
			</div>
			<div>
				<label for="pwd2"><b>비밀번호 확인</b></label> <br /> <input
					type="password" class="form-control" id="pwd2" name="pwd2" />
			</div>
			<div>
				<label for="email"><b>이메일</b></label> <br /> <input type="email" class="form-control"
					id="email" name="email" />
			</div>
			<button id="submitBtn">SIGN UP</button>
		</form>
	</div>
	<script>
		let idPass = false;
		let pwdPass = false;
		let emailPass = false;
		$('#id').keyup(function(e) {
			$('#id').removeClass('is-invalid');
			$('#id').removeClass('is-valid');
			let inputId = this.value;
			const reg_id = /^[a-z]+[a-z0-9]{4,14}$/;
			if (!reg_id.test(inputId)) {
				idPass = false;
				$('#id').addClass('is-invalid');
				return;
			}
			$.ajax({
				url:"checkId.do",
				data:{"id":inputId},
				method:"GET",
				dataType:"json"
			})
			.done(function(data){
				if (data){
					console.log(data);
					idPass=false;
					$('#id').addClass('is-invalid');
					return;
				}
			})
			$('#id').addClass('is-valid');
			idPass=true;
		})
		let checkPwd=function(){
			$('#pwd').removeClass('is-invalid');
			$('#pwd').removeClass('is-valid');
			$('#pwd2').removeClass('is-invalid');
			$('#pwd2').removeClass('is-valid');
			let pwd=$('#pwd').val()
			let pwd2=$('#pwd2').val()
			const reg_pwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
			if(!reg_pwd.test(pwd)){
				pwdPass=false;
				$('#pwd').addClass('is-invalid');
				$('#pwd2').addClass('is-invalid');
				return;
			}
			$('#pwd').addClass('is-valid');
			if (pwd!=pwd2){
				$('#pwd2').addClass('is-invalid');
			}else{
				$('#pwd2').addClass('is-valid');
				pwdPass=true;
			}
		}
		$('#pwd').keyup(checkPwd)
		$('#pwd2').keyup(checkPwd)
		$('#email').keyup(function(){
			$('#email').removeClass('is-invalid');
			$('#email').removeClass('is-valid');
			let email=$('#email').val()
			const reg_email=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(!reg_email.test(email)){
				emailPass=false;
				$('#email').addClass('is-invalid');
				return;
			}
			emailPass=true;
			$('#email').addClass('is-valid')
		})
		$('#submitBtn').click(function(e){
			e.preventDefault();
			if(idPass&&pwdPass&&emailPass){
				swal("회원가입 되었습니다")
				.then(()=>{
					$('form').submit();	
				})
			}
		})
		
		
	</script>
</body>
</html>