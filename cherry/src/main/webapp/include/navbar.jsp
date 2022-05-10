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
					<a href="">logout</a>
				</c:otherwise>
			</c:choose>
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
						<a href="sell.do"><svg xmlns="http://www.w3.org/2000/svg" width="32"
								height="32" fill="currentColor" class="bi bi-cash"
								viewBox="0 0 16 16">
  <path d="M8 10a2 2 0 1 0 0-4 2 2 0 0 0 0 4z" />
  <path
									d="M0 4a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V4zm3 0a2 2 0 0 1-2 2v4a2 2 0 0 1 2 2h10a2 2 0 0 1 2-2V6a2 2 0 0 1-2-2H3z" />
</svg></a> <a href=""><svg xmlns="http://www.w3.org/2000/svg" width="30"
								height="30" fill="currentColor" class="bi bi-person-fill"
								viewBox="0 0 16 16">
		  <path
									d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
		</svg></a> <a href=""><svg xmlns="http://www.w3.org/2000/svg" width="26"
								height="26" fill="currentColor" class="bi bi-chat-fill"
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