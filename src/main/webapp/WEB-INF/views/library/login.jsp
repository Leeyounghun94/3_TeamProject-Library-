<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/resources/styles/loginForm.css">
<html><head><style>

</style>
<meta name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0">
</head>
<body>
<form class="loginForm" action="<c:url value='/library/login'/>" name="login" method="post">
    <div class="wrap">
        <div class="login" id="loginForm">
            <h2>Login</h2>
            <div class="login_id">
                <h4>ID</h4>
                <input type="text" name="id" id="id" placeholder="ID" required>
            </div>
            <div class="login_pw">
                <h4>Password</h4>
                <input type="password" name="pw" id="pw" placeholder="Password" required>
            </div>
            <div class="login_etc">
                <div class="checkbox">
                <input type="checkbox" name="rememberId" id="rememberId"> 아이디 저장
                </div>
                <div class="forgot_pw">
                	<a href="/library/findInfo">비밀번호를 잊어버리셨나요?</a>
            	</div>
            </div>
            <div class="submit">
                <button onclick="loginCheck()" type="submit" value="/login" id="login_btn">로그인</button>
            </div>
            <div class="forgot_pw">
            	<a href="<c:url value='/library/agreementForm'/>">회원가입</a>   	
            </div>
        </div>
    </div>
    
</form>
</body>
<jsp:include page="../includes/footer.jsp" />
</html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>