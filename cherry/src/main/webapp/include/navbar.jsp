<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<div id="navDiv">
	<div id="loginbar">
		<div>
			<c:choose>
				<c:when test="${sessionScope.id eq null }">
					<a href="loginform.do">login</a>
					&emsp;
					<a href="signupform.do">signUp</a>
				</c:when>
				<c:otherwise>
					<a href="">${sessionScope.id}</a>
					&emsp;
					<a href="logout.do">logout</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<nav class="navbar navbar-expand-lg navbar-light">
		<div class="container-fluid">
			<div class="navbar-brand">
				<a href="${pageContext.request.contextPath }/home.do"><b>CHERRY</b><br />
					<b>Market</b></a>
			</div>

			<div id="navli">

				<!-- 검색바 -->
				<form action="${pageContext.request.contextPath }/home.do">
					<div class="input-group">
						<div class="input-group-btn">
							<button type="button" class="btn btn-default dropdown-toggle"
								data-toggle="dropdown">
								<c:choose>
									<c:when test="${param.category eq null}">
										<span id="srch-category">전체</span>
									</c:when>
									<c:otherwise>
										<span id="srch-category">${param.category }</span>
									</c:otherwise>
								</c:choose>
							</button>
							<ul class="dropdown-menu" id="categorySelect">
								<li><a href="" class="cm">전체</a></li>
								<li><a href="" class="cm">디지털기기</a></li>
								<li><a href="" class="cm">생활가전</a></li>
								<li><a href="" class="cm">가구</a></li>
								<li><a href="" class="cm">스포츠/레저</a></li>
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
						<c:choose>
							<c:when test="${param.category eq null}">
								<input type="hidden" id="category" name="category" value="전체">
							</c:when>
							<c:otherwise>
								<input type="hidden" id="category" name="category"
									value="${param.category }">
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${param.search eq null}">
								<input type="text" id="search" name="search"
									class="form-control" placeholder="Search for...">
							</c:when>
							<c:otherwise>
								<input type="text" id="search" name="search"
									class="form-control" value="${param.search }">
							</c:otherwise>
						</c:choose>
						<span class="input-group-btn">
							<button id="btn-search" type="submit" class="btn btn-default">
								<span class="glyphicon glyphicon-search" style="color: white;"></span>
							</button>
						</span>
					</div>
				</form>
				<div style="width: 100%;">
					<div id="iconDivs">
						<div class="iconDiv">
							<a href="sell.do"><svg xmlns="http://www.w3.org/2000/svg"
									width="32" height="32" fill="#ff4973" class="bi bi-cash"
									viewBox="0 0 16 16">
  <path d="M8 10a2 2 0 1 0 0-4 2 2 0 0 0 0 4z" />
  <path
										d="M0 4a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V4zm3 0a2 2 0 0 1-2 2v4a2 2 0 0 1 2 2h10a2 2 0 0 1 2-2V6a2 2 0 0 1-2-2H3z" />
</svg>
								<p style="margin: -2px 0 0 0;">Sell</p></a>
						</div>
						<div class="iconDiv">
							<a href=""> <svg xmlns="http://www.w3.org/2000/svg"
									width="30" height="30" fill="#ff4973" class="bi bi-person-fill"
									viewBox="0 0 16 16">
		  <path
										d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
		</svg>
								<p style="margin: 0px;">mypage</p></a>
						</div>
						<div class="iconDiv">
							<a href="chatlist"><svg xmlns="http://www.w3.org/2000/svg"
									width="24" height="24" fill="#ff4973" class="bi bi-chat"
									viewBox="0 0 16 15">
  <path
										d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
								<p id="chatCount" style="margin: -16px 0 0px 0px;">
									<c:if test="${sum!=0 && sum ne null  }">
										${sum }
									</c:if>
								</p></svg>
								<p style="margin: 22px 0 0 0;">chat</p></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>
</div>
