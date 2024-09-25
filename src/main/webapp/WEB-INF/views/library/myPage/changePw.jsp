<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="container">
		<h1>비밀번호 수정 폼</h1>
		<form action="login.jsp" method="post" id="myForm">
			<div>
				<label for="pwd">기존 비밀번호</label>
				<input type="password" name="pw" id="pw" />
			</div>
			<button type="submit" id="checkPw">비밀번호 확인</button>
			<button type="reset">리셋</button>
		</form>
	</div>
</body>
<script type="text/javascript">
$(document).on('click', '#checkPw', function(){
	const checkPassword = $('#pw').val
	if(!checkPassword || checkPassword.trim() === "") {
		alert("비밀번호를 입력하시오");
	} else {
		$a.ajax({
			type: 'get',
			url: '/library/checkPw',
			data: {'checkPassword' : checkPassword},
			datatype: "text"
		}).done(function(result){
			console.log(result);
			if(result){
				console.log("비밀번호 일치");
				window.location.href="/library.myPage/updatePw";
			} else if(!result) {
				console.log("비밀번호 불일치");
				alert("비밀번호가 맞지 않습니다.");
				window.location.reload();
			}
		}).fail(function(error){
			alert(JSON.stringify(error));
		})
	}
});
</script>
</html>