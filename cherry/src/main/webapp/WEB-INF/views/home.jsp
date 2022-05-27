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
							<a href="detail.do?num=${dto.num }">
								<article class="productsArticle">
									<img
										src="${pageContext.request.contextPath }${dto.imgPathList[0]}"
										alt="" />
									<p class="title">${dto.title}</p>
									<p class="priceWon">${dto.priceWon }
										<c:if test="${dto.wishCount != 0 }">
											&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
											<small class="wishCount"><svg
													xmlns="http://www.w3.org/2000/svg" width="12" height="12"
													fill="red" class="bi bi-heart" viewBox="0 0 16 14">
  <path
														d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
</svg> ${dto.wishCount }</small>
										</c:if>
									</p>
								</article>
							</a>
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
					if (data.isEnd) {
						$('#moreDiv').attr("style", "display:none;");
					}
					lastnum = data.lastnum;
					for (const item of data.list){
						const new_a=document.createElement('a');
						new_a.setAttribute('href',"detail.do?num="+item.num);
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
						new_a.append(new_article);
						$('#productsDiv').append(new_a);
					}
				})
			})
		})
	</script>
	<script>
	//navbar chat 안읽음 표시
		var sock = new SockJS("/cherry/websocket");
		var client = Stomp.over(sock);
		client.connect({},function(){
			client.subscribe('/topic/getNotice/${sessionScope.id}',function(e){
				if ($("#chatCount").text()==""){
					$("#chatCount").text(0);
				}
				let count=$("#chatCount").text();
				$("#chatCount").text(Number(count)+1);
			})
		})
	</script>
</body>
</html>