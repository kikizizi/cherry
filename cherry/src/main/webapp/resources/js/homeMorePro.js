	$(document).ready(function() {
			var lastnum = $("#lastnum").text();
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
						new_a='<a href="detail.do?num='+item.num+'">';
						new_a+='<article class="productsArticle">';
						new_a+='<img src="/cherry'+item.imgPathList[0]+'" alt="" />';
						new_a+='<p class="title">'+item.title+'</p>';
						new_a+='<p class="priceWon">'+item.priceWon;
						if (item.wishCount!=0){
							new_a+='<small class="wishCount"><svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="red" class="bi bi-heart" viewBox="0 0 16 14">'
							new_a+='<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />'
							new_a+='</svg> '+item.wishCount+'</small>'
						}
						new_a+='</p>'
						new_a+='</article>'
						new_a+='</a>'
						$('#productsDiv').append(new_a);
					}
				})
			})
		})