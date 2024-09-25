<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>      
<%@ include file="../includes/header.jsp" %>       
<!DOCTYPE html><html><head><meta charset="UTF-8">
<style>
.result-box{
	text-align: center;	
	margin: 150px 0;
}
.pw_inputBox, .pwCheck_inputBox{
	border: 0;
	height:50px;
	padding: 10px 14px;	
	display: block;
	width : 500px;
	margin : auto;	
}
.pw_input, .pwCheck_input{
	width: 500px;
    height: 50px;
    font-size: 20px;
    border: 0;
    border-radius: 15px;
    outline: none;
    margin: auto;
    padding-left: 10px;
    background-color: rgb(233,233,233);
}
.button_wrap{
	margin-top: 40px;
	text-align: center;
	padding-bottom: 30px;
}
.login_button{
	width: 200px;
    height: 50px;
    background-color: #ebde83;
    font-size: 30px;
    font-weight: 900;
    color: black;
    margin : auto;
    border: 0;
    
}
.findPw_button{
	width: 200px;
    height: 50px;
    background-color: #ebde83;
    font-size: 30px;
    font-weight: 900;
    color: black;
    margin : auto;
    border: 0;	
}
/* 페이지 로고 */
.logo_wrap{
	text-align: center;	
	margin: 150px 0;	
}
.logo_wrap>span{
	font-size : 30px;
	font-weight: 900;
}
p {
	font-size : 18px;
	font-weight: 900;
}
</style>
</head>
<body>
	<form class="result-box">
	<div class="logo_wrap">
		<span>비밀번호 재설정</span>
	</div>
		<div class="result">
			<c:choose>
				<c:when test="${findPw == null }">
				<p class="inquiry">조회결과가 없습니다.</p>
				</c:when>
				<c:otherwise>
					<div class="pw_inputBox">
						<input type="password" name="pw" id="pw" class="pw_input" placeholder="비밀번호">
					</div>
					<div class="pwCheck_inputBox">
						<input type="password" name="pw" id="pw" class="pwCheck_input" placeholder="비밀번호 확인">
					</div>
				</c:otherwise>	
			</c:choose>
		</div>
		<div class="button_wrap">
			<button type="button" class="login_button" onclick="location.href='/library/login'" >비밀번호 재설정</button>
		</div>
	</form>	
</body>
</html>