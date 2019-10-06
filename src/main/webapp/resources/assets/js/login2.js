$(function() {
		$("#loginBTN").on('click', function() {
			var memberId = $("#memberId").val();
			var memberPwd = $("#memberPwd").val();

			if (memberId.length == 0 || memberPwd.length == 0) {
				swal("다시입력해주세요.");
				return;
			}

			var send = {
				"memberId" : memberId,
				"memberPwd" : memberPwd
			}

			$.ajax({
				method : 'post',
				url : 'login',
				data : send,
				success : function(result) {
					if (!result) {
						swal("로그인 실패");
					} else {
						 
						swal("로그인 성공");
						location.href="main";   
					}

				}
			})
		})
 
		$("#signup").on('click', function() {
			location.href = "signup"
		})
		
		$("#memberDelete").on('click', function() {
		$.ajax({
			method : 'GET',
			url : 'memberDelete',
			success : function() {
				location.reload();
			}
		})
	})
	})/**
 * 
 */