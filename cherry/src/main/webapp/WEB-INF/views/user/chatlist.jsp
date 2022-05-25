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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<style>
#TotalBox {
	height: 800px;
	display: flex;
}

#listBox {
	height: 800px;
	width: 320px;
	border-right: solid 0.5px #80808026;
}

#chatBox {
	height: 800px;
	width: 480px;
}

.title {
	height: 35px;
	border-bottom: solid 0.5px #80808026;
}

.title>p {
	font-size: 20px;
	padding: 5px;
	margin-left: 15px;
	font-weight: bold;
}

#text {
	padding: 10px;
	width: 100%;
	outline: none;
	resize: none;
	border: none;
	height: 100px;
	border-radius: 10px;
}

#inputBox {
	border-top: solid 0.5px #80808026;
	width: 480px;
}

#textBox {
	height: 649px;
	overflow-y: auto;
}

#textBox ul {
	width: 100%;
	list-style: none;
	margin: 0;
	padding: 0;
}

#textBox ul li {
	width: 100%;
}

#textBox ul li.left {
	text-align: left;
}

#textBox ul li.right {
	text-align: right;
}

#textBox ul li>div {
	font-size: 15px;
}

.message {
	display: inline-block;
	word-break: break-all;
	margin: 5px 10px;
	max-width: 75%;
	border: 1px solid #888;
	padding: 10px;
	border-radius: 5px;
	background-color: #FCFCFC;
	color: #555;
	text-align: left;
}

#textBox ul li small {
	font-size: 8px;
	margin-bottom: 0px;
}

.chatclick {
	height: 70px;
	border-bottom: solid 0.5px #80808026;
	display:flex;
}

.list_text {
	color: #8e8e8e;
	padding: 3px 0px 0 10px;
}

.list_id {
	padding: 15px 0px 0px 10px;
}
.list_isRead{
	padding: 25px 0 0 0px;
  color: red;
}
</style>
</head>
<body>
	<jsp:include page="/include/navbar.jsp"></jsp:include>
	<div id="m1">
		<div id="m2">
			<div id="TotalBox">
				<div id="listBox">
					<div class="title">
						<p>채팅목록</p>
					</div>
					<div id="chatlist">
						<c:forEach var="tmp" items="${roomList }">
							<div class="chatclick" id="${tmp.roomId }">
								<div style="width:275px">
									<c:choose>
										<c:when test='${tmp.talker eq sessionScope.id }'>
											<div class="list_id" id="${tmp.roomId }_listener">${tmp. listener}님</div>
										</c:when>
										<c:otherwise>
											<div class="list_id" id="${tmp.roomId }_listener">${tmp. talker}님</div>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${fn:length(tmp.text) > 10 }">
											<div class="list_text" id="${tmp.roomId }_text">${fn:substring(tmp.text,0,9) }...</div>
										</c:when>
										<c:otherwise>
											<div class="list_text" id="${tmp.roomId }_text">${tmp.text}</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="list_isRead "id="${tmp.roomId }_IsRead">
									<c:if test="${tmp.talker ne sessionScope.id && tmp.isRead!=0}">
									${tmp.isRead }
									</c:if>
								</div>
								<div id="${tmp.roomId }_talker" style="display: none">
									${tmp.talker }</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div id="chatBox">
					<div class="title">
						<p id="listener">
							<c:if test="${param.listener ne null }">
								${param.listener }
							</c:if>
						</p>
					</div>
					<div id="textBox">
						<ul id="textul">
							<c:choose>

								<c:when test="${param.listener eq null }">
									<div>
										<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80"
											fill="currentColor" class="bi bi-envelope"
											viewBox="0 0 16 16" style="margin: 200px;">
  <path
												d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z" />
</svg>
									</div>
								</c:when>
								<c:otherwise>
									<c:forEach var="tmp" items="${chatlist }">
										<c:choose>
											<c:when test="${tmp.talker==sessionScope.id }">
												<li class="right">
													<div class="message">
														<span>${tmp.text }</span>
													</div>
												</li>
											</c:when>
											<c:otherwise>
												<li class="left">
													<div class="message">
														<span>${tmp.text }</span>
													</div>
												</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					<div id="inputBox">
						<textarea id="text" maxlength="128" placeholder="insert message.."></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp"></jsp:include>
	<script>
		var listener="${param.listener}";
		var roomId="${param.roomId}"
		$('#textBox').scrollTop($('#textBox')[0].scrollHeight);
		var Sock = new SockJS("/cherry/websocket");
		var client = Stomp.over(Sock);
		client.connect({}, function() {
			client.subscribe('/topic/getNotice/${sessionScope.id}',
					function(e) {
						let data = JSON.parse(e.body)
						if (data.roomId == roomId) {
							if (data.talker == '${sessionScope.id }') {
								let new_li = '<li class="right">';
								new_li += '<div class="message">';
								new_li += '<span>' + data.text + '</span>';
								new_li += '</div>';
								new_li += '</li>';
								$('#textul').append(new_li);
							} else {
								let new_li = '<li class="left">';
								new_li += '<div class="message">';
								new_li += '<span>' + data.text + '</span>';
								new_li += '</div>';
								new_li += '</li>';
								$('#textul').append(new_li);
							}
							$('#textBox').scrollTop($('#textBox')[0].scrollHeight);
						}
						if (data.text>10){
							$("#"+data.roomId+"_text").text(data.text.substr(0,9)+"...");
						}else{
							$("#"+data.roomId+"_text").text(data.text);
						}
					})
		})
		$("#text").keyup(function(e) {
			if (e.key == "Enter" && this.value != "\n") {
				client.send('/chat/notice', {}, JSON.stringify({
					'roomId' : roomId,
					'talker' : '${sessionScope.id }',
					'text' : $('#text').val(),
					'listener' : listener
				}))
				$("#text").val("");
			}
		})
		$(".chatclick").click(function(){
			roomId=$(this).attr("id");
			let talker = $("#"+roomId+"_talker").text();
			if (talker!='${sessionScope.id}'){
				$.ajax({
					url:"resetIsRead",
					data:{"roomId":roomId},
					method:'POST',
					dataType:"json"
				}).done(function(){
					$("#"+roomId+"_IsRead").text("");
				})
			}
			id_list = roomId.split('_');
			for (const temp of id_list){
				if (temp!="${sessionScope.id}"){
					listener=temp;
					$("#listener").text(listener);	
				}
			}
			
			$('#textul').empty();
			$.ajax({
				url:"getchatLog",
				data:{"roomId":roomId},
				method:'POST',
				dataType:"json"			
			}).done(function(data){
				
				for (const temp of data){
					if (temp.talker == '${sessionScope.id }') {
						let new_li = '<li class="right">';
						new_li += '<div class="message">';
						new_li += '<span>' + temp.text + '</span>';
						new_li += '</div>';
						new_li += '</li>';
						$('#textul').append(new_li);
					} else {
						let new_li = '<li class="left">';
						new_li += '<div class="message">';
						new_li += '<span>' + temp.text + '</span>';
						new_li += '</div>';
						new_li += '</li>';
						$('#textul').append(new_li);
					}
					$('#textBox').scrollTop($('#textBox')[0].scrollHeight);
				}
			})
		})
		
	</script>
</body>
</html>