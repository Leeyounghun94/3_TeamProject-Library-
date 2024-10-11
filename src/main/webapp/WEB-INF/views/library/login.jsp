<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<%@ include file="../includes/header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.slim.js" 
integrity="sha256-UgvvN8vBkgO0luPSUl2s8TIlOSYRoGFAX4jlCIm9Adc=" 
crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/styles/login.css">
</head>
<body>

<div class="wrapper">
	
	<div class="wrap">
		<form id="login_form" method="post">
			<div class="logo_wrap">
				<span>Login</span>
				<br>
			</div>
			<div class="login_wrap">
				<div class="id_wrap">
						<div class="id_input_box">
						<input class="id_input" name="id" placeholder="ID">
					</div>
				</div>
				<div class="pw_wrap">
					<div class="pw_input_box">
						<input type="password" class="pw_input" name="pw" placeholder="Password">
					</div>
				</div>
				<c:if test = "${result == 0}">
				<div class="login_warn">ID 또는 Password를 잘못 입력하셨습니다.</div>
				</c:if>
				<c:if test = "${result == 1 }">
				<div class="login_success">로그인 성공</div>
				</c:if>
				<div class="login_button_wrap">
					<h3>서버안전을 위해 회원가입 기능을 비활성화 했습니다.<br>이 테스트 계정을 이용해주세요 [ID / PW]<br><br>일반계정 : 33333 / test123<br>관리자계정 : test123 / test123<br><br></h3>
					<button type="button" class="login_button" >로그인</button>
					<button type="button" class="join_button" onclick="location.href='/library/agreementForm'">회원가입</button>
					<p style="align:center;"><a href="/library/findId">아이디 찾기</a> | <a href="/library/findPw">비밀번호 찾기</a></p>
				</div>
						
			</div>
		
		</form>
	</div>

</div>

<script type="text/javascript">
$(".login_button").click(function(){
	/* alert("로그인"); */
	$("#login_form").attr("action", "/library/login");
	$("#login_form").submit();
	
	
});

</script>
</body>
</html>
<%@ include file="../includes/footer.jsp" %>    