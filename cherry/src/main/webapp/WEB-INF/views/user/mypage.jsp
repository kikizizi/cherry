<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체리마켓</title>
<!-- 공통 -->
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<!-- 공통끝 -->
<style>
#m3 {
	width: 800px;
	margin-top: 35px;
	border-radius: 10px;
	margin-bottom: 30px;
	border: solid 0.5px #80808026;
}

.moreDiv {
	height: 50px;
	border-top: solid 0.5px #80808026;
}

.moreDiv p {
	text-align: center;
	color: #80808094;
	font-size: 15px;
	margin-top: 14px;
}

img {
	width: 200px;
	height: 150px;
	border-radius: 8px;
	object-fit: cover;
}

.title {
	text-overflow: ellipsis;
	font-weight: 600;
	margin: 7px 0px 0px;
	color: black;
}

.priceWon {
	color: #ff003b;
	font-weight: 600;
	margin: 5px 0px 0px;
}

.productsArticle {
	display: inline-block;
	margin: 15px 21px;
}

#productsDiv {
	padding: 30px;
}

#noSearch {
	height: 580px;
	text-align: center;
	padding-top: 190px;
	font-size: 16px;
}

.wishCount {
	color: black;
	font-size: 14px;
	float: right;
}

.head {
	margin: 10px 0px 0px 10px;
	font-weight: bold;
}

hr {
	margin: 6px 0px 0 0px;
}

.inner {
	padding:10px 30px;
}
</style>
</head>
<body>
	<jsp:include page="/include/navbar.jsp"></jsp:include>
	<div id="m1">
		<div id="m1_1">
			<div id="m2">
				<p class="head">Wish List</p>
				<hr />
				<div class="inner" id="myWish">
					<c:forEach var="dto" items="${myWish.list}">
						<a href="detail.do?num=${dto.num }">
							<article class="productsArticle">
								<img
									src="${pageContext.request.contextPath }${dto.imgPathList[0]}"
									alt="" />
								<p class="title">${dto.title}</p>
								<p class="priceWon">${dto.priceWon }</p>
							</article>
						</a>
					</c:forEach>
				</div>
				<c:if test="${!myWish.isEnd}">
					<div class="moreDiv" id="moreWishDiv">
						<p id="moreWish">더보기</p>
						<p id="myWishNum" style="display: none;">${myWish.lastnum}</p>
					</div>
				</c:if>
			</div>
			<div id="m3">
				<p class="head">My Goods</p>
				<hr />
				<div class="inner" id="myProducts">
					<c:forEach var="dto" items="${myPro.list}">
						<a href="detail.do?num=${dto.num }">
							<article class="productsArticle">
								<img
									src="${pageContext.request.contextPath }${dto.imgPathList[0]}"
									alt="" />
								<p class="title">${dto.title}</p>
								<p class="priceWon">${dto.priceWon }</p>
							</article>
						</a>
					</c:forEach>
				</div>
				<c:if test="${!myPro.isEnd}">
					<div class="moreDiv" id="moreProDiv">
						<p id="moreProducts">더보기</p>
						<p id="myProNum" style="display: none;">${myPro.lastnum}</p>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	<script>
	$(document).ready(function() {
		$('#moreProducts').click(function() {
			$.ajax({
				url : "moreMyPro",
				data : {
					"num" : $("#myProNum").text()
				},
				method : 'GET',
				dataType : 'json'
			}).done(function(data) {
				console.log(data.isEnd)
				if (data.isEnd) {
					$('#moreProDiv').attr("style", "display:none;");
				}
				$("#myProNum").html(data.lastnum);
				for (const item of data.list){
					const new_a=document.createElement('a');
					new_a.setAttribute('href',"detail.do?num="+item.num);
					const new_article=document.createElement('article');
					new_article.setAttribute('class','productsArticle');
					const new_img=document.createElement('img');
					new_img.setAttribute('src','/cherry'+item.imgPathList[0]);						
					const new_title=document.createElement('p');
					new_title.innerText=item.title;
					new_title.setAttribute('class','title');
					const new_price=document.createElement('p');
					new_price.innerText=item.priceWon;
					new_price.setAttribute('class','priceWon');
					new_article.append(new_img,new_title,new_price);
					new_a.append(new_article);
					$('#myProducts').append(new_a);
				}
			})
		})
		$('#moreWish').click(function() {
			$.ajax({
				url : "moreWish",
				data : {
					"num" : $("#myWishNum").text()
				},
				method : 'GET',
				dataType : 'json'
			}).done(function(data) {
				if (data.isEnd) {
					$('#moreWishDiv').attr("style", "display:none;");
				}
				$("#myWishNum").html(data.lastnum);
				for (const item of data.list){
					const new_a=document.createElement('a');
					new_a.setAttribute('href',"detail.do?num="+item.num);
					const new_article=document.createElement('article');
					new_article.setAttribute('class','productsArticle');
					const new_img=document.createElement('img');
					new_img.setAttribute('src','/cherry'+item.imgPathList[0]);						
					const new_title=document.createElement('p');
					new_title.innerText=item.title;
					new_title.setAttribute('class','title');
					const new_price=document.createElement('p');
					new_price.innerText=item.priceWon;
					new_price.setAttribute('class','priceWon');
					new_article.append(new_img,new_title,new_price);
					new_a.append(new_article);
					$('#myWish').append(new_a);
				}
			})
		})
	})
	</script>
	<script
		src="${pageContext.request.contextPath }/resources/js/navbarsock.js"></script>
</body>
</html>