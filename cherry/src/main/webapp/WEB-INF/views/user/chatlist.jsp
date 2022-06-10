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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/chatlist.css" />
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
								<div style="width: 275px">
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
								<div class="list_isRead " id="${tmp.roomId }_isRead">
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
								${param.listener } 님
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
					<div id="inputBox"
						<c:if test='${param.listener eq null}'>
						style="display:none;"
					</c:if>>
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
		function clickEventReset(){
			$(".chatclick").click(function(){
				$("#inputBox").removeAttr("style");
				roomId=$(this).attr("id");
				let talker = $("#"+roomId+"_talker").text();
				if (talker!='${sessionScope.id}'){
					$.ajax({
						url:"resetIsRead",
						data:{"roomId":roomId},
						method:'POST',
						dataType:"json"
					}).done(function(){
						$("#"+roomId+"_isRead").text("");
					})
				}
				id_list = roomId.split('_');
				for (const temp of id_list){
					if (temp!="${sessionScope.id}"){
						listener=temp;
						$("#listener").text(listener+" 님");	
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
		}
		client.connect({}, function() {
			client.subscribe('/topic/getNotice/${sessionScope.id}',
					function(e) {
						let data = JSON.parse(e.body)
						//채팅방에 들어와 있을때 채팅로그 출력
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
								$.ajax({
									url:"resetIsRead",
									data:{"roomId":roomId},
									method:'POST',
									dataType:"json"
								}).done(function(){
									$("#"+roomId+"_isRead").text("");
								})
							}
							
							$('#textBox').scrollTop($('#textBox')[0].scrollHeight);
						}
						// 채팅방이 새로 만들어진경우 새로운 리스트 생성
						if($("#"+data.roomId+"_text").text()==""){
							new_div='<div class="chatclick" id="'+data.roomId+'">';
							new_div+='<div style="width:275px">';
							if(data.listener=="${sessionScope.id}"){
								new_div+='<div class="list_id" id="'+data.roomId+'_listener">'+data.talker+'님</div>';
							}else{
								new_div+='<div class="list_id" id="'+data.roomId+'_listener">'+data.talker+'님</div>';
							}
							new_div+='<div class="list_text" id="'+data.roomId+'_text"></div>';
							new_div+='</div>';
							new_div+='<div class="list_isRead" id="'+data.roomId+'_IsRead">';
							new_div+='</div>';
							new_div+='<div id="'+data.roomId+'_talker" style="display: none">'+data.talker+'</div>';
							new_div+='</div>';
							$('#chatlist').prepend(new_div);
						}
						// 채팅방 미리보기, 안읽은 카운트 갱신
						if (data.text.length>10){
							$("#"+data.roomId+"_text").text(data.text.substr(0,9)+"...");
						}else{
							$("#"+data.roomId+"_text").text(data.text);
						}
						if (data.talker != '${sessionScope.id }' && listener!=data.talker){
							if ($("#"+data.roomId+"_isRead").text()==""){
								$("#"+data.roomId+"_isRead").text(0);
							}
							var count=$("#"+data.roomId+"_isRead").text();
							$("#"+data.roomId+"_isRead").text(Number(count)+1);
						}
						//최근에 메시지 받은 방 상위 노출
						let save=$("#"+data.roomId).html();
						save='<div class="chatclick" id="'+data.roomId+'">'+save+'</div>';
						$("#"+data.roomId).remove();
						$('#chatlist').prepend(save);
						clickEventReset();
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
		clickEventReset();
	</script>
</body>
</html>