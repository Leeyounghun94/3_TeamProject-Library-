<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>      
<%@ include file="../includes/header.jsp" %>      
<!DOCTYPE html><html><head><meta charset="UTF-8">
<style>
.findId{
	padding-top:50px;
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
	font-size : 50px;
	font-weight: 900;
}
</style>
</head>
<body>
	<form class="findId" id="findIdForm"  method="post" action="/library/findIdResult">
		<div class="logo_wrap"><span>아이디 찾기</span></div>
		<div class="name_inputBox">
			<input type="text" name="name" id="name" class="name_input" placeholder="이름">
		</div>
		<div class="email_inputBox">
			<input type="email" name="email" id="email" class="email_input" placeholder="이메일">
		</div>
		<div class="login_button_wrap">
			<button type="submit" class="login_button" >아이디 찾기</button>
		</div>
	</form>
</body>
</html>
<%@ include file="../includes/footer.jsp" %>  