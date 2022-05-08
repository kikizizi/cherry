<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체리마켓</title>
<link href="https://fonts.googleapis.com/css?family=Varela+Round"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	font-family: 'Varela Round', sans-serif;
}
/* navbar css*/
.navbar {
	background-color: white;
	height: 75px;
	text-align: center;
	width: 100%;
	border-bottom: solid 0.5px #80808026;
}

.navbar .navbar-brand {
	font-size: 25px;
	margin-top: -13px;
}

.navbar .navbar-brand b {
	line-height: 0.9;
	font-weight: bold;
	color: #ff003b;
}

.container-fluid {
	width: 1000px;
	display: flex;
	margin-top: 13px
}

#navli {
	width: 1000px;
	display: flex;
}

#navDiv {
	height: 75px;
	position: fixed;
	width: 100%;
}

.input-group {
	width: 400px;
	margin-top: 8px
}

.search-box {
	width: 100%;
	position: relative;
}

.search-box input {
	border-color: #dfe3e8;
	box-shadow: none
}

.search-box input, .search-box .btn {
	min-height: 38px;
	border-radius: 2px;
}

.search-box .input-group-btn .btn {
	border-color: #eb5844;
	outline: none;
}

.navbar ul li i {
	font-size: 18px;
	line-height: 16px;
}

.navbar .navbar-right .dropdown-toggle::after {
	display: none;
}

.dropdown-toggle {
	width: 80px;
	font-size: 12px;
	height: 34px;
}

.navbar .dropdown-menu {
	border-radius: 1px;
	border-color: #e5e5e5;
	box-shadow: 0 2px 8px rgba(0, 0, 0, .05);
}

.navbar .dropdown-menu li a {
	padding: 6px 20px;
}

.navbar .navbar-right .dropdown-menu {
	width: 400px;
	padding: 20px;
	left: auto;
	right: 0;
	font-size: 14px;
}

.hide {
	display: none !important;
}

@media ( max-width : 768px) {
	.navbar .navbar-right .dropdown-menu {
		width: 100%;
		background: transparent;
		padding: 10px 20px;
	}
	.navbar .input-group {
		width: 100%;
	}
	#textBox {
		width: 500px;
		height: 450px;
		overflow: auto;
		overflow-y: 450px;
	}
	.loginbar {
		width: 100%;
		float: right;
		display: inline-block;
	}
	select {
		width: 200px;
		padding: .8em .5em;
		border: 1px solid #999;
		font-family: inherit;
		background: url('arrow.jpg') no-repeat 95% 50%;
		border-radius: 0px;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
	}
	select::-ms-expand {
		display: none;
	}
}

#loginbar {
	height: 21.5px;
	background-color: #f7e3e5;
	text-align: center;
}

#loginbar a {
	color: white;
	font-size: 13px;
}

#btn-search {
	background-color: #ff4973;
}

#loginbar>div {
	width: 1000px;
	text-align: right;
	margin: auto;
}

#iconDiv {
	margin-top: 10px;
	text-align: right;
	width: 100%;
}

#iconDiv>div>a {
	color: #ff4973;
	margin-left: 20px
}
/* navbar css 끝*/
/* main content start */
#m1 {
	display: flex;
	justify-content: center;
}

#m2 {
	width: 800px;
	margin-top: 120px;
	border-radius: 10px;
	margin-bottom: 30px;
	border: solid 0.5px #80808026;
}
/* main content end */
/* footer css start */
#footerDiv {
	width: 100%;
	margin: 0px;
	background-color: #f7e3e5;
}

.footerLink {
	text-align: center;
	margin: 25px 0px 25px 0px;
}

#footer-brand {
	font-size: 25px;
}

#footer-brand b {
	line-height: 0.9;
	font-weight: bold;
	color: white;
}

