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
<script
	src="${pageContext.request.contextPath }/resources/js/homeMorePro.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/home.css" />
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
					<p id="lastnum" style="display: none;">${lastnum}</p>
				</div>
			</c:if>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	<c:if test="${sessionScope.id ne null }">
		<script
			src="${pageContext.request.contextPath }/resources/js/navbarsock.js"></script>
	</c:if>
</body>
</html>