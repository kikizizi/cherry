	let idPass = false;
		let pwdPass = false;
		let emailPass = false;
		$('#id').keyup(function(e) {
			$('#id').removeClass('is-invalid');
			$('#id').removeClass('is-valid');
			let inputId = this.value;
			const reg_id = /^[a-z]+[a-z0-9]{4,14}$/;
			if (!reg_id.test(inputId)) {
				idPass = false;
				$('#id').addClass('is-invalid');
				return;
			}
			$.ajax({
				url:"checkId.do",
				data:{"id":inputId},
				method:"GET",
				dataType:"json"
			})
			.done(function(data){
				if (data){
					idPass=false;
					$('#id').addClass('is-invalid');
					return;
				}
			})
			$('#id').addClass('is-valid');
			idPass=true;
		})
		let checkPwd=function(){
			$('#pwd').removeClass('is-invalid');
			$('#pwd').removeClass('is-valid');
			$('#pwd2').removeClass('is-invalid');
			$('#pwd2').removeClass('is-valid');
			let pwd=$('#pwd').val()
			let pwd2=$('#pwd2').val()
			const reg_pwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
			if(!reg_pwd.test(pwd)){
				pwdPass=false;
				$('#pwd').addClass('is-invalid');
				$('#pwd2').addClass('is-invalid');
				return;
			}
			$('#pwd').addClass('is-valid');
			if (pwd!=pwd2){
				$('#pwd2').addClass('is-invalid');
			}else{
				$('#pwd2').addClass('is-valid');
				pwdPass=true;
			}
		}
		$('#pwd').keyup(checkPwd)
		$('#pwd2').keyup(checkPwd)
		//$('#email').keyup(function(){
		//	$('#email').removeClass('is-invalid');
		//	$('#email').removeClass('is-valid');
		//	let email=$('#email').val()
		//	const reg_email=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		//	if(!reg_email.test(email)){
		//		emailPass=false;
		//		$('#email').addClass('is-invalid');
		//		return;
		//	}
		//	emailPass=true;
		//	$('#email').addClass('is-valid')
		//})
		$('#submitBtn').click(function(e){
			e.preventDefault();
			//if(idPass&&pwdPass&&emailPass){
			if(idPass&&pwdPass){
				swal("회원가입 되었습니다")
				.then(()=>{
					$('form').submit();	
				})
			} else {
				swal({
					  title: "내용을 모두 입력해주세요",
					  icon: "warning",
					  button: "ok",
					});
			}
		})
		
		