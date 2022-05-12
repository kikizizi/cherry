	$(document).ready(function(){
		var dropdown = $(".navbar-right .dropdown");
		var toogleBtn = $(".navbar-right .dropdown-toggle");
		var cate=document.querySelectorAll(".cm");
		for(let i=0;i<cate.length;i++){
			cate[i].addEventListener("click",function(e){
				e.preventDefault();
				document.querySelector("#srch-category").innerText=this.text;
				document.querySelector("#category").value=this.text;
			})
		}
		// Toggle search and close icon for search dropdown
		dropdown.on("show.bs.dropdown", function(e){
			toogleBtn.toggleClass("hide");
		});
		dropdown.on("hide.bs.dropdown", function(e){
			toogleBtn.addClass("hide");
			toogleBtn.first().removeClass("hide");
		});
	});