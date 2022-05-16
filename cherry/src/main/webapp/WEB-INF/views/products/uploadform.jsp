<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/navbar.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/footer.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/base.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/main.css" />
<script src="${pageContext.request.contextPath }/resources/js/navbar.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/uploadform.css" />
</head>
<body>
	<jsp:include page="/include/navbar.jsp"></jsp:include>
	<div id="m1">
		<div id="m2">
			<div id="formDiv">
				<div>
					<h3>상품판매등록</h3>
				</div>
				<hr style="border: solid 1px black" />
				<form action="goodsupload.do" method="post"
					enctype="multipart/form-data" id="addForm">
					<div class="inputDiv">
						<label for="title">제목</label> <input type="text" id="title"
							name="title" />
					</div>
					<hr />
					<div class="inputDiv">
						<label for="price">가격</label> <input type="number" id="price"
							name="price" />
					</div>
					<hr />
					<div class="inputDiv">
						<label for="category">카테고리</label> <select name="category"
							id="category">
							<option value="선택">선택</option>
							<option value="디지털기기">디지털기기</option>
							<option value="생활가전">생활가전</option>
							<option value="가구/인테리어">가구/인테리어</option>
							<option value="스포츠/레저">스포츠/레저</option>
							<option value="여성패션">여성패션</option>
							<option value="남성패션">남성패션</option>
							<option value="게임/취미">게임/취미</option>
							<option value="뷰티/미용">뷰티/미용</option>
							<option value="반려동물">반려동물</option>
							<option value="도서/티켓/음반">도서/티켓/음반</option>
							<option value="기타">기타</option>
							<option value="삽니다">삽니다</option>
						</select>
					</div>
					<hr />
					<div class="inputDiv">
						<label for="picture">사진등록</label>
						<div>
							<button id="addBtn">+</button>
							<small>&emsp;최대 5장 등록가능</small> <br />
							<div id="imgDiv">
								<input type="file" id="addImage" class="imageInputs"
									onchange="inputChange()"
									accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif" />
							</div>
						</div>
					</div>
					<hr />
					<div class="inputDiv">
						<div>
							<label for="explanation">설명</label><br /> <small id="charNum">0자/2000자</small>
						</div>
						<textarea name="explanation" id="explanation" cols="30" rows="15"
							maxlength="2000"></textarea>
					</div>
				</form>
				<div id="buttonDiv">
					<button id="submitBtn">등록하기</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath }/resources/js/uploadform.js"></script>
</body>
</html>