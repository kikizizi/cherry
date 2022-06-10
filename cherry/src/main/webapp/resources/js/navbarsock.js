//navbar chat 안읽음 표시
			var sock = new SockJS("/cherry/websocket");
			var client = Stomp.over(sock);
			client.connect({}, function() {
				client.subscribe('/topic/getNotice/'+$("#getId").text(),
						function(e) {
							if ($("#chatCount").text() == "") {
								$("#chatCount").text(0);
							}
							let count = $("#chatCount").text();
							$("#chatCount").text(Number(count) + 1);
						})
			})