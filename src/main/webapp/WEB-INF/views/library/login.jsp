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
			</div>
			<div class="login_wrap"> 
				<div class="id_wrap">
						<div class="id_input_box">
						<input class="id_input" name="id">
					</div>
				</div>
				<div class="pw_wrap">
					<div class="pw_input_box">
						<input class="pw_input" name="pw">
					</div>
				</div>
				<c:if test = "${result == 0}">
				<div class="login_warn">ID 또는 Password를 잘못 입력하셨습니다.</div>
				</c:if>
				<div class="login_button_wrap">
					<button type="button" class="login_button" >로그인</button>
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