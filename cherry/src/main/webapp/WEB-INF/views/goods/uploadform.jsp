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
<style>
#formDiv {
	padding: 10px;
}

.inputDiv {
	display: flex;
}

label {
	width: 85px;
}

#addBtn {
	color: #ff4973;
}

#imagesDiv {
	display: flex;
}

input[type=file] {
	display: none;
}

#submitBtn {
	font-size: 15px;
	height: 30px;
	background-color: #ff4973;
	color: white;
	border: none;
	border-radius: 5px;
	margin-top: 20px;
}

textarea {
	width: 86%;
	resize: none;
	outline: none;
}

#buttonDiv {
	width: 100%;
	text-align: center;
}

p {
	width: 100%;
	margin: 10px 0 0 0;
}
</style>
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
				<form action="goodsupload.do" method="post" enctype="multipart/form-data"
					id="addForm">
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
	<script>
		let img_num = 0;
		$("#addBtn").click(function(e) {
			e.preventDefault();
			if ($('.imageInputs').length < 6) {
				$("#addImage").trigger("click");
			}
		})
		function inputChange() {
			var fileInput = document.getElementById("addImage");
			var file_name = fileInput.files[0].name // 파일명
			new_p = document.createElement('p');
			new_p.innerText = file_name + ' ';
			new_p.setAttribute('class', 'img' + img_num);
			new_b = document.createElement('button');
			new_b.setAttribute('class', 'img' + img_num);
			new_b.setAttribute("onclick", "delClass('img" + img_num + "')");
			new_b.setAttribute('type', 'button');
			new_b.innerText = 'x';
			new_p.appendChild(new_b);
			$('#imgDiv').append(new_p);
			$('#addImage').attr('class', 'imageInputs img' + img_num);
			$('#addImage').removeAttr('id');
			var new_input = document.createElement('input');
			new_input.setAttribute('type', 'file');
			new_input.setAttribute('id', 'addImage');
			new_input.setAttribute('class', 'imageInputs');
			new_input.setAttribute('onchange', 'inputChange()')
			new_input.setAttribute('accept',
					'.jpg, .jpeg, .png, .JPG, .JPEG, .gif');
			$('#imgDiv').append(new_input);
			img_num += 1
		}
		var delClass = function(c) {
			$('.' + c).remove();
		}
		$('#submitBtn').click(function(e) {
			e.preventDefault();

			let imgs = $('.imageInputs');
			for (let i = 0; i < imgs.length; i++) {
				imgs[i].setAttribute('name', 'img' + i);
			}
			$('#addImage').remove();
			$('#addForm').submit();
		})
		$('#explanation').keyup(function() {
			$('#charNum').text($('#explanation').val().length+'자/2000자');
		})
	</script>
</body>
</html>