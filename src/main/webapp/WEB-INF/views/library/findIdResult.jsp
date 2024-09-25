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
.name_inputBox, .email_inputBox{
	border: 0;
	height:50px;
	padding: 10px 14px;	
	display: block;
	width : 500px;
	margin : auto;	
}
.name_input, .email_input{
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
.login_button_wrap{
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
	font-size : 30px;
	font-weight: 900;
}
</style>
</head>
<body>
	<form class="result-box">
	<div class="logo_wrap">
		<span>아이디찾기</span>
	</div>
		<div class="result">
			<c:choose>
				<c:when test="${findId == null }">
				<p>조회결과가 없습니다.</p>
				</c:when>
				<c:otherwise>
					<div class="pw_inputBox">
						<p>아이디 : ${findId.id }</p>
					</div>
				</c:otherwise>	
			</c:choose>
		</div>
		<div class="button_wrap">
			<button type="button" class="login_button" onclick="location.href='/library/login'" >로그인하기</button>
			<button type="button" class="login_button" onclick="location.href='/library/findPw'" >비밀번호 찾기</button>
		</div>
	</form>	
</body>
</html>