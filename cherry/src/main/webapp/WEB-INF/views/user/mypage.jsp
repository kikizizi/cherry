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
</style>
</head>
<body>
	<jsp:include page="/include/navbar.jsp"></jsp:include>
	<div id="m1">
		<div id="m1_1">	
			<div id="m2" style="height:300px">
				
			</div>
			<div id="m3" style="height:300px">
				
			</div>
		</div>		
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
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