#gitlink {
	color: white;
}
/* footer css end */
</style>
</head>
<body>

	<div id="navDiv">
		<div id="loginbar">
			<div>
				<a href="loginform.do">login</a>&emsp;<a href="signupform.do">signUp</a>
			</div>
		</div>
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container-fluid">
				<div class="navbar-brand">
					<a href="${pageContext.request.contextPath }/home.do"><b>CHERRY
							Market</b></a>
				</div>
					
				<div id="navli">
					
					<!-- 검색바 -->
					<form action="${pageContext.request.contextPath }/home.do">
						<div class="input-group">
							<div class="input-group-btn">
								<button type="button" class="btn btn-default dropdown-toggle"
									data-toggle="dropdown">
									<span id="srch-category">전체</span>
								</button>
								<ul class="dropdown-menu" id="categorySelect">
									<li><a href="" class="cm">전체</a></li>
									<li><a href="" class="cm">디지털기기</a></li>
									<li><a href="" class="cm">생활가전</a></li>
									<li><a href="" class="cm">가구</a></li>
									<li><a href="" class="cm">스포츠</a></li>
									<li><a href="" class="cm">여성패션</a></li>
									<li><a href="" class="cm">남성패션</a></li>
									<li><a href="" class="cm">게임/취미</a></li>
									<li><a href="" class="cm">뷰티/미용</a></li>
									<li><a href="" class="cm">반려동물</a></li>
									<li><a href="" class="cm">도서/음반</a></li>
									<li><a href="" class="cm">기타</a></li>
									<li><a href="" class="cm">삽니다</a></li>
								</ul>
							</div>
							<input type="hidden" id="category" name="category" value="전체">
							<input type="text" id="search" name="search" class="form-control"
								placeholder="Search for..."> <span
								class="input-group-btn">
								<button id="btn-search" type="submit" class="btn btn-default">
									<span class="glyphicon glyphicon-search" style="color: white;"></span>
								</button>
							</span>
						</div>
					</form>
					<div id="iconDiv">
						<div>
							<a href=""><svg xmlns="http://www.w3.org/2000/svg" width="30"
									height="30" fill="currentColor" class="bi bi-person-fill"
									viewBox="0 0 16 16">
		  <path
										d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
		</svg></a> <a href=""><svg xmlns="http://www.w3.org/2000/svg" width="28"
									height="28" fill="currentColor" class="bi bi-chat-fill"
									viewBox="0 0 16 16">
		  <path
										d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9.06 9.06 0 0 0 8 15z" />
		</svg> </a>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</div>
	<div id="m1">
		<div id="m2">
			<h1>${sessionScope.id}</h1>
			<h1>test</h1>
			<h1>test</h1>
			<h1>test</h1>
			<h1>test</h1>
			<h1>test</h1>
			<h1>test</h1>
			<h1>test</h1>
			<h1>test</h1>
			<h1>test</h1>
			<h1>test</h1>
			<h1>test</h1>
			<h1>test</h1>
			<h1>test</h1>
			<h1>test</h1>
			<h1>test</h1>
			<h1>test</h1>
			<h1>test</h1>
		</div>
	</div>
	<div class="container" id="footerDiv">
		<div class="footerLink">
			<a id="footer-brand"
				href="${pageContext.request.contextPath }/home.do"><b>CHERRYMarket</b></a>
		</div>
		<div class="footerLink">
			<a href="#" id="gitlink"><svg xmlns="http://www.w3.org/2000/svg"
					width="25" height="25" fill="currentColor" class="bi bi-github"
					viewBox="0 0 16 16">
  <path
						d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z" />
</svg></a>
		</div>
	</div>

	<script>
		//검색바
		//ㄴ 검색바 카테고리 선택시 변경기능
		let cate = document.querySelectorAll(".cm");
		for (let i = 0; i < cate.length; i++) {
			cate[i].addEventListener("click", function(e) {
				e.preventDefault();
				document.querySelector("#srch-category").innerText = this.text;
				document.querySelector("#category").value = this.text;
			})
		}
		//ㄴ 검색바 카테고리창 내리기 
		$(document).ready(function() {
			var dropdown = $(".navbar-right .dropdown");
			var toogleBtn = $(".navbar-right .dropdown-toggle");
			console.log(dropdown);
			// Toggle search and close icon for search dropdown
			dropdown.on("show.bs.dropdown", function(e) {
				toogleBtn.toggleClass("hide");
			});
			dropdown.on("hide.bs.dropdown", function(e) {
				toogleBtn.addClass("hide");
				toogleBtn.first().removeClass("hide");
			});
		});

	</script>
</body>
</html>