<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체리마켓</title>
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>

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
.carousel {
	position: relative;
}

.carousel.pointer-event {
	touch-action: pan-y;
}

.carousel-inner {
	position: relative;
	width: 100%;
	overflow: hidden;
}

.carousel-inner::after {
	display: block;
	clear: both;
	content: "";
}

.carousel-item {
	position: relative;
	display: none;
	float: left;
	width: 100%;
	margin-right: -100%;
	-webkit-backface-visibility: hidden;
	backface-visibility: hidden;
	transition: transform 0.6s ease-in-out;
}

@media ( prefers-reduced-motion : reduce) {
	.carousel-item {
		transition: none;
	}
}

.carousel-item.active, .carousel-item-next, .carousel-item-prev {
	display: block;
}

/* rtl:begin:ignore */
.carousel-item-next:not(.carousel-item-start), .active.carousel-item-end
	{
	transform: translateX(100%);
}

.carousel-item-prev:not(.carousel-item-end), .active.carousel-item-start
	{
	transform: translateX(-100%);
}

/* rtl:end:ignore */
.carousel-fade .carousel-item {
	opacity: 0;
	transition-property: opacity;
	transform: none;
}

.carousel-fade .carousel-item.active, .carousel-fade .carousel-item-next.carousel-item-start,
	.carousel-fade .carousel-item-prev.carousel-item-end {
	z-index: 1;
	opacity: 1;
}

.carousel-fade .active.carousel-item-start, .carousel-fade .active.carousel-item-end
	{
	z-index: 0;
	opacity: 0;
	transition: opacity 0s 0.6s;
}

@media ( prefers-reduced-motion : reduce) {
	.carousel-fade .active.carousel-item-start, .carousel-fade .active.carousel-item-end
		{
		transition: none;
	}
}

.carousel-control-prev, .carousel-control-next {
	position: absolute;
	top: 0;
	bottom: 0;
	z-index: 1;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 15%;
	padding: 0;
	color: #fff;
	text-align: center;
	background: none;
	border: 0;
	opacity: 0.5;
	transition: opacity 0.15s ease;
}

@media ( prefers-reduced-motion : reduce) {
	.carousel-control-prev, .carousel-control-next {
		transition: none;
	}
}

.carousel-control-prev:hover, .carousel-control-prev:focus,
	.carousel-control-next:hover, .carousel-control-next:focus {
	color: #fff;
	text-decoration: none;
	outline: 0;
	opacity: 0.9;
}

.carousel-control-prev {
	left: 0;
}

.carousel-control-next {
	right: 0;
}

.carousel-control-prev-icon, .carousel-control-next-icon {
	display: inline-block;
	width: 2rem;
	height: 2rem;
	background-repeat: no-repeat;
	background-position: 50%;
	background-size: 100% 100%;
}

/* rtl:options: {
  "autoRename": true,
  "stringMap":[ {
    "name"    : "prev-next",
    "search"  : "prev",
    "replace" : "next"
  } ]
} */
.carousel-control-prev-icon {
	background-image:
		url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23fff'%3e%3cpath d='M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z'/%3e%3c/svg%3e");
}

.carousel-control-next-icon {
	background-image:
		url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23fff'%3e%3cpath d='M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e");
}

.carousel-indicators {
	position: absolute;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 2;
	display: flex;
	justify-content: center;
	padding: 0;
	margin-right: 15%;
	margin-bottom: 1rem;
	margin-left: 15%;
	list-style: none;
}

.carousel-indicators [data-bs-target] {
	box-sizing: content-box;
	flex: 0 1 auto;
	width: 30px;
	height: 3px;
	padding: 0;
	margin-right: 3px;
	margin-left: 3px;
	text-indent: -999px;
	cursor: pointer;
	background-color: #fff;
	background-clip: padding-box;
	border: 0;
	border-top: 10px solid transparent;
	border-bottom: 10px solid transparent;
	opacity: 0.5;
	transition: opacity 0.6s ease;
}

@media ( prefers-reduced-motion : reduce) {
	.carousel-indicators [data-bs-target] {
		transition: none;
	}
}

.carousel-indicators .active {
	opacity: 1;
}

.carousel-caption {
	position: absolute;
	right: 15%;
	bottom: 1.25rem;
	left: 15%;
	padding-top: 1.25rem;
	padding-bottom: 1.25rem;
	color: #fff;
	text-align: center;
}

.carousel-dark .carousel-control-prev-icon, .carousel-dark .carousel-control-next-icon
	{
	filter: invert(1) grayscale(100);
}

