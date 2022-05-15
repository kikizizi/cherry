<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/navbar.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/footer.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/base.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/main.css" />
<script src="${pageContext.request.contextPath }/resources/js/navbar.js"></script>
<style>
#moreDiv {
	height: 50px;
	border-top: solid 0.5px #80808026;
}

#moreProducts {
	text-align: center;
	color: #80808094;
	font-size: 15px;
	margin-top: 14px;
}
img{
	width:200px;
	height:200px;
	border-radius:8px;
}
.title{
	text-overflow: ellipsis;
	font-weight: 600;
	margin: 7px 0px 0px;
}
.priceWon{
	color:#ff003b;
	font-weight: 600;
	margin: 5px 0px 0px;
}
.productsArticle{
	display:inline-block;
	margin:10px 21px;
}
#productsDiv{
	padding:30px;
}
#noSearch{
	height:580px;
	text-align:center;
	padding-top: 190px;
  font-size: 16px;
}
</style>
</head>
<body>
	<jsp:include page="/include/navbar.jsp"></jsp:include>
	<div id="m1">
		<div id="m2">
			<div id="productsDiv">
				<c:choose>
					<c:when test="${fn:length(list) == 0 }">
						<div id="noSearch">
							<p>
								<strong>'${param.search} '</strong>에 대한 검색결과가 없습니다.
							</p>
							<p>검색어를 다시 확인해주세요.</p>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="dto" items="${list }">
							<article class="productsArticle">
								<img src="${pageContext.request.contextPath }${dto.imgPathList[0]}" alt="" />
								<p class="title">${dto.title}</p>
								<p class="priceWon">${dto.priceWon }</p>
							</article>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<c:if test="${!isEnd}">
				<div id="moreDiv">
					<p id="moreProducts">더보기</p>
				</div>
			</c:if>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	<script>
		$(document).ready(function() {
			var lastnum = ${lastnum};
			$('#moreProducts').click(function() {
				$.ajax({
					url : "moreProducts.do",
					data : {
						"category" : $('#category').val(),
						"search" : $('#search').val(),
						"num" : lastnum
					},
					method : 'GET',
					dataType : 'json'
				}).done(function(data) {
					console.log(data.lastnum);
					console.log(data.list);
					console.log(data.isEnd);
					if (data.isEnd) {
						$('#moreDiv').attr("style", "display:none;");
					}
					lastnum = data.lastnum;
					for (const item of data.list){
						const new_article=document.createElement('article');
						new_article.setAttribute('class','productsArticle');
						const new_img=document.createElement('img');
						new_img.setAttribute('src','${pageContext.request.contextPath }'+item.imgPathList[0]);						
						const new_title=document.createElement('p');
						new_title.innerText=item.title;
						new_title.setAttribute('class','title');
						const new_price=document.createElement('p');
						new_price.innerText=item.priceWon;
						new_price.setAttribute('class','priceWon');
						new_article.append(new_img,new_title,new_price);
						$('#productsDiv').append(new_article);
					}
				})
			})
		})
	</script>
</body>
</html>