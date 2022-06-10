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
						const new_a=document.createElement('a');
						new_a.setAttribute('href',"detail.do?num="+item.num);
						const new_article=document.createElement('article');
						new_article.setAttribute('class','productsArticle');
						const new_img=document.createElement('img');
						new_img.setAttribute('src','/cherry'+item.imgPathList[0]);						
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