.carousel-dark .carousel-indicators [data-bs-target] {
	background-color: #000;
}

.carousel-dark .carousel-caption {
	color: #000;
}

.d-block {
	display: block !important;
}

.w-100 {
	width: 100% !important;
}

.d-none {
	display: none !important;
}

.d-md-block {
	display: block !important;
}

.visually-hidden, .visually-hidden-focusable:not(:focus):not(:focus-within)
	{
	position: absolute !important;
	width: 1px !important;
	height: 1px !important;
	padding: 0 !important;
	margin: -1px !important;
	overflow: hidden !important;
	clip: rect(0, 0, 0, 0) !important;
	white-space: nowrap !important;
	border: 0 !important;
}

#imgs {
	margin: 25px 100px 0px 100px;
	width: 600px;
	height: 400px;
	z-index: 0;
	text-align: center;
}

.carousel-img {
	height: 400px;
	border-radius: 10px;
	object-fit: contain;
	border-radius: 10px;
}

#m2 {
	border: none;
}

#detail {
	margin: 25px 100px 0px 100px;
	width: 600px;
}

small {
	color: #868e96;
}

#title {
	margin-bottom: 0px;
	font-size: 20px;
	font-weight: 600;
}

#priceWon {
	margin-top: 3px;
	font-weight: bold;
	font-size: 18px;
}

#explanation {
	font-size: 16px;
}

#heart {
	
}

#chat {
	margin: 0 0 2px 10px;
}
</style>
</head>
<body>
	<jsp:include page="/include/navbar.jsp"></jsp:include>
	<div id="m1">
		<div id="m2">
			<div id="imgs">
				<div id="carouselExampleDark" class="carousel carousel-dark slide"
					data-bs-ride="false">
					<div class="carousel-inner">
						<c:forEach var="img" items="${dto.imgPathList }"
							varStatus="status">
							<c:choose>
								<c:when test="${status.first }">
									<div class="carousel-item active">
										<img src="${pageContext.request.contextPath }${img}"
											class="d-block w-100 carousel-img" alt="...">
									</div>
								</c:when>
								<c:otherwise>
									<div class="carousel-item">
										<img src="${pageContext.request.contextPath }${img}"
											class="d-block w-100 carousel-img" alt="...">
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleDark" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleDark" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
			<div id="detail">
				<c:choose>
					<c:when test="${dto.isWish == 1 }">
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
							fill="red" id="heart" class="hf" viewBox="0 0 16 16">
  <path fill-rule="evenodd"
								d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" /></svg>
					</c:when>
					<c:otherwise>
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
							fill="red" id="heart" class="he" viewBox="0 0 16 16">
  <path
								d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
</svg>
					</c:otherwise>
				</c:choose>

				<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
					fill="currentColor" id="chat" viewBox="0 0 16 16">
  <path
						d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
</svg>
				<form method="post" id="chatform" action="chatlist" >
					<input type="hidden" value="${dto.id }" id="listener" name="listener"/>
					<input type="hidden" value="" id="roomId" name="roomId" />
				</form>
				<hr style="margin-top: 0px" />
				<p id="title">${dto.title }</p>
				<small>${dto.category } | ${dto.regdate } | ${dto.id }님</small>
				<p id="priceWon">${dto.priceWon }</p>
				<p id="explanation">${dto.explanation }</p>
				<small>조회 ${dto.viewCount } | 관심 ${dto.wishCount }</small>
				<hr />
			</div>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	<script>
		$("#chat").click(function(){
			const id='${sessionScope.id}';
			if (id =="" || id=="${dto.id}"){
				return
			}
			idlist=["${dto.id}","${sessionScope.id}"];
			idlist.sort();
			roomId=idlist.join("_");
			$("#roomId").val(roomId);
			document.getElementById("chatform").submit(); 
		})
		
		$("#heart").click(function(){
			const id = '${sessionScope.id}';
			if (id == ""){
				return
			} else if (id=="${dto.id}"){
				return
			}
			let c_name=$("#heart").attr("class");
			if (c_name == "he"){
				$("#heart").html('<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>');
				$('#heart').attr('class','hf');
				$.ajax({
					url:'conWish.do',
					data:{
						"id":id,
						"num":${dto.num },
						"aord":true
					},
					method:'GET',
					dataType:'json'
				})
			} else{
				$("#heart").html('<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />');
				$('#heart').attr('class','he');
				$.ajax({
					url:'conWish.do',
					data:{
						"id":id,
						"num":${dto.num},
						"aord":false
					},
					method:'GET',
					dataType:'json'
				})
			}
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